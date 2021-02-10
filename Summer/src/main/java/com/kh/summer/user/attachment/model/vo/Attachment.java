package com.kh.summer.user.attachment.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Attachment implements Serializable{
	
	private static final long serialVersionUID = 202012171712L;
	
	private int aNo;
	private String oldFileName;
	private String newFileName;
	private String filePath;
	private int fIndex;
	private String pCode;
	private int bNo;
	private int bcNo;

}
