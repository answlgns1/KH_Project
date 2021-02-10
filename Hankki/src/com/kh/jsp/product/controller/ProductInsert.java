package com.kh.jsp.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.jsp.attachment.model.vo.Attachment;
import com.kh.jsp.product.model.service.ProductService;
import com.kh.jsp.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/insert.pd")
public class ProductInsert extends HttpServlet {
	private static final long serialVersionUID = 11L;
       
    public ProductInsert() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024 * 1024 * 10; // 10MB
		
		// 2. 멀티파트 전달 확인
		if(! ServletFileUpload.isMultipartContent(request) ) {
			// 에러 페이지
			
			System.out.println("멀티파트 전송 실패임");
			request.getRequestDispatcher("views/admin/Product/product_manage.jsp")
				   .forward(request, response);
		}
		
		// 3. 받아온 파일을 저장할 경로 설정하기
		String root = request.getServletContext().getRealPath("/");
		String savePath = root + "resources/ProductFiles";
		
		
		// 4. 위에서 설정한 정보를 바탕으로 MultipartRequest 생성하기
		/**
		 * @param request / 속성 변경을 위한 원본 객체
		 * @param savePath / 파일 저장 경로
		 * @param maxSize / 저장 가능한 파일 최대크기
		 * @param encoding / ex) "UTF-8"
		 * @param FileRenamePolicy / 원본파일 이름을 서버에서
		 * 							  관리하기 편한 이름으로 바꾸는 정책
		 */
		MultipartRequest mre = new MultipartRequest(request, savePath,
												    maxSize, "UTF-8",
												    new DefaultFileRenamePolicy());
		// ** DefaultFileRenamePolicy 는
		//    만약 폴더에 이미 있는 파일의 이름이 또 들어 올 경우
		//    해당 이름을 바꿔주는 정책
		// ex) 새 폴더 --> 새 폴더1 --> 새 폴더 2 . . .
		
		// ---------------- 설정 끝~! ----------------//
		
		// 다중 파일 업로드 처리하기
		// 원본 파일 명과 변경된 파일 명 담기
		ArrayList<String> originNames = new ArrayList<>();
		ArrayList<String> changeNames = new ArrayList<>();
		
		// 화면에서 전달한 파일 이름 가져오기
		Enumeration<String> files = mre.getFileNames();
		
		while(files.hasMoreElements()) {
			// 가져온 파일 하나씩 꺼내옴
			String tagName = files.nextElement();
			
			originNames.add(mre.getOriginalFileName(tagName));
			changeNames.add(mre.getFilesystemName(tagName));
		
			/*
			System.out.println("tageName : " + tagName);
			System.out.println(originNames);
			System.out.println(changeNames);
			*/
		}
		
		
		// 5-1. 파일이 아닌 기본 전송값 처리
		Product pd = new Product();
		
		pd.setP_type(mre.getParameter("pType"));
		pd.setP_name(mre.getParameter("pName"));
		pd.setP_price(Integer.parseInt(mre.getParameter("pPrice")));
		pd.setP_amount(Integer.parseInt(mre.getParameter("pAmount")));
		pd.setP_weight(mre.getParameter("pWeight"));
		pd.setP_explain(mre.getParameter("pExplain"));
		
		
		// 5-2. 파일 저장 및 정보 처리하기
		//      JSP로부터 전달받은 파일을 먼저 저장하고
		//      해당 파일의 이름을 따온다.
		
		ArrayList<Attachment> list = new ArrayList<>();
		// 리스트에 파일 목록을 하나씩 저장
		for(int i = originNames.size()-1; i >= 0; i--) {
			// 기존에 역순으로 가져온 파일들을 올바른 순서로 재정렬하는 반복문
			Attachment at = new Attachment();
			
			at.setF_filepath(savePath);
			at.setF_name(originNames.get(i));
			at.setF_change_name(changeNames.get(i));
			
			list.add(at);
		}
		
		// 6. 전달받은 값을 서비스로 넘기기
		ProductService ps = new ProductService();
		int result = ps.insertProduct(pd, list);
		
		if( result > 0 ) {
			response.sendRedirect("user_Manage.ad");
		} else {
			request.setAttribute("error-msg", "광고 등록 실패!");
			
			request.getRequestDispatcher("views/admin/Product/product_manage.jsp")
				   .forward(request, response);			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
