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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Message;
import cn.barathrum.frogshop.bean.Sku;
import cn.barathrum.frogshop.service.GoodService;

@Controller
public class ManageGoodController {
	@Autowired
	private GoodService goodService;
	/**
	 * 返回商品管理页
	 * @return
	 */
	@RequestMapping("table.html")
	public String tablePage() {
		return "background/table";
	}
	
	
	/**
	 * 批量更新多条sku记录
	 * @param skus 多个sku对象
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/updateSkus",method=RequestMethod.POST)
	@ResponseBody
	public Message updateSkus(@RequestBody List<Sku> skus) {
		int result = goodService.updateSkus(skus);
		if(result == 1) {
			return Message.success();
		}else{
			return Message.fail();
		}
	}
	
	/**
	 * 更新单条sku记录
	 * @param sku
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/updateGoodSku",method=RequestMethod.POST)
	@ResponseBody
	public Message updateGoodSku(Sku sku) {
		int result = goodService.updateSku(sku);
		if(result == 1) {
			return Message.success();
		}else{
			return Message.fail();
		}
	}
	
	
	/**
	 * 删除单条sku记录
	 * @param skuId sku主键
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/delOneSku",method=RequestMethod.POST)
	@ResponseBody
	public Message delOneSku(@RequestParam("skuId")Integer skuId,@RequestParam("goodId")Integer goodId) {
		int result = goodService.deleteSkuById(skuId,goodId);
		if(result == 1) {
			return Message.success();
		}else{
			return Message.fail();
		}
	}
	
	/**
	 * 删除多条sku记录
	 * @param ids 包含多个sku主键
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/deleteSkus",method=RequestMethod.POST)
	@ResponseBody
	public Message deleteSkus(@RequestParam("skuIds")String ids,@RequestParam("goodId")Integer goodId) {
		String[] sIds = ids.split(",");
		Integer[] skuIds = new Integer[sIds.length];
		for(int i = 0 ; i < sIds.length;i++) {
			skuIds[i] = Integer.parseInt(sIds[i]);
		}
		int result = goodService.deleteSkuByIds(skuIds,goodId);
		if(result == 1) {
			return Message.success();
		}else{
			return Message.fail();
		}
	}
	/**
	 * 返回商品sku
	 * @param goodId 商品id
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/myloginfo",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView getGoodSkus(@RequestParam("goodId")Integer goodId) {
		ModelAndView mav = new ModelAndView("background/skuInfo");
		List<Sku> skus = goodService.getSkuByGoodId(goodId);
		if(skus != null && skus.size() > 0) {
			
			mav.addObject("skus", skus);
		}
		return mav;
	}
	/**
	 * 删除指定id的商品
	 * @param goodId 商品id
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/delOneGood",method=RequestMethod.POST)
	@ResponseBody
	public Message delOneGood(@RequestParam("goodId")Integer goodId) {
		int result = goodService.deleteGoodById(goodId);
		if(result == 1) {
			return Message.success();
		}else{
			return Message.fail();
		}
	}
	/**
	 * 批量删除商品
	 * @param ids 多个商品id
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/deleteGoods",method=RequestMethod.POST)
	@ResponseBody
	public Message deleteGoods(@RequestParam("ids")String ids) {
		String[] sIds = ids.split(",");
		Integer[] goodIds = new Integer[sIds.length];
		for(int i = 0 ; i < sIds.length;i++) {
			goodIds[i] = Integer.parseInt(sIds[i]);
		}
		int result = goodService.deleteGoodByIds(goodIds);
		if(result == 1) {
			return Message.success();
		}else{
			return Message.fail();
		}
	}
	
	/**
	 * 更新商品上下架状态
	 * @param goodId 商品id
	 * @param status 上下架状态
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/putawayGood",method=RequestMethod.POST)
	@ResponseBody
	public Message putawayGood(@RequestParam("goodId")Integer goodId,@RequestParam("status")Byte status) {
		int result = goodService.updateGoodStatus(goodId,status);
		if(result == 1) {
			return Message.success();
		}else{
			return Message.fail();
		}
	}
	
	/**
	 * 获取所有商品
	 * @param pageNum
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping("/getAllGoods")
	@ResponseBody
	public Message getAllGoods(@RequestParam("pageNum")int pageNum){
		PageHelper.startPage(pageNum, 24);
		List<Good> goods = goodService.getAllGoods();

		PageInfo pageInfo = null;
		if(goods != null && goods.size() > 0) {
		    pageInfo = new PageInfo(goods,24);
			return Message.success().add("pageInfo", pageInfo);
		}
		return Message.fail();
	}
	
	@ExceptionHandler(value={UnknownAccountException.class,UnauthorizedException.class,UnauthenticatedException.class,AuthorizationException.class})
	public String handleException() {
		return "background/login";
	}
}
