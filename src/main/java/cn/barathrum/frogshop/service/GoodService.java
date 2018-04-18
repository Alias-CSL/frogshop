package cn.barathrum.frogshop.service;

import java.util.List;

import cn.barathrum.frogshop.bean.Category;
import cn.barathrum.frogshop.bean.Good;

public interface GoodService {
	//通过类目获取该类目下所有商品
	List<Good> getGoodByCategoryId(Integer id);
	//通过类目id获取该类目
	Category getCategoryById(Integer id);
	//通过类目id与商品属性获取该类目
	List<Good> getGoodByAttributes(Integer id, List<String> attr);
}
