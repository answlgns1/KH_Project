package com.kh.summer.user.community.model.service;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;

public interface FreeService {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(Board board, List<Attachment> attachList);

	Map<String, String> selectOneBoard(int bNo);

	List<Map<String, String>> selectAttachmentList(int bNo);

	List<Map<String, String>> selectBoardCommentList(int bNo);
	
	Map<String, String> updateView(int bNo);
	
	int updateBoard(Map<String, String> board, List<Map<String, String>> attachList);
	
	int deleteBoard(int bNo);

	int deleteFile(int aNo);

	int insertComment(Map<String, String> comment);

	int deleteComment(int bcNo);
}