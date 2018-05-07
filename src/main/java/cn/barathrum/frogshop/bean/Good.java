package cn.barathrum.frogshop.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties(value = { "handler" })  
public class Good implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//ID
    private Integer id;
    //商品名
    private String goodName;
    //状态，是否可用
    private Byte status;
    //更新时间
    private Date updateTime;
    //更新人,采用延迟加载
    private Integer updatePersonId;
   // private User updatePerson;
    //录入时间
    private Date enteringTime;
    //录入人，采用延迟加载
   // private User enteringPerson;
    private Integer enteringPersonId;
 
    //促销
    private Byte romotion;
    //总销量
    private Integer totalSales;
    //原始价格
    private BigDecimal originalPrice;
    //总库存
    private Integer stocks;
    //该商品对应多种库存，采用延迟加载
    private List<Sku> skus;
    //商品描述图片
    private List<DescPicture> descPictures;
    //商品详情图片，采用延迟加载s
    private List<DetailPicture> detailPictures;
    //商品评论，采用延迟加载
  //  private List<Evaluate> evaluates;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public Integer getUpdatePersonId() {
		return updatePersonId;
	}
	public void setUpdatePersonId(Integer updatePersonId) {
		this.updatePersonId = updatePersonId;
	}
	public Date getEnteringTime() {
		return enteringTime;
	}
	public void setEnteringTime(Date enteringTime) {
		this.enteringTime = enteringTime;
	}
	public Integer getEnteringPersonId() {
		return enteringPersonId;
	}
	public void setEnteringPersonId(Integer enteringPersonId) {
		this.enteringPersonId = enteringPersonId;
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
	public BigDecimal getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(BigDecimal originalPrice) {
		this.originalPrice = originalPrice;
	}
	public Integer getStocks() {
		return stocks;
	}
	public void setStocks(Integer stocks) {
		this.stocks = stocks;
	}
	public List<Sku> getSkus() {
		return skus;
	}
	public void setSkus(List<Sku> skus) {
		this.skus = skus;
	}
	public List<DescPicture> getDescPictures() {
		return descPictures;
	}
	public void setDescPictures(List<DescPicture> descPictures) {
		this.descPictures = descPictures;
	}
	public List<DetailPicture> getDetailPictures() {
		return detailPictures;
	}
	public void setDetailPictures(List<DetailPicture> detailPictures) {
		this.detailPictures = detailPictures;
	}
	
}