package cn.barathrum.frogshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.barathrum.frogshop.bean.Category;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
    
    Category selectByCategoryName(String name);
	/**
	 * 根据商品类目等级获取类目
	 * @param grade 商品类目等级
	 * @return
	 */
	List<Category> selectByPID(@Param("grade")Integer grade);
}