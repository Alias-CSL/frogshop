package cn.barathrum.frogshop.dao;

import java.util.List;

import cn.barathrum.frogshop.bean.AttributeName;

public interface AttributeNameMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AttributeName record);

    int insertSelective(AttributeName record);

    AttributeName selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AttributeName record);

    int updateByPrimaryKey(AttributeName record);
    
    List<AttributeName> selectAttributeNameByCategoryId(Integer id);
    List<AttributeName> selectByCategoryId(Integer id);
}