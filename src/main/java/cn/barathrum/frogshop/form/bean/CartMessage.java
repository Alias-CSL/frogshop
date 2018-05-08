package cn.barathrum.frogshop.form.bean;

import java.io.Serializable;
import java.util.Date;

import cn.barathrum.frogshop.bean.Sku;

public class CartMessage implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//cartId
	private Integer id;
    //对应用户id
    private Integer userId;
    //对skuId
    private Integer skuId;
    //商品数目
    private Integer count;
    //商品名称
    private String goodName;
    
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getSkuId() {
		return skuId;
	}
	public void setSkuId(Integer skuId) {
		this.skuId = skuId;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

    
}
