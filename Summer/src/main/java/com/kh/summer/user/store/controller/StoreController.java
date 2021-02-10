package com.kh.summer.user.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.summer.common.util.Utils;
import com.kh.summer.user.ioinfo.model.service.IoInfoService;
import com.kh.summer.user.member.model.service.MemberService;
import com.kh.summer.user.member.model.vo.Member;
import com.kh.summer.user.orderinfo.model.service.OrderInfoService;
import com.kh.summer.user.orderinfo.model.vo.OrderInfo;
import com.kh.summer.user.store.model.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	OrderInfoService orderinfoService;
	
	@Autowired
	IoInfoService ioinfoServe;
	
	@RequestMapping("/store/selectStoreMain.do")
	public String selectStoreMain(Model model) {
		List<Map<String, String>> list = storeService.selectStoreMainList();
		
		System.out.println("list : " + list);
		
		model.addAttribute("list", list);
		
		return "user/store/storeMain";
	}
	
	@RequestMapping("/store/selectStoreTop.do")
	public String selectStoreTop(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, 
			@RequestParam(required=false) String sortVal, Model model) {
		
		int numPerPage = 8; // 한 페이지 당 게시글 and 페이지 수 
		
		// 1. 현재 페이지 게시글 구하기
		String sort = sortVal;
		
		List<Map<String, String>> list = storeService.selectStoreTopList(cPage, numPerPage, sort);
		
		System.out.println("list : " + list);
		 
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = storeService.selectStoreTopTotalContents();
		
		System.out.println("totalContents : " + totalContents);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "selectStoreTop.do");
		
		model.addAttribute("list", list)
        .addAttribute("totalContents", totalContents)
        .addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		
		return "user/store/topStore";	
	}
	
	@RequestMapping("/store/selectStorePants.do")
	public String selectStorePants(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, 
			@RequestParam(required=false) String sortVal, Model model) {
		
		int numPerPage = 8; // 한 페이지 당 게시글 and 페이지 수 
		
		// 1. 현재 페이지 게시글 구하기
		String sort = sortVal;
		
		List<Map<String, String>> list = storeService.selectStorePantsList(cPage, numPerPage, sort);
		
		System.out.println("list : " + list);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = storeService.selectStorePantsTotalContents();
		
		System.out.println("totalContents : " + totalContents);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "selectStorePants.do");
		
		model.addAttribute("list", list)
        .addAttribute("totalContents", totalContents)
        .addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		
		return "user/store/pantsStore";	
	}
	
	@RequestMapping("/store/selectStoreOuter.do")
	public String selectStoreOuter(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, 
			@RequestParam(required=false) String sortVal, Model model) {
		
		int numPerPage = 8; // 한 페이지 당 게시글 and 페이지 수 
		
		// 1. 현재 페이지 게시글 구하기
		String sort = sortVal;
		
		List<Map<String, String>> list = storeService.selectStoreOuterList(cPage, numPerPage, sort);
		
		System.out.println("list : " + list);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = storeService.selectStoreOuterTotalContents();
		
		System.out.println("totalContents : " + totalContents);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "selectStoreOuter.do");
		
		model.addAttribute("list", list)
        .addAttribute("totalContents", totalContents)
        .addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		
		return "user/store/outerStore";	
	}
	
	@RequestMapping("/store/storeDetail.do")
	public String storeDetail(@RequestParam int no, Model model, @RequestParam String Id) {
		
		Map<String, String> store = storeService.selectOneStore(no);
		List<Map<String, String>> attachmentList = storeService.selectAttachmentList(no);
		List<Map<String, String>> commentList = storeService.selectStoreCommentList(no);

		List<Map<String, String>> size = storeService.selectSize(no);
		
		Map<String, Object> mySize = storeService.selectMySize(Id);
		
		System.out.println(mySize);
		
		model.addAttribute("store", store)
			 .addAttribute("attachmentList", attachmentList)
			 .addAttribute("commentList", commentList)
			 .addAttribute("size", size)
			 .addAttribute("mySize", mySize);
		
		System.out.println("model : " + model);
		
		return "user/store/storeDetail";	
	}
	
	@RequestMapping("/store/selectBuyStore.do")
	public String selectBuyStore(@RequestParam int no, Model model,
								 @RequestParam(required=false) int sAmount,
								 @RequestParam(required=false) int mAmount,
								 @RequestParam(required=false) int lAmount ) {
		Map<String, String> store = storeService.selectOneStore(no);
		List<Map<String, String>> attachmentList = storeService.selectAttachmentList(no);
		
		
		model.addAttribute("store", store)
			 .addAttribute("attachmentList", attachmentList)
			 .addAttribute("sAmount", sAmount)
			 .addAttribute("mAmount", mAmount)
			 .addAttribute("lAmount", lAmount);
		
		return "user/store/selectBuyStore";	
	}
	@RequestMapping("/store/updateLike.do")
	@ResponseBody
	public boolean updateLike(@RequestParam int no, @RequestParam String userId) {
		
		Map<String, String> like = new HashMap<String, String>();
		
		like.put("no", String.valueOf(no));
		like.put("userId", userId);
		
		boolean check = storeService.updateLike(like) == 0 ? false : true;
		
		return check;
	}
	
	@RequestMapping("/store/successBuyStore.do")
	public String successBuyStore(OrderInfo orderInfo, Model model
								,@RequestParam String userId) {
								//,@RequestParam String pCode) {
								//,@RequestParam String pPrice
								//,@RequestParam String Amount) {
		
		Map<String, String> ioinfo  = new HashMap<String, String>();
		
		ioinfo.put("userId", userId);
		//ioinfo.put("pCode", pCode);
		//ioinfo.put("pPrice", pPrice);
		//ioinfo.put("Amount", Amount);
		
		System.out.println("ioinfo : " + ioinfo);
		
		int result = orderinfoService.insertOrderInfo(orderInfo);
		
		//int io = ioinfoServe.insertIoInfo(ioinfo);	
		
		System.out.println("result : " + result);
		
		System.out.println("orderInfo: " + orderInfo);
		
		if( result > 0 ) {
			System.out.println("주문내역 추가 성공"); 
		} else {
			System.out.println("주문내역 추가 실패");
		}
		
		return "user/store/successBuyStore";
	}
	
	@RequestMapping("/store/selectSmallSize.do")
	@ResponseBody
	public boolean selectSmallSize(@RequestParam String storeSize, @RequestParam String pCode){
		
		Map<String, String> size = new HashMap<String, String>();
		
		size.put("storeSize", storeSize);
		size.put("pCode", pCode);
		
		boolean check = storeService.selectSmallSize(size) == 0 ? false : true;
		
		return check;
	}
	
	@RequestMapping("/store/insertStoreComment.do")
	public String insertStoreComment(@RequestParam String userId, @RequestParam int bNo, @RequestParam String cContents, Model model) {
		
		Map<String, String> comment = new HashMap<String, String>();
		
		comment.put("USERID", userId);
		comment.put("BNO", String.valueOf(bNo));
		comment.put("CCONTENTS", cContents);
		
		int result = storeService.insertStoreComment(comment);
		
		// 5. 처리 결과에 따른 view 처리			
		String loc = "/store/storeDetail.do?no="+bNo+"&Id="+userId;
		String msg ="";
								
		if( result > 0 ) {				
			msg = "댓글 등록 성공";				
		} else {				
			msg = "댓글 등록 실패!";				
		}
								
		model.addAttribute("loc", loc).addAttribute("msg", msg);
					
		return "common/msg";
	}
	
	@RequestMapping("/store/deleteStoreComment.do")
	public String deleteComment(@RequestParam int bNo, @RequestParam int bcNo, HttpServletRequest request, Model model) {
		System.out.println("1");
		int result = storeService.deleteStoreComment(bcNo);
		System.out.println("2");
		
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("member");
		
		String userId = member.getUserId();
		
		// 5. 처리 결과에 따른 view 처리
		String loc = "/store/storeDetail.do?no="+bNo+"&Id="+userId;
		String msg ="";
		System.out.println("3");
		if( result > 0 ) {
			msg = "댓글 삭제 성공";
		} else {
			msg = "댓글 삭제 실패!";
		}
		System.out.println("4");
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		System.out.println("5");
		return "common/msg";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}












