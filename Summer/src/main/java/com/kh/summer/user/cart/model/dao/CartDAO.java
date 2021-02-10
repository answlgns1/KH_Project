package com.kh.summer.user.cart.model.dao;

import java.util.List;
import java.util.Map;


public interface CartDAO {
	
	List<Map<String, String>> selectCartList(int cPage, int numPerPage, String userId);
	
	int deleteCart(int cartNo);

	int selectCartTotalContents(String userId);

	
}
