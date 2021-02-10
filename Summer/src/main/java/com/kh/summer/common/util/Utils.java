package com.kh.summer.common.util;

import java.util.Map;

import org.springframework.stereotype.Controller;

@Controller
public class Utils {
	// 유저화면용 페이징 메소드
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url ){
		String pageBar = "";
		int pageBarSize = 5; // 1, 2, 3, 4, 5 --> 6, 7, 8, 9, 10 // 페이지바 버튼의 수
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1; // 페이지바 시작 번호
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1; // 페이지바 끝 번호
		
		pageBar += "<ul>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li>";
			pageBar += "<span><i class='ion-ios-arrow-back'></i></span>&nbsp;";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li>";
			pageBar += "<a href='javascript:fn_paging("+(pageNo-1)+")'><i class='ion-ios-arrow-back'></i></a>&nbsp;";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<li class='active'>";
				pageBar += "<span style='background: #88c8bc;'>"+pageNo+"</span>&nbsp;";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li>";
				pageBar += "<a href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>&nbsp;";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li>";
			pageBar += "<span><i class='ion-ios-arrow-forward'></i></span>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li>";
			pageBar += "<a href='javascript:fn_paging("+pageNo+")'><i class='ion-ios-arrow-forward'></i></a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}
	
	// 유저용 정렬 페이징 메소드
		public static String getPageBar(int totalContents, int cPage, int numPerPage, String url, String sort){
			String pageBar = "";
			int pageBarSize = 5; // 1, 2, 3, 4, 5 --> 6, 7, 8, 9, 10 // 페이지바 버튼의 수
			cPage = cPage==0?1:cPage;
			
			//총페이지수 구하기
			int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
			
			//1.pageBar작성
			//pageBar순회용변수 
			int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1; // 페이지바 시작 번호
			//종료페이지 번호 세팅
			int pageEnd = pageNo+pageBarSize-1; // 페이지바 끝 번호
			
			pageBar += "<ul>";
			//[이전]section
			if(pageNo == 1 ){
				pageBar += "<li>";
				pageBar += "<span><i class='ion-ios-arrow-back'></i></span>&nbsp;";
				pageBar += "</li>";
			}
			else {
				pageBar += "<li>";
				pageBar += "<a href='javascript:fn_paging("+(pageNo-1)+")'><i class='ion-ios-arrow-back'></i></a>&nbsp;";
				pageBar += "</li>";
			}
			
			// pageNo section
			while(!(pageNo>pageEnd || pageNo > totalPage)){
				if(cPage == pageNo ){
					pageBar += "<li class='active'>";
					pageBar += "<span style='background: #88c8bc;'>"+pageNo+"</span>&nbsp;";
					pageBar += "</li>";
				} 
				else {
					pageBar += "<li>";
					pageBar += "<a href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>&nbsp;";
					pageBar += "</li>";
				}
				pageNo++;
			}
			
			//[다음] section
			if(pageNo > totalPage){
				pageBar += "<li>";
				pageBar += "<span><i class='ion-ios-arrow-forward'></i></span>";
				pageBar += "</li>";
				
			} else {
				pageBar += "<li>";
				pageBar += "<a href='javascript:fn_paging("+pageNo+")'><i class='ion-ios-arrow-forward'></i></a> ";
				pageBar += "</li>";
			}
			
			pageBar += "</ul>";
			
			//2.스크립트 태그 작성
			//fn_paging함수
			pageBar += "<script>";
			pageBar += "function fn_paging(cPage,numPerPage){";
			pageBar += "location.href='"+url+"?cPage='+cPage+'&sort="+sort+"';";
			pageBar += "}";
			pageBar += "</script>";
			
			return pageBar; 
		}
		
		// 유저용 검색 페이징 메소드
		public static String getPageBar(int totalContents, int cPage, int numPerPage, String url, Map<String, String> searchMap){
			String pageBar = "";
			int pageBarSize = 5; // 1, 2, 3, 4, 5 --> 6, 7, 8, 9, 10 // 페이지바 버튼의 수
			cPage = cPage==0?1:cPage;
			
			//총페이지수 구하기
			int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
			
			//1.pageBar작성
			//pageBar순회용변수 
			int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1; // 페이지바 시작 번호
			//종료페이지 번호 세팅
			int pageEnd = pageNo+pageBarSize-1; // 페이지바 끝 번호
			
			pageBar += "<ul>";
			//[이전]section
			if(pageNo == 1 ){
				pageBar += "<li>";
				pageBar += "<span><i class='ion-ios-arrow-back'></i></span>&nbsp;";
				pageBar += "</li>";
			}
			else {
				pageBar += "<li>";
				pageBar += "<a href='javascript:fn_paging("+(pageNo-1)+")'><i class='ion-ios-arrow-back'></i></a>&nbsp;";
				pageBar += "</li>";
			}
			
			// pageNo section
			while(!(pageNo>pageEnd || pageNo > totalPage)){
				if(cPage == pageNo ){
					pageBar += "<li class='active'>";
					pageBar += "<span style='background: #88c8bc;'>"+pageNo+"</span>&nbsp;";
					pageBar += "</li>";
				} 
				else {
					pageBar += "<li>";
					pageBar += "<a href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>&nbsp;";
					pageBar += "</li>";
				}
				pageNo++;
			}
			
			//[다음] section
			if(pageNo > totalPage){
				pageBar += "<li>";
				pageBar += "<span><i class='ion-ios-arrow-forward'></i></span>";
				pageBar += "</li>";
				
			} else {
				pageBar += "<li>";
				pageBar += "<a href='javascript:fn_paging("+pageNo+")'><i class='ion-ios-arrow-forward'></i></a> ";
				pageBar += "</li>";
			}
			
			pageBar += "</ul>";
			
			//2.스크립트 태그 작성
			//fn_paging함수
			pageBar += "<script>";
			pageBar += "function fn_paging(cPage,numPerPage){";
			pageBar += "location.href='"+url+"?cPage='+cPage+'&searchCt="+searchMap.get("searchCt")+"&search="+searchMap.get("search")+"';";
			pageBar += "}";
			pageBar += "</script>";
			
			return pageBar; 
		}
	
	
	// 관리자 페이지 전용 (부트스트랩 2라서 아이콘 적용안됨)
	public static String getAdPageBar(int totalContents, int cPage, int numPerPage, String url ){
		String pageBar = "";
		int pageBarSize = 5; // 1, 2, 3, 4, 5 --> 6, 7, 8, 9, 10 // 페이지바 버튼의 수
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1; // 페이지바 시작 번호
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1; // 페이지바 끝 번호
		
		pageBar += "<ul>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li>";
			pageBar += "<span><i class='icon-chevron-left'></i></span>&nbsp;";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li>";
			pageBar += "<a href='javascript:fn_paging("+(pageNo-1)+")'><i class='icon-chevron-left'></i></a>&nbsp;";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<li class='active'>";
				pageBar += "<span style='background: #88c8bc;'>"+pageNo+"</span>&nbsp;";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li>";
				pageBar += "<a href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>&nbsp;";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li>";
			pageBar += "<span><i class='icon-chevron-right'></i></span>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li>";
			pageBar += "<a href='javascript:fn_paging("+pageNo+")'><i class='icon-chevron-right'></i></a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}
	
	// 정렬을 위한 페이징 메소드
	public static String getAdPageBar(int totalContents, int cPage, int numPerPage, String url, String sort){
		String pageBar = "";
		int pageBarSize = 5; // 1, 2, 3, 4, 5 --> 6, 7, 8, 9, 10 // 페이지바 버튼의 수
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1; // 페이지바 시작 번호
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1; // 페이지바 끝 번호
		
		pageBar += "<ul>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li>";
			pageBar += "<span><i class='icon-chevron-left'></i></span>&nbsp;";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li>";
			pageBar += "<a href='javascript:fn_paging("+(pageNo-1)+")'><i class='icon-chevron-left'></i></a>&nbsp;";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<li class='active'>";
				pageBar += "<span style='background: #88c8bc;'>"+pageNo+"</span>&nbsp;";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li>";
				pageBar += "<a href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>&nbsp;";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li>";
			pageBar += "<span><i class='icon-chevron-right'></i></span>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li>";
			pageBar += "<a href='javascript:fn_paging("+pageNo+")'><i class='icon-chevron-right'></i></a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage+'&sort="+sort+"';";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}
	
	// 검색을 위한 페이징 메소드
	public static String getAdPageBar(int totalContents, int cPage, int numPerPage, String url, Map<String, String> searchMap){
		String pageBar = "";
		int pageBarSize = 5; // 1, 2, 3, 4, 5 --> 6, 7, 8, 9, 10 // 페이지바 버튼의 수
		cPage = cPage==0?1:cPage;
		
		//총페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1; // 페이지바 시작 번호
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1; // 페이지바 끝 번호
		
		pageBar += "<ul>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li>";
			pageBar += "<span><i class='icon-chevron-left'></i></span>&nbsp;";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li>";
			pageBar += "<a href='javascript:fn_paging("+(pageNo-1)+")'><i class='icon-chevron-left'></i></a>&nbsp;";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){
				pageBar += "<li class='active'>";
				pageBar += "<span style='background: #88c8bc;'>"+pageNo+"</span>&nbsp;";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li>";
				pageBar += "<a href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>&nbsp;";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li>";
			pageBar += "<span><i class='icon-chevron-right'></i></span>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li>";
			pageBar += "<a href='javascript:fn_paging("+pageNo+")'><i class='icon-chevron-right'></i></a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage+'&searchCt="+searchMap.get("searchCt")+"&search="+searchMap.get("search")+"';";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}
	
	
}