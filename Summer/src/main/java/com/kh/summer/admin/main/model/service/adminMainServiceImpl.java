package com.kh.summer.admin.main.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.admin.main.model.dao.adminMainDAO;

@Service
public class adminMainServiceImpl implements adminMainService {
	
	@Autowired
	private adminMainDAO adminMaindao;

	@Override
	public int userCount() {
		return adminMaindao.userCount();
	}

	@Override
	public int likesCount() {
		return adminMaindao.likesCount();
	}

	@Override
	public int productsCount() {
		return adminMaindao.productsCount();
	}

	@Override
	public int commentsCount() {
		return adminMaindao.commentsCount();
	}

	@Override
	public List<Map<String, String>> selectProducts() {
		return adminMaindao.selectProducts();
	}

}
