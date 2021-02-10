package com.kh.summer.admin.product.controller;

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

import com.kh.summer.admin.product.model.service.adminProductService;
import com.kh.summer.common.util.Utils;
import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.pants.model.vo.Pants;
import com.kh.summer.user.product.model.vo.Product;
import com.kh.summer.user.top.model.vo.Top;

@Controller
public class adminProductController {
	
	@Autowired
	private adminProductService adminproductService;
	
	//------------------------------ 상품목록 조회 -------------------------//
	@RequestMapping("/admin/selectProductList.do")
	public String selectProductList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
									@RequestParam(required=false) String sort, Model model){
		
		int numPerPage = 5; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, Object>> products = adminproductService.selectProductList(cPage, numPerPage, sort);
		
		int totalContents = adminproductService.selectProductTotalContents(sort);
		
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectProductList.do", sort);
		
		model.addAttribute("products", products)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		return "admin/product/productList";
	}
	
	//------------------------------ 상품 검색 조회 -------------------------//
	@RequestMapping("/admin/selectProductSearch.do")
	public String selectProductSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			   						 @RequestParam String searchCt, @RequestParam String search, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchCt", searchCt);
		searchMap.put("search", search);
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, Object>> products = adminproductService.selectProductSearch(cPage, numPerPage, searchMap);
		
		// 2. 검색된 게시글 수 (페이지 처리를 위함)
		int totalContents = adminproductService.selectProductSearchCount(searchMap);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectProductSearch.do", searchMap);
		
		model.addAttribute("products", products)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		
		return "admin/product/productList";
	}
	
	//------------------------------ 상품 상세 조회 -------------------------//
	@RequestMapping("/admin/selectProductDetail.do")
	public String selectProductDetail(@RequestParam String pcode, Model model) {
		
		Map<String, String> product = adminproductService.selectProductDetail(pcode);
		
		List<Map<String, String>> attachment = adminproductService.selectProductImg(pcode);
		
		model.addAttribute("product", product)
			 .addAttribute("attachment", attachment);
		
		return "admin/product/productDetail";
	}
	
	//------------------------------ 상품 수정 페이지 -------------------------//
	@RequestMapping("/admin/updateProduct.do")
	public String updateProduct(@RequestParam String pcode, Model model) {
		
		Map<String, String> product = adminproductService.selectProductDetail(pcode);
		
		List<Map<String, String>> attachment = adminproductService.selectProductImg(pcode);
		
		System.out.println("product : " + product);
		System.out.println("attachment : " + attachment);
		
		model.addAttribute("product", product)
			 .addAttribute("attachment", attachment);
		
		return "admin/product/productUpdate";
	}
	
	//------------------------------ 상품 수정 완료 -------------------------//
	@RequestMapping("/admin/productUpdateEnd.do")
	public String productUpdateEnd(Product product, @RequestParam(value="imageFile", required=false) MultipartFile[] imageFiles,
									HttpServletRequest req, Model model) {
		
		String pCode = product.getPCode();
		
		// 원본 게시글 불러와 수정하기
		Product originProduct = adminproductService.updateView(pCode);
		
		originProduct.setPName(product.getPName());
		originProduct.setPDescription(product.getPDescription());
		originProduct.setPPrice(product.getPPrice());
		
		// 1. 파일 저장 경로 선언
		String saveDirectory
			= req.getServletContext().getRealPath("/resources/user/images/store");
		
		// 원본 첨부파일 목록
		List<Attachment> attachList = adminproductService.AttachmentList(pCode);
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
					at.setPCode(pCode);
					
					attachList.add(at);
				}
				
				// 파일 이름 변경하기
				String originName = f.getOriginalFilename();
				String changeName = fileNameChanger(originName, pCode);
				
				// 실제 파일 저장
				try {
					f.transferTo(new File(saveDirectory + "/" + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				at.setOldFileName(originName);
				at.setNewFileName(changeName);
				at.setFilePath("/resources/user/images/store/");
				at.setFIndex(idx);
				
				attachList.set(idx, at);
				
			}
			idx++;
		}
		
		System.out.println("[controller] image : " + attachList);
		// 3. update 서비스 실행
		int result = adminproductService.updateProduct(originProduct, attachList);
		String loc = "/admin/selectProductList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "상품 수정 성공!";
		} else {
			msg = "상품 수정 실패!";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	//------------------------------ 상품 등록 페이지 -------------------------//
	@RequestMapping("/admin/insertProduct.do")
	public String insertProduct() {
		return "admin/product/productInsert";
	}
	
	// -------------------- 룩북 등록 완료 ----------------- //
	@RequestMapping("/admin/insertProductEnd.do")
	public String insertProductEnd(HttpServletRequest req, Product product, Model model,
								   @RequestParam(value="imageFile", required=false) MultipartFile[] imdageFiles,
								   @RequestParam(value="topS", required=false) String[] topS,
								   @RequestParam(value="topM", required=false) String[] topM,
								   @RequestParam(value="topL", required=false) String[] topL,
								   @RequestParam(value="pantsS", required=false) String[] pantsS,
								   @RequestParam(value="pantsM", required=false) String[] pantsM,
								   @RequestParam(value="pantsL", required=false) String[] pantsL) {
		
		System.out.println(product);
		int findex = 0;
		
		
		
		
		// 1. 파일 저장경로와 파일 정보를 담을 객체 생성
		String saveDirectory
			= req.getServletContext().getRealPath("/resources/user/images/store");
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
				at.setFilePath("/resources/user/images/store/");
				at.setFIndex(findex);
				
				attachList.add(at);
				
				findex++;
				
			}
			
		}
		/***************************************/
		
		// 4. 비즈니스(서비스) 로직 수행
		Map<String, Object> size = new HashMap<>();
		
		String loc = "/admin/selectProductList.do";
		String msg = "";
		
		if(topS[4].equals("Top")) {
			Top ts = new Top();
			ts.setTSize("S");
			ts.setTotal(topS[0]);
			ts.setShoulder(topS[1]);
			ts.setChest(topS[2]);
			ts.setSleeve(topS[3]);
			
			Top tm = new Top();
			tm.setTSize("M");
			tm.setTotal(topM[0]);
			tm.setShoulder(topM[1]);
			tm.setChest(topM[2]);
			tm.setSleeve(topM[3]);
			
			Top tl = new Top();
			tl.setTSize("L");
			tl.setTotal(topL[0]);
			tl.setShoulder(topL[1]);
			tl.setChest(topL[2]);
			tl.setSleeve(topL[3]);
			
			size.put("TS", ts);
			size.put("TM", tm);
			size.put("TL", tl);
			
			System.out.println("Top : " + size);
			
			int result = adminproductService.insertProduct(product, attachList, size);
			
			// 5. 처리 결과에 따른 view 처리
			if( result > 0 ) {
				msg = "상품 등록 성공!";
			} else {
				msg = "상품 등록 실패!";
			}
		} else if(pantsS[5].equals("Pants")) {
			Pants ps = new Pants();
			ps.setPSize("S");
			ps.setTotal(pantsS[0]);
			ps.setWaist(pantsS[1]);
			ps.setThigh(pantsS[2]);
			ps.setRise(pantsS[3]);
			ps.setHem(pantsS[4]);
			
			Pants pm = new Pants();
			pm.setPSize("M");
			pm.setTotal(pantsM[0]);
			pm.setWaist(pantsM[1]);
			pm.setThigh(pantsM[2]);
			pm.setRise(pantsM[3]);
			pm.setHem(pantsM[4]);
			
			Pants pl = new Pants();
			pl.setPSize("L");
			pl.setTotal(pantsL[0]);
			pl.setWaist(pantsL[1]);
			pl.setThigh(pantsL[2]);
			pl.setRise(pantsL[3]);
			pl.setHem(pantsL[4]);
			
			size.put("PS", ps);
			size.put("PM", pm);
			size.put("PL", pl);
			
			System.out.println("Pants : " + size);
			
			int result = adminproductService.insertProduct(product, attachList, size);
			
			// 5. 처리 결과에 따른 view 처리
			if( result > 0 ) {
				msg = "상품 등록 성공!";
			} else {
				msg = "상품 등록 실패!";
			}
		} else {
			msg = "사이즈가 없습니다.";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
				
		return "common/msg";
	}
	
	//------------------------------ 입출고관리 목록 -------------------------//
	@RequestMapping("/admin/manageIO.do")
	public String manageIO(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
						   @RequestParam(required=false) String sort, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, Object>> ios = adminproductService.selectIOList(cPage, numPerPage, sort);
		
		int totalContents = adminproductService.selectIOTotalContents(sort);
		
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "manageIO.do", sort);
		
		model.addAttribute("ios", ios)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		
		return "admin/product/productManageIO";
	}
	
	//------------------------------ 입출고내역 검색 조회 -------------------------//
	@RequestMapping("/admin/selectIOSearch.do")
	public String selectIOSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			   						 @RequestParam String searchCt, @RequestParam String search, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchCt", searchCt);
		searchMap.put("search", search);
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, Object>> ios = adminproductService.selectIOSearch(cPage, numPerPage, searchMap);
		
		// 2. 검색된 게시글 수 (페이지 처리를 위함)
		int totalContents = adminproductService.selectIOSearchCount(searchMap);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectIOSearch.do", searchMap);
		
		model.addAttribute("ios", ios)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		
		return "admin/product/productManageIO";
	}
	
	// ------------------- 상품입고 등록 페이지 ---------------- //
	@RequestMapping("/admin/insertI.do")
	public String insertI(Model model) {
		
		List<Map<String, String>> pList = adminproductService.pList();
		
		model.addAttribute("pList", pList);
		
		return "admin/product/insertI";
	}
	
	// ------------------- 상품 한개 조회 (ajax) ---------------- //
	@ResponseBody
	@RequestMapping("/admin/selectP.do")
	public Map<String, Object> selectP(@RequestParam String pcode, Model model) {
		
		Map<String, Object> pd = adminproductService.selectOneP(pcode);
		
		System.out.println(pd);
		
		return pd;
	}
	
	@RequestMapping("/admin/insertIEnd.do")
	public String insertIEnd(@RequestParam String pcode, @RequestParam int addStock, Model model) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("pcode", pcode);
		map.put("addStock", addStock);
		
		int result = adminproductService.insertI(map);
		
		String loc = "/admin/manageIO.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "상품입고 등록 성공";
		} else {
			msg = "상품입고 등록 실패";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	// ------------------- 첨부파일 이름 설정하는 메소드(수정) ---------------- //
	public String fileNameChanger(String oldFileName, String pCode) {
		// 확장자 추출
		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		int rnd = (int)(Math.random() * 1000);
		
		return pCode + "_" + rnd + "." + ext;
	}
	
	// ------------------- 첨부파일 이름 설정하는 메소드(등록) ---------------- //
	public String fileNameChanger(String oldFileName) {
		// 확장자 추출
		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int)(Math.random() * 1000);
		
		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
	}
}










