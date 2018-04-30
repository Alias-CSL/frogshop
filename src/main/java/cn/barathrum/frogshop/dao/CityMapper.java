package cn.barathrum.frogshop.dao;

import java.util.List;

import cn.barathrum.frogshop.bean.City;

public interface CityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(City record);

    int insertSelective(City record);

    City selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(City record);

    int updateByPrimaryKey(City record);
	//通过省份id获取城市
    List<City> selectByProvinceId(Integer id);
}