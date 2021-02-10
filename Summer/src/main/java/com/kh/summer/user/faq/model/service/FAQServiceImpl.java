package com.kh.summer.user.faq.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.admin.customerService.model.vo.Question;
import com.kh.summer.common.exception.BoardException;
import com.kh.summer.user.faq.model.dao.FAQDAO;
import com.kh.summer.user.faq.model.vo.FAQ;

@Service
public class FAQServiceImpl implements FAQService {

	@Autowired
	FAQDAO faqDAO;
	
	@Override
	public List<Map<String, String>> selectFAQList(int cPage, int numPerPage) {

		return faqDAO.selectFAQList(cPage, numPerPage);
	}

	@Override
	public int selectFAQTotalContents() {
		
		return faqDAO.selectFAQTotalContents();
	}

	@Override
	public FAQ selectOneFAQ(int fNo) {
		
		return faqDAO.selectOneFAQ(fNo);
	}

	@Override
	public int insertFAQ(FAQ faq) {
		
		int result1 = faqDAO.insertFAQ(faq);
		
		if( result1 == 0 ) throw new BoardException();
		
		return result1;
	}

}
