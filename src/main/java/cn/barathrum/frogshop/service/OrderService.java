package cn.barathrum.frogshop.service;

import java.util.List;

import cn.barathrum.frogshop.bean.Order;

public interface OrderService {

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
	 * 获取指定类型的用户所有的订单信息
	 * @param userId 用户id
	 * @param status 类型
	 * @return
	 */
	List<Order> selectOrderByStatus(Integer userId,Integer status);
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
}
