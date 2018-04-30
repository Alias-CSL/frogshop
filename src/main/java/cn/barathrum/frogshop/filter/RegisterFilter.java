package cn.barathrum.frogshop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.barathrum.frogshop.bean.User;
@WebFilter(urlPatterns={"/register.html","/login.html"},asyncSupported=false)
public class RegisterFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/";
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginEntity");//获取保存在session中的用户
		String referer = req.getHeader("Referer");
		System.out.println("aaaaaaaaaaaaaaaa");
		if(referer != null) {
				session.setAttribute("Referer", referer);
		}
		chain.doFilter(request, response);
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
