package cn.barathrum.frogshop.dao;

import java.util.List;

import cn.barathrum.frogshop.bean.Province;

public interface ProvinceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Province record);

    int insertSelective(Province record);

    Province selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Province record);

    int updateByPrimaryKey(Province record);
    //获取所有省份
    List<Province> selectAll();
}