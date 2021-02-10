package com.kh.summer.admin.orderinfo.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class adminOrderDAOImpl implements adminOrderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> selectOrderList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		List<Map<String, Object>> orders = sqlSession.selectList("adminOrderMapper.selectOrderList", null, rows);
		
		for( int i = 0; i < orders.size(); i++ ) {
			int ono = Integer.parseInt((String) orders.get(i).get("ONO"));
			List<Map<String, Object>> ios = sqlSession.selectList("adminOrderMapper.selectIOList", ono);
			
			Map<String, Object> temp = new HashMap<String, Object>();
			temp = orders.get(i);
			temp.put("ios", ios);
			
			orders.remove(i);
			orders.add(i, temp);
		}
		
		return orders;
	}

	@Override
	public int selectOrderTotalContents() {
		return sqlSession.selectOne("adminOrderMapper.selectOrderTotalContents");
	}

	@Override
	public List<Map<String, Object>> selectOrderSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		List<Map<String, Object>> orders = sqlSession.selectList("adminOrderMapper.selectOrderSearch", searchMap, rows);
		
		for( int i = 0; i < orders.size(); i++ ) {
			int ono = Integer.parseInt((String) orders.get(i).get("ONO"));
			List<Map<String, Object>> ios = sqlSession.selectList("adminOrderMapper.selectIOList", ono);
			
			Map<String, Object> temp = new HashMap<String, Object>();
			temp = orders.get(i);
			temp.put("ios", ios);
			
			orders.remove(i);
			orders.add(i, temp);
		}
		
		return orders;
	}

	@Override
	public int selectOrderSearchCount(Map<String, String> searchMap) {
		return sqlSession.selectOne("adminOrderMapper.selectOrderSearchCount", searchMap);
	}

	@Override
	public List<Map<String, String>> selectPointList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminOrderMapper.selectPointList", null, rows);
	}

	@Override
	public int selectPointTotalContents() {
		return sqlSession.selectOne("adminOrderMapper.selectPointTotalContents");
	}

	@Override
	public List<Map<String, Object>> selectPointSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminOrderMapper.selectPointSearch", searchMap, rows);
	}

	@Override
	public int selectPointSearchCount(Map<String, String> searchMap) {
		return sqlSession.selectOne("adminOrderMapper.selectPointSearchCount");
	}

}







