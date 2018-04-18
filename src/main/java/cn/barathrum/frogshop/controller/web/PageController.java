package cn.barathrum.frogshop.controller.web;

import java.lang.reflect.Method;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Message;
import cn.barathrum.frogshop.service.GoodService;

/**
 * 功能：分页控制器
 * @author 83893
 *
 */
@Controller
@RequestMapping("/page")
public class PageController {
	
	public static final int GOODNUM = 30;
	
	//注入商品业务逻辑类
	@Autowired
	private GoodService goodService;
	
	
	
	//商品分页控制器
	@RequestMapping(value="/good")
	@ResponseBody
	public Message getGoodByPage(@RequestParam("id") Integer id,@RequestParam(value="pageNum",defaultValue="1") int pageNum,@RequestParam("attr")String attr) {
		List<Good> goods = null;
		//引入分页插件，查询前设置好分页参数
		PageHelper.startPage(pageNum, GOODNUM);
		//如果商品查询属性为空
		if(attr.equals("") || attr.equals("")) {
			//根据类目id查询商品
			goods = goodService.getGoodByCategoryId(id);
		}else{
			//根据类目id与属性值查询商品
			//goods = goodService.getGoodByAttributes(id,attr);
		}
		//使用PageInfo包装分页查询结果
		PageInfo pageInfo = new PageInfo(goods,GOODNUM);
		return Message.success().add("pageInfo", pageInfo);
	}
	
}
