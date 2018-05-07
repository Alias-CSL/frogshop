package cn.barathrum.frogshop.form.bean;

import java.io.Serializable;
import java.math.BigDecimal;

import org.springframework.web.multipart.MultipartFile;
/**
 * 封装前端form表单的上传属性值，包括图片数据
 * @author 83893
 *
 */
public class GoodSku implements Serializable {


	private static final long serialVersionUID = 1L;
	//属性值
	private String attributes;
	//原价
	private BigDecimal originalPrice;
	//销售价格
	private BigDecimal price;
	// 库存
	private Integer resource;
	//上传的图片
	private MultipartFile picture;

	public BigDecimal getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(BigDecimal originalPrice) {
		this.originalPrice = originalPrice;
	}

	public String getAttributes() {
		return attributes;
	}

	public void setAttributes(String attributes) {
		this.attributes = attributes;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getResource() {
		return resource;
	}

	public void setResource(Integer resource) {
		this.resource = resource;
	}

	public MultipartFile getPicture() {
		return picture;
	}

	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}

}
