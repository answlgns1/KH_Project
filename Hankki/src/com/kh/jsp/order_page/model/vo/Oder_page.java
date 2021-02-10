package com.kh.jsp.order_page.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Oder_page implements Serializable {

	private static final long serialVersionUID = 1010L;
	
	private int o_no;
	private String o_id;
	private int o_p_no;
	private Date o_date;
	private String o_name;
    private String o_get_name;
    private String o_get_phone;
    private String o_get_address;
    private int o_use_point;
    private int o_total_price;
    private String o_pay_option;
    private int o_delivery_fee;

    public Oder_page() {
		super();
	}

	public Oder_page(int o_no, String o_id, int o_p_no, Date o_date, String o_name, String o_get_name,
			String o_get_phone, String o_get_address, int o_use_point, int o_total_price, String o_pay_option,
			int o_delivery_fee) {
		super();
		this.o_no = o_no;
		this.o_id = o_id;
		this.o_p_no = o_p_no;
		this.o_date = o_date;
		this.o_name = o_name;
		this.o_get_name = o_get_name;
		this.o_get_phone = o_get_phone;
		this.o_get_address = o_get_address;
		this.o_use_point = o_use_point;
		this.o_total_price = o_total_price;
		this.o_pay_option = o_pay_option;
		this.o_delivery_fee = o_delivery_fee;
	}

	@Override
	public String toString() {
		return "Oder_page [o_no=" + o_no + ", o_id=" + o_id + ", o_p_no=" + o_p_no + ", o_date=" + o_date + ", o_name="
				+ o_name + ", o_get_name=" + o_get_name + ", o_get_phone=" + o_get_phone + ", o_get_address="
				+ o_get_address + ", o_use_point=" + o_use_point + ", o_total_price=" + o_total_price
				+ ", o_pay_option=" + o_pay_option + ", o_delivery_fee=" + o_delivery_fee + "]";
	}

	public int getO_no() {
		return o_no;
	}

	public String getO_id() {
		return o_id;
	}

	public int getO_p_no() {
		return o_p_no;
	}

	public Date getO_date() {
		return o_date;
	}

	public String getO_name() {
		return o_name;
	}

	public String getO_get_name() {
		return o_get_name;
	}

	public String getO_get_phone() {
		return o_get_phone;
	}

	public String getO_get_address() {
		return o_get_address;
	}

	public int getO_use_point() {
		return o_use_point;
	}

	public int getO_total_price() {
		return o_total_price;
	}

	public String getO_pay_option() {
		return o_pay_option;
	}

	public int getO_delivery_fee() {
		return o_delivery_fee;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public void setO_p_no(int o_p_no) {
		this.o_p_no = o_p_no;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public void setO_get_name(String o_get_name) {
		this.o_get_name = o_get_name;
	}

	public void setO_get_phone(String o_get_phone) {
		this.o_get_phone = o_get_phone;
	}

	public void setO_get_address(String o_get_address) {
		this.o_get_address = o_get_address;
	}

	public void setO_use_point(int o_use_point) {
		this.o_use_point = o_use_point;
	}

	public void setO_total_price(int o_total_price) {
		this.o_total_price = o_total_price;
	}

	public void setO_pay_option(String o_pay_option) {
		this.o_pay_option = o_pay_option;
	}

	public void setO_delivery_fee(int o_delivery_fee) {
		this.o_delivery_fee = o_delivery_fee;
	}
}