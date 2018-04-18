package cn.barathrum.frogshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.barathrum.frogshop.bean.Category;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.dao.CategoryMapper;
import cn.barathrum.frogshop.dao.GoodMapper;
import cn.barathrum.frogshop.service.GoodService;
@Service
public class GoodServiceImpl implements GoodService {
	
	@Autowired
	private GoodMapper goodMapper;
	
	@Autowired
	private CategoryMapper categoryMapper;
	
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

}
