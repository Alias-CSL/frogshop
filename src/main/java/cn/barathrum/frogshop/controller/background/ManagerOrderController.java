package cn.barathrum.frogshop.controller.background;

import java.util.List;

import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.barathrum.frogshop.bean.Message;
import cn.barathrum.frogshop.bean.Order;
import cn.barathrum.frogshop.service.GoodService;

@Controller
public class ManagerOrderController {
	private final int UNSHIPPED = 2;
	@Autowired
	private GoodService goodService;
	/**
	 * 跳转到订单发货页面
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/shipments.html",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView shipments() {
		ModelAndView mav = new ModelAndView("background/deliver_good");
		List<Order> orders = goodService.selectOrderByStatus(UNSHIPPED);
		if(orders != null && orders.size() > 0){
			mav.addObject("orders", orders);
			return mav;
		}
		return mav;
	}
	/**
	 * 订单发货处理
	 * @param orderId 订单id
	 * @param orderShipped 订单编码
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/orderShipped",method=RequestMethod.POST) 
	@ResponseBody
	public Message orderShipped(@RequestParam("orderId")Integer orderId,@RequestParam("expressNum")String expressNum) {
		int result = goodService.updateOrderShippedStatus(orderId,expressNum);
		if(result == 1) {
			return Message.success();
		}else{
			return Message.fail();
		}
	}
	
	
	@ExceptionHandler(value={UnknownAccountException.class,UnauthorizedException.class,UnauthenticatedException.class,AuthorizationException.class})
	public String handleException() {
		return "background/login";
	}
}
