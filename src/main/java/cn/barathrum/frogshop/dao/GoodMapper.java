package cn.barathrum.frogshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.barathrum.frogshop.bean.Good;

public interface GoodMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Good record);

    Integer insertSelective(Good record);
    Integer insertGood(Good record);
    Good selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Good record);

    int updateByPrimaryKey(Good record);
    //通过类目id获取商品
    List<Good> selectByCategoryId(Integer id);
	//通过类目id与商品属性获取该类目
	List<Good> selectByAttributes(@Param("id")Integer id, @Param("attr")List<String> attr);
	//获取商品的产品参数
	String getProductAttributes(Integer id);
	//通过skuId获取good名称
	String selectGoodNameBySkuId(Integer skuId);
	/**
	 * 更新商品数据
	 * @param skuId skuid,通过该id关联获取商品id
	 * @param goodNum 商品数量
	 * @return
	 */
	int updateGoodData(@Param("skuId")Integer skuId, @Param("goodNum")Integer goodNum);
	/**
	 * 根据用户id获取用户收藏的商品
	 * @param userId
	 * @return
	 */
	List<Good> selectByUserId(Integer userId);
	/**
	 * 获取所有商品
	 * @return
	 */
	List<Good> selectAllGoods();
	/**
	 * 更新商品上下架状态
	 * @param goodId 商品id
	 * @param status 上下架状态
	 * @return
	 */
	int updateGoodStatus(@Param("goodId")Integer goodId, @Param("status")Byte status);
	/**
	 * 批量删除商品
	 * @param ids 多个商品id
	 * @return
	 */
	int deleteByGoodIds(@Param("ids")Integer[] goodIds);
	/**
	 * 更新商品总库存
	 * @param stocks 商品库存
	 * @return
	 */
	int updateGoodStocks(@Param("stocks")int stocks,@Param("id")Integer id);	
}