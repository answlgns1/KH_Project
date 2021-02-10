package com.kh.jsp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {

	private static final long serialVersionUID = 1123L;

	// 필드값
	private String userId;
	private int userNo;
	private int userPoint;
	private String userPwd;
	private String userName;
	private String userPhone;
	private String userEmail;
	private String userBirth;
	private String userAddress;
	private Date enrollDate;
	private String userGrade;
	private String userStatus;

//	생성자

	public Member() {
	};

	public Member(String userId, String userName, Date enrollDate, String userGrade, String userStatus) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.enrollDate = enrollDate;
		this.userGrade = userGrade;
		this.userStatus = userStatus;
	}
	
	public Member(String userId, String userPwd, String userName, String userPhone, String userEmail,
			String userAddress, String userBirth) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
		this.userBirth = userBirth;
	}
	
	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}
	

	
	public Member(String userId, int userNo, int userPoint, String userPwd, String userName, String userPhone,
			String userEmail, String userBirth, String userAddress, Date enrollDate, String userStatus) {
		super();
		this.userId = userId;
		this.userNo = userNo;
		this.userPoint = userPoint;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userBirth = userBirth;
		this.userAddress = userAddress;
		this.enrollDate = enrollDate;
		this.userStatus = userStatus;
	}

//	toString
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userNo=" + userNo + ", userPoint=" + userPoint + ", userPwd=" + userPwd
				+ ", userName=" + userName + ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", userBirth="
				+ userBirth + ", userAddress=" + userAddress + ", enrollDate=" + enrollDate + "]";
	}
	
	public String getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

//	getter setter

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

}
