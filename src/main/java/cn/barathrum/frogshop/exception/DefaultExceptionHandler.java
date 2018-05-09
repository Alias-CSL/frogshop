package cn.barathrum.frogshop.exception;

import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.util.NestedServletException;

@ControllerAdvice
public class DefaultExceptionHandler {
	
	@ExceptionHandler(value={UnknownAccountException.class,UnauthorizedException.class,UnauthenticatedException.class,AuthorizationException.class})
	public String loginExceptionHandler() {
		return "redirect:/login.html";
	}
	
	@ExceptionHandler(value={NestedServletException.class})
	public String handlerServletException() {
		return "404.jsp";
	}
}
