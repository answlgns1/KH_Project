package com.kh.summer.user.faq.model.service;

import java.util.List;
import java.util.Map;

import com.kh.summer.admin.customerService.model.vo.Question;
import com.kh.summer.user.faq.model.vo.FAQ;

public interface FAQService {
	
	List<Map<String, String>> selectFAQList(int cPage, int numPerPage);
	
	int selectFAQTotalContents();
	
	FAQ selectOneFAQ(int fNo);
	
	int insertFAQ(FAQ faq);
	
}
