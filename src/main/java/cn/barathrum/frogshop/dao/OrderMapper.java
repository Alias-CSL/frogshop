package cn.barathrum.frogshop.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.barathrum.frogshop.bean.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);
    
    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    /**
     * 通过用户id获取所有订单
     * @param userId
     * @return
     */
	List<Order> selectByUserId(Integer userId);
	/**
	 * 支付订单，修改订单的状态与添加支付时间
	 * @param orderId 订单id
	 * @param status 订单状态
	 * @param payDate 支付时间
	 */
	int updateByPayBill(@Param("orderId")Integer orderId, @Param("status")Integer status, @Param("paidDate")Date payDate);
	/**
	 * 获取用户所有未支付的订单信息
	 * @param userId 用户id
	 * @param status 状态
	 * @return
	 */
	List<Order> selectOrderByStatus(@Param("userId")Integer userId,@Param("status")Integer status);
	/**
	 * 更改订单状态
	 * @param orderId 订单id
	 * @param type 状态类别
	 * @return
	 */
	int updateByStatus(@Param("orderId")Integer orderId, @Param("status")int type);
	/**
	 * 根据不同订单状态获取订单信息
	 * @param status 订单状态
	 * @return
	 */
	List<Order> selectByStatus(int status);
	/**
	 * 更新订单发货信息与订单状态
	 * @param orderId 订单id
	 * @param expressNum 快递码
	 * @param status 订单状态
	 * @return
	 */
	int updateOrderByShipped(@Param("orderId")Integer orderId, @Param("expressNum")String expressNum, @Param("status")int status);
}