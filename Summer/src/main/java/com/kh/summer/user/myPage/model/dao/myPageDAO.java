package com.kh.summer.user.myPage.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.pants.model.vo.Pants;
import com.kh.summer.user.top.model.vo.Top;

public interface myPageDAO {

	List<Map<String, String>> selectReviewList(int cPage, int numPerPage, String userId);

	int selectReviewTotalContents(String userId);

	List<Map<String, String>> selectLikeList(int cPage, int numPerPage, String userId);

	int selectLikeTotalContents(String userId);

	List<Map<String, String>> selectPointList(int cPage, int numPerPage, String userId);

	int selectPointTotalContents(String userId);

	Top selectTopSize(String userId);

	Pants selectPantsSize(String userId);

	int insertTopSize(Map<String, String> map);

	int insertPantsSize(Map<String, String> map);

	int updateTopSize(Map<String, String> map);

	int updatePantsSize(Map<String, String> map);

	List<Map<String, String>> selectQuestionList(int cPage, int numPerPage, String userId);

	int selectQuestionTotalContents(String userId);

}
