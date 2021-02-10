package com.kh.summer.user.orderinfo.model.service;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.orderinfo.model.vo.OrderInfo;

public interface OrderInfoService {
	
	List<Map<String, String>> selectOIList(String userId);

	int insertOrderInfo(OrderInfo orderInfo);

}
