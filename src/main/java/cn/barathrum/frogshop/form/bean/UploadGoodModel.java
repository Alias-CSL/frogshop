package cn.barathrum.frogshop.form.bean;

import java.util.List;

/**
 * 将前台多个商品sku数据封装为一个model类，方便spring mvc获取
 * @author 83893
 *
 */
public class UploadGoodModel {
	private List<GoodSku> skus;
	private Integer goodId;
	
	public Integer getGoodId() {
		return goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	public List<GoodSku> getSkus() {
		return skus;
	}

	public void setSkus(List<GoodSku> skus) {
		this.skus = skus;
	}

	public UploadGoodModel(List<GoodSku> skus,Integer goodId) {
		super();
		this.skus = skus;
		this.goodId = goodId;
	}

	public UploadGoodModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
