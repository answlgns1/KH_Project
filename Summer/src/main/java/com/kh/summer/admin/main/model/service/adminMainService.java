package com.kh.summer.admin.main.model.service;

import java.util.List;
import java.util.Map;

public interface adminMainService {

	int userCount();

	int likesCount();

	int productsCount();

	int commentsCount();

	List<Map<String, String>> selectProducts();

}
