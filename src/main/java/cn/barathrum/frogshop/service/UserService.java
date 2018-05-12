package cn.barathrum.frogshop.service;

import java.util.List;
import java.util.Set;

import cn.barathrum.frogshop.bean.Address;
import cn.barathrum.frogshop.bean.Cart;
import cn.barathrum.frogshop.bean.City;
import cn.barathrum.frogshop.bean.District;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Order;
import cn.barathrum.frogshop.bean.Province;
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

	// 通过手机号码注册用户
	int insertUserByPhone(String username, String phoneNum, String salt, String encryptPassword);

	// 通过邮箱注册用户
	int insertUserByEmail(String username, String email, String salt, String encryptPassword);

	
	/**
	 * 更新商品数据
	 * @param goodNum 商品数量
	 * @param skuId skuId
	 * @return
	 */
	int updateGoodData(Integer goodNum, Integer skuId);
	
	/**
	 * 收藏商品，先判断商品是否存在
	 * @param goodId 商品id
	 * @param userId 用户id
	 * @return
	 */
	int insertCollectionRecord(Integer goodId, Integer userId);
	
	/**
	 * 返回用户收藏的商品
	 * @param userId 用户id
	 * @param pn 页码
	 * @return
	 */
	List<Good> selectAllCollection(Integer userId);

}
