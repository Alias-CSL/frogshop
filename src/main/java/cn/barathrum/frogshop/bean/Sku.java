package cn.barathrum.frogshop.bean;

import java.math.BigDecimal;
import java.util.Date;

public class Sku {
	//id
    private Integer id;
    //商品id
    private Integer goodId;
    //价格
    private BigDecimal price;
    //库存
    private Integer resource;
    //销量
    private Integer sales;
    //原始价格
    private BigDecimal originalPrice;
    //商品描述图片地址
    private String picture;
    //添加商品时间
    private Date createTime;
    //商品上下架状态
    private Integer status;
    //商品属性
    private String attributes;
    //商品码
    private Integer goodCode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodid(Integer goodid) {
        this.goodId = goodid;
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

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }

    public BigDecimal getOriginalprice() {
        return originalPrice;
    }

    public void setOriginalprice(BigDecimal originalprice) {
        this.originalPrice = originalprice;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public Date getCreatetime() {
        return createTime;
    }

    public void setCreatetime(Date createtime) {
        this.createTime = createtime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAttributes() {
        return attributes;
    }

    public void setAttributes(String attributes) {
        this.attributes = attributes == null ? null : attributes.trim();
    }

    public Integer getGoodcode() {
        return goodCode;
    }

    public void setGoodcode(Integer goodcode) {
        this.goodCode = goodcode;
    }
}