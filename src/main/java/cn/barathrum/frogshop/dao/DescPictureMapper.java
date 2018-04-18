package cn.barathrum.frogshop.dao;

import java.util.List;

import cn.barathrum.frogshop.bean.DescPicture;

public interface DescPictureMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DescPicture record);

    int insertSelective(DescPicture record);

    DescPicture selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DescPicture record);

    int updateByPrimaryKey(DescPicture record);
    //通过商品Id获取描述图片信息
    List<DescPicture> selectByGoodId(Integer id);
}