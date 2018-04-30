package cn.barathrum.frogshop.controller.web;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.barathrum.frogshop.bean.Address;
import cn.barathrum.frogshop.bean.Cart;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Message;
import cn.barathrum.frogshop.bean.Sku;
import cn.barathrum.frogshop.service.AddressService;
import cn.barathrum.frogshop.service.GoodService;
import cn.barathrum.frogshop.service.UserService;

/**
 * 买家购物控制类，包括添加到购物车、购买、
 * 
 * @author 83893
 *
 */
@RestController
public class ShopController {

	@Autowired 
	private UserService userService;
	
	@Autowired
	private GoodService goodService;
	
	@Autowired
	private AddressService addressService;
	
	@RequestMapping(value="/collection.html")
	@RequiresAuthentication
	public ModelAndView collectionPage() {
		return new ModelAndView("person/collection");
	}
	/**
	 * 返回用户收藏的商品
	 * @param userId 用户id
	 * @param pn 页码
	 * @return
	 */
	@RequestMapping(value="/getMyCollection")
	@RequiresAuthentication
	@ResponseBody
	public Message getAllCollection(@RequestParam("userId")Integer userId,@RequestParam(name="pn",defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, 10);
		List<Good> goods = userService.selectAllCollection(userId);
		PageInfo pageInfo = null;
		if(goods != null && goods.size()>0) {
			pageInfo = new PageInfo(goods,10);
			return Message.success().add("pageInfo", pageInfo);
		}
		return Message.fail();
	}
	/**
	 * 用户添加评价
	 * @param userId 用户id
	 * @param orderNum 订单码
	 * @param content 内容
	 * @param grade 评分等级
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="commentTheGood",method=RequestMethod.POST)
	public Message commentTheGood(@RequestParam("userId")Integer userId,@RequestParam("orderNum")String orderNum,@RequestParam("content")String content,@RequestParam("grade")String grade) {
		int result = userService.insertNewComment(userId,orderNum,content,grade);
		if(result == 1) {
			return Message.success();
		}
		return Message.fail();
	}
	
	/**
	 * 将商品添加到购物车
	 * @param skuId 商品SKUId
	 * @param userId 用户ID
	 * @param goodNum 数量
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/addToCart",method=RequestMethod.POST)
	public Message addToCart(@RequestParam("skuId") Integer skuId, @RequestParam("userId") Integer userId,
			@RequestParam("goodNum") Integer goodNum,@RequestParam("goodName")String goodName) {
		Cart cart = userService.selectCartById(skuId,userId,goodName);//查询之前是否加入过购物车
		int result = 0 ;
		if(cart != null) {//之前已经加入过购物车,只需叠加数量
			result = userService.updateCartNum(cart.getId(),goodNum);
		}else {//之前已经加入过购物车
			result = userService.addToCart(skuId,userId,goodNum,goodName);
		}
		if(result == 1) {//添加成功
			return Message.success();			
		}
		System.out.println("sdfsdf");
		//添加失败
		return Message.fail();
	}
	/**
	 * 购买商品处理，跳转到订单页面
	 * @param userId 用户id
	 * @param skuId skuid
	 * @param goodNum 商品数量
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/buyTheGood",method=RequestMethod.POST)
	public ModelAndView buyGood(@RequestParam("userId") Integer userId,@RequestParam("skuId") Integer skuId,
			@RequestParam("count") Integer goodNum,@RequestParam("goodName")String goodName) {
		ModelAndView mav = new ModelAndView("home/pay");
		//先获取对应的sku信息
		Sku sku = goodService.getSkuBySkuId(skuId);
		//获取用户的收货地址
		List<Address> addresses = addressService.getAllAddress(userId);
		//通过skuId获取good名称
		//String goodName = goodService.getGoodNameBySkuId(skuId);
		//if(goodName != null) {
			mav.addObject("goodName",goodName);
		//}
		if(addresses != null && addresses.size() > 0) {
			mav.addObject("addresses",addresses);
		}
		if(sku != null) {
			String attr = sku.getAttributes().replaceAll("\"", "").replaceAll("\\{", "").replaceAll("\\}", "");
			sku.setAttributes(attr);
			mav.addObject("sku",sku);
		}
		mav.addObject("goodNum", goodNum);
		return mav;
	}
	
	
}
