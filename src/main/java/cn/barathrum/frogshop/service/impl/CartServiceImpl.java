package cn.barathrum.frogshop.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.barathrum.frogshop.bean.Cart;
import cn.barathrum.frogshop.dao.CartMapper;
import cn.barathrum.frogshop.service.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;

	/**
	 * 将商品加入购物车
	 */
	@Override
	public int addToCart(Integer skuId, Integer userId, Integer goodNum, String goodName) {
		return cartMapper.insertSelective(skuId, userId, goodNum, new Date(), goodName);
	}

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
	@Override
	public Cart selectCartById(Integer skuId, Integer userId, String goodName) {
		return cartMapper.selectById(skuId, userId, goodName);
	}

	/**
	 * 更新购物车信息
	 * 
	 * @param id
	 *            购物车商品id
	 * @param goodNum
	 *            购物数量
	 * @return
	 */
	@Override
	public int updateCartNum(Integer id, Integer goodNum) {
		return cartMapper.updateByCartNum(id, goodNum);
	}

	/**
	 * 更新购物车商品数量
	 * 
	 * @param cartId
	 *            购物车商品id
	 * @param count
	 *            数量
	 * @return
	 */
	@Override
	public int updateCartGoodNum(Integer cartId, int count) {
		return cartMapper.updateCartCount(cartId, count);
	}

	/**
	 * 获取购物车商品
	 * 
	 * @param ids
	 *            id集合
	 * @return
	 */
	@Override
	public List<Cart> selectCartByIds(Integer[] ids) {
		return cartMapper.selectCartByIds(ids);
	}

	/**
	 * 删除购物车商品
	 * 
	 * @param id
	 *            购物车商品id
	 * @return
	 */
	@Override
	public int deleteCartById(Integer id) {
		return cartMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 获取用户购物车所有商品信息
	 * 
	 * @param userId
	 *            用户id
	 * @return
	 */
	@Override
	public List<Cart> selectAllCartGoods(Integer userId) {
		return cartMapper.selectCartsByUserId(userId);
	}

}
