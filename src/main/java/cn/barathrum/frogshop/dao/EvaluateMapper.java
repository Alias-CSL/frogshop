package cn.barathrum.frogshop.dao;

import java.util.List;

import cn.barathrum.frogshop.bean.Evaluate;

public interface EvaluateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Evaluate record);

    int insertSelective(Evaluate record);

    Evaluate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Evaluate record);

    int updateByPrimaryKey(Evaluate record);
    //通过商品id获取商品所有评论
    List<Evaluate> selectEvaluatesByGoodId(Integer id);
}