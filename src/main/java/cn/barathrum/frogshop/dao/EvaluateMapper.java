package cn.barathrum.frogshop.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	/**
	 * 用户添加评价
	 * @param userId 用户id
	 * @param orderNum 订单码
	 * @param content 内容
	 * @param grade 评分等级
	 * @param date 评价日期哦
	 * @return
	 */
	int insertNewRecord(@Param("userId")Integer userId, @Param("orderNum")String orderNum, @Param("content")String content, @Param("grade")String grade, @Param("createTime")Date date);
}