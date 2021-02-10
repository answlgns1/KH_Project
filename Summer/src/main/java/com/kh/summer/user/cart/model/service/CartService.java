package com.kh.summer.user.cart.model.service;

import java.util.List;
import java.util.Map;

public interface CartService {
	
	List<Map<String, String>> selectCartList(int cPage, int numPerPage, String userId);
	
	int deleteCart(int cartNo);

	int selectCartTotalContents(String userId);


}
