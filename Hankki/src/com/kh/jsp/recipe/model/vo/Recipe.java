package com.kh.jsp.recipe.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Recipe implements Serializable {

	private static final long serialVersionUID = 1007L;

	private int rb_no;
	private String rb_writer;
	private String rb_title;
	private String rb_content;
	private Date rb_date;
	private int rb_recommend_count;
	private int rb_value;
	private int rb_count;
    private String rb_attachment;
	
    public Recipe() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Recipe(int rb_no, String rb_writer, String rb_title, String rb_content, Date rb_date,
			int rb_recommend_count, int rb_value, int rb_count, String rb_attachment) {
		super();
		this.rb_no = rb_no;
		this.rb_writer = rb_writer;
		this.rb_title = rb_title;
		this.rb_content = rb_content;
		this.rb_date = rb_date;
		this.rb_recommend_count = rb_recommend_count;
		this.rb_value = rb_value;
		this.rb_count = rb_count;
		this.rb_attachment = rb_attachment;
	}

	@Override
	public String toString() {
		return "Recipe [rb_no=" + rb_no + ", rb_writer=" + rb_writer + ", rb_title=" + rb_title + ", rb_content="
				+ rb_content + ", rb_date=" + rb_date + ", rb_recommend_count=" + rb_recommend_count + ", rb_value="
				+ rb_value + ", rb_count=" + rb_count + ", rb_attachment=" + rb_attachment + "]";
	}

	public int getRb_no() {
		return rb_no;
	}

	public String getRb_writer() {
		return rb_writer;
	}

	public String getRb_title() {
		return rb_title;
	}

	public String getRb_content() {
		return rb_content;
	}

	public Date getRb_date() {
		return rb_date;
	}

	public int getRb_recommend_count() {
		return rb_recommend_count;
	}

	public int getRb_value() {
		return rb_value;
	}

	public int getRb_count() {
		return rb_count;
	}

	public String getRb_attachment() {
		return rb_attachment;
	}

	public void setRb_no(int rb_no) {
		this.rb_no = rb_no;
	}

	public void setRb_writer(String rb_writer) {
		this.rb_writer = rb_writer;
	}

	public void setRb_title(String rb_title) {
		this.rb_title = rb_title;
	}

	public void setRb_content(String rb_content) {
		this.rb_content = rb_content;
	}

	public void setRb_date(Date rb_date) {
		this.rb_date = rb_date;
	}

	public void setRb_recommend_count(int rb_recommend_count) {
		this.rb_recommend_count = rb_recommend_count;
	}

	public void setRb_value(int rb_value) {
		this.rb_value = rb_value;
	}

	public void setRb_count(int rb_count) {
		this.rb_count = rb_count;
	}

	public void setRb_attachment(String rb_attachment) {
		this.rb_attachment = rb_attachment;
	}
    
}
