package com.kh.jsp.delivery.model.vo;

import java.io.Serializable;

public class Delivery implements Serializable {

	private static final long serialVersionUID = 1012L;
	
	private int d_no;
	private int d_o_no;
	private int d_invoice;
	private String d_status;

	public Delivery() {
		super();
	}

	public Delivery(int d_no, int d_o_no, int d_invoice, String d_status) {
		super();
		this.d_no = d_no;
		this.d_o_no = d_o_no;
		this.d_invoice = d_invoice;
		this.d_status = d_status;
	}

	@Override
	public String toString() {
		return "Delivery [d_no=" + d_no + ", d_o_no=" + d_o_no + ", d_invoice=" + d_invoice + ", d_status=" + d_status
				+ "]";
	}

	public int getD_no() {
		return d_no;
	}

	public int getD_o_no() {
		return d_o_no;
	}

	public int getD_invoice() {
		return d_invoice;
	}

	public String getD_status() {
		return d_status;
	}

	public void setD_no(int d_no) {
		this.d_no = d_no;
	}

	public void setD_o_no(int d_o_no) {
		this.d_o_no = d_o_no;
	}

	public void setD_invoice(int d_invoice) {
		this.d_invoice = d_invoice;
	}

	public void setD_status(String d_status) {
		this.d_status = d_status;
	}
}
