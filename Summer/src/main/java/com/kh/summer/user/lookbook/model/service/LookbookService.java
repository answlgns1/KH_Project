package com.kh.summer.user.lookbook.model.service;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;

public interface LookbookService {

	List<Map<String, String>> selectLookbookList(int cPage, int numPerPage, String sort);
	
	List<Map<String, String>> selectLookbookSearch(int cPage, int numPerPage, Map<String, String> searchMap);

	int selectLookbookTotalContents();
	
	int selectLookbookSearchCount(Map<String, String> searchMap);
	
	Map<String, String> selectLookbookDetail(int bno);
	
	List<Map<String, String>> selectLookbookCommentList(int bno);
	
	int insertLookbookComment(Map<String, String> comment);
	
	int updateLookbookComment(Map<String, String> uc);
	
	int deleteLookbookComment(int bcNo);

	int insertLookbook(Board board, List<Attachment> attachList);

	Board selectOneLookbook(int bNo);

	List<Map<String, String>> selectAttachmentList(int bno);
	
	Board updateView(int bNo);
	
	int updateLookbook(Board board, List<Attachment> attachList);
	
	int deleteLookbook(int bNo);

	int deleteFile(int aNo);

	int viewUp(int bno);

	List<Attachment> AttachmentList(int bno);



	
}