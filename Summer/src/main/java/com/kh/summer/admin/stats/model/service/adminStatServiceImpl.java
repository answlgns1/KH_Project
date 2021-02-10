package com.kh.summer.admin.stats.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.admin.stats.model.dao.adminStatDAO;

@Service
public class adminStatServiceImpl implements adminStatService {
	
	@Autowired
	private adminStatDAO adminStatdao;

	@Override
	public List<Map<String, String>> selectRevenue19List() {
		return adminStatdao.selectRevenue19List();
	}
	
	@Override
	public List<Map<String, String>> selectRevenue20List() {
		return adminStatdao.selectRevenue20List();
	}
	
	@Override
	public List<Map<String, String>> selectRevenue21List() {
		return adminStatdao.selectRevenue21List();
	}

	@Override
	public Map<String, String> selectSellPd() {
		return adminStatdao.selectSellPd();
	}

	@Override
	public Map<String, String> selectUserGender() {
		return adminStatdao.selectUserGender();
	}

	@Override
	public List<Map<String, String>> selectUserAge() {
		return adminStatdao.selectUserAge();
	}

	

}
