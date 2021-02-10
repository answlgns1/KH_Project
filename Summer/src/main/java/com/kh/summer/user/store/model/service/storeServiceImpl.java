package com.kh.summer.user.store.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.store.model.dao.StoreDAO;
import com.kh.summer.user.store.model.vo.Store;

@Service
public class storeServiceImpl implements StoreService {

	@Autowired
	StoreDAO storeDAO;
	
	@Override
	public List<Map<String, String>> selectStoreTopList(int cPage, int numPerPage, String sort) {
		
		return storeDAO.selectStoreTopList(cPage, numPerPage, sort);
	}

	@Override
	public int selectStoreTopTotalContents() {
		return storeDAO.selectStoreTopTotalContents();
	}
	
	@Override
	public List<Map<String, String>> selectStorePantsList(int cPage, int numPerPage, String sort) {
		
		return storeDAO.selectStorePantsList(cPage, numPerPage, sort);
	}

	@Override
	public int selectStorePantsTotalContents() {
		return storeDAO.selectStorePantsTotalContents();
	}
	
	@Override
	public List<Map<String, String>> selectStoreOuterList(int cPage, int numPerPage, String sort) {
		
		return storeDAO.selectStoreOuterList(cPage, numPerPage, sort);
	}

	@Override
	public int selectStoreOuterTotalContents() {
		return storeDAO.selectStoreOuterTotalContents();
	}

	@Override
	public int insertStore(Store store, List<Attachment> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override 
	public Map<String, String> selectOneStore(int bNo) {		
		Map<String, String> store = storeDAO.selectOneStore(bNo);
		// 조회수 1 증가!
		if( store != null ) storeDAO.updateViews(bNo);
		
		return store;
	}
	
	@Override
	public int updateLike(Map<String, String> like){
		return storeDAO.updateLike(like);
	}

	@Override 
	public List<Map<String, String>> selectAttachmentList(int bNo) {
		return storeDAO.selectAttachmentList(bNo);
	}

	@Override
	public List<Map<String, String>> selectStoreCommentList(int bNo) {
		return storeDAO.selectStoreCommentList(bNo);
	}

	@Override
	public List<Map<String, String>> selectSize(int bNo) {
		return storeDAO.selectSize(bNo);
	}

	@Override
	public int selectSmallSize(Map<String, String> size) {
		return storeDAO.selectSmallSize(size);
	}

	@Override
	public int insertStoreComment(Map<String, String> comment) {
		return storeDAO.insertStoreComment(comment);
	}

	@Override
	public int deleteStoreComment(int bcNo) {
		return storeDAO.deleteStoreComment(bcNo);
	}

	@Override
	public List<Map<String, String>> selectStoreMainList() {
		return storeDAO.selectStoreMainList();
	}

	@Override
	public Map<String, Object> selectMySize(String Id) {
		return storeDAO.selectSize(Id);
	}


}
