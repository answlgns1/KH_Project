package com.kh.summer.user.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.summer.common.util.Utils;
import com.kh.summer.user.board.model.vo.Board;
import com.kh.summer.user.notice.model.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/community/noticeList.do")
	public String selectNoticeList(@RequestParam( value="cPage", required=false, defaultValue="1")int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = noticeService.selectNoticeList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = noticeService.selectNoticeTotalContents();
		System.out.println(totalContents);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "noticeList.do");
	
		System.out.println("list :" + list);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/community/noticeList";
	}
	
	@RequestMapping("/community/noticeView.do")
	public String noticeView(@RequestParam int no, Model model) {
		
		Board board = noticeService.selectOneNotice(no);
		
		model.addAttribute("board", board);
		
		return "user/community/noticeView";
	}
}
