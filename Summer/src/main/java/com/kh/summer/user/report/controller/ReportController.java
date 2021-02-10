package com.kh.summer.user.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.summer.user.report.model.service.ReportService;
import com.kh.summer.user.report.model.vo.Report;

@Controller
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	Report report;
	
	@RequestMapping("/report/insertReport.do")
	public String insertBoard(@RequestParam(value="url", required=false) String url,
							  @RequestParam(value="bNo", required=false) int bNo,
							  @RequestParam(value="bcNo", required=false) int bcNo,
							  @RequestParam(value="userId", required=false) String userId,
							  @RequestParam(value="rReason", required=false) String rReason, Model model) {
		
		report.setBNo(bNo);
		report.setBcNo(bcNo);
		report.setUserId(userId);
		report.setRReason(rReason);
		
		System.out.println(report);
		
		
		int result = reportService.insertReport(report);
		
		String msg ="";
		
		if( result > 0 ) {
			msg = "신고 완료";
		} else {
			msg = "신고 실패!";
		}
		
		model.addAttribute("loc", url).addAttribute("msg", msg);
		
		return "common/msg";
		
	}
}
