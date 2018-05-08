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
/**
 * 过滤请求路径，进行操作时，先判断用户是否登录，，如果登录了，且Referer不为空，转发请求
 * 如果用户未登录，保存先前的页面url（session.setAttribute("Referer", referer);），用于操作完成后重定向返回原始操作页面，然后跳转到登录页面
 * @author 83893
 *
 */
@WebFilter(urlPatterns={"/addToCart/*","/buyTheGood/*","/myCart/*","/person/index.html"},asyncSupported=false)
public class LoginFilter implements Filter {


	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/";
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginEntity");//获取保存在session中的用户
		String referer = req.getHeader("Referer");
		if(user != null && referer != null) {
			System.out.println("直接转发");
			chain.doFilter(request, response);
		}else{		
			System.out.println("重定向");
			HttpServletResponse resq = (HttpServletResponse) response;
			resq.sendRedirect(basePath+"login.html");
			if(referer != null) {
				session.setAttribute("Referer", referer);
			}
		}
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