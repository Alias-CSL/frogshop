package cn.barathrum.frogshop.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.barathrum.frogshop.bean.Order;
import cn.barathrum.frogshop.dao.EvaluateMapper;
import cn.barathrum.frogshop.dao.OrderGoodMapper;
import cn.barathrum.frogshop.dao.OrderMapper;
import cn.barathrum.frogshop.service.OrderService;
import cn.barathrum.frogshop.utils.DigitalCodeUtil;
@Service
public class OrderServiceImpl implements OrderService {
	// 注入OrderMapper
	@Autowired
	private OrderMapper orderMapper;
	// 注入OrderGoodMapper
	@Autowired
	private OrderGoodMapper orderGoodMapper;
	// 注入EvaluateMapper
	@Autowired
	private EvaluateMapper evaluateMapper;

	/**
	 * 创建订单
	 */
	@Override
	public Order addOrder(Order order) {
		String orderNum = DigitalCodeUtil.getOrderCode();// 生创订单码
		order.setOrderNum(orderNum);// 设置订单码
		order.setCreateDate(new Date());// 设置订单创建时间
		orderMapper.insertSelective(order);
		return order;
	}

	/**
	 * 创建订单与商品的关联
	 * 
	 * @param orderId
	 *            订单id
	 * @param skuId
	 *            商品sku id
	 * @param goodNum商品数量
	 * @return
	 */
	@Override
	public int createOrderGood(int orderId, Integer skuId, Integer goodNum, String goodName) {
		return orderGoodMapper.insertGoodOrder(orderId, skuId, goodNum, goodName);
	}

	/**
	 * 通过订单d获取订单
	 * 
	 * @param id
	 *            订单id
	 * @return
	 */
	@Override
	public Order getOrderByPrimaryKey(Integer id) {
		return orderMapper.selectByPrimaryKey(id);
	}

	/**
	 * 支付订单
	 */
	@Override
	public Order payTheOrder(Integer orderId) {
		Integer status = 2;
		Date payDate = new Date();
		int result = orderMapper.updateByPayBill(orderId, status, payDate);
		if (result > 0) {
			Order order = orderMapper.selectByPrimaryKey(orderId);
			return order;
		}
		return null;
	}

	/**
	 * 通过用户id获取所有订单
	 * 
	 * @param userId
	 *            用户id
	 * @return
	 */
	@Override
	public List<Order> selectOrderByUserId(Integer userId) {
		return orderMapper.selectByUserId(userId);
	}

	/**
	 * 获取指定类型的用户所有的订单信息
	 * 
	 * @param userId
	 *            用户id
	 * @return
	 */
	@Override
	public List<Order> selectOrderByStatus(Integer userId, Integer status) {
		return orderMapper.selectOrderByStatus(userId, status);
	}

	/**
	 * 用户添加评价
	 * 
	 * @param userId
	 *            用户id
	 * @param orderNum
	 *            订单码
	 * @param content
	 *            内容
	 * @param grade
	 *            评分等级
	 * @return
	 */
	@Override
	public int insertNewComment(Integer userId, String orderNum, String content, String grade) {
		return evaluateMapper.insertNewRecord(userId, orderNum, content, grade, new Date());
	}

	/**
	 * 更改订单状态
	 * 
	 * @param orderId
	 * @param type
	 * @return
	 */
	@Override
	public int updateOrderStatus(Integer orderId, int type) {
		return orderMapper.updateByStatus(orderId, type);
	}
}
