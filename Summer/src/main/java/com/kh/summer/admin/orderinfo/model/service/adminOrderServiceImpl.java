package com.kh.summer.admin.orderinfo.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.admin.orderinfo.model.dao.adminOrderDAO;


@Service
public class adminOrderServiceImpl implements adminOrderService {

	@Autowired
	private adminOrderDAO adminorderDAO;

	@Override
	public List<Map<String, Object>> selectOrderList(int cPage, int numPerPage) {
		return adminorderDAO.selectOrderList(cPage, numPerPage);
	}

	@Override
	public int selectOrderTotalContents() {
		return adminorderDAO.selectOrderTotalContents();
	}

	@Override
	public List<Map<String, Object>> selectOrderSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		return adminorderDAO.selectOrderSearch(cPage, numPerPage, searchMap);
	}

	@Override
	public int selectOrderSearchCount(Map<String, String> searchMap) {
		return adminorderDAO.selectOrderSearchCount(searchMap);
	}

	@Override
	public List<Map<String, String>> selectPointList(int cPage, int numPerPage) {
		return adminorderDAO.selectPointList(cPage, numPerPage);
	}

	@Override
	public int selectPointTotalContents() {
		return adminorderDAO.selectPointTotalContents();
	}

	@Override
	public List<Map<String, Object>> selectPointSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		return adminorderDAO.selectPointSearch(cPage, numPerPage, searchMap);
	}

	@Override
	public int selectPointSearchCount(Map<String, String> searchMap) {
		return adminorderDAO.selectPointSearchCount(searchMap);
	}
	
	

}
