package cn.barathrum.frogshop.exception;

import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class DefaultExceptionHandler {
	
	@ExceptionHandler(value={UnknownAccountException.class,UnauthorizedException.class,UnauthenticatedException.class,AuthorizationException.class})
	public String loginExceptionHandler() {
		return "home/login";
	}
	
}
