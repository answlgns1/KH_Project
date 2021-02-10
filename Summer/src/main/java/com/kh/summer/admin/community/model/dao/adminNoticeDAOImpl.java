package com.kh.summer.admin.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.board.model.vo.Board;

@Repository
public class adminNoticeDAOImpl implements adminNoticeDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectAdminNoticeList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("boardMapper.selectAdminNoticeList", null, rows);
	}
	
	@Override
	public int selectAdminNoticeTotalContents() {
		
		return sqlSession.selectOne("boardMapper.selectAdminNoticeTotalContents");
	}

	@Override
	public Board selectOneAdminNotice(int bNo) {
		
		return sqlSession.selectOne("boardMapper.selectOneAdminNotice", bNo);
	}

	@Override
	public int insertAdminNotice(Board board) {
		
		return sqlSession.insert("boardMapper.insertAdminNotice", board);
	}

	@Override
	public int adminNoticeDelete(int bno) {
	
		return sqlSession.delete("boardMapper.deleteAdminNotice", bno);
	}

}
