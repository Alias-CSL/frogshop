package cn.barathrum.frogshop.dao;

import cn.barathrum.frogshop.bean.AttributeGood;

public interface AttributeGoodMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AttributeGood record);

    int insertSelective(AttributeGood record);

    AttributeGood selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AttributeGood record);

    int updateByPrimaryKey(AttributeGood record);
}