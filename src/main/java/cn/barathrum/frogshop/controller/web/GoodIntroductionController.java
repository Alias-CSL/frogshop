package cn.barathrum.frogshop.controller.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.barathrum.frogshop.bean.Attribute;
import cn.barathrum.frogshop.bean.Evaluate;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Message;
import cn.barathrum.frogshop.bean.Sku;
import cn.barathrum.frogshop.service.GoodService;
import cn.barathrum.frogshop.service.UserService;
import cn.barathrum.frogshop.utils.AttributeUtil;
/**
 * 商品详情控制类
 * @author 83893
 *
 */
@Controller
public class GoodIntroductionController {
	public static final  int PAGESIZE = 10;
	@Autowired
	private GoodService goodService;
	
	@Autowired 
	private UserService userService;
	/**
	 * 收藏商品，先判断商品是否存在
	 * @param goodId 商品id
	 * @param userId 用户id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addToCollection",method=RequestMethod.POST)
	public Message addToCollection(@RequestParam("goodId")Integer goodId,@RequestParam("userId")Integer userId) {
		int result = userService.insertCollectionRecord(goodId,userId);
		if(result == 1) {//收藏成功
			return Message.success();
		}
		//之前收藏过，收藏失败
		return Message.fail();
	}
	
	// 通过商品id获取商品详情相关的数据
	@RequestMapping("/good/introduction/{id}")
	public ModelAndView getGoodIntroduction(@PathVariable("id") Integer id) {
		ModelAndView mv = new ModelAndView("home/introduction");
		Good good = goodService.getGoodByGoodId(id);
		//good.getDescPictures();// 获取描述图片
		//good.getDetailPictures();// 获取详情图片
		//引入分页插件，查询前设置好分页参数
	/*	PageHelper.startPage(1, PAGESIZE);
		List<Evaluate> evaluates = good.getEvaluates();// 获取商品评论
		//使用PageInfo包装分页查询结果
		PageInfo pageInfo ;
		if(evaluates != null && evaluates.size() > 0) {
			pageInfo = new PageInfo(evaluates,PAGESIZE);
		}else{
			pageInfo = null;
		}
		mv.addObject("evaluatePageInfo",pageInfo);//向model中添加评论分页数据*/
		List<Sku> sku = good.getSkus();// 获取商品库存信息
		List<Attribute> attributes = AttributeUtil.getSaleAttribute(sku);// 获取商品销售属性
		String json = goodService.getProductAttributes(id);// 获取商品的产品参数的json字符串
		List<String> productAttributes = AttributeUtil.getProductAttribute(json);// 获取商品产品参数
		mv.addObject("good", good);
		if (productAttributes != null) {
			mv.addObject("productAttributes",productAttributes);
		}
		if (attributes != null) {
			mv.addObject("attributes", attributes);
		}
		return mv;
	}
	/**
	 * 获取商品评价
	 * @param pageNum 页码
	 * @param id 商品id
	 * @return
	 */
	@RequestMapping("/getEvaluate")
	@ResponseBody
	public Message getEvaluate(@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,@RequestParam("goodId") Integer id) {
		//引入分页插件，分页前设置好参数
		PageHelper.startPage(pageNum,PAGESIZE);
		//获取评论
		List<Evaluate> evaluates = goodService.getEvaluateByGoodId(id);
		//使用PageInfo包装分页查询结果
		PageInfo pageInfo = null;
		if(evaluates.size() > 0 && evaluates != null) {//评论不为空返回数据
			pageInfo = new PageInfo(evaluates,PAGESIZE);
			return Message.success().add("pageInfo", pageInfo);
		}
		return Message.fail();//评论为空，返回错误代码
	}
	
	//根据商品规格获取库存
	@RequestMapping("/getStockMessage")
	@ResponseBody
	public Message getStockMessage(@RequestParam("goodId")Integer goodId,@RequestParam("attr") String attr) {
		String attribute = null;
		try {
			attribute = URLDecoder.decode(attr, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//解析json为数据库查询字符串
		//List<String> attributes = JsonParse.JsonParseToAttributes(attribute); 
		//通过商品规格获取对应的sku信息
		Sku sku = goodService.getSkuByAttributes(goodId,attribute);
		if(sku != null) {
			return Message.success().add("sku", sku);
		}
		return Message.fail();
	}
	
	//获取总库存
	@RequestMapping("/getTotalStockMessage")
	@ResponseBody
	public Message getTotalStockMessage(@RequestParam("goodId")Integer goodId) {
		//获取商品
		Good good = goodService.getGoodByGoodId(goodId);
		if(good != null) {
			return Message.success().add("good", good);
		}
		return Message.fail();
	}
	/*
	 * public Message getGoodIntroduction(@PathVariable("id") Integer id) { Good
	 * good = goodService.getGoodByGoodId(id); good.getDescPictures();//获取描述图片
	 * good.getDetailPictures();//获取详情图片 good.getEvaluates();//获取商品评论 List<Sku>
	 * sku = good.getSkus();//获取商品库存信息 List<Attribute> attributes =
	 * AttributeUtil.getAttribute(sku);//获取商品销售属性 Message message =
	 * Message.success().add("good", good); if(attributes != null) {
	 * message.add("attributs", attributes); } return message; }
	 */
}
