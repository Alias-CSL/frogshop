package cn.barathrum.frogshop.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.barathrum.frogshop.bean.Address;
import cn.barathrum.frogshop.bean.City;
import cn.barathrum.frogshop.bean.District;
import cn.barathrum.frogshop.bean.Province;
import cn.barathrum.frogshop.dao.AddressMapper;
import cn.barathrum.frogshop.dao.CityMapper;
import cn.barathrum.frogshop.dao.DistrictMapper;
import cn.barathrum.frogshop.dao.ProvinceMapper;
import cn.barathrum.frogshop.service.AddressService;
@Service
public class AddressServiceImpl implements AddressService {
	// 注入AddressDao
	@Autowired
	private AddressMapper addressMapper;
	// 注入ProvinceMapper
	@Autowired
	private ProvinceMapper provinceMapper;
	// 注入CityMapper
	@Autowired
	private CityMapper cityMapper;
	// 注入DistrictMapper
	@Autowired
	private DistrictMapper districtMapper;

	// 获取用户的收货地址
	@Override
	public List<Address> getAllAddress(Integer userId) {
		List<Address> addresses = addressMapper.selectByUserId(userId);
		return addresses;
	}

	// 获取所有省份
	@Override
	public List<Province> getAllProvince() {
		List<Province> provinces = provinceMapper.selectAll();
		return provinces;
	}

	// 通过省份id获取城市
	@Override
	public List<City> getCitiesByProvinceId(Integer id) {
		return cityMapper.selectByProvinceId(id);
	}

	// 通过城市id获取地区
	@Override
	public List<District> getDistrictByCityId(Integer id) {
		return districtMapper.selectByCityId(id);
	}

	// 通过城市名获取地区
	@Override
	public List<District> getDistByCityName(String cityName) {
		return districtMapper.selectByCityName(cityName);
	}

	/**
	 * 添加新的地址
	 * 
	 * @return
	 */
	@Override
	public Address addNewAddress(Address address) {

		addressMapper.insertSelective(address);
		return address;
	}

	/**
	 * 修改地址
	 */
	@Override
	public Address modifyAddress(Address address) {
		addressMapper.updateByPrimaryKeySelective(address);
		return address;
	}

	/**
	 * 删除地址
	 */
	@Override
	public int removeAddress(Integer addressId) {
		return addressMapper.deleteByPrimaryKey(addressId);
	}

	/**
	 * 修改默认地址，先将之前设置的默认地址设置为普通地址，然后将选中的地址设置为默认地址
	 * 
	 * @param addressId
	 *            要设置为默认地址的地址id
	 * @param defaultAddressId
	 *            之前的默认地址id
	 * @return
	 */
	@Override
	public int saveAsDefaultAddress(Integer addressId, Integer defaultAddressId) {
		// 先将之前的默认地址设置为普通地址
		List<Map<String, Object>> data = new ArrayList<>();
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("id", addressId);
		map1.put("status", 1);

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("id", defaultAddressId);
		map2.put("status", 2);
		data.add(map1);
		data.add(map2);
		int reult = addressMapper.updateDefaultAddressByMap(data);
		return reult;
	}
}
