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

	// 用户将商品添加到购物车
	int addToCart(Integer skuId, Integer userId, Integer goodNum,String goodName);

	/**
	 * 创建订单
	 * @param order 订单实例
	 * @return
	 */
	Order addOrder(Order order);
	/**
	 * 创建订单与商品的关联
	 * @param orderId 订单id
	 * @param skuId 商品sku id
	 * @param goodNum商品数量
	 * @param goodNum商品数量
	 * @return
	 */
	int createOrderGood(int orderId, Integer skuId, Integer goodNum,String goodName);
	/**
	 * 通过订单d获取订单
	 * @param id 订单id
	 * @return
	 */
	Order getOrderByPrimaryKey(Integer id);
	/**
	 * 支付订单
	 * @param orderId 订单id
	 * @return 返回订单实例
	 */
	Order payTheOrder(Integer orderId);
	/**
	 * 通过用户id获取所有订单
	 * @param userId 用户id
	 * @return
	 */
	List<Order> selectOrderByUserId(Integer userId);
	/**
	 * 查询之前是否加入过购物车
	 * @param skuId sku id
	 * @param userId 用户id
	 * @param goodName 商品名
	 */
	Cart selectCartById(Integer skuId, Integer userId, String goodName);
	/**
	 * 更新购物车信息
	 * @param id 购物车商品id
	 * @param goodNum 购物数量
	 * @return
	 */
	int updateCartNum(Integer id, Integer goodNum);
	/**
	 * 更新商品数据
	 * @param goodNum 商品数量
	 * @param skuId skuId
	 * @return
	 */
	int updateGoodData(Integer goodNum, Integer skuId);
	/**
	 * 获取指定类型的用户所有的订单信息
	 * @param userId 用户id
	 * @param status 类型
	 * @return
	 */
	List<Order> selectOrderByStatus(Integer userId,Integer status);
	/**
	 * 收藏商品，先判断商品是否存在
	 * @param goodId 商品id
	 * @param userId 用户id
	 * @return
	 */
	int insertCollectionRecord(Integer goodId, Integer userId);
	/**
	 * 用户添加评价
	 * @param userId 用户id
	 * @param orderNum 订单码
	 * @param content 内容
	 * @param grade 评分等级
	 * @return
	 */
	int insertNewComment(Integer userId, String orderNum, String content, String grade);
	/**
	 * 更改订单状态
	 * @param orderId
	 * @param type
	 * @return
	 */
	int updateOrderStatus(Integer orderId, int type);
	/**
	 * 返回用户收藏的商品
	 * @param userId 用户id
	 * @param pn 页码
	 * @return
	 */
	List<Good> selectAllCollection(Integer userId);
	/**
	 * 获取用户购物车所有商品信息
	 * @param userId 用户id
	 * @return
	 */
	List<Cart> selectAllCartGoods(Integer userId);
}
