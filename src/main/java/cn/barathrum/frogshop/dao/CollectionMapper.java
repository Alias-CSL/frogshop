package cn.barathrum.frogshop.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import cn.barathrum.frogshop.bean.ShopCollection;

public interface CollectionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ShopCollection record);

    int insertSelective(ShopCollection record);

    ShopCollection selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShopCollection record);

    int updateByPrimaryKey(ShopCollection record);
    /**
     * 查询之前是否被插入过
     * @param goodId 商品id
     * @param userId 用户id
     * @return
     */
	int selectByAllKeys(@Param("goodId")Integer goodId, @Param("userId")Integer userId);
	/**
	 * 插入新记录
     * @param goodId 商品id
     * @param userId 用户id
	 * @param date 插入时间
	 * @return
	 */
	int insertRecord(@Param("goodId")Integer goodId,@Param("userId") Integer userId, @Param("date")Date date);
	
}