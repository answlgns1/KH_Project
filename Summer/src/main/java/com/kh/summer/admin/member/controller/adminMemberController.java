package com.kh.summer.admin.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.summer.admin.member.model.service.adminMemberService;
import com.kh.summer.common.exception.MemberException;
import com.kh.summer.common.util.Utils;
import com.kh.summer.user.member.model.vo.Member;

@Controller
public class adminMemberController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private adminMemberService adminmemberService;

	//------------------------------ 회원목록 조회 -------------------------//
	@RequestMapping("/admin/selectMemberList.do")
	public String selectMemberList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
								   Model model) {
		
		int numPerPage = 5; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> members = adminmemberService.selectMemberList(cPage, numPerPage);
		
		int totalContents = adminmemberService.selectMemberTotalContents();
		
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectMemberList.do");
		
		model.addAttribute("members", members)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		return "admin/member/memberList";
	}
	
	//------------------------------ 회원등급 변경 -------------------------//
	@ResponseBody
	@RequestMapping("/admin/membershipUpdate.do")
	public String membershipUpdate(@RequestParam String userId, @RequestParam String membership) {
		
		int result = adminmemberService.membershipUpdate(userId, membership);
		
		if( result > 0 ) {
			membership = adminmemberService.selectMembership(userId);
			System.out.println("[회원등급 수정] : ( " + userId + " ) -- " + membership);
		} else {
			membership = "X";
		}
		
		return membership;
	}
	
	//------------------------------ 회원상태 변경 -------------------------//
	@ResponseBody
	@RequestMapping("/admin/mStatusUpdate.do")
	public String mStatusUpdate(@RequestParam String userId, @RequestParam String mstatus) {
		
		int result = adminmemberService.mStatusUpdate(userId, mstatus);
		
		if( result > 0 ) {
			mstatus = adminmemberService.selectMstatus(userId);
			System.out.println("[회원상태 수정] : ( " + userId + " ) -- " + mstatus);
		} else {
			mstatus = "X";
		}
		
		return mstatus;
	}
	
	//------------------------------ 관리자목록 조회 -------------------------//
	@RequestMapping("/admin/selectAdminList.do")
	public String selectAdminList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
								   Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> admins = adminmemberService.selectAdminList(cPage, numPerPage);
		
		int totalContents = adminmemberService.selectAdminTotalContents();
		
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectAdminList.do");
		
		model.addAttribute("admins", admins)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		return "admin/member/adminList";
	}
	
	//------------------------------ 회원검색 조회 -------------------------//
	@RequestMapping("/admin/selectMemberSearch.do")
	public String selectMemberSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			   						 @RequestParam String searchCt, @RequestParam String search, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchCt", searchCt);
		searchMap.put("search", search);
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> members = adminmemberService.selectMemberSearch(cPage, numPerPage, searchMap);
		
		// 2. 검색된 게시글 수 (페이지 처리를 위함)
		int totalContents = adminmemberService.selectMemberSearchCount(searchMap);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectMemberSearch.do", searchMap);
		
		model.addAttribute("members", members)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		
		return "admin/member/memberList";
	}
	
	//------------------------------ 관리자검색 조회 -------------------------//
	@RequestMapping("/admin/selectAdminSearch.do")
	public String selectAdminSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			   						@RequestParam(value="searchCt") String searchCt,
			   						@RequestParam(value="search") String search, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchCt", searchCt);
		searchMap.put("search", search);
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> admins = adminmemberService.selectAdminSearch(cPage, numPerPage, searchMap);
		
		// 2. 검색된 게시글 수 (페이지 처리를 위함)
		int totalContents = adminmemberService.selectAdminSearchCount(searchMap);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectAdminSearch.do", searchMap);
		
		model.addAttribute("admins", admins)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		
		return "admin/member/adminList";
	}
	
	@RequestMapping("/admin/insertAdmin.do")
	public String insertAdmin() {
		return "admin/member/insertAdmin";
	}
	
	@RequestMapping("/admin/insertAdminEnd.do")
	public String insertAdminEnd(Member member, Model model) {
		
		String plainPassword = member.getPassword();
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		
		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);
		
		member.setPassword(encryptPassword);
		
		try {
			// 1. 서비스를 통한 비즈니스 로직 수행
			int result = adminmemberService.insertAdmin(member);
			
			// 2. 처리 결과에 따라 view 분기 처리
			String loc = "/admin/selectAdminList.do";
			String msg = "";
			
			if( result > 0 ) {
				msg = "관리자등록 성공!";
			} else {
				msg = "관리자등록 실패!";
			}
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			System.out.println("관리자 등록 에러 발생!!");
			
			// 기존은 예외를 우리가 지정한 예외 형식으로
			// 바꾸어 보내기 위해 MemberException을 호출한다.
			throw new MemberException(e.getMessage());
		}
		
		return "common/msg";
	}
}










