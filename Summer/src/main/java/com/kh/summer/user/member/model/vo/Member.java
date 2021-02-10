package com.kh.summer.user.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Member implements Serializable {

	private static final long serialVersionUID = 1004L;
	
	private String userId;
	private String password;
	private String nickName;
	private String userName;
	private String gender;
	private String birth;
	private String email;
	private String phone;
	private String address;
	private String membership;
	private Date enrollDate;
	private String mstatus;
	private Date deleteDate;
	
	public Member(String userId, String password, String nickName, String email, String phone, String address) {
		super();
		this.userId = userId;
		this.password = password;
		this.nickName = nickName;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}

	public Member(String userId, String password, String nickName, String userName, String gender, String birth,
			String email, String phone, String address) {
		super();
		this.userId = userId;
		this.password = password;
		this.nickName = nickName;
		this.userName = userName;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}

	public Member(String userId, String password) {
		super();
		this.userId = userId;
		this.password = password;
	}
	
	
	
}
