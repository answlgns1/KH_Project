package com.kh.summer.user.orderinfo.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.orderinfo.model.vo.OrderInfo;

@Repository
public class OrderInfoDAOImpl implements OrderInfoDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectOIList(String userId) {
		
		return sqlSession.selectList("orderinfoMapper.selectOIList", userId);
	}

	@Override
	public int insertOrderInfo(OrderInfo orderInfo) {
		return sqlSession.insert("orderinfoMapper.insertOI", orderInfo);
	}

}
