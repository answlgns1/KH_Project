package com.kh.summer.user.faq.model.vo;

import java.util.Date;

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
public class FAQ {

	private int fno;
	private int qtypeno;
	private String ftitle;
	private String fcontents;
	private String userid;
	private Date fdate;
	
}
