package com.kh.summer.user.lookbook.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.common.exception.BoardException;
import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;
import com.kh.summer.user.lookbook.model.dao.LookbookDAO;

@Service
public class LookbookServiceImpl implements LookbookService {
	
	@Autowired
	private LookbookDAO lookbookDAO;

	@Override
	public List<Map<String, String>> selectLookbookList(int cPage, int numPerPage, String sort) {
		return lookbookDAO.selectLookbookList(cPage, numPerPage, sort);
	}
	
	@Override
	public List<Map<String, String>> selectLookbookSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		return lookbookDAO.selectLookbookSearch(cPage, numPerPage, searchMap);
	}

	@Override
	public int selectLookbookTotalContents() {
		return lookbookDAO.selectLookbookTotalContents();
	}
	
	@Override
	public int selectLookbookSearchCount(Map<String, String> searchMap) {
		return lookbookDAO.selectLookbookSearchCount(searchMap);
	}
	
	@Override
	public Map<String, String> selectLookbookDetail(int bno) {
		return lookbookDAO.selectLookbookDetail(bno);
	}
	
	@Override
	public List<Map<String, String>> selectLookbookCommentList(int bno) {
		return lookbookDAO.selectLookbookCommentList(bno);
	}
	
	@Override
	public int insertLookbookComment(Map<String, String> comment) {
		return lookbookDAO.insertLookbookComment(comment);
	}
	
	@Override
	public int updateLookbookComment(Map<String, String> uc) {
		return lookbookDAO.updateLookbookComment(uc);
	}
	
	@Override
	public int deleteLookbookComment(int bcNo) {
		return lookbookDAO.deleteLookbookComment(bcNo);
	}

	@Override
	// @Transactional()
	public int insertLookbook(Board board, List<Attachment> attachList) {
		
		int result1 = 0;
		
		try {
			result1 = lookbookDAO.insertLookbook(board);
			
			if(result1 == 0) throw new BoardException();
			
			if(attachList.size() > 0) {
				for(Attachment a : attachList) {
					int result2 = lookbookDAO.insertAttachment(a);
					if(result2 == 0) throw new BoardException("첨부파일 추가 실패!");
					System.out.println(a);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result1;
	}

	@Override
	public Board selectOneLookbook(int boardNo) {
		
		Board board = lookbookDAO.selectOneLookbook(boardNo);
		
		// 조회수 1 증가!
		if( board != null ) lookbookDAO.updateReadCount(boardNo);
		
		return board;
	}

	@Override
	public List<Map<String, String>> selectAttachmentList(int bno) {
		return lookbookDAO.selectAttachmentList(bno);
	}

	@Override
	public Board updateView(int bNo) {
		return lookbookDAO.selectOneLookbook(bNo);
	}

	@Override
	public int updateLookbook(Board board, List<Attachment> attachList) {
		
		int totalResult = 0;
		
		List<Map<String, String>> originList = lookbookDAO.selectAttachmentList(board.getBNo());
		
		System.out.println("[service] 원본 첨부파일 : " + originList);
		
		totalResult = lookbookDAO.updateLookbook(board);
		
		if(totalResult == 0) throw new BoardException("게시글 수정 실패!");
		
		// 이전 첨부파일이 있다면, DB의 이전 파일 기록을 삭제하기
		if( originList.size() > 0 ) {
			totalResult = lookbookDAO.deleteAttachment(board.getBNo());
			
			if(totalResult == 0) throw new BoardException("첨부 파일 삭제 실패!");
		}
		
		// 이전의 첨부파일은 없고, 새로 추가한 첨부파일이 있다면
		if(attachList.size() > 0) {
			for(Attachment a : attachList) {
				// update라고 쓰지만, SQL은 insert로
				totalResult = lookbookDAO.updateAttachment(a);
				
				if( totalResult == 0 ) throw new BoardException("첨부파일 추가 실패!");
			}
		}
		
		return totalResult;
	}

	@Override
	public int deleteLookbook(int bno) {
		return lookbookDAO.deleteLookbook(bno);
	}

	@Override
	public int deleteFile(int aNo) {
		return lookbookDAO.deleteFile(aNo);
	}

	@Override
	public int viewUp(int bno) {
		return lookbookDAO.viewUp(bno);
	}

	@Override
	public List<Attachment> AttachmentList(int bno) {
		return lookbookDAO.AttachmentList(bno);
	}

}
