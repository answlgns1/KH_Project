package com.kh.summer.user.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.board.model.vo.Board;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("boardMapper.selectNoticeList", null, rows);
	}

	@Override
	public int selectNoticeTotalContents() {

		return sqlSession.selectOne("boardMapper.selectNoticeTotalContents");
	}

	@Override
	public Board selectOneNotice(int bNo) {
		
		return sqlSession.selectOne("boardMapper.selectOneNotice", bNo);
	}

}
