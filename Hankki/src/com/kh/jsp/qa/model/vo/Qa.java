package com.kh.jsp.qa.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Qa implements Serializable {

	private static final long serialVersionUID = 1005L;
	
	private int qa_no;
	private String qa_writer;
	private String qa_title;
	private String qa_content;
	private Date qa_date;
	
	public Qa() {
		super();
	}

	public Qa(int qa_no, String qa_writer, String qa_title, String qa_content, Date qa_date) {
		super();
		this.qa_no = qa_no;
		this.qa_writer = qa_writer;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.qa_date = qa_date;
	}

	@Override
	public String toString() {
		return "Qa [qa_no=" + qa_no + ", qa_writer=" + qa_writer + ", qa_title=" + qa_title + ", qa_content="
				+ qa_content + ", qa_date=" + qa_date + "]";
	}

	public int getQa_no() {
		return qa_no;
	}

	public String getQa_writer() {
		return qa_writer;
	}

	public String getQa_title() {
		return qa_title;
	}

	public String getQa_content() {
		return qa_content;
	}

	public Date getQa_date() {
		return qa_date;
	}

	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}

	public void setQa_writer(String qa_writer) {
		this.qa_writer = qa_writer;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public void setQa_date(Date qa_date) {
		this.qa_date = qa_date;
	}

	
}
