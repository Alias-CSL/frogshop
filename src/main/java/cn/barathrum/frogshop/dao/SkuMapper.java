package cn.barathrum.frogshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.barathrum.frogshop.bean.Sku;

public interface SkuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Sku record);

    int insertSelective(Sku record);

    Sku selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Sku record);

    int updateByPrimaryKey(Sku record);
    
    List<Sku> selectByGoodId(Integer id);
    //获取商品各种sku的商品属性
   // List<String> selectAttributeByGoodId(Integer id);
	//通过商品规格获取对应的sku信息
	Sku selectByAttributes(@Param("goodId")Integer goodId, @Param("attributes")String attributes);
}