package com.kh.summer.admin.customerService.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.admin.customerService.model.dao.FaqServiceDAO;
import com.kh.summer.common.exception.BoardException;
import com.kh.summer.user.faq.model.vo.FAQ;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	FaqServiceDAO faqServiceDAO;
	
	@Override
	public List<Map<String, String>> selectFAQList(int cPage, int numPerPage) {

		return faqServiceDAO.selectFAQList(cPage, numPerPage);
	}

	@Override
	public int selectFAQTotalContents() {
		
		return faqServiceDAO.selectFAQTotalContents();
	}

	@Override
	public FAQ selectOneFAQ(int fNo) {
		
		return faqServiceDAO.selectOneFAQ(fNo);
	}

	@Override
	public int insertFAQ(FAQ faq) {
		
		int result1 = faqServiceDAO.insertFAQ(faq);
		
		if( result1 == 0 ) throw new BoardException();
		
		return result1;
	}

	@Override
	public int faqDelete(int fno) {
		
		return faqServiceDAO.faqDelete(fno);
	}

}
