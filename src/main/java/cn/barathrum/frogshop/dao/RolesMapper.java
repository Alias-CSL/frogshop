package cn.barathrum.frogshop.dao;

import java.util.Set;

import cn.barathrum.frogshop.bean.Roles;

public interface RolesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Roles record);

    int insertSelective(Roles record);

    Roles selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Roles record);

    int updateByPrimaryKey(Roles record);
    //通过用户id获取Role
    Set<Roles> selectByUserId(Integer id);
    //通过用户名获取角色
    Set<String> selectByUserName(String username);
    
}