package cn.barathrum.frogshop.form.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
/**
 * 将多个商品信息、与地址信息封装为实体类
 * @author 83893
 *
 */
public class CartOrder implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//用户id
	private Integer userId;
	//收货地址id
	private Integer addressId;
    //快递邮费
    private BigDecimal expressage;
    //快递名
    private String expressName;
    //商品数量
    private Integer goodNum;
    //总金额
    private BigDecimal total;
    //购物商品
    List<CartMessage> carts;
	public Integer getGoodNum() {
		return goodNum;
	}
	public void setGoodNum(Integer goodNum) {
		this.goodNum = goodNum;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	public BigDecimal getExpressage() {
		return expressage;
	}
	public void setExpressage(BigDecimal expressage) {
		this.expressage = expressage;
	}
	public String getExpressName() {
		return expressName;
	}
	public void setExpressName(String expressName) {
		this.expressName = expressName;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public List<CartMessage> getCarts() {
		return carts;
	}
	public void setCarts(List<CartMessage> carts) {
		this.carts = carts;
	} 
    
    
}
