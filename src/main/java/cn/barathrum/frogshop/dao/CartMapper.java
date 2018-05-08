package cn.barathrum.frogshop.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.barathrum.frogshop.bean.Cart;

public interface CartMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Cart record);

	int insertSelective(@Param("skuId") Integer skuId, @Param("userId") Integer userId,
			@Param("count") Integer goodNum,@Param("createDate")Date createDate,@Param("goodName")String goodName);

	Cart selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Cart record);

	int updateByPrimaryKey(Cart record);
	/**
	 * 查询之前是否加入添加过该记录
	 * @param skuId sku id
	 * @param userId 用户id
	 * @param goodName 商品名
	 */
	Cart selectById(@Param("skuId")Integer skuId, @Param("userId")Integer userId,@Param("goodName")String goodName);
	/**
	 * 更新购物车信息
	 * @param id 购物车商品id
	 * @param goodNum 购物数量
	 * @return
	 */
	int updateByCartNum(@Param("id")Integer id, @Param("num")Integer goodNum);
	/**
	 * 通过用户id获取所有购物车商品信息
	 * @param userId 用户id
	 * @return
	 */
	List<Cart> selectCartsByUserId(Integer userId);
	/**
	 * 更新购物车商品数量
	 * @param cartId 购物车商品id
	 * @param count 数量
	 * @return
	 */
	int updateCartCount(@Param("cartId")Integer cartId, @Param("count")int count);
	/**
	 * 获取购物车商品
	 * @param ids id集合
	 * @return
	 */
	List<Cart> selectCartByIds(@Param("ids")Integer[] ids);

}