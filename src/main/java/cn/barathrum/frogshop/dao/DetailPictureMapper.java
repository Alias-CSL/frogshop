package cn.barathrum.frogshop.dao;

import java.util.List;

import cn.barathrum.frogshop.bean.DetailPicture;

public interface DetailPictureMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DetailPicture record);

    int insertSelective(DetailPicture record);

    DetailPicture selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DetailPicture record);

    int updateByPrimaryKey(DetailPicture record);
    //通过商品Id获取商品描述图片
    List<DetailPicture> selectByGoodId(Integer id);
    
}