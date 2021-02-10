package com.kh.summer.user.store.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.summer.user.attachment.model.vo.Attachment;

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
public class Store {
	
	private static final long serialVersionUID = 12171438L;
	
	private String pCode;
	private String pName;
	private int pPrice; 
	private int lcNo;
	private int mcNo;
	private int scNo;
	private int comNo;
	private String pDescription;
	private int pStock;
	
	//가상컬럼에 대한 필드추가
	private int fileCount;
	//첨부파일에 대한 필드추가
	private List<Attachment> files = new ArrayList<>();
}
