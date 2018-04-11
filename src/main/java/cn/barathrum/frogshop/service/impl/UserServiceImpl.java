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
	//根据用户名获取权限
	@Override
	public Set<String> findRoles(String username) {
		return rolesDao.selectByUserName(username);
	}
	//根据用户名获取权限
	@Override
	public Set<String> findPermissions(String username) {
		return permissionDao.selectByUserName(username);
	}
	//通过用户名获取用户
	@Override
	public User findByUsername(String username) {
		return userDao.selectByUsername(username);
	}
	
}
