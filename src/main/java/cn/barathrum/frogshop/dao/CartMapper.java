package cn.barathrum.frogshop.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import cn.barathrum.frogshop.bean.Cart;

public interface CartMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Cart record);

	int insertSelective(@Param("skuId") Integer skuId, @Param("userId") Integer userId,
			@Param("count") Integer goodNum,@Param("createDate")Date createDate,@Param("goodName")String goodName);

	Cart selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Cart record);

	int updateByPrimaryKey(Cart record);
	/**
	 * 查询之前是否加入添加过该记录
	 * @param skuId sku id
	 * @param userId 用户id
	 * @param goodName 商品名
	 */
	Cart selectById(@Param("skuId")Integer skuId, @Param("userId")Integer userId,@Param("goodName")String goodName);
	/**
	 * 更新购物车信息
	 * @param id 购物车商品id
	 * @param goodNum 购物数量
	 * @return
	 */
	int updateByCartNum(@Param("id")Integer id, @Param("num")Integer goodNum);

}