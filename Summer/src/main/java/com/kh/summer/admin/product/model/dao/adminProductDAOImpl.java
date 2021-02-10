package com.kh.summer.admin.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.pants.model.vo.Pants;
import com.kh.summer.user.product.model.vo.Product;
import com.kh.summer.user.top.model.vo.Top;


@Repository
public class adminProductDAOImpl implements adminProductDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> selectProductList(int cPage, int numPerPage, String sort) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminProductMapper.selectProductList", sort, rows);
	}

	@Override
	public int selectProductTotalContents(String sort) {
		return sqlSession.selectOne("adminProductMapper.selectProductTotalContents", sort);
	}
	
	@Override
	public List<Map<String, Object>> selectProductSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminProductMapper.selectProductSearch", searchMap, rows);
	}

	@Override
	public int selectProductSearchCount(Map<String, String> searchMap) {
		return sqlSession.selectOne("adminProductMapper.selectProductSearchCount", searchMap);
	}

	@Override
	public Map<String, String> selectProductDetail(String pcode) {
		return sqlSession.selectOne("adminProductMapper.selectProductDetail", pcode);
	}

	@Override
	public List<Map<String, String>> selectProductImg(String pcode) {
		return sqlSession.selectList("adminProductMapper.selectProductImg", pcode);
	}

	@Override
	public Product selectOneProduct(String pCode) {
		return sqlSession.selectOne("adminProductMapper.selectOneProduct", pCode);
	}

	@Override
	public List<Attachment> AttachmentList(String pCode) {
		return sqlSession.selectList("adminProductMapper.AttachmentList", pCode);
	}

	@Override
	public List<Map<String, String>> selectAttachmentList(String pCode) {
		return sqlSession.selectList("adminProductMapper.selectAttachmentList", pCode);
	}

	@Override
	public int updateProduct(Product product) {
		return sqlSession.update("adminProductMapper.updateProduct", product);
	}

	@Override
	public int deleteAttachment(String pCode) {
		return sqlSession.delete("adminProductMapper.deleteAttachment", pCode);
	}

	@Override
	public int updateAttachment(Attachment a) {
		return sqlSession.insert("adminProductMapper.updateAttachment", a);
	}

	@Override
	public int insertProduct(Product product) {
		return sqlSession.insert("adminProductMapper.insertProduct", product);
	}

	@Override
	public int insertAttachment(Map<String, Object> map) {
		return sqlSession.insert("adminProductMapper.insertAttachment", map);
	}
	
	@Override
	public String selectPCode(int lcNo) {
		return sqlSession.selectOne("adminProductMapper.selectPCode", lcNo);
	}

	@Override
	public int insertProductSize(Map<String, Object> size, String pCode) {
		int result = 0;
		
		if( size.get("TS") != null ) {
			Top S = (Top)size.get("TS"); 
			S.setPCode(pCode);
			result = sqlSession.insert("adminProductMapper.insertTopSize", S);
		}
		if( size.get("TM") != null ) {
			Top M = (Top)size.get("TM"); 
			M.setPCode(pCode);
			result = sqlSession.insert("adminProductMapper.insertTopSize", M);
		}
		if( size.get("TL") != null ) {
			Top L = (Top)size.get("TL"); 
			L.setPCode(pCode);
			result = sqlSession.insert("adminProductMapper.insertTopSize", L);
		}
		if( size.get("PS") != null ) {
			Pants S = (Pants)size.get("PS");
			S.setPCode(pCode);
			result = sqlSession.insert("adminProductMapper.insertPantsSize", S);
		}
		if( size.get("PM") != null ) {
			Pants M = (Pants)size.get("PM");
			M.setPCode(pCode);
			result = sqlSession.insert("adminProductMapper.insertPantsSize", M);
		}
		if( size.get("PL") != null ) {
			Pants L = (Pants)size.get("PL");
			L.setPCode(pCode);
			result = sqlSession.insert("adminProductMapper.insertPantsSize", L);
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> selectIOList(int cPage, int numPerPage, String sort) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminProductMapper.selectIOList", sort, rows);
	}

	@Override
	public int selectIOTotalContents(String sort) {
		return sqlSession.selectOne("adminProductMapper.selectIOTotalContents", sort);
	}

	@Override
	public List<Map<String, Object>> selectIOSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminProductMapper.selectIOSearch", searchMap, rows);
	}

	@Override
	public int selectIOSearchCount(Map<String, String> searchMap) {
		return sqlSession.selectOne("adminProductMapper.selectIOSearchCount", searchMap);
	}

	@Override
	public List<Map<String, String>> pList() {
		return sqlSession.selectList("adminProductMapper.pList");
	}

	@Override
	public Map<String, Object> selectOneP(String pcode) {
		return sqlSession.selectOne("adminProductMapper.selectOneP", pcode);
	}

	@Override
	public int insertI(Map<String, Object> map) {
		return sqlSession.insert("adminProductMapper.insertI", map);
	}

	@Override
	public int updateStock(Map<String, Object> map) {
		return sqlSession.update("adminProductMapper.updateStock", map);
	}


	


}



