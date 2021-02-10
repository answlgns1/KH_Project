package com.kh.summer.admin.stats.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.summer.admin.stats.model.service.adminStatService;

@Controller
public class adminStatsController {
	
	@Autowired
	private adminStatService adminStatservice; 

	@RequestMapping("/admin/selectAdminStats.do")
	public String selectAdminStats(Model model) {
		// 2019년도 월간 수익
		List<Map<String, String>> revenue19 = adminStatservice.selectRevenue19List();
		
		// 2020년도 월간 수익
		List<Map<String, String>> revenue20 = adminStatservice.selectRevenue20List();
		
		// 2021년도 월간 수익
		List<Map<String, String>> revenue21 = adminStatservice.selectRevenue21List();
		
		// 상품별 판매량 통계
		Map<String, String> sell_pd = adminStatservice.selectSellPd();
		
		// 회원통계(성별)
		Map<String, String> user_gender = adminStatservice.selectUserGender();
		
		// 회원통계(연령대별) 
		List<Map<String, String>> user_age = adminStatservice.selectUserAge();
		
		model.addAttribute("revenue19", revenue19)
			 .addAttribute("revenue20", revenue20)
			 .addAttribute("revenue21", revenue21)
			 .addAttribute("sell_pd", sell_pd)
			 .addAttribute("user_gender", user_gender)
			 .addAttribute("user_age", user_age);
		
		return "admin/stats/adminStats"; 
	}
}
