package com.kh.summer.admin.product.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.product.model.vo.Product;

public interface adminProductDAO {

	List<Map<String, Object>> selectProductList(int cPage, int numPerPage, String sort);

	int selectProductTotalContents(String sort);

	List<Map<String, Object>> selectProductSearch(int cPage, int numPerPage, Map<String, String> searchMap);

	int selectProductSearchCount(Map<String, String> searchMap);

	Map<String, String> selectProductDetail(String pcode);

	List<Map<String, String>> selectProductImg(String pcode);

	Product selectOneProduct(String pCode);

	List<Attachment> AttachmentList(String pCode);

	List<Map<String, String>> selectAttachmentList(String pCode);

	int updateProduct(Product product);

	int deleteAttachment(String pCode);

	int updateAttachment(Attachment a);

	int insertProduct(Product product);

	int insertAttachment(Map<String, Object> map);

	int insertProductSize(Map<String, Object> size, String pCode);

	String selectPCode(int lcNo);

	List<Map<String, Object>> selectIOList(int cPage, int numPerPage, String sort);

	int selectIOTotalContents(String sort);

	List<Map<String, Object>> selectIOSearch(int cPage, int numPerPage, Map<String, String> searchMap);

	int selectIOSearchCount(Map<String, String> searchMap);

	List<Map<String, String>> pList();

	Map<String, Object> selectOneP(String pcode);

	int insertI(Map<String, Object> map);

	int updateStock(Map<String, Object> map);


}
