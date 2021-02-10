package com.kh.summer.admin.stats.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository 
public class adminStatDAOImpl implements adminStatDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectRevenue19List() {
		return sqlSession.selectList("adminStatMapper.selectRevenue19List");
	}
	
	@Override
	public List<Map<String, String>> selectRevenue20List() {
		return sqlSession.selectList("adminStatMapper.selectRevenue20List");
	}
	
	@Override
	public List<Map<String, String>> selectRevenue21List() {
		return sqlSession.selectList("adminStatMapper.selectRevenue21List");
	}

	@Override
	public Map<String, String> selectSellPd() {
		return sqlSession.selectOne("adminStatMapper.selectSellPd");
	}

	@Override
	public Map<String, String> selectUserGender() {
		return sqlSession.selectOne("adminStatMapper.selectUserGender");
	}

	@Override
	public List<Map<String, String>> selectUserAge() {
		return sqlSession.selectList("adminStatMapper.selectUserAge");
	}
	
	

}
