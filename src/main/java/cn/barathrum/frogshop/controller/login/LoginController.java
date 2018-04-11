package cn.barathrum.frogshop.controller.login;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String login(@PathParam("username") String username,@PathParam("password") String password){
		String msg = "";
		UsernamePasswordToken token = new UsernamePasswordToken(username,password);
		Subject subject = SecurityUtils.getSubject();
		try{
			subject.login(token);//验证登录
		}catch(IncorrectCredentialsException e) {
	        msg = "登录密码错误. Password for account " + token.getPrincipal() + " was incorrect."; 
	        return "error";
	    } catch (ExcessiveAttemptsException e) {
	        msg = "登录失败次数过多";
	        return "error";
	    } catch (LockedAccountException e) {
	        msg = "帐号已被锁定. The account for username " + token.getPrincipal() + " was locked.";  
	        return "error";
	    } catch (DisabledAccountException e) {
	        msg = "帐号已被禁用. The account for username " + token.getPrincipal() + " was disabled.";  
	        return "error";
	    } catch (ExpiredCredentialsException e) {
	        msg = "帐号已过期. the account for username " + token.getPrincipal() + "  was expired.";  
	        return "error";
	    } catch (UnknownAccountException e) {
	        msg = "帐号不存在. There is no user with username of " + token.getPrincipal();  
	        return "error";
	    } catch (UnauthorizedException e) {
	        msg = "您没有得到相应的授权！" + e.getMessage();
	        return "error";
	    }
		return "success";
	}
}
