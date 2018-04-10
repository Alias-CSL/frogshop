package cn.barathrum.frogshop.dao;

import java.util.List;

import cn.barathrum.frogshop.bean.AttributeName;

public interface AttributeNameMapper {
    
	List<AttributeName> selectAttributeNameByCategoryId(Integer id);
 
}