package cn.barathrum.frogshop.controller.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.barathrum.frogshop.bean.Category;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Message;
import cn.barathrum.frogshop.service.GoodService;
import cn.barathrum.frogshop.utils.JsonParseUtil;

/**
 * 商品控制类
 * 
 * @author 83893
 *
 */
@Controller
// @RequestMapping(")
public class GoodController {
	public static final int GOODNUM = 32;
	@Autowired
	private GoodService goodService;

	// 获取外套商品
	@RequestMapping("/man/coat/{id}")
	@ResponseBody
	public ModelAndView getCoat(@PathVariable("id") Integer id) {
		ModelAndView mv = new ModelAndView("home/search");
		/*PageHelper.startPage(1, 32);
		List<Good> goods = goodService.getGoodByCategoryId(id);
		PageInfo page = new PageInfo(goods, GOODNUM);
		if (goods != null) {
			mv.addObject("page", page);// 将商品数据添加到ModelAndView
		}*/
		Category category = goodService.getCategoryById(id);
		category.getAttributeNames();// 加载attributes
		mv.addObject("category", category);// 将类目数据添加到ModelAndView
		return mv;
	}

	@RequestMapping("/getGoods")
	@ResponseBody
	public Message getGoods(@RequestParam("id") Integer id,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "attr", defaultValue = " ") String attr) {
		List<Good> goods = null;//存放商品数据的集合
		//引入分页插件，查询前设置好分页参数
		PageHelper.startPage(pageNum, GOODNUM);
		//使用PageInfo包装分页查询结果
		PageInfo pageInfo ;
		//先判断是否查询属性，如果有则进行商品属性查询，若没有则进行全属性查询
		String attribute = null;
		try {
			attribute = URLDecoder.decode(attr, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		if(attribute.equals(" ") || attribute.equals("") || attribute == null) {
			//根据类目id查询商品
			goods = goodService.getGoodByCategoryId(id);
		}else{
			//根据类目id与属性值查询商品
			//解析json为数据库查询字符串
			List<String> attributes = JsonParseUtil.JsonParseToAttributes(attribute); 
			goods = goodService.getGoodByAttributes(id,attributes);
		}
		if(goods != null && goods.size() > 0) {
			pageInfo = new PageInfo(goods,GOODNUM);
			return Message.success().add("pageInfo", pageInfo);	
		}else{
			return Message.fail();
		}
	}
}
