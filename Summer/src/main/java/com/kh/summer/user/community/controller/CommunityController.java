package com.kh.summer.user.community.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommunityController {
	
	@RequestMapping("/community/selectCommunityMain.do")
	public String selectCommunityMain(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for(int i = 9 ; i >= 1 ; i--) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("boardNo", "6"+i);
			map.put("boardTitle", "커뮤니티"+i);
			map.put("boardWriter", "홍길동"+i);
			map.put("boardDate", "20.12.06");
			map.put("fileCount", i%2==0?"1":"0");
			map.put("boardReadCount", Integer.toString(i));
			
			list.add(map);
		}
		model.addAttribute("list", list);
		
		return "user/community/communityMain";
	}
	
}
