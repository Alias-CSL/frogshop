package cn.barathrum.frogshop.service;

import java.util.List;

import cn.barathrum.frogshop.bean.Cart;

public interface CartService {
	// 用户将商品添加到购物车
	int addToCart(Integer skuId, Integer userId, Integer goodNum, String goodName);

	/**
	 * 查询之前是否加入过购物车
	 * 
	 * @param skuId
	 *            sku id
	 * @param userId
	 *            用户id
	 * @param goodName
	 *            商品名
	 */
	Cart selectCartById(Integer skuId, Integer userId, String goodName);

	/**
	 * 更新购物车信息
	 * 
	 * @param id
	 *            购物车商品id
	 * @param goodNum
	 *            购物数量
	 * @return
	 */
	int updateCartNum(Integer id, Integer goodNum);

	/**
	 * 更新购物车商品数量
	 * 
	 * @param cartId
	 *            购物车商品id
	 * @param count
	 *            数量
	 * @return
	 */
	int updateCartGoodNum(Integer cartId, int count);

	/**
	 * 获取购物车商品
	 * 
	 * @param ids
	 *            id集合
	 * @return
	 */
	List<Cart> selectCartByIds(Integer[] ids);

	/**
	 * 删除购物车商品
	 * 
	 * @param id
	 *            购物车商品id
	 * @return
	 */
	int deleteCartById(Integer id);

	/**
	 * 获取用户购物车所有商品信息
	 * 
	 * @param userId
	 *            用户id
	 * @return
	 */
	List<Cart> selectAllCartGoods(Integer userId);
}
