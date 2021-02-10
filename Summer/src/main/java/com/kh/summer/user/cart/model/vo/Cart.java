package com.kh.summer.user.cart.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Cart {
	
	private int cartNo;
	private String userId;
	private String pCode;
	private int amount;

}
