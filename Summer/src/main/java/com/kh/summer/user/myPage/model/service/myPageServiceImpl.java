package com.kh.summer.user.myPage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.user.myPage.model.dao.myPageDAO;
import com.kh.summer.user.pants.model.vo.Pants;
import com.kh.summer.user.top.model.vo.Top;

@Service
public class myPageServiceImpl implements myPageService {
	
	@Autowired
	myPageDAO mypageDAO;

	@Override
	public List<Map<String, String>> selectReviewList(int cPage, int numPerPage, String userId) {
		return mypageDAO.selectReviewList(cPage, numPerPage, userId);
	}

	@Override
	public int selectReviewTotalContents(String userId) {
		return mypageDAO.selectReviewTotalContents(userId);
	}

	@Override
	public List<Map<String, String>> selectLikeList(int cPage, int numPerPage, String userId) {
		return mypageDAO.selectLikeList(cPage, numPerPage, userId);
	}

	@Override
	public int selectLikeTotalContents(String userId) {
		return mypageDAO.selectLikeTotalContents(userId);
	}

	@Override
	public List<Map<String, String>> selectPointList(int cPage, int numPerPage, String userId) {
		return mypageDAO.selectPointList(cPage, numPerPage, userId);
	}

	@Override
	public int selectPointTotalContents(String userId) {
		return mypageDAO.selectPointTotalContents(userId);
	}

	@Override
	public Top selectTopSize(String userId) {
		return mypageDAO.selectTopSize(userId);
	}

	@Override
	public Pants selectPantsSize(String userId) {
		return mypageDAO.selectPantsSize(userId);
	}

	@Override
	public int insertTopSize(String userId, Top topSize) {
		Map<String, String> map = new HashMap<>();
		
		map.put("userId", userId);
		map.put("total", topSize.getTotal());
		map.put("shoulder", topSize.getShoulder());
		map.put("chest", topSize.getChest());
		map.put("sleeve", topSize.getSleeve());
		
		return mypageDAO.insertTopSize(map);
	}

	@Override
	public int insertPantsSize(String userId, Pants pantsSize) {
		Map<String, String> map = new HashMap<>();
		
		map.put("userId", userId);
		map.put("total", pantsSize.getTotal());
		map.put("waist", pantsSize.getWaist());
		map.put("thigh", pantsSize.getThigh());
		map.put("rise", pantsSize.getRise());
		map.put("hem", pantsSize.getHem());
		
		return mypageDAO.insertPantsSize(map);
	}

	@Override
	public int updateTopSize(String userId, Top topSize) {
		Map<String, String> map = new HashMap<>();
		
		map.put("userId", userId);
		map.put("total", topSize.getTotal());
		map.put("shoulder", topSize.getShoulder());
		map.put("chest", topSize.getChest());
		map.put("sleeve", topSize.getSleeve());
		
		return mypageDAO.updateTopSize(map);
	}

	@Override
	public int updatePantsSize(String userId, Pants pantsSize) {
		Map<String, String> map = new HashMap<>();
		
		map.put("userId", userId);
		map.put("total", pantsSize.getTotal());
		map.put("waist", pantsSize.getWaist());
		map.put("thigh", pantsSize.getThigh());
		map.put("rise", pantsSize.getRise());
		map.put("hem", pantsSize.getHem());
		
		return mypageDAO.updatePantsSize(map);
	}

	@Override
	public List<Map<String, String>> selectQuestionList(int cPage, int numPerPage, String userId) {
		return mypageDAO.selectQuestionList(cPage, numPerPage, userId);
	}

	@Override
	public int selectQuestionTotalContents(String userId) {
		return mypageDAO.selectQuestionTotalContents(userId);
	}

}
