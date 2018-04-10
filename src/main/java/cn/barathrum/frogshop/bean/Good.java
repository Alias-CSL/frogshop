package cn.barathrum.frogshop.bean;

import java.util.Date;
import java.util.List;

public class Good {
	//ID
    private Integer id;
    //商品名
    private String goodName;
    //状态，是否可用
    private Byte status;
    //更新时间
    private Date updateTime;
    //更新人,采用延迟加载
    private User updatePerson;
    //录入时间
    private Date enteringTime;
    //录入人，采用延迟加载
    private User enteringPerson;
    //促销
    private Byte romotion;
    //总销量
    private Integer totalSales;
    //该商品对应多种库存，采用延迟加载
    private List<Sku> skus;
    
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Sku> getSkus() {
		return skus;
	}

	public void setSkus(List<Sku> skus) {
		this.skus = skus;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public User getUpdatePerson() {
		return updatePerson;
	}

	public void setUpdatePerson(User updatePerson) {
		this.updatePerson = updatePerson;
	}

	public Date getEnteringTime() {
		return enteringTime;
	}

	public void setEnteringTime(Date enteringTime) {
		this.enteringTime = enteringTime;
	}

	public User getEnteringPerson() {
		return enteringPerson;
	}

	public void setEnteringPerson(User enteringPerson) {
		this.enteringPerson = enteringPerson;
	}

	public Byte getRomotion() {
		return romotion;
	}

	public void setRomotion(Byte romotion) {
		this.romotion = romotion;
	}

	public Integer getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(Integer totalSales) {
		this.totalSales = totalSales;
	}

   
}