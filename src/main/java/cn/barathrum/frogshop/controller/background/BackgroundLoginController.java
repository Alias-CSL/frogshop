package cn.barathrum.frogshop.controller.background;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.barathrum.frogshop.bean.User;
import cn.barathrum.frogshop.service.UserService;
import cn.barathrum.frogshop.utils.LoginTypeMatchUtil;

@Controller("backgroundLoginController")
public class BackgroundLoginController {
	@Autowired
	private UserService userService;

	/**
	 * 首页跳转
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping("/bachgorundIndex.html")
	public String indexPage() {
		return "background/index";
	}
	/**
	 * 主要跳转
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping("/main.html")
	public String mainPage() {
		return "background/main";
	}
	/**
	 * 跳转到后台登录页面
	 * @return
	 */
	@RequestMapping(value="/backgoundLogin.html")
	public String backgoundLogin() {
		return "background/login";
	}
	

	@RequestMapping(value="/loginBackground")
	public ModelAndView loginBackground(HttpServletRequest request, @RequestParam("principal") String principal,
			@RequestParam("password") String password) {
		ModelAndView mav = new ModelAndView();
		String msg = "";
		HttpSession session = request.getSession();
		UsernamePasswordToken token = new UsernamePasswordToken(principal, password);
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			session.removeAttribute("userId");
			session.removeAttribute("loginEntity");
			session.setAttribute("loginFlag", false);// 登录成功标识
			subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
		}
		try {
			subject.login(token);// 验证登录
			List<String> roles = new ArrayList<>();
			roles.add("super_admin");
			roles.add("order_admin");
			boolean[] flag = subject.hasRoles(roles);
			System.out.println(flag.length);
			User user = null;// 获取登录用户
			//Principal user = (Principal)subject.getPrincipal();
			//subject.
			if(flag[0] || flag[1]){
				int type = LoginTypeMatchUtil.loginType(principal);// 用户登录类型（手机、邮箱、用户名）
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
				session.setAttribute("userId", user.getId());// 保存用户名到Session中
				session.setAttribute("loginEntity", user);// 保存用户到session中
				session.setAttribute("loginFlag", true);// 登录成功标识
				mav.setViewName("redirect:/bachgorundIndex.html");
			}else{
				 mav.setViewName("redirect:/backgoundLogin.html");
			}
			
			/*// 这个值是用户,从之前的页面跳转过来,如果该值不为null跳转到此URL
			String controUrl = (String) session.getAttribute("Referer");
			if(controUrl != null && !"".equals(controUrl)) {
				String temp = "/"+controUrl.split("frogShop/")[1];
				mav.setViewName("redirect:"+temp);
			}else{
				mav.setViewName("redirect:home/backgoundLogin");
			}*/
			
		} catch (IncorrectCredentialsException e) {
			msg = "用户名或密码错误. Password for account " + token.getPrincipal() 
	        + " was incorrect.";  
	        mav.addObject("message", msg);  
	        //System.out.println(msg);  
	        mav.setViewName("redirect:/backgoundLogin.html");
		} catch (ExcessiveAttemptsException e) {
			msg = "登录失败次数过多";  
			mav.addObject("message", msg);  
		    //System.out.println(msg);  
		    mav.setViewName("redirect:/backgoundLogin.html");
		} catch (LockedAccountException e) {  
	        msg = "帐号已被锁定. The account for username " + token.getPrincipal() 
	        + " was locked.";  
	        mav.addObject("message", msg);  
	       // System.out.println(msg);  
	        mav.setViewName("redirect:/backgoundLogin.html");
	    } catch (DisabledAccountException e) {  
	        msg = "帐号已被禁用. The account for username " + token.getPrincipal() 
	        + " was disabled.";  
	        mav.addObject("message", msg);  
	        //System.out.println(msg);  
	        mav.setViewName("redirect:/backgoundLogin.html");
	    } catch (ExpiredCredentialsException e) {  
	        msg = "帐号已过期. the account for username " + token.getPrincipal() 
	        + "  was expired.";  
	        mav.addObject("message", msg);  
	        //System.out.println(msg);  
	        mav.setViewName("redirect:/backgoundLogin.html");
	    } catch (UnknownAccountException e) {  
	        msg = "帐号不存在. There is no user with username of " + token.getPrincipal();  
	        mav.addObject("message", msg);  
	        //System.out.println(msg);  
	        mav.setViewName("redirect:/backgoundLogin.html");
	    } catch (UnauthorizedException e) {  
	        msg = "您没有得到相应的授权！" + e.getMessage();  
	        mav.addObject("message", msg);  
	        //System.out.println(msg);  
	        mav.setViewName("redirect:/backgoundLogin.html");
	    }
		return mav;
		
	}
	
	//登出控制
	@RequestMapping("/logoutBackground")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/backgoundLogin.html");
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("loginEntity");
		session.setAttribute("loginFlag", false);// 登录成功标识
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
		}
		return mav;
	}
}
