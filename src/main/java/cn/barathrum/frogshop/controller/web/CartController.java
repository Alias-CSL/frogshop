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
import cn.barathrum.frogshop.service.CartService;
import cn.barathrum.frogshop.service.GoodService;
import cn.barathrum.frogshop.service.OrderService;
import cn.barathrum.frogshop.service.UserService;

/**
 * 买家购物控制类，包括添加到购物车、购买、
 * 
 * @author 83893
 *
 */
@RestController
public class CartController {

	@Autowired 
	private UserService userService;
	
	@Autowired
	private GoodService goodService;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/collection.html")
	@RequiresAuthentication
	public ModelAndView collectionPage() {
		return new ModelAndView("person/collection");
	}
	/**
	 * 更新购物车商品数量
	 * @param cartId 购物车商品 id
	 * @param count 数量
	 * @return
	 */
	@RequestMapping(value="/changeGoodNum",method=RequestMethod.POST)
	@ResponseBody
	@RequiresAuthentication
	public Message changeGoodNum(@RequestParam("cartId")Integer cartId,@RequestParam("count")int count) {
		int result = cartService.updateCartGoodNum(cartId,count);
		if(result == 1){
			return Message.success();
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
		int result = orderService.insertNewComment(userId,orderNum,content,grade);
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
	 * @param goodName商品名
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/addToCart",method=RequestMethod.POST)
	public Message addToCart(@RequestParam("skuId") Integer skuId, @RequestParam("userId") Integer userId,
			@RequestParam("goodNum") Integer goodNum,@RequestParam("goodName")String goodName) {
		Cart cart = cartService.selectCartById(skuId,userId,goodName);//查询之前是否加入过购物车
		int result = 0 ;
		if(cart != null) {//之前已经加入过购物车,只需叠加数量
			result = cartService.updateCartNum(cart.getId(),goodNum);
		}else {//之前已经加入过购物车
			result = cartService.addToCart(skuId,userId,goodNum,goodName);
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
	/**
	 * 从购物车跳转到支付页面
	 * @param cartIds 购物车选中的商品信息
	 * @param userId 用户id
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping("/goToPay") 
	public ModelAndView goToPay(@RequestParam("cartIds")String cartIds,@RequestParam("userId")Integer userId) {
		ModelAndView mav = new ModelAndView("home/paygoods");
		//获取用户想要购买的商品
		String[] sIds = cartIds.split(",");
		Integer[] ids = new Integer[sIds.length];
		for(int i = 0 ; i < sIds.length;i++) {
			ids[i] = Integer.parseInt(sIds[i]);
		}
		//获取购物车商品
		List<Cart> carts = cartService.selectCartByIds(ids);
		mav.addObject("carts", carts);
		mav.addObject("cartIds", cartIds);
		//System.out.println(carts.size());
		//用户地址
		//获取用户的收货地址
		List<Address> addresses = addressService.getAllAddress(userId);
		mav.addObject("addresses", addresses);
		return mav;
	}
	
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping(value="/deleteCart",method=RequestMethod.POST)
	public Message deleteCart(@RequestParam("cartId")Integer cartId) {
		int result = cartService.deleteCartById(cartId);
		if(result == 1) {
			return Message.success();
		}
		return Message.fail();
	}
}
