package com.kh.summer.user.orderinfo.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class OrderInfo {

	private String oNo;
	private String rName;
	private String rAddress;
	private String rPhone;
	private String requirement;
	private int totalPrice;
	private String userId;
	private Date orderDate;
	private String payInfo;
	private String orderInfo;
	private int osNo;
	private String deliveryNo;
	private Date endDate;
	
}
