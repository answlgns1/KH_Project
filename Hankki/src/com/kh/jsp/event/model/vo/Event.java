package com.kh.jsp.event.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Event implements Serializable {

	private static final long serialVersionUID = 1003L;
	
    private int e_no;
	private String e_writer;
	private String e_title;
	private String e_content;
	private Date e_date;
	private String e_attachment;

	public Event() {
		super();
	}

	public Event(int e_no, String e_writer, String e_title, String e_content, Date e_date, String e_attachment) {
		super();
		this.e_no = e_no;
		this.e_writer = e_writer;
		this.e_title = e_title;
		this.e_content = e_content;
		this.e_date = e_date;
		this.e_attachment = e_attachment;
	}

	@Override
	public String toString() {
		return "Event [e_no=" + e_no + ", e_writer=" + e_writer + ", e_title=" + e_title + ", e_content=" + e_content
				+ ", e_date=" + e_date + ", e_attachment=" + e_attachment + "]";
	}

	public Number getE_no() {
		return e_no;
	}

	public String getE_writer() {
		return e_writer;
	}

	public String getE_title() {
		return e_title;
	}

	public String getE_content() {
		return e_content;
	}

	public Date getE_date() {
		return e_date;
	}

	public String getE_attachment() {
		return e_attachment;
	}

	public void setE_no(int e_no) {
		this.e_no = e_no;
	}

	public void setE_writer(String e_writer) {
		this.e_writer = e_writer;
	}

	public void setE_title(String e_title) {
		this.e_title = e_title;
	}

	public void setE_content(String e_content) {
		this.e_content = e_content;
	}

	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}

	public void setE_attachment(String e_attachment) {
		this.e_attachment = e_attachment;
	}
	
}
