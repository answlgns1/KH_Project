package com.kh.jsp.shoppingCart.model.vo;

import java.io.Serializable;

public class Shopping_Cart implements Serializable {

	private static final long serialVersionUID = 1008L;
	
	private String c_id;
	private int c_no;
	private int c_product_price;
	private String c_product_name;
	private int c_product_count;
	
	public Shopping_Cart() {
		super();
	}

	public Shopping_Cart(String c_id, int c_no, int c_product_price, String c_product_name, int c_product_count) {
		super();
		this.c_id = c_id;
		this.c_no = c_no;
		this.c_product_price = c_product_price;
		this.c_product_name = c_product_name;
		this.c_product_count = c_product_count;
	}

	@Override
	public String toString() {
		return "Shopping_Cart [c_id=" + c_id + ", c_no=" + c_no + ", c_product_price=" + c_product_price + ", c_product_name="
				+ c_product_name + ", c_product_count=" + c_product_count + "]";
	}

	public String getC_id() {
		return c_id;
	}

	public int getC_no() {
		return c_no;
	}

	public int getC_product_price() {
		return c_product_price;
	}

	public String getC_product_name() {
		return c_product_name;
	}

	public int getC_product_count() {
		return c_product_count;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public void setC_product_price(int c_product_price) {
		this.c_product_price = c_product_price;
	}

	public void setC_product_name(String c_product_name) {
		this.c_product_name = c_product_name;
	}

	public void setC_product_count(int c_product_count) {
		this.c_product_count = c_product_count;
	}
	
}
