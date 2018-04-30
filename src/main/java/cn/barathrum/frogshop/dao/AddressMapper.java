package cn.barathrum.frogshop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.barathrum.frogshop.bean.Address;

public interface AddressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
    //通过用户id获取地址
    List<Address> selectByUserId(Integer userId);
    //通过用户id更新地址
	int updateByUserIdSelective(Address address);
	//批量更新操作
	int updateDefaultAddressByMap(@Param("list")List<Map<String,Object>> list);
}