package cn.barathrum.frogshop.dao;

import java.util.List;

import cn.barathrum.frogshop.bean.District;

public interface DistrictMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(District record);

    int insertSelective(District record);

    District selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(District record);

    int updateByPrimaryKey(District record);
	//通过城市id获取地区
	List<District> selectByCityId(Integer id);
	//通过城市名获取地区
	List<District> selectByCityName(String cityName);
}