package cn.barathrum.frogshop.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.barathrum.frogshop.bean.Message;
import cn.barathrum.frogshop.bean.User;
import cn.barathrum.frogshop.service.UserService;
import cn.barathrum.frogshop.utils.DigitalCodeUtil;
import cn.barathrum.frogshop.utils.LoginTypeMatchUtil;
import cn.barathrum.frogshop.utils.PasswordEncryptUtil;
import cn.barathrum.frogshop.utils.SendVerifyCodeUtil;
import cn.barathrum.frogshop.utils.UuidUtil;


@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = { "login", "login.html", "login.do", "login.action" })
	public String loginRedirect() {
		return "login";
	}
	//账号登录处理
	@RequestMapping("/userLogin")
	public ModelAndView login(HttpServletRequest request, @PathParam("principal") String principal,
			@PathParam("password") String password) {
		ModelAndView mav = new ModelAndView();
		String msg = "";
		HttpSession session = request.getSession();
		UsernamePasswordToken token = new UsernamePasswordToken(principal, password);
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
		}
		try {
			subject.login(token);// 验证登录
			//Principal user = (Principal)subject.getPrincipal();
			//subject.
			int type = LoginTypeMatchUtil.loginType(principal);// 用户登录类型（手机、邮箱、用户名）
			User user = null;// 获取登录用户
			switch (type) {
			case LoginTypeMatchUtil.EMAILTYPE:
				user = userService.findByEmail(principal);
				break;
			case LoginTypeMatchUtil.NAMETYPE:
				user = userService.findByUsername(principal);
				break;
			case LoginTypeMatchUtil.PHONETYPE:
				user = userService.findByPhoneNum(principal);
				break;
			default:
				break;
			}
			setRedirectView(session,user,mav);
			
		} catch (IncorrectCredentialsException e) {
			msg = "用户名或密码错误. Password for account " + token.getPrincipal() 
	        + " was incorrect.";  
	        mav.addObject("message", msg);  
	        //System.out.println(msg);  
	        mav.setViewName("redirect:/login.html");
		} catch (ExcessiveAttemptsException e) {
			msg = "登录失败次数过多";  
			mav.addObject("message", msg);  
		    //System.out.println(msg);  
		    mav.setViewName("redirect:/login.jsp");
		} catch (LockedAccountException e) {  
	        msg = "帐号已被锁定. The account for username " + token.getPrincipal() 
	        + " was locked.";  
	        mav.addObject("message", msg);  
	       // System.out.println(msg);  
	        mav.setViewName("redirect:/login.jsp");
	    } catch (DisabledAccountException e) {  
	        msg = "帐号已被禁用. The account for username " + token.getPrincipal() 
	        + " was disabled.";  
	        mav.addObject("message", msg);  
	        //System.out.println(msg);  
	        mav.setViewName("redirect:/login.jsp");
	    } catch (ExpiredCredentialsException e) {  
	        msg = "帐号已过期. the account for username " + token.getPrincipal() 
	        + "  was expired.";  
	        mav.addObject("message", msg);  
	        //System.out.println(msg);  
	        mav.setViewName("redirect:/login.jsp");
	    } catch (UnknownAccountException e) {  
	        msg = "帐号不存在. There is no user with username of " + token.getPrincipal();  
	        mav.addObject("message", msg);  
	        //System.out.println(msg);  
	        mav.setViewName("redirect:/login.jsp");
	    } catch (UnauthorizedException e) {  
	        msg = "您没有得到相应的授权！" + e.getMessage();  
	        mav.addObject("message", msg);  
	        //System.out.println(msg);  
	        mav.setViewName("redirect:/login.jsp");
	    }
		return mav;
	}
	//登出控制
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/login.html");
		HttpSession session = request.getSession();
		session.removeAttribute("loginEntity");
		session.setAttribute("loginFlag", false);// 登录成功标识
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
		}
		
		return mav;
	}
	//账号注册页面跳转
	@RequestMapping(value ={"register.html","register.do","register.action","register"})
	public String register() {
		return "register";
	}

	/**
	 * 发送验证码到用户手机
	 * @param httpRequest 会话
	 * @param phoneNum 手机号码
	 * @return
	 */
	@RequestMapping("/getVerifyCode")
	@ResponseBody
	public Message getVerifyCode(HttpServletRequest httpRequest,@RequestParam("phoneNum") String phoneNum) {
		HttpSession session = httpRequest.getSession();//获取会话
		String verifyCode = DigitalCodeUtil.getRandomCode(4);//生成四位随机验证码
		String result = SendVerifyCodeUtil.testSendSms(verifyCode, phoneNum);//向用户手机发送验证码
		if(result != null && !result.equals("")) {//
			String code = result.split(",")[0].split(":")[1].replaceAll("\"", "").trim();
			System.out.println(code);
			if(code.equals("000000")) {//发送成功
				session.setAttribute("verifyCode", verifyCode);//将验证码保存到session中
				session.setMaxInactiveInterval(60);//验证码保存时间位60秒
				return Message.success();
			}else {//发送失败
				return Message.fail();
			}
		}
		return Message.fail();
	}
	/**
	 * 判断用户名是否存在
	 * @param username 用户名
	 * @return
	 */
	@RequestMapping("/existsTheUsername")
	@ResponseBody
	public Message existsTheUsername(@RequestParam("username")String username) {
		User user = userService.findByUsername(username);
		if(user != null){//用户名已存在
			return Message.fail();
		}else{//用户名不存在
			return Message.success();
		}
	}
	
	/**
	 * 判手机是否被注册
	 * @param phoneNum 用户手机号码
	 * @return
	 */
	@RequestMapping("/existsThePhoneNum")
	@ResponseBody
	public Message existsThePhoneNum(@RequestParam("phoneNum")String phoneNum) {
		User user = userService.findByPhoneNum(phoneNum);
		if(user != null){//手机号已经被注册
			return Message.fail();
		}else{//手机未注册
			return Message.success();
		}
	}
	
	/**
	 * 判邮箱是否被注册
	 * @param email 邮箱
	 * @return
	 */
	@RequestMapping("/existsTheEmail")
	@ResponseBody
	public Message existsTheEmail(@RequestParam("email")String email) {
		User user = userService.findByEmail(email);
		if(user != null){//邮箱已经被注册
			return Message.fail();
		}else{//邮箱未注册
			return Message.success();
		}
	}
	
	/**
	 * 用户邮箱注册
	 * @param username 用户名
	 * @param email 邮箱
	 * @param password 密码
	 * @param passwordRepeat 确认密码
	 * @return
	 */
	@RequestMapping(value="/emailRegister")
	@ResponseBody
	public ModelAndView emailRegister(HttpServletRequest request,@RequestParam("username")String username,@RequestParam("email")String email,@RequestParam("password")String password,@RequestParam("passwordRepeat")String passwordRepeat) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String msg = "";//注册信息
		if(!password.equals("") && passwordRepeat.equals(password)) {
			//UUID随机生成盐值
			String salt = UuidUtil.get32UUID();
			//加密用户密码
			String encryptPassword = PasswordEncryptUtil.passwordEncry(password, salt);
			//将用户数据保存到数据库
			int result = userService.insertUserByEmail(username,email,salt,encryptPassword);
			if(result == 1) { //注册成功
				User user = userService.findByEmail(email);
 				setRedirectView(session,user,mav);
			}else{//注册失败
				mav.setViewName("error");
			}
		}
		
		return mav;
	}
	
	/**
	 * 手机号码注册
	 * @param username 用户名
	 * @param phoneNum 手机号码
	 * @param code 验证码
	 * @param password 密码
	 * @param passwordRepeat 确认密码
	 * @return
	 */
	@RequestMapping("/phoneRegister")
	@ResponseBody
	public ModelAndView phoneRegister(HttpServletRequest request ,@RequestParam("username")String username,@RequestParam("phoneNum")String phoneNum,
			@RequestParam("code")String code,@RequestParam("password")String password,@RequestParam("passwordRepeat")String passwordRepeat) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String verifyCode = (String) session.getAttribute("verifyCode");//保存在session中的验证码
		if(!password.equals("") && passwordRepeat.equals(password) && code.equals(verifyCode)) {
			//UUID随机生成盐值
			String salt = UuidUtil.get32UUID();
			//加密用户密码
			String encryptPassword = PasswordEncryptUtil.passwordEncry(password, salt);
			//将用户数据保存到数据库
			int result = userService.insertUserByPhone(username, phoneNum, salt, encryptPassword);
			if(result == 1) { //注册成功
				User user = userService.findByPhoneNum(phoneNum);
 				setRedirectView(session,user,mav);
			}else{//注册失败
				mav.setViewName("error");
			}
		}
		return mav;
	}
	/**
	 * 从session中保存用户登录状态，获取Referer，并进行页面跳转
	 * @param session 会话
	 * @param user 用户信息
	 * @param mav ModelAndView对象
	 */
	public void setRedirectView(HttpSession session , User user,ModelAndView mav) {
		session.setAttribute("userName", user.getUserName());// 保存用户名到Session中
		session.setAttribute("loginEntity", user);// 保存用户到session中
		session.setAttribute("loginFlag", true);// 登录成功标识
		// 这个值是用户,从之前的页面跳转过来,如果该值不为null跳转到此URL
		String controUrl = (String) session.getAttribute("Referer");
		if(controUrl != null && !"".equals(controUrl)) {
			String temp = "/"+controUrl.split("frogShop/")[1];
			mav.setViewName("redirect:"+temp);
		}else{
			mav.setViewName("redirect:/index.jsp");
		}
	}
	
}
