package com.kh.jsp.attachment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable {

	private static final long serialVersionUID = 20022L;
	
	private int f_no; 		      // 파일 번호 - 시퀀스로 생성
	private int f_type; 	      // 파일 타입(연결된 게시판 타입) - 1(상품 게시판), 2(레시피 게시판) 등
	private int f_connect_no;     // 파일과 연결된 게시글의 번호
	private int f_level;	   	  // 파일 레벨(0 - 대표사진(썸네일에 표시되는 이미지), 1 - 나머지 사진들) 
	private String f_name; 		  // 원본 파일 이름
	private String f_change_name; // 바뀐 파일 이름
	private Date f_upload_date;   // 파일이 업로드 된 날짜
	private String f_status;	  // 파일 상태 ( Y - 존재하고 있음, N - 삭제 됨 )
	private String f_filepath;	  // 파일 경로
	
	public Attachment() {
		super();
	}
	
	public Attachment(String f_name, String f_change_name, String f_filepath) {
		super();
		this.f_name = f_name;
		this.f_change_name = f_change_name;
		this.f_filepath = f_filepath;
	}

	public Attachment(int f_no, int f_type, int f_connect_no, int f_level, String f_name, String f_change_name,
			Date f_upload_date, String f_status, String f_filepath) {
		super();
		this.f_no = f_no;
		this.f_type = f_type;
		this.f_connect_no = f_connect_no;
		this.f_level = f_level;
		this.f_name = f_name;
		this.f_change_name = f_change_name;
		this.f_upload_date = f_upload_date;
		this.f_status = f_status;
		this.f_filepath = f_filepath;
	}

	@Override
	public String toString() {
		return "Attachment [f_no=" + f_no + ", f_type=" + f_type + ", f_connect_no=" + f_connect_no + ", f_level="
				+ f_level + ", f_name=" + f_name + ", f_change_name=" + f_change_name + ", f_upload_date="
				+ f_upload_date + ", f_status=" + f_status + ", f_filepath=" + f_filepath + "]";
	}

	public int getF_no() {
		return f_no;
	}

	public int getF_type() {
		return f_type;
	}

	public int getF_connect_no() {
		return f_connect_no;
	}

	public int getF_level() {
		return f_level;
	}

	public String getF_name() {
		return f_name;
	}

	public String getF_change_name() {
		return f_change_name;
	}

	public Date getF_upload_date() {
		return f_upload_date;
	}

	public String getF_status() {
		return f_status;
	}

	public String getF_filepath() {
		return f_filepath;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public void setF_type(int f_type) {
		this.f_type = f_type;
	}

	public void setF_connect_no(int f_connect_no) {
		this.f_connect_no = f_connect_no;
	}

	public void setF_level(int f_level) {
		this.f_level = f_level;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public void setF_change_name(String f_change_name) {
		this.f_change_name = f_change_name;
	}

	public void setF_upload_date(Date f_upload_date) {
		this.f_upload_date = f_upload_date;
	}

	public void setF_status(String f_status) {
		this.f_status = f_status;
	}

	public void setF_filepath(String f_filepath) {
		this.f_filepath = f_filepath;
	}
	
	
}
