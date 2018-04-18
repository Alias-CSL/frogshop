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
import cn.barathrum.frogshop.utils.LoginTypeMatch;

public class UserRealm extends AuthorizingRealm {
	@Autowired
	private UserService userServiceImpl;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//获取用户名
		String count = (String) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		int type = LoginTypeMatch.loginType(count);
		if(type == LoginTypeMatch.EMAILTYPE) {//用户使用邮箱登录
			authorizationInfo.setRoles(userServiceImpl.findRolesByEmail(count));
			authorizationInfo.setStringPermissions(userServiceImpl.findPermissionsByEmail(count));
		}else if(type == LoginTypeMatch.PHONETYPE) {//用户使用手机号码登录
			authorizationInfo.setRoles(userServiceImpl.findRolesByPhoneNum(count));
			authorizationInfo.setStringPermissions(userServiceImpl.findPermissionsByPhoneNum(count));
		}else{//用户使用用户名登录
			authorizationInfo.setRoles(userServiceImpl.findRolesByUsername(count));
			authorizationInfo.setStringPermissions(userServiceImpl.findPermissionsByUsername(count));
		}
		
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String count = (String) token.getPrincipal();
		int type = LoginTypeMatch.loginType(count);
		User user = null ;
		if(type == LoginTypeMatch.EMAILTYPE) {//用户使用邮箱登录
			user = userServiceImpl.findByEmail(count);
		}else if(type == LoginTypeMatch.PHONETYPE) {//用户使用手机号码登录
			user = userServiceImpl.findByPhoneNum(count);
		}else{//用户使用用户名登录
			user = userServiceImpl.findByUsername(count);
		}
		
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
