package com.kh.jsp.recipe_comment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class recipe_comment implements Serializable {

	private static final long serialVersionUID = 1011L;
	
	private int rbc_no;
	private int rb_no;
	private String rbc_writer;
	private String rbc_content;
	private Date rbc_date;
	private int rbc_value;

	public recipe_comment() {
		super();
	}

	public recipe_comment(int rbc_no, int rb_no, String rbc_writer, String rbc_content, Date rbc_date, int rbc_value) {
		super();
		this.rbc_no = rbc_no;
		this.rb_no = rb_no;
		this.rbc_writer = rbc_writer;
		this.rbc_content = rbc_content;
		this.rbc_date = rbc_date;
		this.rbc_value = rbc_value;
	}

	@Override
	public String toString() {
		return "recipe_comment [rbc_no=" + rbc_no + ", rb_no=" + rb_no + ", rbc_writer=" + rbc_writer + ", rbc_content="
				+ rbc_content + ", rbc_date=" + rbc_date + ", rbc_value=" + rbc_value + "]";
	}

	public int getRbc_no() {
		return rbc_no;
	}

	public int getRb_no() {
		return rb_no;
	}

	public String getRbc_writer() {
		return rbc_writer;
	}

	public String getRbc_content() {
		return rbc_content;
	}

	public Date getRbc_date() {
		return rbc_date;
	}

	public int getRbc_value() {
		return rbc_value;
	}

	public void setRbc_no(int rbc_no) {
		this.rbc_no = rbc_no;
	}

	public void setRb_no(int rb_no) {
		this.rb_no = rb_no;
	}

	public void setRbc_writer(String rbc_writer) {
		this.rbc_writer = rbc_writer;
	}

	public void setRbc_content(String rbc_content) {
		this.rbc_content = rbc_content;
	}

	public void setRbc_date(Date rbc_date) {
		this.rbc_date = rbc_date;
	}

	public void setRbc_value(int rbc_value) {
		this.rbc_value = rbc_value;
	}
}
