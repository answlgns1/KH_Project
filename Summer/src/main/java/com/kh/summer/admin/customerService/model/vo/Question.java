package com.kh.summer.admin.customerService.model.vo;

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

public class Question {
	
	private int qno;			// 문의번호
	private int qtypeno;		// 질문유형번호
	private String qtitle;		// 제목
	private String qcontents;	// 내용
	private String userid;		// 작성자
	private Date qdate;			// 작성일
	private char astatus;		// 답변상태
	private String acontents;	// 답변내용
	private String auserid;		// 담당자
	private Date adate;			// 답변일

}


