package com.kh.summer.user.faq.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.summer.common.util.Utils;
import com.kh.summer.user.faq.model.service.FAQService;
import com.kh.summer.user.faq.model.vo.FAQ;
import com.kh.summer.user.member.model.vo.Member;


@Controller
public class faqController {
	
	@Autowired
	FAQService faqService;
	
	@RequestMapping("/service/frequentlyAskQuestion.do")
	public String selectFAQList(@RequestParam( value="cPage", required=false, defaultValue="1")int cPage, Model model) {
		
		int numPerPage = 15; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = faqService.selectFAQList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = faqService.selectFAQTotalContents();
		System.out.println(totalContents);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "frequentlyAskQuestion.do");
	
		System.out.println("list :" + list);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/service/frequentlyAskQuestion";
	}
	
	@RequestMapping("/service/frequentlyAskQuestionForm.do")
	public String frequentlyAskQuestionForm() {
		
		return "user/service/frequentlyAskQuestionForm";
	}
	
	@RequestMapping("/service/frequentlyAskQuestionFormEnd.do")
	public String insertFAQ(FAQ faq, Model model, HttpServletRequest req, HttpSession session) {
		
		Member member = (Member)session.getAttribute("member");
		
		faq.setUserid(member.getUserId());
		
		int result = faqService.insertFAQ(faq);
		
		String loc = "/service/frequentlyAskQuestion.do";
		String msg = "";
		if( result > 0 ) {
			msg = "문의사항 등록 성공";
		} else {
			msg = "문의사항 등록 실패";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/service/frequentlyAskQuestionView.do")
	public String frequentlyAskQuestionView(@RequestParam int no, Model model) {
		
		FAQ faq = faqService.selectOneFAQ(no);
		
		model.addAttribute("faq", faq);
		
		return "user/service/frequentlyAskQuestionView";
	}

	
}
