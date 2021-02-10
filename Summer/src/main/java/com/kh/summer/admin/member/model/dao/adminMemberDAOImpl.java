package com.kh.summer.admin.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.member.model.vo.Member;

@Repository
public class adminMemberDAOImpl implements adminMemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminMemberMapper.selectMemberList", null, rows);
	}

	@Override
	public int selectMemberTotalContents() {
		return sqlSession.selectOne("adminMemberMapper.selectMemberTotalContents");
	}

	@Override
	public int membershipUpdate(String userId, String membership) {
		Map<String, String> map = new HashMap<>();
		
		map.put("userId", userId);
		map.put("membership", membership);
		
		return sqlSession.update("adminMemberMapper.membershipUpdate", map);
	}

	@Override
	public String selectMembership(String userId) {
		return sqlSession.selectOne("adminMemberMapper.selectMembership", userId);
	}

	@Override
	public int mStatusUpdate(String userId, String mstatus) {
		Map<String, String> map = new HashMap<>();
		
		map.put("userId", userId);
		map.put("mstatus", mstatus);
		
		return sqlSession.update("adminMemberMapper.mStatusUpdate", map);
	}
	
	@Override
	public String selectMstatus(String userId) {
		return sqlSession.selectOne("adminMemberMapper.selectMstatus", userId);
	}

	@Override
	public List<Map<String, String>> selectAdminList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminMemberMapper.selectAdminList", null, rows);
	}

	@Override
	public int selectAdminTotalContents() {
		return sqlSession.selectOne("adminMemberMapper.selectAdminTotalContents");
	}

	@Override
	public List<Map<String, String>> selectMemberSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		System.out.println(searchMap);
		return sqlSession.selectList("adminMemberMapper.selectMemberSearch", searchMap, rows);
	}

	@Override
	public int selectMemberSearchCount(Map<String, String> searchMap) {
		return sqlSession.selectOne("adminMemberMapper.selectMemberSearchCount", searchMap);
	}

	@Override
	public List<Map<String, String>> selectAdminSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		System.out.println(searchMap);
		return sqlSession.selectList("adminMemberMapper.selectAdminSearch", searchMap, rows);
	}

	@Override
	public int selectAdminSearchCount(Map<String, String> searchMap) {
		return sqlSession.selectOne("adminMemberMapper.selectAdminSearchCount", searchMap);
	}

	@Override
	public int insertAdmin(Member member) {
		return sqlSession.insert("adminMemberMapper.insertAdmin", member);
	}
	

}







