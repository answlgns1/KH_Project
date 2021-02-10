package com.kh.jsp.advertise.model.vo;

import java.io.Serializable;

public class Advertisement implements Serializable{

	private static final long serialVersionUID = 1002L;
	
	private int ad_no;
	private String ad_writer;
	private String ad_name;
	private String ad_content;
	private String ad_attachment;
	private String ad_link;
	
	public Advertisement() {
		super();
	}

	public Advertisement(int ad_no, String ad_writer, String ad_name, String ad_content, String ad_attachment, String ad_link) {
		super();
		this.ad_no = ad_no;
		this.ad_writer = ad_writer;
		this.ad_name = ad_name;
		this.ad_content = ad_content;
		this.ad_attachment = ad_attachment;
		this.ad_link = ad_link;
	}


	public Advertisement(String ad_name, String ad_content, String ad_attachment, String ad_link) {
		super();
		this.ad_name = ad_name;
		this.ad_content = ad_content;
		this.ad_attachment = ad_attachment;
		this.ad_link = ad_link;
	}

	@Override
	public String toString() {
		return "Advertisement [ad_no=" + ad_no + ", ad_writer=" + ad_writer + ", ad_name=" + ad_name + ", ad_content="
				+ ad_content + ", ad_attachment=" + ad_attachment + ", ad_link=" + ad_link + "]";
	}

	public int getAd_no() {
		return ad_no;
	}

	public void setAd_no(int ad_no) {
		this.ad_no = ad_no;
	}

	public String getAd_writer() {
		return ad_writer;
	}

	public void setAd_writer(String ad_writer) {
		this.ad_writer = ad_writer;
	}

	public String getAd_name() {
		return ad_name;
	}

	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}

	public String getAd_content() {
		return ad_content;
	}

	public void setAd_content(String ad_content) {
		this.ad_content = ad_content;
	}

	public String getAd_attachment() {
		return ad_attachment;
	}

	public void setAd_attachment(String ad_attachment) {
		this.ad_attachment = ad_attachment;
	}

	public String getAd_link() {
		return ad_link;
	}

	public void setAd_link(String ad_link) {
		this.ad_link = ad_link;
	}

}
