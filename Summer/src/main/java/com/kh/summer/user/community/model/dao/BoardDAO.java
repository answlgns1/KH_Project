package com.kh.summer.user.community.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;

public interface BoardDAO {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();
	
	int insertBoard(Board board);
	
	int insertAttachment(Attachment a);
	
	Board selectOneBoard(int bNo);
	
	List<Attachment> selectAttachmentList(int bNo);
	
	int updateReadCount(int bNo);
	
	int updateBoard(Board board);

	int updateAttachment(Attachment a);

	int deleteBoard(int bNo);

	// 만약 DataBase에서 ATTACHMENT 테이블에 
	// ON DELETE CASCADE 옵션이 선언되지 않았다면
	// 이 메소드로 첨부파일 삭제도 구현해야 한다.
	int deleteAttachment(int bNo);
	
	int deleteFile(int attNo);
	
}
