package com.kh.summer.user.community.model.service;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;

public interface BoardService {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(Board board, List<Attachment> attachList);

	Board selectOneBoard(int bNo);

	List<Attachment> selectAttachmentList(int bNo);
	
	Board updateView(int bNo);
	
	int updateBoard(Board board, List<Attachment> attachList);
	
	int deleteBoard(int bNo);

	int deleteFile(int attNo);
	
}