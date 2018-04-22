package cn.barathrum.frogshop.bean;

import java.util.List;

/**
 * 商品销售属性封装类
 * @author 83893
 *
 */
public class Attribute {

	private String name;//属性名
	private List<String> attributes;//属性值
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<String> getAttributes() {
		return attributes;
	}
	public void setAttributes(List<String> attributes) {
		this.attributes = attributes;
	}
	
}
