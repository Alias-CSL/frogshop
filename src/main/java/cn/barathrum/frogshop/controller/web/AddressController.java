package cn.barathrum.frogshop.controller.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.barathrum.frogshop.bean.Address;
import cn.barathrum.frogshop.bean.City;
import cn.barathrum.frogshop.bean.District;
import cn.barathrum.frogshop.bean.Message;
import cn.barathrum.frogshop.bean.Province;
import cn.barathrum.frogshop.service.AddressService;
import cn.barathrum.frogshop.service.UserService;

/**
 * 收货地址相关信息拦截类
 * 
 * @author 83893
 *
 */
@Controller
public class AddressController {
	@Autowired
	private UserService userService;

	@Autowired
	private AddressService addressService;
	
	@RequiresAuthentication
	@RequestMapping(value = "/getAllAddresses", method = RequestMethod.GET)
	public ModelAndView getAllAddresses(@RequestParam("userId") Integer userId) {
		ModelAndView mav = new ModelAndView("person/address");
		//获取用户的收货地址
		List<Address> addresses = addressService.getAllAddress(userId);
		if(addresses != null && addresses.size() > 0) {
			mav.addObject("addresses",addresses);
		}
		return mav;
	}
	/**
	 * 修改地址,通过shiro要求用户登录之后才可以进行操作
	 * @return
	 */
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping(value = "/changeAddress", method = RequestMethod.POST)
	public Message changeAddress(Address address) {
		//URLDecoder.decode(s, enc)
		Address modifyAddress = addressService.modifyAddress(address);
		if(modifyAddress != null) {
			return Message.success().add("modifyAddress", modifyAddress);
		}
		return Message.fail();
	}

	/**
	 * 添加新的地址,通过shiro要求用户登录之后才可以进行操作
	 * @return
	 */
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping(value = "/addNewAddress", method = RequestMethod.POST)
	public Message addNewAddress(Address address) {
		
		Address newAddress = addressService.addNewAddress(address);
		if (newAddress != null) {
			return Message.success().add("newAddress", newAddress);
		}
		return Message.fail();
	}
	/**
	 * 删除地址,通过shiro要求用户登录之后才可以进行操作
	 * @param addressId 地址id
	 * @return
	 */
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping(value = "/removeAddress", method = RequestMethod.GET)
	public Message removeAddress(@RequestParam("id")Integer addressId) {
		
		int result = addressService.removeAddress(addressId);
		
		if (result == 1) {//删除成功
			return Message.success();
		}
		return Message.fail();
	}
	/**
	 * 修改默认地址，先将之前设置的默认地址设置为普通地址，然后将选中的地址设置为默认地址,通过shiro要求用户登录之后才可以进行操作
	 * @param addressId 要设置为默认地址的地址id
	 * @param defaultAddressId 之前的默认地址id
	 * @return
	 */
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping(value = "/saveAsDefaultAddress", method = RequestMethod.POST)
	public Message saveAsDefaultAddress(@RequestParam("id")Integer addressId,@RequestParam("defaultAddressId")Integer defaultAddressId) {
		
		int result = addressService.saveAsDefaultAddress(addressId,defaultAddressId);
		
		if (result == 1) {//修改成功
			return Message.success();
		}
		return Message.fail();
	}
	/**
	 * 返回所有省份
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getAllProvince")
	public Message getAllProvince() {
		List<Province> provinces = addressService.getAllProvince();
		if (provinces != null && provinces.size() > 0) {// 获取的数据不为空
			return Message.success().add("results", provinces);
		}
		return Message.fail();
	}

	/**
	 * 返回省份中所有城市
	 * 
	 * @param id
	 *            省份id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getCitiesByProvinceId")
	public Message getCitiesByProvinceId(@RequestParam("id") Integer id) {
		List<City> cities = addressService.getCitiesByProvinceId(id);
		if (cities != null && cities.size() > 0) {// 获取的数据不为空
			return Message.success().add("results", cities);
		}
		return Message.fail();
	}

	/**
	 * 通过城市名获取地区
	 * 
	 * @param cityName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getDistByCityName")
	public Message getDistByCityName(@RequestParam("id") String cityName) {
		String name = null;
		try {
			name = URLDecoder.decode(cityName, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<District> districts = addressService.getDistByCityName(name);
		System.out.println("in");
		if (districts != null && districts.size() > 0) {// 获取的数据不为空
			System.out.println("True");
			return Message.success().add("results", districts);
		}
		return Message.fail();
	}

	/**
	 * 通过city id获取地区
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getDistByCityId")
	public Message getDistByCityId(@RequestParam("id") Integer id) {
		List<District> districts = addressService.getDistrictByCityId(id);
		System.out.println("in");
		if (districts != null && districts.size() > 0) {// 获取的数据不为空
			System.out.println("True");
			return Message.success().add("results", districts);
		}
		return Message.fail();
	}
}
