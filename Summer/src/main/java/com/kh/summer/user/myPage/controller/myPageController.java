package com.kh.summer.user.myPage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.summer.common.util.Utils;
import com.kh.summer.user.cart.model.service.CartService;
import com.kh.summer.user.member.model.service.MemberService;
import com.kh.summer.user.member.model.vo.Member;
import com.kh.summer.user.myPage.model.service.myPageService;
import com.kh.summer.user.orderinfo.model.service.OrderInfoService;
import com.kh.summer.user.pants.model.vo.Pants;
import com.kh.summer.user.top.model.vo.Top;

@Controller
public class myPageController {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	OrderInfoService orderinfoService;
	
	@Autowired
	myPageService mypageService;
	
// --------------------- 마이페이지 장바구니 목록 조회 ---------------------------- //
	@RequestMapping("/myPage/myPageCart.do")
	public String myPageCart(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
							 HttpServletRequest request, Model model) {
		
		int numPerPage = 5; // 한 페이지 당 게시글 and 페이지 수
		
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		
		String userId = member.getUserId();
		
		List<Map<String, String>> c = cartService.selectCartList(cPage, numPerPage, userId);
		
		int totalContents = cartService.selectCartTotalContents(userId);
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myPageCart.do");
		
		String msg = totalContents + "건의 구매후기가 있습니다.";
		
		model.addAttribute("c", c)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar)
			 .addAttribute("msg", msg);
		
		return "user/myPage/myPageCart";
	}
	
// --------------------- 마이페이지 장바구니 삭제 ---------------------------- //
	@RequestMapping("/myPage/cartDelete.do")
	@ResponseBody
	public boolean cartDelete(@RequestParam int cartNo, Model model) {
		
		boolean result = cartService.deleteCart(cartNo) != 0 ? true : false;
		
		return result;
	}
	
// --------------------- 마이페이지 구매내역 조회 ------------------------------ //
	@RequestMapping("/myPage/myPageOI.do")
	public String myPageOI(@RequestParam String userId, Model model) {
		
		Member m = memberService.selectOneMember(userId);
		List<Map<String, String>> oi = orderinfoService.selectOIList(userId);
		
		model.addAttribute("oi", oi)
		     .addAttribute("member", m);
		
		System.out.println(oi);
		System.out.println(m);
		
		return "user/myPage/myPageOrderInfo";
	}
	
// --------------------- 마이페이지 구매후기 조회 ------------------------------ //
	@RequestMapping("/myPage/myPageReview.do")
	public String myPageReview(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
							   HttpServletRequest request, Model model) {
		
		int numPerPage = 5; // 한 페이지 당 게시글 and 페이지 수
		
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		
		String userId = member.getUserId();
		
		List<Map<String, String>> reviews = mypageService.selectReviewList(cPage, numPerPage, userId);
		
		int totalContents = mypageService.selectReviewTotalContents(userId);
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myPageReview.do");
		
		String msg = totalContents + "건의 구매후기가 있습니다.";
		
		model.addAttribute("reviews", reviews)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar)
			 .addAttribute("msg", msg);
		
		return "user/myPage/myPageReview";
	}
	
	
// --------------------- 마이페이지 좋아요목록 조회 ------------------------------ //
	@RequestMapping("/myPage/myPageLike.do")
	public String myPageLike(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
							   HttpServletRequest request, Model model) {
		
		int numPerPage = 5; // 한 페이지 당 게시글 and 페이지 수
		
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		
		String userId = member.getUserId();
		
		List<Map<String, String>> likeList = mypageService.selectLikeList(cPage, numPerPage, userId);
		
		int totalContents = mypageService.selectLikeTotalContents(userId);
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myPageLike.do");
		
		String msg = totalContents + "개의 좋아요가 있습니다.";
		
		System.out.println(likeList);
		
		model.addAttribute("likeList", likeList)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar)
			 .addAttribute("msg", msg);
		
		return "user/myPage/myPageLike";
	}
	
// --------------------- 마이페이지 포인트내역 조회 ------------------------------ //
	@RequestMapping("/myPage/myPagePoint.do")
	public String myPagePoint(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
							   HttpServletRequest request, Model model) {
		
		int numPerPage = 5; // 한 페이지 당 게시글 and 페이지 수
		
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		
		String userId = member.getUserId();
		
		List<Map<String, String>> point = mypageService.selectPointList(cPage, numPerPage, userId);
		
		int totalContents = mypageService.selectPointTotalContents(userId);
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myPagePoint.do");
		
		String msg = totalContents + "건의 포인트내역이 있습니다.";
		
		System.out.println(point);
		
		model.addAttribute("point", point)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar)
			 .addAttribute("msg", msg);
		
		return "user/myPage/myPagePoint";
	}
	
// --------------------- 마이페이지 마이사이즈 조회 ------------------------------ //
	@RequestMapping("/myPage/myPageMySize.do")
	public String myPageMySize(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		
		String userId = member.getUserId();
		
		Top topSize = mypageService.selectTopSize(userId);
		
		Pants pantsSize = mypageService.selectPantsSize(userId);
		
		model.addAttribute("topSize", topSize)
			 .addAttribute("pantsSize", pantsSize);
		
		return "user/myPage/myPageMySize";
	}
	
// --------------------- 마이페이지 마이사이즈 등록 ------------------------------ //
	@RequestMapping("/myPage/insertMySize.do")
	public String insertMySize(@RequestParam String sort,
							   Top topSize, Pants pantsSize,
							   HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		
		String userId = member.getUserId();
		
		System.out.println(sort);
		System.out.println(topSize);
		System.out.println(pantsSize);
		
		String msg = "실패";
		String loc = "";
		
		if(sort.equals("top")) {
			Top tSize = mypageService.selectTopSize(userId);
			if( tSize == null ) {
				int topResult = mypageService.insertTopSize(userId, topSize);
				if( topResult > 0 ) {
					msg = "상의 사이즈 등록 성공";
				} else {
					msg = "상의 사이즈 등록 실패";
				}
			} else {
				int topResult = mypageService.updateTopSize(userId, topSize);
				if( topResult > 0 ) {
					msg = "상의 사이즈 수정 성공";
				} else {
					msg = "상의 사이즈 수정 실패";
				}
			}
		} else if(sort.equals("pants")) {
			Pants pSize = mypageService.selectPantsSize(userId);
			if( pSize == null ) {
				int pantsResult = mypageService.insertPantsSize(userId, pantsSize);
				if( pantsResult > 0 ) {
					msg = "하의 사이즈 등록 성공";
				} else {
					msg = "하의 사이즈 등록 실패";
				}
			} else {
				int pantsResult = mypageService.updatePantsSize(userId, pantsSize);
				if( pantsResult > 0 ) {
					msg = "하의 사이즈 수정 성공";
				} else {
					msg = "하의 사이즈 수정 실패";
				}
			}
		}
		
		loc = "/myPage/myPageMySize.do";
		
		model.addAttribute("msg", msg)
			 .addAttribute("loc", loc);
		
		return "common/msg";
	}
	
// --------------------- 마이페이지 포인트내역 조회 ------------------------------ //
	@RequestMapping("/myPage/myPageQuestion.do")
	public String myPageQuestion(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
							   HttpServletRequest request, Model model) {
		
		int numPerPage = 5; // 한 페이지 당 게시글 and 페이지 수
		
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		
		String userId = member.getUserId();
		
		List<Map<String, String>> question = mypageService.selectQuestionList(cPage, numPerPage, userId);
		
		int totalContents = mypageService.selectQuestionTotalContents(userId);
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myPageQuestion.do");
		
		String msg = totalContents + "건의 문의내역이 있습니다.";
		
		System.out.println(question);
		
		model.addAttribute("question", question)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar)
			 .addAttribute("msg", msg);
		
		return "user/myPage/myPageQuestion";
	}
	
// --------------------- 마이페이지 배송조회 ------------------------------ //
	@RequestMapping("/myPage/myPageDeliveryChk.do")
	public String myPageDeliveryChk() {
		return "user/myPage/myPageDeliveryChk";
	}
	
// ------------------------ 404 에러 페이지 ----------------------------------------------- //
	@RequestMapping("/error.do")
	public String errorPage(Model model) {
		
		String msg = "미개발구역입니다 ㅜㅜ";
		
		model.addAttribute("msg", msg);
		
		return "user/common/errorPage";
		
	}
	

}








