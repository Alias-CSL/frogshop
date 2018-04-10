package cn.barathrum.frogshop.dao;

import cn.barathrum.frogshop.bean.PermissionRole;

public interface PermissionRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PermissionRole record);

    int insertSelective(PermissionRole record);

    PermissionRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PermissionRole record);

    int updateByPrimaryKey(PermissionRole record);
}