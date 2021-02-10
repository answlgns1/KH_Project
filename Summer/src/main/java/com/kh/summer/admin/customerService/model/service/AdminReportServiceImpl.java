package com.kh.summer.admin.customerService.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.admin.customerService.model.dao.AdminReportDAO;
import com.kh.summer.user.report.model.vo.Report;

@Service
public class AdminReportServiceImpl implements AdminReportService {

	@Autowired
	AdminReportDAO AdminreportDAO;
	
	@Override
	public List<Map<String, String>> selectAdminReportList(int cPage, int numPerPage) {

		return AdminreportDAO.selectAdminReportList(cPage, numPerPage);
	}

	@Override
	public Report selectOneAdminReport(int rNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectAdminReportTotalContents() {
		// TODO Auto-generated method stub
		return 0;
	}

}
