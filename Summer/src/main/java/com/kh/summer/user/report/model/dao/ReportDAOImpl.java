package com.kh.summer.user.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.report.model.vo.Report;

@Repository
public class ReportDAOImpl implements ReportDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertReport(Report report) {
		return sqlSession.insert("reportMapper.insertReport", report);
	}

	
}
