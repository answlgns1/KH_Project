package com.kh.summer.admin.community.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.summer.admin.community.model.service.adminNoticeService;
import com.kh.summer.common.util.Utils;
import com.kh.summer.user.board.model.vo.Board;
import com.kh.summer.user.member.model.vo.Member;

@Controller
public class adminNoticeController {
	
	@Autowired
	adminNoticeService adminNoticeService;
	
	// 문의사항 목록 조회
	@RequestMapping("/admin/community/adminNoticeList.do")
	public String selectAdminNoticeList(
			@RequestParam( value="cPage", required=false, defaultValue="1")int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = adminNoticeService.selectAdminNoticeList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = adminNoticeService.selectAdminNoticeTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "noticeList.do");
	
		System.out.println("list :" + list);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/community/noticeList";
	}
	
	@RequestMapping("/admin/community/noticeForm.do")
	public String noticeForm() {
		
		return "admin/community/noticeForm";
	}
	
	@RequestMapping("/admin/community/noticeFormEnd.do")
	public String insertNotice(Board board, Model model, HttpServletRequest req, HttpSession session) {
		
		Member member = (Member)session.getAttribute("member");
		
		board.setUserId(member.getUserId());
		
		int result = adminNoticeService.insertAdminNotice(board);
		
		String loc = "/admin/community/noticeList.do";
		String msg = "";
		if( result > 0 ) {
			msg = "공지사항 등록 성공";
		} else {
			msg = "공지사항 등록 실패";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/admin/community/noticeView.do")
	public String noticeView(@RequestParam int no, Model model) {
		
		Board board = adminNoticeService.selectOneAdminNotice(no);
		
		model.addAttribute("board", board);
		
		return "admin/community/noticeView";
	}
	
	@RequestMapping("/admin/community/noticeDelete.do")
	public String noticeDelete(@RequestParam int bNo, Model model) {
		
		int result = adminNoticeService.adminNoticeDelete(bNo);
		
		String loc = "/admin/community/noticeList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "문의사항 삭제 완료 ! ";
		} else {
			msg = "문의사항 삭제 실패 ! "; 
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
	
		return "common/msg";
	}

}
