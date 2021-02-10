package com.kh.summer.user.lookbook.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.kh.summer.user.lookbook.model.service.LookbookService;

@Controller
public class LookbookController {
	
	@Autowired
	LookbookService lookbookService;
	
// -------------------- 룩북 목록 조회 ----------------- //
	@RequestMapping("/lookbook/selectLookbookList.do")
	public String selectLookbookMain(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
									 @RequestParam(required=false) String sort,
									 Model model) {
		int numPerPage = 8; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = lookbookService.selectLookbookList(cPage, numPerPage, sort);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = lookbookService.selectLookbookTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "selectLookbookList.do", sort);
		
		String msg = totalContents + "건의 게시글이 있습니다.";
		
		model.addAttribute("list", list)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar)
			 .addAttribute("msg", msg);
		
		System.out.println(list);
		
		return "user/lookbook/lookbookList";
	}
	
// -------------------- 룩북 검색 조회 ----------------- //
	@RequestMapping("/lookbook/selectLookbookSearch.do")
	public String selectLookbookSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
									   @RequestParam String searchCt, @RequestParam String search, Model model) {

		int numPerPage = 8; // 한 페이지 당 게시글 and 페이지 수
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchCt", searchCt);
		searchMap.put("search", search);
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = lookbookService.selectLookbookSearch(cPage, numPerPage, searchMap);
		
		// 2. 검색된 게시글 수 (페이지 처리를 위함)
		int totalContents = lookbookService.selectLookbookSearchCount(searchMap);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "selectLookbookSearch.do", searchMap);
		
		String msg = "검색 결과 : " + totalContents + " 건의 게시글이 있습니다.";
		
		model.addAttribute("list", list)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar)
			 .addAttribute("msg", msg);
		
		
		return "user/lookbook/lookbookList";
	}
	
// -------------------- 룩북 상세 조회 ----------------- //
	@RequestMapping("/lookbook/selectLookbookDetail.do")
	public String selectLookbookDetail(HttpServletRequest request, HttpServletResponse response,
									   @RequestParam int bno, Model model) {
		// 게시글 한 개 조회
		Map<String, String> list = lookbookService.selectLookbookDetail(bno);
		
		// 조회한 게시글에 대한 첨부파일 조회
		List<Map<String, String>> attach = lookbookService.selectAttachmentList(bno);
		
		// 댓글정보 조회
		List<Map<String, String>> commentList = lookbookService.selectLookbookCommentList(bno);
		
		
		//----------------- 쿠키를 사용한 조회수 증가 중복방지 시작 --------------------//
		Cookie[] cookies = request.getCookies();
		
		// 비교하기 위해 새로운 쿠키 생성
		Cookie viewCookie = null;
		
		// 쿠키가 있을 경우
		if ( cookies != null && cookies.length > 0 ) {
			for ( int i = 0; i < cookies.length; i++ ) {
				// Cookie의 name이 cookie + bno와 일치하는 쿠키를 viewCookie에 넣어줌 
                if (cookies[i].getName().equals("cookie" + bno)) {
                    viewCookie = cookies[i];
                }
			}
		}
		
		if (list != null) {
            // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
            if (viewCookie == null) {
                // 쿠키 생성(이름, 값)
                Cookie newCookie = new Cookie("cookie" + bno, "|" + bno + "|");
                                
                // 쿠키 추가
                response.addCookie(newCookie);
 
                // 쿠키를 추가 시키고 조회수 증가시킴
                int result = lookbookService.viewUp(bno);
                
                if( result > 0 ) {
                    System.out.println("cookie 없음 : 조회수 증가");
                }else {
                    System.out.println("조회수 증가 에러");
                }
            } else {	// viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
                System.out.println("cookie 있음 : 조회수 증가 X");
                
                // 쿠키 값 받아옴.
                String value = viewCookie.getValue();
                
                System.out.println("cookie 값 : " + value);
            }
		}
		
        //----------------- 쿠키를 사용한 조회수 증가 중복방지 끝 --------------------//
		
		model.addAttribute("list", list)
			 .addAttribute("attach", attach)
			 .addAttribute("commentList", commentList);
		
		return "user/lookbook/lookbookDetail";
	}
	
// -------------------- 댓글 등록 ----------------- //
	@RequestMapping("/lookbook/insertLookbookComment.do")
	public String insertLookbookComment(@RequestParam String userId, @RequestParam String cContents,
										@RequestParam int bno, Model model) {
		
		Map<String, String> comment = new HashMap<String, String>();
		
		comment.put("USERID", userId);
		comment.put("BNO", String.valueOf(bno));
		comment.put("CCONTENTS", cContents);
		
		
		
		int result = lookbookService.insertLookbookComment(comment);
		
		String loc = "/lookbook/selectLookbookDetail.do?bno="+bno;
		String msg = "";
		
		if( result > 0 ) {
			msg = "댓글 등록 성공";
		} else {
			msg = "댓글 등록 실패!";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
// -------------------- 댓글 수정 ----------------- //
	@RequestMapping("/lookbook/updateLookbookComment.do")
	public String updateLookbookComment(@RequestParam int bno, @RequestParam int bcno,
										@RequestParam String updateCContents, Model model) {
		
		Map<String, String> uc = new HashMap<>();
		
		uc.put("BCNO", String.valueOf(bcno));
		uc.put("CCONTENTS", updateCContents);
		
		int result = lookbookService.updateLookbookComment(uc);
		
		String loc = "/lookbook/selectLookbookDetail.do?bno="+bno;
		String msg = "";
		
		if( result > 0 ) {
			msg = "댓글 수정 성공";
		} else {
			msg = "댓글 수정 실패!";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
		
// -------------------- 댓글 삭제  ----------------- //
	@RequestMapping("/lookbook/deleteLookbookComment.do")
	public String deleteLookbookComment(@RequestParam int bno, @RequestParam int bcNo, Model model) {
		
		int result = lookbookService.deleteLookbookComment(bcNo);
		
		String loc = "/lookbook/selectLookbookDetail.do?bno="+bno;
		String msg = "";
		
		if( result > 0 ) {
			msg = "댓글 삭제 성공";
		} else {
			msg = "댓글 삭제 실패!";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
// -------------------- 룩북 등록 페이지 ----------------- //
	@RequestMapping("/lookbook/LookbookInsert.do")
	public String LookbookInsert() {
		return "user/lookbook/lookbookInsert";
	}
	
	
// -------------------- 룩북 등록 완료 ----------------- //
	@RequestMapping("/lookbook/LookbookInsertEnd.do")
	public String LookbookInsertEnd(HttpServletRequest req, Board board, Model model,
									@RequestParam(value="imageFile", required=false) MultipartFile[] imdageFiles) {
		
		System.out.println(board);
		int findex = 0;
		
		// 1. 파일 저장경로와 파일 정보를 담을 객체 생성
		String saveDirectory
			= req.getServletContext().getRealPath("/resources/user/images/lookbook");
		List<Attachment> attachList = new ArrayList<Attachment>();
		
		/*** MultipartFile 로 파일 업로드 처리하기 ***/
		for( MultipartFile f : imdageFiles ) {
			if( f.isEmpty() == false ) { // 파일이 비어있지 않다면
				
				// 2. 파일명 재생성
				String oldFileName = f.getOriginalFilename();
				String newFileName = fileNameChanger(oldFileName);
				
				try {
					f.transferTo(new File(saveDirectory + "/" + newFileName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				// 4. list에 담기
				Attachment at = new Attachment();
				at.setOldFileName(oldFileName);
				at.setNewFileName(newFileName);
				at.setFilePath("/resources/user/images/lookbook/");
				at.setFIndex(findex);
				
				attachList.add(at);
				
				findex++;
				
			}
			
		}
		/***************************************/
		
		// 4. 비즈니스(서비스) 로직 수행
		int result = lookbookService.insertLookbook(board, attachList);
		
		// 5. 처리 결과에 따른 view 처리
		String loc = "/lookbook/selectLookbookList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "룩북 등록 성공!";
		} else {
			msg = "룩북 등록 실패!";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
				
		return "common/msg";
	}

// -------------------- 룩북 수정 페이지 ----------------- //
	@RequestMapping("/lookbook/LookbookUpdate.do")
	public String LookbookUpdate(@RequestParam int bno, Model model) {
		
		// 게시글 정보 조회
		Map<String, String> list = lookbookService.selectLookbookDetail(bno);
		
		// 해당 게시글의 첨부파일 정보 조회
		List<Map<String, String>> attach = lookbookService.selectAttachmentList(bno);
		
		model.addAttribute("list", list)
			 .addAttribute("attach", attach);
		System.out.println(list);
		System.out.println(attach);
		
		return "user/lookbook/lookbookUpdate";
	}
	
// -------------------- 룩북 수정 완료 ----------------- //
	@RequestMapping("/lookbook/LookbookUpdateEnd.do")
	public String LookbookUpdateEnd(Board board, @RequestParam(value="imageFile", required=false) MultipartFile[] imageFiles,
									HttpServletRequest req, Model model) {
		
		int bNo = board.getBNo();
		
		// 원본 게시글 불러와 수정하기
		Board originBoard = lookbookService.updateView(bNo);
		
		originBoard.setBTitle(board.getBTitle());
		originBoard.setBContents(board.getBContents());
		
		// 1. 파일 저장 경로 선언
		String saveDirectory
			= req.getServletContext().getRealPath("/resources/user/images/lookbook");
		
		// 원본 첨부파일 목록
		List<Attachment> attachList = lookbookService.AttachmentList(bNo);
		if( attachList == null ) attachList = new ArrayList<Attachment>();
		
		// 2. 변경한 파일 정보 업로드 시작!
		int idx = 0;
		for( MultipartFile f : imageFiles ) {
			Attachment at = null;
			
			if( f.isEmpty() == false ) { // 원본 파일이 있다면..
				// 원본 파일 삭제
				if( attachList.size() > idx ) { // 원본이 1개 이상이라면..
					boolean fileDelete 
						= new File(saveDirectory + "/" + attachList.get(idx).getNewFileName()).delete();
					
					System.out.println("파일 삭제 여부 확인 : " + fileDelete);
					
					at = attachList.get(idx);
				} else {  // 원본이 없다면..
					// attachment의 공간이 없으므로 add(추가) 해야함
					at = new Attachment();
					at.setBNo(bNo);
					
					attachList.add(at);
				}
				
				// 파일 이름 변경하기
				String originName = f.getOriginalFilename();
				String changeName = fileNameChanger(originName);
				
				// 실제 파일 저장
				try {
					f.transferTo(new File(saveDirectory + "/" + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				at.setOldFileName(originName);
				at.setNewFileName(changeName);
				at.setFilePath("/resources/user/images/lookbook/");
				at.setFIndex(idx);
				
				attachList.set(idx, at);
				
			}
			idx++;
		}
		
		System.out.println("[controller] image : " + attachList);
		// 3. update 서비스 실행
		int result = lookbookService.updateLookbook(originBoard, attachList);
		String loc = "/lookbook/selectLookbookList.do";
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
	
// -------------------- 룩북 삭제 ----------------- //
	@RequestMapping("/lookbook/deleteLookbook.do")
	public String boardDelete(@RequestParam int bno, HttpServletRequest req, Model model) {

		int result = lookbookService.deleteLookbook(bno);
		
		String loc = "/lookbook/selectLookbookList.do";
		String msg = "";
		
		
		if( result > 0 ) {
			msg = "게시글 삭제 완료!";
		} else {
			msg = "게시글 삭제 실패!";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
// ------------------- 첨부파일 삭제 ---------------- //
	@RequestMapping("/lookbook/fileDelete.do")
	@ResponseBody
	public boolean fileDelete(@RequestParam int aNo,
							  @RequestParam String fName,
							  HttpServletRequest req) {
		
		String saveDir
			= req.getServletContext().getRealPath("/resources/user/images/lookbook");
		
		boolean check = lookbookService.deleteFile(aNo) != 0 ? true : false;
		
		if( check == true ) {
			new File(saveDir + "/" + fName).delete();
		}
		
		return check;
	}
	
	// ------------------- 첨부파일 이름 설정하는 메소드 ---------------- //
	public String fileNameChanger(String oldFileName) {
		// 확장자 추출
		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int)(Math.random() * 1000);
		
		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
		
	}
	
}
