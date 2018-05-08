package cn.barathrum.frogshop.service;

import java.math.BigDecimal;
import java.util.List;

import cn.barathrum.frogshop.bean.AttributeGood;
import cn.barathrum.frogshop.bean.AttributeName;
import cn.barathrum.frogshop.bean.Cart;
import cn.barathrum.frogshop.bean.Category;
import cn.barathrum.frogshop.bean.Evaluate;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Order;
import cn.barathrum.frogshop.bean.Sku;

public interface GoodService {
	//通过类目获取该类目下所有商品
	List<Good> getGoodByCategoryId(Integer id);
	//通过类目id获取该类目
	Category getCategoryById(Integer id);
	//通过类目id与商品属性获取该类目
	List<Good> getGoodByAttributes(Integer id, List<String> attr);
	//通过商品id获取商品
	Good getGoodByGoodId(Integer id);
	//获取商品的产品参数
	String getProductAttributes(Integer id);
	//通过商品id获取评论
	List<Evaluate> getEvaluateByGoodId(Integer id);
	//通过商品规格获取对应的sku信息
	Sku getSkuByAttributes(Integer goodId, String attributes);
	//通过SkuId获取sku
	Sku getSkuBySkuId(Integer skuId);
	//通过skuId获取good名字
	String getGoodNameBySkuId(Integer skuId);
	/**
	 * 插入商品sku记录
	 * @param goodId 商品id
	 * @param price 原价
	 * @param originalPrice 销售价格
	 * @param resource 库存
	 * @param pictureAddress 图片外链地址
	 * @param attributes 商品属性
	 * @return
	 */
	int insertGoodSku(Integer goodId, BigDecimal price, BigDecimal originalPrice, Integer resource,
			String pictureAddress, String attributes);
	/**
	 * 根据商品类目等级获取类目
	 * @param grade 商品类目等级
	 * @return
	 */
	List<Category> selectByCategoryGrade(Integer grade);
	/**
	 * 添加新的商品
	 * @param good 商品实体类
	 * @return
	 */
	int insertGood(Good good);
	/**
	 * 通过Category Id获取商品属性
	 * @param categoryId 
	 * @return
	 */
	List<AttributeName> getAttributeNamesByCategoryId(Integer categoryId);
	/**
	 * 添加商品属性记录
	 * @param attributeGood
	 * @return
	 */
	int insertAttributeGood(AttributeGood attributeGood);
	/**
	 * 保存商品描述图片
	 * @param goodId 商品id
	 * @param pictureAddress 图片地址
	 * @return
	 */
	int insertGoodDescPic(Integer goodId, String pictureAddress);
	/**
	 * 保存商品详情图片
	 * @param goodId 商品id
	 * @param pictureAddress 图片地址
	 * @param sort 图片排序
	 * @return
	 */
	int insertGoodDetailPic(Integer goodId, String pictureAddress, int sort);
	/**
	 * 获取所有商品
	 * @return
	 */
	List<Good> getAllGoods();
	/**
	 * 更新商品上下架状态
	 * @param goodId 商品id
	 * @param status 上下架状态
	 * @return
	 */
	int updateGoodStatus(Integer goodId, Byte status);
	/**
	 * 删除指定id的商品
	 * @param goodId 商品id
	 * @return
	 */
	int deleteGoodById(Integer goodId);
	/**
	 * 批量删除商品
	 * @param goodIds 多个商品id
	 * @return
	 */
	int deleteGoodByIds(Integer[] goodIds);
	/**
	 * 获取指定商品的sku
	 * @param goodId 商品id
	 * @return
	 */
	List<Sku> getSkuByGoodId(Integer goodId);
	/**
	 * 删除单条sku记录
	 * @param skuId sku主键
	 * @param goodId 商品主键
	 * @return
	 */
	int deleteSkuById(Integer skuId, Integer goodId);
	/**
	 * 批量删除sku
	 * @param skuIds 多个sku主键
	 * @return
	 */
	int deleteSkuByIds(Integer[] skuIds,Integer goodId);
	/**
	 * 更新sku的价格、市场价、库存
	 * @param sku 实例对象
	 * @return
	 */
	int updateSku(Sku sku);
	/**
	 * 批量更新多个sku对象
	 * @param skus
	 * @return
	 */
	int updateSkus(List<Sku> skus);
	/**
	 * 根据不同订单状态获取订单信息
	 * @param status 订单状态
	 * @return
	 */
	List<Order> selectOrderByStatus(int status);
	/**
	 * 订单发货处理
	 * @param orderId 订单id
	 * @param orderShipped 订单编码
	 * @return
	 */
	int updateOrderShippedStatus(Integer orderId, String expressNum);
	/**
	 * 更新购物车商品数量
	 * @param cartId 购物车商品id
	 * @param count 数量
	 * @return
	 */
	int updateCartGoodNum(Integer cartId, int count);
	/**
	 * 获取购物车商品
	 * @param ids id集合
	 * @return
	 */
	List<Cart> selectCartByIds(Integer[] ids);
	/**
	 * 删除购物车商品
	 * @param id 购物车商品id
	 * @return
	 */
	int deleteCartById(Integer id);
}
