package cn.barathrum.frogshop.service;

import java.util.List;

import cn.barathrum.frogshop.bean.Address;
import cn.barathrum.frogshop.bean.City;
import cn.barathrum.frogshop.bean.District;
import cn.barathrum.frogshop.bean.Province;

public interface AddressService {
	// 获取用户的收货地址
	List<Address> getAllAddress(Integer userId);
	
	//获取所有省份
	List<Province> getAllProvince();
	
	//通过省份id获取城市
	List<City> getCitiesByProvinceId(Integer id);
	
	//通过城市id获取地区
	List<District> getDistrictByCityId(Integer id);
	
	//通过城市名获取地区
	List<District> getDistByCityName(String cityName);
	/**
	 * 添加新的地址
	 * @return
	 */
	Address addNewAddress(Address address);
	/**
	 * 修改地址
	 * @param address
	 * @return
	 */
	Address modifyAddress(Address address);
	/**
	 * 删除收货地址
	 * @param addressId
	 * @return
	 */
	int removeAddress(Integer addressId);
	/**
	 * 修改默认地址，先将之前设置的默认地址设置为普通地址，然后将选中的地址设置为默认地址
	 * @param addressId 要设置为默认地址的地址id
	 * @param defaultAddressId 之前的默认地址id
	 * @return
	 */
	int saveAsDefaultAddress(Integer addressId, Integer defaultAddressId);
}
