package com.kh.summer.admin.customerService.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.report.model.vo.Report;

@Repository
public class AdminReportDAOImpl implements AdminReportDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectAdminReportList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminreportMapper.selectReportList", null, rows);
	}

	@Override
	public int selectAdminReportTotalContents() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Report selectOneAdminReport(int rNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
