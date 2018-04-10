package cn.barathrum.frogshop.dao;

import java.util.List;

import cn.barathrum.frogshop.bean.AttributeValue;

public interface AttributeValueMapper {
	//通过AttributeName的Id获取属性值
	List<AttributeValue> selectByAttributeNameId(Integer id);
    int deleteByPrimaryKey(Integer id);

    int insert(AttributeValue record);

    int insertSelective(AttributeValue record);

    AttributeValue selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AttributeValue record);

    int updateByPrimaryKey(AttributeValue record);
}