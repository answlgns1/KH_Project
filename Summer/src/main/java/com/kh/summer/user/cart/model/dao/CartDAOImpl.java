package com.kh.summer.user.cart.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectCartList(int cPage, int numPerPage, String userId) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("cartMapper.selectCartList", userId, rows);
	}

	@Override
	public int deleteCart(int cartNo) {
		return sqlSession.delete("cartMapper.deleteCart", cartNo);
	}

	@Override
	public int selectCartTotalContents(String userId) {
		return sqlSession.selectOne("cartMapper.selectCartTotalContents", userId);
	}

}
