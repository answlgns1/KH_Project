package com.kh.summer.user.orderinfo.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.orderinfo.model.vo.OrderInfo;

public interface OrderInfoDAO {
	
	List<Map<String, String>> selectOIList(String userId);

	int insertOrderInfo(OrderInfo orderInfo);

}
