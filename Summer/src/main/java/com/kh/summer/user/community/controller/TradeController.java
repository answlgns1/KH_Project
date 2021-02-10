package com.kh.summer.user.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.summer.common.util.Utils;
import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;
import com.kh.summer.user.community.model.service.TradeService;

@Controller
public class TradeController {
	
	@Autowired
	TradeService tradeService;
	
	@RequestMapping("/community/selectTradeList.do")
	public String selectTradeList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model,
								  @RequestParam(value="search", required=false) String[] search) {
		
		//System.out.println(search);
		if(search != null) {
			System.out.println(search[0]);
			System.out.println(search[1]);
		}
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수 
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = tradeService.selectTradeList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = tradeService.selectTradeTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardList.do");
		
		System.out.println("list : " + list);
		
		model.addAttribute("list", list)
			.addAttribute("totalContents", totalContents)
			.addAttribute("numPerPage", numPerPage)
			.addAttribute("pageBar", pageBar);
		
		return "user/community/tradeList";
	}
	
	@RequestMapping("/community/selectTradeDetail.do")
	public String selectTradeDetail(@RequestParam int no, Model model) {
		
		Map<String, String> trade = tradeService.selectOneTrade(no);
		List<Map<String, String>> attachmentList = tradeService.selectAttachmentList(no);
		List<Map<String, String>> commentList = tradeService.selectBoardCommentList(no);
		
		model.addAttribute("trade", trade)
			 .addAttribute("attachmentList", attachmentList)
			 .addAttribute("commentList", commentList);
		
		return "user/community/tradeDetail";
	}
	
	@RequestMapping("/community/insertTradeView.do")
	public String insertTradeView() {
		
		return "user/community/insertTradeView";
	}
	
	@RequestMapping("/community/insertTradeEnd.do")
	public String insertTrade(Board board, Model model, HttpServletRequest req,
			@RequestParam(value="imageFile", required=false) MultipartFile[] imageFiles) {
		
		// 1. 파일 저장 경로와 파일 정보를 담을 객체 생성
		String filePath = "/resources/user/boardUpload";
		String saveDirectory = req.getServletContext().getRealPath(filePath);
		List<Attachment> attachList = new ArrayList<>();
		
		/*** MultipartFile 로 파일 업로드 처리하기 ***/
		if(imageFiles != null) {
			for(MultipartFile f : imageFiles) {
				if( f.isEmpty() == false ) {
					// 파일이 비어있지 않다면 --> 첨부파일을 추가했다면
					
					// 2. 파일명 재생성
					String originName = f.getOriginalFilename();
					String changeName = fileNameChanger(originName);
					
					try {
						f.transferTo(new File(saveDirectory + "/" + changeName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					// 3. list에 담기
					Attachment at = new Attachment();
					at.setOldFileName(originName);
					at.setNewFileName(changeName);
					at.setFilePath(filePath + "/");
					
					attachList.add(at);
				}
			}
		} 
		/**************************************/
		
		// 4. 비즈니스(서비스) 로직 수행
		
		int result = tradeService.insertTrade(board, attachList);
		
		// 5. 처리 결과에 따른 view 처리
		String loc = "/community/selectTradeList.do";
		String msg ="";
		
		if( result > 0 ) {
			msg = "게시글 등록 성공";
		} else {
			msg = "게시글 등록 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	// 단순 파일 이름 변경용 메소드
		public String fileNameChanger(String oldFileName) {
			// 확장자 추출
			String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmSSS");
			int rnd = (int)(Math.random() * 1000); // 0 ~ 999
			
			return sdf.format(new Date(System.currentTimeMillis())) + "-" + rnd + "." + ext;
		}
}
