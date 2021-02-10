package com.kh.jsp.question.model.vo;

import java.io.Serializable;

public class Question implements Serializable {

	private static final long serialVersionUID = 1006L;

	private int q_no;
	private String q_writer;
	private String q_title;
	private String q_content;
	private String q_attachment;
	
	public Question() {
		super();
	}

	public Question(int q_no, String q_writer, String q_title, String q_content, String q_attachment) {
		super();
		this.q_no = q_no;
		this.q_writer = q_writer;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_attachment = q_attachment;
	}

	@Override
	public String toString() {
		return "Question [q_no=" + q_no + ", q_writer=" + q_writer + ", q_title=" + q_title + ", q_content=" + q_content
				+ ", q_attachment=" + q_attachment + "]";
	}

	public int getQ_no() {
		return q_no;
	}

	public String getQ_writer() {
		return q_writer;
	}

	public String getQ_title() {
		return q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public String getQ_attachment() {
		return q_attachment;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public void setQ_attachment(String q_attachment) {
		this.q_attachment = q_attachment;
	}
	
}
