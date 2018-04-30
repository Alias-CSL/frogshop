package cn.barathrum.frogshop.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.barathrum.frogshop.bean.OrderGood;

public interface OrderGoodMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderGood record);

    int insertSelective(OrderGood record);
    
    OrderGood selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderGood record);

    int updateByPrimaryKey(OrderGood record);
    /**
     * 通过订单id获取对应的商品信息
     * @param orderId
     * @return
     */
    List<OrderGood> selectByOrderId(Integer orderId);
    /**
	 * 创建订单与商品的关联
	 * @param orderId 订单id
	 * @param skuId 商品sku id
	 * @param goodNum商品数量
	 * @return
	 */
	int insertGoodOrder(@Param("orderId")int orderId,@Param("skuId") Integer skuId, @Param("goodNum") Integer goodNum,@Param("goodName")String goodName);
}