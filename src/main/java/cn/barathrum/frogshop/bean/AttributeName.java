package cn.barathrum.frogshop.bean;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties(value = { "handler" })
public class AttributeName {
	//id
    private Integer id;
    //属性名
    private String name;
    //类目id
    private Integer categoryId;
    //排序
    private Integer sort;
    //状态
    private Integer status;
    //创建时间
    private Date createTime;
    //是否为必须添加的属性
    private Integer necessary;
    //是否为搜索字段
    private Integer search;
    //该属性名下的属性值
    private List<AttributeValue> attributeValues;
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getNecessary() {
		return necessary;
	}
	public void setNecessary(Integer necessary) {
		this.necessary = necessary;
	}
	public Integer getSearch() {
		return search;
	}
	public void setSearch(Integer search) {
		this.search = search;
	}
	public List<AttributeValue> getAttributeValues() {
		return attributeValues;
	}
	public void setAttributeValues(List<AttributeValue> attributeValues) {
		this.attributeValues = attributeValues;
	}
  
}