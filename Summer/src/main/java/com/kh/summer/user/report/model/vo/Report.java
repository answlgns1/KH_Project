package com.kh.summer.user.report.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

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
@Component
public class Report implements Serializable{

	private static final long serialVersionUID = 202012200134L;
	
	private int rNo;
	private int bNo;
	private int bcNo;
	private String userId;
	private String rReason;
	private Date rDate;
	private String rStatus;
	
}
