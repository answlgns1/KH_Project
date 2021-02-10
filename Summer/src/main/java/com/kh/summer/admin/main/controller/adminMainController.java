package com.kh.summer.admin.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.summer.admin.main.model.service.adminMainService;

@Controller
public class adminMainController {
	
	@Autowired
	private adminMainService adminMainservice; 

	@RequestMapping("/admin/selectAdminMain.do")
	public String selectAdminMain(Model model) {
		// 회원수, 좋아요수, 상품수, 댓글수
		int userCount = adminMainservice.userCount();
		
		int likeCount = adminMainservice.likesCount();
		
		int productCount = adminMainservice.productsCount();
		
		int commentCount = adminMainservice.commentsCount();
		
		List<Map<String, String>> products = adminMainservice.selectProducts();
		
		model.addAttribute("userCount", userCount)
			 .addAttribute("likeCount", likeCount)
			 .addAttribute("productCount", productCount)
			 .addAttribute("commentCount", commentCount)
			 .addAttribute("products", products);
		
		return "admin/adminMain"; 
	}
}
