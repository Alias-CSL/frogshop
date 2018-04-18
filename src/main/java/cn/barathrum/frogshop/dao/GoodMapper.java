package cn.barathrum.frogshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.barathrum.frogshop.bean.Good;

public interface GoodMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Good record);

    int insertSelective(Good record);

    Good selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Good record);

    int updateByPrimaryKey(Good record);
    //通过类目id获取商品
    List<Good> selectByCategoryId(Integer id);
	//通过类目id与商品属性获取该类目
	List<Good> selectByAttributes(@Param("id")Integer id, @Param("attr")List<String> attr);	
}