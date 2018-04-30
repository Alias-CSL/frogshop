package cn.barathrum.frogshop.controller.web;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.barathrum.frogshop.bean.Message;
import cn.barathrum.frogshop.bean.Order;
import cn.barathrum.frogshop.logistics.KdniaoTrackQueryAPI;
import cn.barathrum.frogshop.service.UserService;

@Controller
public class OrderController {
	private  final int PAGESIZE = 10; 
	private final int  NOTPAID = 1;//待付款
	private final int  NOTSHIPPED = 2;//待发货
	private final int  NOTRECEIPT = 3;//待收货
	private final int  NOTEVALUATE = 4;//待评价
	private final int CANCELORDER = 6;//取消订单
	@Autowired
	UserService userService;
	/**
	 * 获取物流信息
	 * @param orderId 订单id
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping("/logistics")
	public ModelAndView  logistics(@RequestParam("orderId")Integer orderId) {
		ModelAndView mav = new ModelAndView("person/logistics");
		//通过订单id获取快递编码与快递名
		Order order = userService.getOrderByPrimaryKey(orderId);
		String subStr = ",\"expressName\":\""+order.getExpressName()+"\"}";
		String str = KdniaoTrackQueryAPI.getOrderTraces(order.getExpressName(),order.getExpressNum());
		String result = str.substring(0,str.length()-1)+subStr;
		mav.addObject("result", result);
		System.out.println(result);
		return mav;
	}
	
	/**
	 * 跳转到用户的订单管理页面,要求用户为登陆状态
	 */
	@RequiresAuthentication
	@RequestMapping("/order.html")
	public String userOrderList() {
		return "person/order";
	}
	
	/**
	 * 确认收货
	 * @param orderId
	 * @return
	 */
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping(value="/confiemRecept",method=RequestMethod.POST)
	public Message confiemRecept(@RequestParam("orderId") Integer orderId) {
		int result = userService.updateOrderStatus(orderId,4);
		if(result == 1) {
			return Message.success();
		}
		return Message.fail();
	}
	/**
	 * 取消订单
	 * @param orderId
	 * @return
	 */
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping(value="/cancelOrder",method=RequestMethod.POST)
	public Message cancelOrder(@RequestParam("orderId") Integer orderId) {
		int result = userService.updateOrderStatus(orderId,CANCELORDER);
		if(result == 1) {
			return Message.success();
		}
		return Message.fail();
	}
	/**
	 * 获取用户所有未支付的订单信息
	 * @param userId 用户id
	 * @param pn 页码
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/getOrdersWithoutPaying",method=RequestMethod.GET)
	@ResponseBody
	public Message getOrdersWithoutPaying(@RequestParam("userId")Integer userId,@RequestParam(name="pn",defaultValue="1")Integer pn) {
		PageInfo pageInfo = getOrderPageInfo(userId,pn,NOTPAID);
		if(pageInfo != null) {
			return Message.success().add("pageInfo", pageInfo);
		}
		 return Message.fail();
	}
	/**
	 * 获取用户所有未发货的订单信息
	 * @param userId
	 * @param pn
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/getOrdersWithoutSipping",method=RequestMethod.GET)
	@ResponseBody
	public Message getOrdersWithoutSipping(@RequestParam("userId")Integer userId,@RequestParam(name="pn",defaultValue="1")Integer pn) {
		PageInfo pageInfo = getOrderPageInfo(userId,pn,NOTSHIPPED);
		if(pageInfo != null) {
			return Message.success().add("pageInfo", pageInfo);
		}
		 return Message.fail();
	}
	
	/**
	 * 获取用户所有未收货的订单信息
	 * @param userId
	 * @param pn
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/getMyOrdersWithoutReceipt",method=RequestMethod.GET)
	@ResponseBody
	public Message getMyOrdersWithoutReceipt(@RequestParam("userId")Integer userId,@RequestParam(name="pn",defaultValue="1")Integer pn) {
		PageInfo pageInfo = getOrderPageInfo(userId,pn,NOTRECEIPT);
		if(pageInfo != null) {
			return Message.success().add("pageInfo", pageInfo);
		}
		 return Message.fail();
	}
	
	/**
	 * 获取用户所有未评价的订单信息
	 * @param userId
	 * @param pn
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/getMyOrdersWithoutEvaluate",method=RequestMethod.GET)
	@ResponseBody
	public Message getMyOrdersWithoutEvaluate(@RequestParam("userId")Integer userId,@RequestParam(name="pn",defaultValue="1")Integer pn) {
		PageInfo pageInfo = getOrderPageInfo(userId,pn,NOTEVALUATE);
		if(pageInfo != null) {
			return Message.success().add("pageInfo", pageInfo);
		}
		 return Message.fail();
	}
	/**
	 * 获取不同状态的订单信息
	 * @param userId 用户id
	 * @param pn 页码
	 * @param status 订单状态
	 * @return
	 */
	public PageInfo getOrderPageInfo(Integer userId,Integer pn,Integer status) {
		PageHelper.startPage(pn,PAGESIZE);
		List<Order> orders = userService.selectOrderByStatus(userId,status);
		PageInfo pageInfo = null;
		if(orders != null && orders.size() > 0) {
			pageInfo = new PageInfo(orders,PAGESIZE);
			return pageInfo;
		}
		return null;
	}
	/**
	 * 获取用户所有订单信息
	 * @param userId 用户id
 	 * @param pn 页码
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/getMyOrders",method=RequestMethod.GET)
	@ResponseBody
	public Message getMyOrders(@RequestParam("userId")Integer userId,@RequestParam(name="pn",defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, PAGESIZE);
		List<Order> orders = userService.selectOrderByUserId(userId);
		PageInfo pageInfo = null;
		if(orders != null && orders.size() > 0) {
			pageInfo = new PageInfo(orders,PAGESIZE);
			return Message.success().add("pageInfo", pageInfo);
		}
			return Message.fail();
	}

	/**
	 * 支付订单,通过shiro要求用户登录之后才可以付款
	 * @param orderId 订单号
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping("/payBill")
	@ResponseBody
	public ModelAndView payBill(@RequestParam("orderId")Integer orderId) {
		ModelAndView mav = new ModelAndView();
		Order order = userService.payTheOrder(orderId);
		if(order != null) {//支付成功
			mav.setViewName("home/success");//设置视图名
			mav.addObject("order", order);//添加订单对象
			return mav;
		}
		//支付失败
		mav.setViewName("fail");
		return mav;
	}
	
	/**
	 * 创建订单，并返回订单信息,通过shiro要求用户登录之后才可以添加订单
	 * @param order 订单对象
	 * @param skuId 商品sku id
	 * @param goodName 商品名称
	 * @return
	 */
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping(value="/createOrder",method=RequestMethod.POST)
	public ModelAndView createOrder(Order order,@RequestParam("skuId")Integer skuId,@RequestParam("goodName")String goodName) {
		ModelAndView mav =new ModelAndView();
		//销量加一，库存减一
		int result = userService.updateGoodData(order.getGoodNum(),skuId);
		if(result == 1) {//有库存，可以下单
			//先创建订单然后再创建订单商品关联
			userService.addOrder(order);
			Order newOrder = userService.getOrderByPrimaryKey(order.getId()); 
			//根据订单id创建订单商品
			int result1 = userService.createOrderGood(order.getId(),skuId,order.getGoodNum(),goodName);
			
			if(result1 > 0) {//提交订单成功
				mav.setViewName("home/paybill");
				newOrder.getAddress();//取消延迟加载
				mav.addObject("newOrder", newOrder);
				return mav;
			}else {
				mav.addObject("message", Message.fail());
				mav.setViewName("home/payFail");
				return mav;
			}
		}else {
			mav.addObject("message", Message.fail());
			mav.setViewName("home/payFail");
		}
		//设置提交订单失败页面
		return mav;
	}
}
