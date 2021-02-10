package com.kh.summer.admin.stats.model.dao;

import java.util.List;
import java.util.Map;

public interface adminStatDAO {

	List<Map<String, String>> selectRevenue19List();

	List<Map<String, String>> selectRevenue20List();
	
	List<Map<String, String>> selectRevenue21List();

	Map<String, String> selectSellPd();

	Map<String, String> selectUserGender();

	List<Map<String, String>> selectUserAge();

}
