package cn.barathrum.frogshop.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

@WebListener
public class SessionListenerBySeachLogin implements HttpSessionListener {
	// session创建时的操作
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// 初始时，设置登录标志为失败
		se.getSession().setAttribute("loginFlag", "false");
	}
	
	//session销毁时的操作
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
		}
		HttpSession session = se.getSession();
		if(session.getAttribute("userId") != null) {
			session.removeAttribute("userId"); 
		}
		if(session.getAttribute("loginEntity") != null) {
			session.removeAttribute("loginEntity");
		}
		session.setAttribute("loginFlag", false);
	}

}
