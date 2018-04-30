package cn.barathrum.frogshop.bean;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties(value = { "handler" })  
public class Order {
    private Integer id;
    //买家id
    private Integer userId;
    //收获地址
    private Address address;
    //收货地址id
    private Integer addressId;
    //订单状态
    private Integer status;
    //快递编码
    private String expressNum;
    //快递邮费
    private BigDecimal expressage;
    //快递名
    private String expressName;
    //商品数量
    private Integer goodNum;
    //总金额
    private BigDecimal total;
    //订单创建时间
    private Date createDate;
    //订单支付时间
    private Date paidDate;
    //收货时间
    private Date shipmentsDate;
    //订单成交时间
    private Date dealDate;
    //订单编码
    private String orderNum;
    //订单中包含的商品
    private List<OrderGood> orderGoods;
    
	public List<OrderGood> getOrderGoods() {
		return orderGoods;
	}

	public void setOrderGoods(List<OrderGood> orderGoods) {
		this.orderGoods = orderGoods;
	}

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

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

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getExpressNum() {
		return expressNum;
	}

	public void setExpressNum(String expressNum) {
		this.expressNum = expressNum;
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

	public Integer getGoodNum() {
		return goodNum;
	}

	public void setGoodNum(Integer goodNum) {
		this.goodNum = goodNum;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getPaidDate() {
		return paidDate;
	}

	public void setPaidDate(Date paidDate) {
		this.paidDate = paidDate;
	}

	public Date getShipmentsDate() {
		return shipmentsDate;
	}

	public void setShipmentsDate(Date shipmentsDate) {
		this.shipmentsDate = shipmentsDate;
	}

	public Date getDealDate() {
		return dealDate;
	}

	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

    
}