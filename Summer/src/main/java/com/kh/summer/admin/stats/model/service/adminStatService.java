package com.kh.summer.admin.stats.model.service;

import java.util.List;
import java.util.Map;

public interface adminStatService {

	List<Map<String, String>> selectRevenue19List();

	List<Map<String, String>> selectRevenue20List();
	
	List<Map<String, String>> selectRevenue21List();

	Map<String, String> selectSellPd();

	Map<String, String> selectUserGender();

	List<Map<String, String>> selectUserAge();

}
