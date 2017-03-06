package com.domain;
/**
 * 对应数据表goods
 * @author Administrator
 *
 */
public class Goods {
	private int id;
	private String goodsName;
	private float goodsPrice;
	private int goodsNum;
	private int goodsStatus;
	public int getGoodsStatus() {
		return goodsStatus;
	}
	public void setGoodsStatus(int goodsStatus) {
		this.goodsStatus = goodsStatus;
	}
	private Types types;//对应商品的类型
	public Goods() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public float getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public Types getTypes() {
		return types;
	}
	public void setTypes(Types types) {
		this.types = types;
	}
	
}
