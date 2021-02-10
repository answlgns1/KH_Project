package com.kh.summer.admin.main.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository 
public class adminMainDAOImpl implements adminMainDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int userCount() {
		return sqlSession.selectOne("adminMainMapper.userCount");
	}

	@Override
	public int likesCount() {
		return sqlSession.selectOne("adminMainMapper.likesCount");
	}

	@Override
	public int productsCount() {
		return sqlSession.selectOne("adminMainMapper.productsCount");
	}

	@Override
	public int commentsCount() {
		return sqlSession.selectOne("adminMainMapper.commentsCount");
	}

	@Override
	public List<Map<String, String>> selectProducts() {
		return sqlSession.selectList("adminMainMapper.selectProducts");
	}

}
