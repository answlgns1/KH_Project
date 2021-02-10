package com.kh.summer.user.lookbook.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;

public interface LookbookDAO {

	List<Map<String, String>> selectLookbookList(int cPage, int numPerPage, String sort);
	
	List<Map<String, String>> selectLookbookSearch(int cPage, int numPerPage, Map<String, String> searchMap);

	int selectLookbookTotalContents();
	
	int selectLookbookSearchCount(Map<String, String> searchMap);
	
	Map<String, String> selectLookbookDetail(int bno);
	
	List<Map<String, String>> selectLookbookCommentList(int bno);
	
	int insertLookbookComment(Map<String, String> comment);
	
	int updateLookbookComment(Map<String, String> uc);
	
	int deleteLookbookComment(int bcNo);
	
	int insertLookbook(Board board);
	
	int insertAttachment(Attachment a);
	
	Board selectOneLookbook(int bNo);
	
	List<Map<String, String>> selectAttachmentList(int bno);
	
	int updateReadCount(int bNo);
	
	int updateLookbook(Board board);

	int updateAttachment(Attachment a);

	int deleteLookbook(int bno);

	// 만약 DataBase에서 ATTACHMENT 테이블에 
	// ON DELETE CASCADE 옵션이 선언되지 않았다면
	// 이 메소드로 첨부파일 삭제도 구현해야 한다.
	int deleteAttachment(int bNo);
	
	int deleteFile(int aNo);

	int viewUp(int bno);

	List<Attachment> AttachmentList(int bno);

	


	
}
