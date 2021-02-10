package com.kh.summer.admin.customerService.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.faq.model.vo.FAQ;

@Repository
public class FaqServiceDAOImpl implements FaqServiceDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectFAQList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("faqMapper.selectFAQList", null, rows);
	}
	@Override
	public int selectFAQTotalContents() {
		
		return sqlSession.selectOne("faqMapper.selectFAQTotalContents");
	}

	@Override
	public FAQ selectOneFAQ(int fNo) {
		
		return sqlSession.selectOne("faqMapper.selectOneFAQ", fNo);
	}
	@Override
	public int insertFAQ(FAQ faq) {
		
		return sqlSession.insert("faqMapper.insertFAQ", faq);
	}

	@Override
	public int faqDelete(int fno) {
		
		return sqlSession.delete("faqMapper.deleteFAQ", fno);
	}
}
