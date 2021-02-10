package com.kh.summer.admin.product.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.admin.product.model.dao.adminProductDAO;
import com.kh.summer.common.exception.BoardException;
import com.kh.summer.common.exception.ProductException;
import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.product.model.vo.Product;


@Service
public class adminProductServiceImpl implements adminProductService {

	@Autowired
	private adminProductDAO adminproductDAO;

	@Override
	public List<Map<String, Object>> selectProductList(int cPage, int numPerPage, String sort) {
		return adminproductDAO.selectProductList(cPage, numPerPage, sort);
	}

	@Override
	public int selectProductTotalContents(String sort) {
		return adminproductDAO.selectProductTotalContents(sort);
	}

	@Override
	public List<Map<String, Object>> selectProductSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		return adminproductDAO.selectProductSearch(cPage, numPerPage, searchMap);
	}

	@Override
	public int selectProductSearchCount(Map<String, String> searchMap) {
		return adminproductDAO.selectProductSearchCount(searchMap);
	}

	@Override
	public Map<String, String> selectProductDetail(String pcode) {
		return adminproductDAO.selectProductDetail(pcode);
	}

	@Override
	public List<Map<String, String>> selectProductImg(String pcode) {
		return adminproductDAO.selectProductImg(pcode);
	}

	@Override
	public Product updateView(String pCode) {
		return adminproductDAO.selectOneProduct(pCode);
	}

	@Override
	public List<Attachment> AttachmentList(String pCode) {
		return adminproductDAO.AttachmentList(pCode);
	}

	@Override
	public int updateProduct(Product product, List<Attachment> attachList) {
		
		int totalResult = 0;
		
		List<Map<String, String>> originList = adminproductDAO.selectAttachmentList(product.getPCode());
		
		System.out.println("[service] 원본 첨부파일 : " + originList);
		
		totalResult = adminproductDAO.updateProduct(product);
		
		if(totalResult == 0) throw new ProductException("상품 수정 실패!");
		
		// 이전 첨부파일이 있다면, DB의 이전 파일 기록을 삭제하기
		if( originList.size() > 0 ) {
			totalResult = adminproductDAO.deleteAttachment(product.getPCode());
			
			if(totalResult == 0) throw new ProductException("첨부 파일 삭제 실패!");
		}
		
		// 이전의 첨부파일은 없고, 새로 추가한 첨부파일이 있다면
		if( attachList.size() > 0 ) {
			for(Attachment a : attachList) {
				// update라고 쓰지만, SQL은 insert로
				totalResult = adminproductDAO.updateAttachment(a);
				
				if( totalResult == 0 ) throw new BoardException("첨부파일 추가 실패!");
			}
		}
		
		return totalResult;
	}

	@Override
	public int insertProduct(Product product, List<Attachment> attachList, Map<String, Object> size) {
		int result1 = 0;
		
		try {
			result1 = adminproductDAO.insertProduct(product);
			if(result1 == 0) throw new ProductException("상품정보 등록 실패");
			
			int lcNo = product.getLcNo();
			
			String pCode = adminproductDAO.selectPCode(lcNo);
			int result2 = adminproductDAO.insertProductSize(size, pCode);
			if(result2 == 0) throw new ProductException("상품사이즈 등록 실패");
			
			if(attachList.size() > 0) {
				for(Attachment a : attachList) {
					Map<String, Object> map = new HashMap<>();
					map.put("a", a);
					map.put("lcNo", lcNo);
					System.out.println(map);
					int result3 = adminproductDAO.insertAttachment(map);
					if(result3 == 0) throw new ProductException("첨부파일 추가 실패!");
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result1;
	}

	@Override
	public List<Map<String, Object>> selectIOList(int cPage, int numPerPage, String sort) {
		return adminproductDAO.selectIOList(cPage, numPerPage, sort);
	}

	@Override
	public int selectIOTotalContents(String sort) {
		return adminproductDAO.selectIOTotalContents(sort);
	}

	@Override
	public List<Map<String, Object>> selectIOSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		return adminproductDAO.selectIOSearch(cPage, numPerPage, searchMap);
	}

	@Override
	public int selectIOSearchCount(Map<String, String> searchMap) {
		return adminproductDAO.selectIOSearchCount(searchMap);
	}

	@Override
	public List<Map<String, String>> pList() {
		return adminproductDAO.pList();
	}

	@Override
	public Map<String, Object> selectOneP(String pcode) {
		return adminproductDAO.selectOneP(pcode);
	}

	@Override
	public int insertI(Map<String, Object> map) {
		
		int totalResult = 0;
		
		int result = adminproductDAO.insertI(map);
		if(result == 0) throw new ProductException("상품입고 등록 실패!");
		
		int result1 = adminproductDAO.updateStock(map);
		if(result1 == 0) throw new ProductException("상품입고 등록 실패!");
		
		if( result > 0 && result1 > 0 ) {
			totalResult = 1;
		}
		
		return totalResult;
	}
	

}
