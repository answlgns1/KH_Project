package com.kh.summer.user.community.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.common.exception.BoardException;
import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;
import com.kh.summer.user.community.model.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		return boardDAO.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		return boardDAO.selectBoardTotalContents();
	}

	@Override
	// @Transactional()
	public int insertBoard(Board board, List<Attachment> attachList) {
		
		int result1 = 0;
		
		try {
			result1 = boardDAO.insertBoard(board);
			
			if(result1 == 0) throw new BoardException();
			
			// 현재 가져온 Attachment들은 boardNo가 없다...
			// 이를 해결 방법은?
			// 1. DB에서 가장 최근 생성된 boardNo를 DAO로 가져오는 방법
			// 2. mapper의 insert문에서 selectKey 태그를 사용하는 방법
			if(attachList.size() > 0) {
				for(Attachment a : attachList) {
					int result2 = boardDAO.insertAttachment(a);
					if(result2 == 0) throw new BoardException("첨부파일 추가 실패!");
				}
			}
		} catch(Exception e) {
			// 파일 삭제
			throw new BoardException("등록된 파일 삭제 실패");
		}
		return result1;
	}

	@Override
	public Board selectOneBoard(int boardNo) {
		
		Board board = boardDAO.selectOneBoard(boardNo);
		
		// 조회수 1 증가!
		if( board != null ) boardDAO.updateReadCount(boardNo);
		
		return board;
	}

	@Override
	public List<Attachment> selectAttachmentList(int boardNo) {
		return boardDAO.selectAttachmentList(boardNo);
	}

	@Override
	public Board updateView(int boardNo) {
		return boardDAO.selectOneBoard(boardNo);
	}

	@Override
	public int updateBoard(Board board, List<Attachment> attachList) {
		
		int totalResult = 0;
		
		List<Attachment> originList = boardDAO.selectAttachmentList(board.getBNo());
		
		totalResult = boardDAO.updateBoard(board);
		
		if(totalResult == 0) throw new BoardException("게시글 수정 실패!");
		
		// 이전 첨부파일이 있다면, DB의 이전 파일 기록을 삭제하기
		if( originList.size() > 0 ) {
			totalResult = boardDAO.deleteAttachment(board.getBNo());
			
			if(totalResult == 0) throw new BoardException("첨부 파일 삭제 실패!");
		}
		
		// 이전의 첨부파일은 없고, 새로 추가한 첨부파일이 있다면
		if(attachList.size() > 0) {
			for(Attachment a : attachList) {
				// update라고 쓰지만, SQL은 insert로
				totalResult = boardDAO.updateAttachment(a);
				
				if( totalResult == 0 ) throw new BoardException("첨부파일 추가 실패!");
			}
		}
		
		return totalResult;
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardDAO.deleteBoard(boardNo);
	}

	@Override
	public int deleteFile(int attNo) {
		return boardDAO.deleteFile(attNo);
	}

}
