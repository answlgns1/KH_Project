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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.summer.common.util.Utils;
import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;
import com.kh.summer.user.community.model.service.FreeService;

@Controller
public class FreeController {
	
	@Autowired
	FreeService freeService;
	
	@RequestMapping("/community/selectFreeList.do")
	public String selectFreeList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model,
								 @RequestParam(value="search", required=false) String[] search) {
		System.out.println(search);
		if(search != null) {
			System.out.println(search[0]);
			System.out.println(search[1]);
		}
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수 
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = freeService.selectBoardList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = freeService.selectBoardTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "selectFreeList.do");
		
		model.addAttribute("list", list)
//			.addAttribute("totalContents", totalContents)
//			.addAttribute("numPerPage", numPerPage)
			.addAttribute("pageBar", pageBar);
		
		return "user/community/freeList";
	}
	
	@RequestMapping("/community/selectFreeDetail.do")
	public String selectFreeDetail(@RequestParam int no, Model model) {
		
		Map<String, String> board = freeService.selectOneBoard(no);
		List<Map<String, String>> attachmentList = freeService.selectAttachmentList(no);
		List<Map<String, String>> commentList = freeService.selectBoardCommentList(no);
		
		model.addAttribute("board", board)
			 .addAttribute("attachmentList", attachmentList)
			 .addAttribute("commentList", commentList);
		
		return "user/community/freeDetail";
	}
	
	@RequestMapping("/community/insertFreeView.do")
	public String insertFreeView() {
		
		return "user/community/insertFreeView";
	}
	
	@RequestMapping("/community/insertFreeEnd.do")
	public String insertBoard(Board board, Model model, HttpServletRequest req,
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
		
		int result = freeService.insertBoard(board, attachList);
		
		// 5. 처리 결과에 따른 view 처리
		String loc = "/community/selectFreeList.do";
		String msg ="";
		
		if( result > 0 ) {
			msg = "게시글 등록 성공";
		} else {
			msg = "게시글 등록 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/community/updateFreeView.do")
	public String updateFreeView(@RequestParam int bNo, Model model) {

		Map<String, String> board = freeService.updateView(bNo); 
		List<Map<String, String>> attachmentList = freeService.selectAttachmentList(bNo);
		
		model.addAttribute("board", board)
			 .addAttribute("attachmentList", attachmentList);
		
		return "user/community/updateFreeView";
	}
	
	@RequestMapping("/community/updateFreeEnd.do")
	public String boardUpdate(@RequestParam int bNo, @RequestParam String bTitle, @RequestParam String bContents,
							@RequestParam(value="imageFile", required=false) MultipartFile[] imageFiles,
							HttpServletRequest req, Model model) {
		
		// 원본 게시글 불러와 수정하기
		Map<String, String> originBoard = freeService.updateView(bNo);
		
		originBoard.put("BTITLE", bTitle);
		originBoard.put("BCONTENTS", bContents);

		// 1. 파일 저장 경로 선언
		String filePath = "/resources/user/boardUpload";
		String saveDirectory = req.getServletContext().getRealPath(filePath);
		
		List<Map<String, String>> attachList = new ArrayList<Map<String, String>>();
		
		// 2. 추가한 파일 등록
		for(MultipartFile f : imageFiles) {
			Map<String, String> attachment = null;
				
			if( f.isEmpty() == false ) {
				
				attachment = new HashMap<String, String>();

				// 파일 이름 변경하기
				String originName = f.getOriginalFilename(); // 이때 파일을 가져옴(임시공간에 저장)
				String changeName = fileNameChanger(originName);
				
				attachment.put("BNO", String.valueOf(bNo));
				attachment.put("OLDFILENAME", originName);
				attachment.put("NEWFILENAME", changeName);
				attachment.put("FILEPATH", filePath + "/");
				attachList.add(attachment);

				// 실제 파일 저장
				try {
					f.transferTo(new File(saveDirectory + "/" + changeName)); // 가져온 파일을 지정한 경로와 이름으로 바꿔 저장, 기존의 파일은 삭제
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
			}
		}
		
		// 3. update 서비스 실행
		int result = freeService.updateBoard(originBoard, attachList);
		//int result = 1;
		String loc = "/community/selectFreeDetail.do?no="+bNo;
		String msg = "";
		
		if( result > 0 ) {
			msg = "게시글 수정 성공!";
		} else {
			msg = "게시글 수정 실패!";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/community/deleteFree.do")
	public String boardDelete(@RequestParam int bNo, HttpServletRequest req, Model model) {
		
		// 1. 파일이 저장된 폴더 경로
		String saveDir = req.getServletContext().getRealPath("/resources/user/boardUpload");
		
		// 첨부파일 삭제 명단
		List<Map<String, String>> delList = freeService.selectAttachmentList(bNo);
		
		// 2. DB 정보 삭제하기
		int result = freeService.deleteBoard(bNo);
		
		String loc = "/community/selectFreeList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "게시글 삭제 완료!";
			
			// 3. 실제 파일 삭제
			for(Map<String, String> a : delList) {
				new File(saveDir + "/" + a.get("NEWFILENAME")).delete();
			}
			
		} else {
			msg = "게시글 삭제 실패!";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/community/deleteFreeFile.do")
	@ResponseBody
	public boolean fileDelete(@RequestParam int aNo,
							  @RequestParam String newFileName,
							  HttpServletRequest req) {
		
		String saveDir = req.getServletContext().getRealPath("/resources/user/boardUpload");
		
		boolean check = freeService.deleteFile(aNo) != 0 ? true : false;
		
		if(check == true) {
			new File(saveDir + "/" + newFileName).delete();
		}
		
		return check;
	}
	
	@RequestMapping("/community/insertFreeComment.do")
	public String insertComment(@RequestParam String userId, @RequestParam int bNo, @RequestParam String cContents, Model model) {
		
		Map<String, String> comment = new HashMap<String, String>();
		
		comment.put("USERID", userId);
		comment.put("BNO", String.valueOf(bNo));
		comment.put("CCONTENTS", cContents);
		
		int result = freeService.insertComment(comment);
		
		// 5. 처리 결과에 따른 view 처리
		String loc = "/community/selectFreeDetail.do?no="+bNo;
		String msg ="";
		
		if( result > 0 ) {
			msg = "댓글 등록 성공";
		} else {
			msg = "댓글 등록 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/community/deleteFreeComment.do")
	public String deleteComment(@RequestParam int bNo, @RequestParam int bcNo, Model model) {
		
		int result = freeService.deleteComment(bcNo);
		
		// 5. 처리 결과에 따른 view 처리
		String loc = "/community/selectFreeDetail.do?no="+bNo;
		String msg ="";
		
		if( result > 0 ) {
			msg = "댓글 삭제 성공";
		} else {
			msg = "댓글 삭제 실패!";
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
