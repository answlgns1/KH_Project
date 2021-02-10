package com.kh.summer.admin.orderinfo.model.dao;

import java.util.List;
import java.util.Map;

public interface adminOrderDAO {

	List<Map<String, Object>> selectOrderList(int cPage, int numPerPage);

	int selectOrderTotalContents();

	List<Map<String, Object>> selectOrderSearch(int cPage, int numPerPage, Map<String, String> searchMap);

	int selectOrderSearchCount(Map<String, String> searchMap);

	List<Map<String, String>> selectPointList(int cPage, int numPerPage);

	int selectPointTotalContents();

	List<Map<String, Object>> selectPointSearch(int cPage, int numPerPage, Map<String, String> searchMap);

	int selectPointSearchCount(Map<String, String> searchMap);

	

}
