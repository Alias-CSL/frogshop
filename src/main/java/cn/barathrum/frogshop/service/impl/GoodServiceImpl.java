package cn.barathrum.frogshop.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.barathrum.frogshop.bean.AttributeGood;
import cn.barathrum.frogshop.bean.AttributeName;
import cn.barathrum.frogshop.bean.Category;
import cn.barathrum.frogshop.bean.DescPicture;
import cn.barathrum.frogshop.bean.DetailPicture;
import cn.barathrum.frogshop.bean.Evaluate;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Order;
import cn.barathrum.frogshop.bean.Sku;
import cn.barathrum.frogshop.dao.AttributeGoodMapper;
import cn.barathrum.frogshop.dao.AttributeNameMapper;
import cn.barathrum.frogshop.dao.CategoryMapper;
import cn.barathrum.frogshop.dao.DescPictureMapper;
import cn.barathrum.frogshop.dao.DetailPictureMapper;
import cn.barathrum.frogshop.dao.EvaluateMapper;
import cn.barathrum.frogshop.dao.GoodMapper;
import cn.barathrum.frogshop.dao.OrderMapper;
import cn.barathrum.frogshop.dao.SkuMapper;
import cn.barathrum.frogshop.service.GoodService;
import cn.barathrum.frogshop.utils.DigitalCodeUtil;

@Service
public class GoodServiceImpl implements GoodService {

	@Autowired
	private GoodMapper goodMapper;

	@Autowired
	private CategoryMapper categoryMapper;

	@Autowired
	private EvaluateMapper evaluateMapper;

	@Autowired
	private SkuMapper skuMapper;

	@Autowired
	private AttributeNameMapper attributeNameMapper;

	@Autowired
	private AttributeGoodMapper attributeGoodMapper;
	
	@Autowired
	private DescPictureMapper descPictureMapper;
	
	@Autowired
	private DetailPictureMapper detailPictureMapper;
	
	@Autowired
	private OrderMapper orderMapper;
	// 通过类目id获取商品
	@Override
	public List<Good> getGoodByCategoryId(Integer id) {
		return goodMapper.selectByCategoryId(id);
	}

	// 通过类目id获取类目
	@Override
	public Category getCategoryById(Integer id) {
		return categoryMapper.selectByPrimaryKey(id);
	}

	// 通过类目id与商品属性获取该类目
	@Override
	public List<Good> getGoodByAttributes(Integer id, List<String> attr) {
		return goodMapper.selectByAttributes(id, attr);
	}

	// 通过商品id获取商品
	@Override
	public Good getGoodByGoodId(Integer id) {
		return goodMapper.selectByPrimaryKey(id);
	}

	// 获取商品的产品参数
	@Override
	public String getProductAttributes(Integer id) {
		return goodMapper.getProductAttributes(id);
	}

	// 通过商品id获取评论
	@Override
	public List<Evaluate> getEvaluateByGoodId(Integer id) {
		return evaluateMapper.selectEvaluatesByGoodId(id);
	}

	// 通过商品规格获取对应的sku信息
	@Override
	public Sku getSkuByAttributes(Integer goodId, String attributes) {
		return skuMapper.selectByAttributes(goodId, attributes);
	}

	// 通过SkuId获取sku
	@Override
	public Sku getSkuBySkuId(Integer skuId) {
		return skuMapper.selectByPrimaryKey(skuId);
	}

	// 通过skuId获取good名称
	@Override
	public String getGoodNameBySkuId(Integer skuId) {
		return goodMapper.selectGoodNameBySkuId(skuId);
	}

	/**
	 * 插入商品sku记录
	 * 
	 * @param goodId
	 *            商品id
	 * @param price
	 *            原价
	 * @param originalPrice
	 *            销售价格
	 * @param resource
	 *            库存
	 * @param pictureAddress
	 *            图片外链地址
	 * @return
	 */
	@Override
	public int insertGoodSku(Integer goodId, BigDecimal price, BigDecimal originalPrice, Integer resource,
			String pictureAddress, String attributes) {
		Sku sku = new Sku();
		sku.setGoodId(goodId);
		sku.setAttributes(attributes);
		sku.setOriginalPrice(originalPrice);
		sku.setPrice(price);
		sku.setResource(resource);
		sku.setPicture(pictureAddress);
		sku.setCreateTime(new Date());
		Integer goodNum = Integer.valueOf(DigitalCodeUtil.getRandomCode(8));
		sku.setGoodCode(goodNum);
		return skuMapper.insertSelective(sku);
	}

	/**
	 * 根据商品类目等级获取类目
	 * 
	 * @param grade
	 *            商品类目等级
	 * @return
	 */
	@Override
	public List<Category> selectByCategoryGrade(Integer grade) {
		return categoryMapper.selectByPID(grade);
	}

	/**
	 * 添加新的商品
	 * 
	 * @param good
	 *            商品实体类
	 * @return
	 */
	@Override
	public int insertGood(Good good) {
		good.setEnteringTime(new Date());
		Integer goodId = goodMapper.insertGood(good);
		return good.getId();
	}

	/**
	 * 通过Category Id获取商品属性
	 * 
	 * @param categoryId
	 * @return
	 */
	@Override
	public List<AttributeName> getAttributeNamesByCategoryId(Integer categoryId) {
		return attributeNameMapper.selectByCategoryId(categoryId);
	}
	/**
	 * 添加商品属性记录
	 * @param attributeGood
	 * @return
	 */
	@Override
	public int insertAttributeGood(AttributeGood attributeGood) {
		attributeGood.setCreateTime(new Date());
		return attributeGoodMapper.insertSelective(attributeGood);
	}
	/**
	 * 保存商品描述图片
	 * @param goodId 商品id
	 * @param pictureAddress 图片地址
	 * @return
	 */
	@Override
	public int insertGoodDescPic(Integer goodId, String pictureAddress) {
		DescPicture record = new DescPicture();
		record.setDescPicture(pictureAddress);
		record.setGoodId(goodId);
		return descPictureMapper.insertSelective(record);
	}
	/**
	 * 保存商品详情图片
	 * @param goodId 商品id
	 * @param pictureAddress 图片地址
	 * @param sort 图片排序
	 * @return
	 */
	@Override
	public int insertGoodDetailPic(Integer goodId, String pictureAddress, int sort) {
		DetailPicture detailPicture = new DetailPicture();
		detailPicture.setDetailPicture(pictureAddress);
		detailPicture.setGoodId(goodId);
		detailPicture.setSort(sort);
		return detailPictureMapper.insertSelective(detailPicture);
	}
	/**
	 * 获取所有商品
	 * @return
	 */
	@Override
	public List<Good> getAllGoods() {
		return goodMapper.selectAllGoods();
	}
	/**
	 * 更新商品上下架状态
	 * @param goodId 商品id
	 * @param status 上下架状态
	 * @return
	 */
	@Override
	public int updateGoodStatus(Integer goodId, Byte status) {
		return goodMapper.updateGoodStatus(goodId,status);
	}
	/**
	 * 删除指定id的商品
	 * @param goodId 商品id
	 * @return
	 */
	@Override
	public int deleteGoodById(Integer goodId) {
		return goodMapper.deleteByPrimaryKey(goodId);
	}
	/**
	 * 批量删除商品
	 * @param ids 多个商品id
	 * @return
	 */
	@Override
	public int deleteGoodByIds(Integer[] goodIds) {
		return goodMapper.deleteByGoodIds(goodIds);
	}
	/**
	 * 获取指定商品的sku
	 * @param goodId 商品id
	 * @return
	 */
	@Override
	public List<Sku> getSkuByGoodId(Integer goodId) {
		return skuMapper.selectByGoodId(goodId);
	}
	/**
	 * 删除单条sku记录
	 * @param skuId sku主键
	 * @param goodId 商品id
	 * @return
	 */
	@Override
	public int deleteSkuById(Integer skuId, Integer goodId) {
		int result1 = skuMapper.deleteByPrimaryKey(skuId);
		int stocks = skuMapper.selectStocksByGoodId(goodId);
		int result = goodMapper.updateGoodStocks(stocks,goodId);//更新商品总库存
		
		return (result == result1)?1:0;
	}
	/**
	 * 批量删除sku
	 * @param skuIds 多个sku主键
	 * @return
	 */
	@Override
	public int deleteSkuByIds(Integer[] skuIds,Integer goodId) {
		int result1 = skuMapper.deleteBySkuIds(skuIds);
		int stocks = skuMapper.selectStocksByGoodId(goodId);
		int result = goodMapper.updateGoodStocks(stocks,goodId);//更新商品总库存	
		return (result == result1)?1:0;
	}
	/**
	 * 更新sku的价格、市场价、库存
	 * @param sku
	 * @return
	 */
	@Override
	public int updateSku(Sku sku) {
		int result1 = skuMapper.updateByPrimaryKeySelective(sku);
		int goodId = sku.getGoodId();
		int stocks = skuMapper.selectStocksByGoodId(goodId);
		System.out.println(stocks);
		int result = goodMapper.updateGoodStocks(stocks,goodId);//更新商品总库存	
		return (result == result1)?1:0;
	}
	/**
	 * 批量更新多个sku对象
	 * @param skus
	 * @return
	 */
	@Override
	public int updateSkus(List<Sku> skus) {
		int result1 = skuMapper.updateSkusSelective(skus);
		int goodId = skus.get(0).getGoodId();
		int stocks = skuMapper.selectStocksByGoodId(goodId);
		int result = goodMapper.updateGoodStocks(stocks,goodId);//更新商品总库存	
		return (result == result1)?1:0;
	}
	/**
	 * 根据不同订单状态获取订单信息
	 * @param status 订单状态
	 * @return
	 */
	@Override
	public List<Order> selectOrderByStatus(int status) {
		return orderMapper.selectByStatus(status);
	}
	/**
	 * 订单发货处理
	 * @param orderId 订单id
	 * @param orderShipped 订单编码
	 * @return
	 */
	@Override
	public int updateOrderShippedStatus(Integer orderId, String expressNum) {
		return orderMapper.updateOrderByShipped(orderId,expressNum,3);
	}

}
