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
	/**
	 * 更新sku数据
	 * @param skuId skuId
	 * @param goodNum 商品数量
	 */
	int updateSkuData(@Param("skuId")Integer skuId, @Param("goodNum")Integer goodNum);
	/**
	 * 批量删除sku
	 * @param skuIds 多个sku主键
	 * @return
	 */
	int deleteBySkuIds(@Param("skuIds")Integer[] skuIds);
	/**
	 * 批量更新多个sku对象
	 * @param skus
	 * @return
	 */
	int updateSkusSelective(@Param("skus")List<Sku> skus);
	/**
	 * 获取指定商品的总库存
	 * @param goodId 商品id
	 * @return
	 */
	int selectStocksByGoodId(Integer goodId);
}