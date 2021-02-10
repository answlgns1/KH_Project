package com.kh.jsp.admin.model.vo;

import java.io.Serializable;

public class Admin implements Serializable {

	private static final long serialVersionUID = 1001L;
	
	// 필드 변수 선언
	private String adminId;			// 관리자 아이디
	private String adminPwd;		// 관리자 비밀번호
	private String adminName;		// 관리자 이름
	private String adminEmail;		// 관리자 이메일
	private String adminPhone;		// 관리자 연락처
	private String adminAddress;	// 관리자 주소
	
	// 생성자
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin(String adminId, String adminPwd, String adminName, String adminEmail, String adminPhone,
			String adminAddress) {
		super();
		this.adminId = adminId;
		this.adminPwd = adminPwd;
		this.adminName = adminName;
		this.adminEmail = adminEmail;
		this.adminPhone = adminPhone;
		this.adminAddress = adminAddress;
	}

	// 로그인 시 아이디와 비밀번호를 받아올 생성자
	public Admin(String adminId, String adminPwd) {
		super();
		this.adminId = adminId;
		this.adminPwd = adminPwd;
	}
	
	
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminPwd=" + adminPwd + ", adminName=" + adminName + ", adminEmail="
				+ adminEmail + ", adminPhone=" + adminPhone + ", adminAddress=" + adminAddress + "]";
	}

	// Getter Setter
	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	public String getAdminPhone() {
		return adminPhone;
	}

	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}

	public String getAdminAddress() {
		return adminAddress;
	}

	public void setAdminAddress(String adminAddress) {
		this.adminAddress = adminAddress;
	}
	
	
	
	
}
