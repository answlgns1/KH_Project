package com.kh.summer.user.top.model.vo;

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
public class Top {
	
	private int topNo;
	private String pCode;
	private String userId;
	private String tSize;
	private String total;
	private String shoulder;
	private String chest;
	private String sleeve;
	
	public Top(String userId, String total, String shoulder, String chest, String sleeve) {
		super();
		this.userId = userId;
		this.total = total;
		this.shoulder = shoulder;
		this.chest = chest;
		this.sleeve = sleeve;
	}
	
	

}
