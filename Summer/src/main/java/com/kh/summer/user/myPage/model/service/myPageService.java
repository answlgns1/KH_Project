package com.kh.summer.user.myPage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.pants.model.vo.Pants;
import com.kh.summer.user.top.model.vo.Top;

public interface myPageService {
	
	List<Map<String, String>> selectReviewList(int cPage, int numPerPage, String userId);

	int selectReviewTotalContents(String userId);

	List<Map<String, String>> selectLikeList(int cPage, int numPerPage, String userId);

	int selectLikeTotalContents(String userId);

	List<Map<String, String>> selectPointList(int cPage, int numPerPage, String userId);

	int selectPointTotalContents(String userId);

	Top selectTopSize(String userId);

	Pants selectPantsSize(String userId);

	int insertTopSize(String userId, Top topSize);

	int insertPantsSize(String userId, Pants pantsSize);

	int updateTopSize(String userId, Top topSize);

	int updatePantsSize(String userId, Pants pantsSize);

	List<Map<String, String>> selectQuestionList(int cPage, int numPerPage, String userId);

	int selectQuestionTotalContents(String userId);

}
