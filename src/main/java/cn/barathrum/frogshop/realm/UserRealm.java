package cn.barathrum.frogshop.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import cn.barathrum.frogshop.bean.User;
import cn.barathrum.frogshop.service.UserService;

public class UserRealm extends AuthorizingRealm {
	@Autowired
	private UserService userServiceImpl;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//获取用户名
		String username = (String) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		authorizationInfo.setRoles(userServiceImpl.findRoles(username));
		authorizationInfo.setStringPermissions(userServiceImpl.findPermissions(username));
		// TODO Auto-generated method stub
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = (String) token.getPrincipal();
		User user = userServiceImpl.findByUsername(username);
		if(user == null) {
			throw new UnknownAccountException();//没找到账号
		}
		
		if(user.getStatus() == 2){//账号锁定
			throw new LockedAccountException();
		}
		//交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
				user.getUserName(),
				user.getUserPass(),
				ByteSource.Util.bytes("admin"),
				getName());
		return authenticationInfo;
	}

}
