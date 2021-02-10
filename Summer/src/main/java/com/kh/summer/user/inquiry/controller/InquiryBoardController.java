package com.kh.summer.user.inquiry.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.summer.admin.customerService.model.vo.Question;
import com.kh.summer.common.util.Utils;
import com.kh.summer.user.inquiry.model.service.InquiryBoardService;
import com.kh.summer.user.member.model.vo.Member;

@Controller
public class InquiryBoardController {

	@Autowired
	InquiryBoardService inquiryBoardService;
	
	@RequestMapping("/service/inquiryBoard.do")
	public String selectInquiryList(@RequestParam( value="cPage", required=false, defaultValue="1")int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = inquiryBoardService.selectInquiryBoardList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = inquiryBoardService.selectInquiryBoardTotalContents();
		System.out.println(totalContents);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "inquiryBoard.do");
	
		System.out.println("list :" + list);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/service/inquiryBoard";
	}
	
	@RequestMapping("/service/inquiryBoardForm.do")
	public String inquiryBoardForm() {
		return "user/service/inquiryBoardForm";
	}
	
	@RequestMapping("/service/inquiryBoardFormEnd.do")
	public String insertiInquiryBoard(Question question, Model model, HttpServletRequest req, HttpSession session) {
		
		Member member = (Member)session.getAttribute("member");
		
		question.setUserid(member.getUserId());
		
		int result = inquiryBoardService.insertInquiryBoard(question);
		
		String loc = "/service/inquiryBoard.do";
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
	
	@RequestMapping("/service/inquiryBoardView.do")
	public String inquiryBoardView(@RequestParam int no, Model model) {
		
		Question question = inquiryBoardService.selectOneInquiryBoard(no);
		
		model.addAttribute("question", question);
		
		return "user/service/inquiryBoardView";
	}

	@RequestMapping("/service/deleteInquiryBoard.do")
	public String inquiryBoardDelete(@RequestParam int qNo, Model model) {
		
		int result = inquiryBoardService.deleteInquiryBoard(qNo);
		
		String loc = "/service/inquiryBoard.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "게시글 삭제 완료 ! ";
		} else {
			msg = "게시글 삭제 실패 ! "; 
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
	
		return "common/msg";
	}
	
	// -------------------- 문의 검색 조회 ----------------- //
		@RequestMapping("/service/selectInquiryBoardSearch.do")
		public String selectLookbookSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
										   @RequestParam String searchCt, @RequestParam String search, Model model) {

			int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
			
			Map<String, String> searchMap = new HashMap<String, String>();
			searchMap.put("searchCt", searchCt);
			searchMap.put("search", search);
			
			// 1. 현재 페이지 게시글 구하기
			List<Map<String, String>> list = inquiryBoardService.selectInquiryBoardSearch(cPage, numPerPage, searchMap);
			
			// 2. 검색된 게시글 수 (페이지 처리를 위함)
			int totalContents = inquiryBoardService.selectInquiryBoardSearchCount(searchMap);
			
			// 3. 페이지 계산된 HTML 구하기
			String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "selectInquiryBoardList.do");
			
			String msg = "검색 결과 : " + totalContents + " 건의 게시글이 있습니다.";
			
			model.addAttribute("list", list)
				 .addAttribute("totalContents", totalContents)
				 .addAttribute("numPerPage", numPerPage)
				 .addAttribute("pageBar", pageBar)
				 .addAttribute("msg", msg);
			
			
			return "user/service/inquiryBoard";
		}
	

}
