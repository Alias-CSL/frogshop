package cn.barathrum.frogshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.barathrum.frogshop.bean.Category;
import cn.barathrum.frogshop.bean.Evaluate;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Sku;
import cn.barathrum.frogshop.dao.CategoryMapper;
import cn.barathrum.frogshop.dao.EvaluateMapper;
import cn.barathrum.frogshop.dao.GoodMapper;
import cn.barathrum.frogshop.dao.SkuMapper;
import cn.barathrum.frogshop.service.GoodService;
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
	

	//通过类目id获取商品
	@Override
	public List<Good> getGoodByCategoryId(Integer id) {
		return goodMapper.selectByCategoryId(id);
	}
	
	//通过类目id获取类目
	@Override
	public Category getCategoryById(Integer id) {
		return categoryMapper.selectByPrimaryKey(id);
	}
	//通过类目id与商品属性获取该类目
	@Override
	public List<Good> getGoodByAttributes(Integer id, List<String> attr) {
		return goodMapper.selectByAttributes(id,attr);
	}
	//通过商品id获取商品
	@Override
	public Good getGoodByGoodId(Integer id) {
		return goodMapper.selectByPrimaryKey(id);
	}
	//获取商品的产品参数
	@Override
	public String getProductAttributes(Integer id) {
		return goodMapper.getProductAttributes(id);
	}
	//通过商品id获取评论
	@Override
	public List<Evaluate> getEvaluateByGoodId(Integer id) {
		return evaluateMapper.selectEvaluatesByGoodId(id);
	}
	//通过商品规格获取对应的sku信息
	@Override
	public Sku getSkuByAttributes(Integer goodId, String attributes) {
		return skuMapper.selectByAttributes(goodId,attributes);
	}
	//通过SkuId获取sku
	@Override
	public Sku getSkuBySkuId(Integer skuId) {
		return  skuMapper.selectByPrimaryKey(skuId);
	}
	//通过skuId获取good名称
	@Override
	public String getGoodNameBySkuId(Integer skuId) {
		return goodMapper.selectGoodNameBySkuId(skuId);
	}

}
