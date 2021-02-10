package com.kh.summer.user.pants.model.vo;

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
public class Pants {
	
	private int pantsNo;
	private String pCode;
	private String userId;
	private String pSize;
	private String total;
	private String waist;
	private String thigh;
	private String rise;
	private String hem;
	
	public Pants(String userId, String total, String waist, String thigh, String rise, String hem) {
		super();
		this.userId = userId;
		this.total = total;
		this.waist = waist;
		this.thigh = thigh;
		this.rise = rise;
		this.hem = hem;
	}
	
	

}
