package cn.barathrum.frogshop.bean;

import java.util.Date;

public class AttributeValue {
	//ID
    private Integer id;
    //属性值名称
    private String name;
    
    //private AttributeName attributeName;
    //属性名ID
    private Integer attrnameId;
    //排序
    private Integer sort;
    //状态，是否可用
    private Integer status;
    //创建时间
    private Date createTime;

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

	public Integer getAttrnameId() {
		return attrnameId;
	}

	public void setAttrnameId(Integer attrnameId) {
		this.attrnameId = attrnameId;
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

   
}