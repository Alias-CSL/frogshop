package cn.barathrum.frogshop.service;

import java.util.Set;

import org.springframework.web.bind.annotation.RequestParam;

import cn.barathrum.frogshop.bean.User;

public interface UserService {
	// 通过用户名获取角色
	Set<String> findRolesByUsername(String username);

	// 通过用户名获取权限
	Set<String> findPermissionsByUsername(String username);

	// 通过用户名获取用户
	User findByUsername(String username);

	// 通过手机号获取角色
	Set<String> findRolesByPhoneNum(String phoneNum);

	// 通过手机号获取权限
	Set<String> findPermissionsByPhoneNum(String phoneNum);

	// 通过手机号获取用户
	User findByPhoneNum(String phoneNum);
	
	// 通过邮箱获取角色
	Set<String> findRolesByEmail(String email);

	// 通过郵箱获取权限
	Set<String> findPermissionsByEmail(String email);

	// 通过邮箱获取用户
	User findByEmail(String email);
	
	//通过手机号码注册用户
	int insertUserByPhone(String username,String phoneNum,String salt, String encryptPassword);
	//通过邮箱注册用户
	int insertUserByEmail(String username, String email, String salt, String encryptPassword);
	//将商品加入购物车
	int addToCart(Integer skuId, Integer userId, Integer goodNum);
}
