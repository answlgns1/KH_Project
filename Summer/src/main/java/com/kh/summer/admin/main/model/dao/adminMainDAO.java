package com.kh.summer.admin.main.model.dao;

import java.util.List;
import java.util.Map;

public interface adminMainDAO {

	int userCount();

	int likesCount();

	int productsCount();

	int commentsCount();

	List<Map<String, String>> selectProducts();

}
