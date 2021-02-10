package com.kh.summer.admin.customerService.model.service;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.report.model.vo.Report;

public interface AdminReportService {
	
	List<Map<String, String>> selectAdminReportList(int cPage, int numPerPage);
	
	int selectAdminReportTotalContents();
	
	Report selectOneAdminReport(int rNo);

}
