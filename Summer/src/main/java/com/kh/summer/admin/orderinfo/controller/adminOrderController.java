package com.kh.summer.admin.orderinfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.summer.admin.orderinfo.model.service.adminOrderService;
import com.kh.summer.common.util.Utils;

@Controller
public class adminOrderController {
	
	@Autowired
	private adminOrderService adminorderService;
	
	//------------------------------ 결제내역 조회 -------------------------//
	@RequestMapping("/admin/selectOrderList.do")
	public String selectOrderList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			   					  Model model) {
		
		int numPerPage = 5; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, Object>> orders = adminorderService.selectOrderList(cPage, numPerPage);
		
		int totalContents = adminorderService.selectOrderTotalContents();
		
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectOrderList.do");
		
		model.addAttribute("orders", orders)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		return "admin/orderinfo/orderInfoList";
	}
	
	//------------------------------ 결제내역 검색 조회 -------------------------//
	@RequestMapping("/admin/selectOrderSearch.do")
	public String selectOrderSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			   						 @RequestParam String searchCt, @RequestParam String search, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchCt", searchCt);
		searchMap.put("search", search);
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, Object>> orders = adminorderService.selectOrderSearch(cPage, numPerPage, searchMap);
		
		// 2. 검색된 게시글 수 (페이지 처리를 위함)
		int totalContents = adminorderService.selectOrderSearchCount(searchMap);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectOrderSearch.do", searchMap);
		
		model.addAttribute("orders", orders)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		
		return "admin/orderinfo/orderInfoList";
	}
	
	//------------------------------ 포인트내역 조회 -------------------------//
	@RequestMapping("/admin/selectPointList.do")
	public String selectPointList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
				  				  Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> points = adminorderService.selectPointList(cPage, numPerPage);
		
		int totalContents = adminorderService.selectPointTotalContents();
		
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectPointList.do");
		
		model.addAttribute("points", points)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		return "admin/orderinfo/pointList";
	}
	
	//------------------------------ 포인트내역 검색 조회 -------------------------//
	@RequestMapping("/admin/selectPointSearch.do")
	public String selectPointSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			   						@RequestParam String searchCt, @RequestParam String search, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchCt", searchCt);
		searchMap.put("search", search);
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, Object>> points = adminorderService.selectPointSearch(cPage, numPerPage, searchMap);
		
		// 2. 검색된 게시글 수 (페이지 처리를 위함)
		int totalContents = adminorderService.selectPointSearchCount(searchMap);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectPointSearch.do", searchMap);
		
		model.addAttribute("points", points)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		
		return "admin/orderinfo/pointList";
	}
	
}










