package cn.barathrum.frogshop.controller.background;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.barathrum.forgshop.qiniuyun.QiniuUtils;
import cn.barathrum.frogshop.bean.AttributeGood;
import cn.barathrum.frogshop.bean.AttributeName;
import cn.barathrum.frogshop.bean.Category;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Message;
import cn.barathrum.frogshop.form.bean.GoodSku;
import cn.barathrum.frogshop.form.bean.UploadGoodModel;
import cn.barathrum.frogshop.form.bean.UploadImge;
import cn.barathrum.frogshop.service.GoodService;

/**
 * 处理商品上传、修改操作
 * 
 * @author 83893
 *
 */
@Controller("fileController")
public class FileController {
	// 七牛云测试域名
	private final String IP = "http://p7bhzmlhi.bkt.clouddn.com/";
	// 商品顶级类目编码
	private final Integer FIRSTPID = 0;
	// 商品二级类目编码
	private final Integer SECONDPID = 1;
	// 商品三级类目编码
	private final Integer THIRDPID = 2;
	// 注入GoodService
	@Autowired
	private GoodService goodService;

	/**
	 * 商品类目首页
	 * 
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping("/addGood.html")
	public String addGoodPage() {
		return "background/shop_category";
	}
	

	/**
	 * 根据二级父类目id获取三级类目
	 * @param categoryId 父类类目id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getThirdCategories")
	public Message getThirdCategories(@RequestParam("categoryId") Integer categoryId) {
		//根据父类id获取子级类目
		List<Category> categories = goodService.selectByCategoryGrade(categoryId);
		if (categories != null && categories.size() > 0) {
			return Message.success().add("categories", categories);
		}
		return Message.fail();
	}
	/**
	 * 添加商品属性记录
	 * @param attributegood
	 * @return
	 */
	@RequestMapping(value="addGoodAttributes",method=RequestMethod.POST)
	public ModelAndView addGoodAttributes(AttributeGood attributeGood) {
		ModelAndView mav = new ModelAndView();
		int result = goodService.insertAttributeGood(attributeGood);
		if(result == 1) {
			mav.setViewName("background/good_sku");
			mav.addObject("goodId",attributeGood.getGoodId());
			return mav;
		}
		mav.setViewName("background/good_attribute");
		return mav;
	}
	/**
	 * 根据用户选择的类目额返回商品属性给用户填写
	 * @param good
	 * @param categoryId
	 * @return
	 */
	@RequestMapping(value="addGoodMessge",method=RequestMethod.POST)
	public ModelAndView addGoodMessge(Good good,@RequestParam("categoryId")Integer categoryId) {
		ModelAndView mav = new ModelAndView("background/good_attribute");
		int goodId = goodService.insertGood(good);
		mav.addObject("categoryId", categoryId);
		mav.addObject("goodId",goodId);
		//获取商品属性
		List<AttributeName> attributeNames = goodService.getAttributeNamesByCategoryId(categoryId);
		mav.addObject("attributeNames", attributeNames);
		return mav;
	}
	
	/**
	 * 跳转到商品编辑页面
	 * @param categoryId
	 * @return
	 */
	@RequestMapping("/editGoodBasemMessage")
	public ModelAndView editGoodBasemMessage(@RequestParam("categoryId")Integer categoryId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryId", categoryId);
		mav.setViewName("background/shop_good");
		return mav;
	}
	
	/**
	 * 根据一级父类目id获取二级类目
	 * @param categoryId 父类类目id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getSecondCategories")
	public Message getSecondCategories(@RequestParam("categoryId") Integer categoryId) {
		//根据父类id获取子级类目
		List<Category> categories = goodService.selectByCategoryGrade(categoryId);
		if (categories != null && categories.size() > 0) {
			return Message.success().add("categories", categories);
		}
		return Message.fail();
	}

	/**
	 * 获取顶级类目
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getFirstCategories")
	public Message getFirstCategories() {
		// 根据类目等级获取类目
		List<Category> categories = goodService.selectByCategoryGrade(FIRSTPID);
		if (categories != null && categories.size() > 0) {
			return Message.success().add("categories", categories);
		}
		return Message.fail();
	}

	/**
	 * 添加商品sku信息，并上传保存图片到第三方服务器
	 * 
	 * @param servletRequest
	 * @param skus
	 *            封装好的Model，用于接受前端的各个商品sku信息
	 * @return
	 */
	@RequestMapping(value="/uploadMultipartFile")
	public ModelAndView saveProduct(HttpServletRequest servletRequest,
          @ModelAttribute UploadGoodModel skus,BindingResult bindingResult) {
		Integer goodId = skus.getGoodId();
		//System.out.println("goodId:"+goodId);
		ModelAndView mav = new ModelAndView();
		boolean flag = false;
		List<GoodSku> goodSkus = skus.getSkus();
		System.out.println(goodSkus.size());
		for (GoodSku goodSku : goodSkus) {
			String attributes = "{" + goodSku.getAttributes() + "}";// 商品属性
			BigDecimal price = goodSku.getPrice();// 该属性的商品销售价格
			BigDecimal originalPrice = goodSku.getOriginalPrice();// 该属性的商品原价价格
			Integer resource = goodSku.getResource();// 该属性的库存
			MultipartFile file = goodSku.getPicture();// 上传的图片

			if (!file.isEmpty()) {
				// 图片名
				String fileName = file.getOriginalFilename();// 文件名
				file.getContentType();
				String key = "goodImage/goodDesc/"+goodId+"/"+ fileName;//
				String pictureAddress = IP + key;// 图片外链地址
				// System.out.println(key);
				// File dest = new File(fileName);
				// file.transferTo(dest);
				try {
					String result = QiniuUtils.streamUpload(key, file.getInputStream());// 将图片上传到七牛云
					if (result.equals(key)) {// 上传成功，将数据保存到数据库中
						int code = goodService.insertGoodSku(goodId, price, originalPrice, resource, pictureAddress,
								attributes);
						flag = true;
					} else {
						flag = false;
						break;
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				// System.out.println("error");
				mav.setViewName("background/good_sku");
				return mav;
			}
		}
		if (flag) {
			mav.addObject("goodId", goodId);
			mav.setViewName("background/good_slidershow");
			return mav;
		} else {
			mav.setViewName("background/good_sku");
			return mav;
		}
	}
	/**
	 * 上传商品描述图片
	 * @param servletRequest
	 * @param files 上传的图片集合
	 * @param goodId 商品id
	 * @return
	 */
	@RequestMapping(value="/uploadDescImage",method=RequestMethod.POST)
	public ModelAndView uploadDescImage(HttpServletRequest servletRequest,UploadImge files,@RequestParam("goodId")Integer goodId) {
		List<MultipartFile> images = files.getImages();
		ModelAndView mav = new ModelAndView();
		boolean flag = false;
		if(null != images && images.size()>0) {
			for(MultipartFile multipartFile:images){
				// 图片名
				String fileName = multipartFile.getOriginalFilename();// 文件名
				multipartFile.getContentType();
				String key = "goodImage/goodDesc/"+goodId+"/"+ fileName;//
				String pictureAddress = IP + key;// 图片外链地址
				try {
					String result = QiniuUtils.streamUpload(key, multipartFile.getInputStream());// 将图片上传到七牛云
					if (result.equals(key)) {// 上传成功，将数据保存到数据库中
						int code = goodService.insertGoodDescPic(goodId,pictureAddress);
						flag = true;
					} else {
						flag = false;
						break;
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		if (flag) {
			mav.addObject("goodId", goodId);
			mav.setViewName("background/good_detail");
			return mav;
		} else {
			mav.setViewName("background/good_slidershow");
			return mav;
		}
	}
	
	/**
	 * 上传商品详情图片
	 * @param servletRequest
	 * @param files 上传的图片集合
	 * @param goodId 商品id
	 * @return
	 */
	@RequestMapping(value="/uploadDetailImage",method=RequestMethod.POST)
	public ModelAndView uploadDetailImage(HttpServletRequest servletRequest,UploadImge files,@RequestParam("goodId")Integer goodId) {
		List<MultipartFile> images = files.getImages();
		ModelAndView mav = new ModelAndView();
		boolean flag = false;
		if(null != images && images.size()>0) {
			int index = 1;
			for(MultipartFile multipartFile:images){
				// 图片名
				String fileName = multipartFile.getOriginalFilename();// 文件名
				multipartFile.getContentType();
				String key = "goodImage/goodDesc/"+goodId+"/"+ fileName;//
				String pictureAddress = IP + key;// 图片外链地址
				try {
					String result = QiniuUtils.streamUpload(key, multipartFile.getInputStream());// 将图片上传到七牛云
					if (result.equals(key)) {// 上传成功，将数据保存到数据库中
						int code = goodService.insertGoodDetailPic(goodId,pictureAddress,index++);
						flag = true;
					} else {
						flag = false;
						break;
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		if (flag) {
			mav.setViewName("background/add_success");
			return mav;
		} else {
			mav.setViewName("background/good_detail");
			return mav;
		}
	}
}
