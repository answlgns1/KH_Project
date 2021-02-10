package com.kh.summer.user.community.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.common.exception.BoardException;
import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;
import com.kh.summer.user.community.model.dao.FreeDAO;

@Service
public class FreeServiceImpl implements FreeService {
	
	@Autowired
	private FreeDAO freeDAO;

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		return freeDAO.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		return freeDAO.selectBoardTotalContents();
	}

	@Override
	// @Transactional()
	public int insertBoard(Board board, List<Attachment> attachList) {
		
		int result1 = 0;
		
		try {
			result1 = freeDAO.insertBoard(board);
			
			if(result1 == 0) throw new BoardException("게시글 등록 실패!");
			
			// mapper의 insert문에서 selectKey 태그를 사용하여 bNo 가져오기
			if(attachList.size() > 0) {
				for(Attachment a : attachList) {
					int result2 = freeDAO.insertAttachment(a);
					if(result2 == 0) throw new BoardException("첨부파일 추가 실패!");
				}
			}
		} catch(Exception e) {
			// 파일 삭제
			if(attachList.size() > 0) {
				for(Attachment a : attachList) {
					
					// 파일 삭제
				}
			}
			throw new BoardException("등록된 파일 삭제 실패");
		}
		return result1;
	}

	@Override
	public Map<String, String> selectOneBoard(int bNo) {
		
		Map<String, String> board = freeDAO.selectOneBoard(bNo);
		
		// 조회수 1 증가!
		if( board != null ) freeDAO.updateViews(bNo);
		
		return board;
	}

	@Override
	public List<Map<String, String>> selectAttachmentList(int bNo) {
		return freeDAO.selectAttachmentList(bNo);
	}
	
	@Override
	public List<Map<String, String>> selectBoardCommentList(int bNo) {
		return freeDAO.selectBoardCommentList(bNo);
	}

	@Override
	public Map<String, String> updateView(int bNo) {
		return freeDAO.selectOneBoard(bNo);
	}

	@Override
	public int updateBoard(Map<String, String> board, List<Map<String, String>> attachList) {

		int totalResult = 0;
		
		totalResult = freeDAO.updateBoard(board);
		
		if(totalResult == 0) throw new BoardException("게시글 수정 실패!");

		if(attachList.size() > 0) {
			for(Map<String, String> a : attachList) {
				// update라고 쓰지만, SQL은 insert로
				totalResult = freeDAO.updateAttachment(a);
				
				if( totalResult == 0 ) throw new BoardException("첨부파일 추가 실패!");
			}
		}
		
		return totalResult;
	}

	@Override
	public int deleteBoard(int bNo) {
		return freeDAO.deleteBoard(bNo);
	}

	@Override
	public int deleteFile(int aNo) {
		return freeDAO.deleteFile(aNo);
	}

	@Override
	public int insertComment(Map<String, String> comment) {
		return freeDAO.insertComment(comment);
	}

	@Override
	public int deleteComment(int bcNo) {
		return freeDAO.deleteComment(bcNo);
	}

}
