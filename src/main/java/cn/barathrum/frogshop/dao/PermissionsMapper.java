package cn.barathrum.frogshop.dao;

import java.util.Set;

import cn.barathrum.frogshop.bean.Permissions;

public interface PermissionsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Permissions record);

    int insertSelective(Permissions record);

    Permissions selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Permissions record);

    int updateByPrimaryKey(Permissions record);
    //通过角色id获取权限
    Set<Permissions> selectByRoleId(Integer id);
    //通过用户名获取权限
	Set<String> selectByUserName(String username);
	//通过手机号获取权限
	Set<String> selectByPhoneNum(String phoneNum);
	//通过邮箱获取权限
	Set<String> selectByEmail(String email);
    
}