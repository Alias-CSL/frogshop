package cn.barathrum.frogshop.dao;

import cn.barathrum.frogshop.bean.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    //通过用户名获取用户
	User selectByUsername(String username);
    
}