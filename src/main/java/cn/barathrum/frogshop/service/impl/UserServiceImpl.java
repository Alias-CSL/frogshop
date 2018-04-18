package cn.barathrum.frogshop.service.impl;


import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.barathrum.frogshop.bean.User;
import cn.barathrum.frogshop.dao.PermissionsMapper;
import cn.barathrum.frogshop.dao.RolesMapper;
import cn.barathrum.frogshop.dao.UserMapper;
import cn.barathrum.frogshop.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	//注入UserDao
	@Autowired
	private UserMapper userDao;
	//注入RolesDao
	@Autowired
	private RolesMapper rolesDao;
	//注入PermissionsDao
	@Autowired
	private PermissionsMapper permissionDao;
	//根据用户名获取角色
	@Override
	public Set<String> findRolesByUsername(String username) {
		return rolesDao.selectByUserName(username);
	}
	//根据用户名获取权限
	@Override
	public Set<String> findPermissionsByUsername(String username) {
		return permissionDao.selectByUserName(username);
	}
	//通过用户名获取用户
	@Override
	public User findByUsername(String username) {
		return userDao.selectByUsername(username);
	}
	//根据手机号获取角色
	@Override
	public Set<String> findRolesByPhoneNum(String phoneNum) {
		return rolesDao.selectByPhoneNum(phoneNum);
	}
	//根据手机号获取权限
	@Override
	public Set<String> findPermissionsByPhoneNum(String phoneNum) {
		return permissionDao.selectByPhoneNum(phoneNum);
	}
	//根据手机号获取
	@Override
	public User findByPhoneNum(String phoneNum) {
		return userDao.selectByPhoneNum(phoneNum);
	}
	//根据邮箱获取角色
	@Override
	public Set<String> findRolesByEmail(String email) {
		return rolesDao.selectByEmail(email);
	}
	//根据邮箱获取权限
	@Override
	public Set<String> findPermissionsByEmail(String email) {
		return permissionDao.selectByEmail(email);
	}
	//根据邮箱获取用户
	@Override
	public User findByEmail(String email) {
		return userDao.selectByEmail(email);
	}
	
}
