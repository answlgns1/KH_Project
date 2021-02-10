package com.kh.summer.user.ioinfo.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class IoInfo {

	private int ioNo;
	private String io;
	private String pCode;
	private int quantity;
	private int price;
	private String userId;
	private String oNo;
	private String etc;
	private String ioDate;
	
}
