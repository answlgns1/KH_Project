package com.kh.summer.admin.product.model.service;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.product.model.vo.Product;

public interface adminProductService {

	List<Map<String, Object>> selectProductList(int cPage, int numPerPage, String sort);

	int selectProductTotalContents(String sort);

	List<Map<String, Object>> selectProductSearch(int cPage, int numPerPage, Map<String, String> searchMap);

	int selectProductSearchCount(Map<String, String> searchMap);

	Map<String, String> selectProductDetail(String pcode);

	List<Map<String, String>> selectProductImg(String pcode);

	Product updateView(String pCode);

	List<Attachment> AttachmentList(String pCode);

	int updateProduct(Product originProduct, List<Attachment> attachList);

	int insertProduct(Product product, List<Attachment> attachList, Map<String, Object> size);

	List<Map<String, Object>> selectIOList(int cPage, int numPerPage, String sort);

	int selectIOTotalContents(String sort);

	List<Map<String, Object>> selectIOSearch(int cPage, int numPerPage, Map<String, String> searchMap);

	int selectIOSearchCount(Map<String, String> searchMap);

	List<Map<String, String>> pList();

	Map<String, Object> selectOneP(String pcode);

	int insertI(Map<String, Object> map);

	
}
