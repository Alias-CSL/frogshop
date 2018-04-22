package cn.barathrum.frogshop.service;

import java.util.List;

import cn.barathrum.frogshop.bean.Category;
import cn.barathrum.frogshop.bean.Evaluate;
import cn.barathrum.frogshop.bean.Good;
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
}
