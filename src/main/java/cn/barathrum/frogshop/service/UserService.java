package cn.barathrum.frogshop.service;

import java.util.Set;

import cn.barathrum.frogshop.bean.User;

public interface UserService {
	//通过用户名获取角色
	Set<String> findRoles(String username);
	//通过用户名获取权限
	Set<String> findPermissions(String username);
	//通过用户名获取用户
	User findByUsername(String username);
	
}
