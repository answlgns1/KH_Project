package com.kh.summer.user.product.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Product {
	
	private String pCode;
	private String pName;
	private int pPrice;
	private int lcNo;
	private int mcNo;
	private int scNo;
	private int comNo;
	private String pDescription;
	private int pStock;

}
