package cn.barathrum.frogshop.bean;

import java.util.List;

public class Category {
	//ID
    private Integer id;
    //类目名
    private String name;
    //排序值
    private Integer sortId;
    //父级Id
    private Integer pId;
    //类目显示名
    private String displayName;
    //一对多个属性名
    private List<AttributeName> attributeNames;

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

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

	public Integer getSortId() {
		return sortId;
	}

	public void setSortId(Integer sortId) {
		this.sortId = sortId;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public List<AttributeName> getAttributeNames() {
		return attributeNames;
	}

	public void setAttributeNames(List<AttributeName> attributeNames) {
		this.attributeNames = attributeNames;
	}
    
   
}