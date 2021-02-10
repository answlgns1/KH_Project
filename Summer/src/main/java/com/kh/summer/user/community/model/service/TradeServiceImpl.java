package com.kh.summer.user.community.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.common.exception.BoardException;
import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;
import com.kh.summer.user.community.model.dao.TradeDAO;

@Service
public class TradeServiceImpl implements TradeService {

	@Autowired
	private TradeDAO tradeDAO;
	
	@Override
	public List<Map<String, String>> selectTradeList(int cPage, int numPerPage) {
		return tradeDAO.selectTradeList(cPage, numPerPage);
	}

	@Override
	public int selectTradeTotalContents() {
		return tradeDAO.selectTradeTotalContents();
	}

	@Override
	public Map<String, String> selectOneTrade(int no) {
		
		Map<String, String> trade = tradeDAO.selectOneTrade(no);
		
		// 조회수 1 증가!
		if( trade != null ) tradeDAO.updateViews(no);
		
		return trade;
	}

	@Override
	public List<Map<String, String>> selectAttachmentList(int no) {
		return tradeDAO.selectAttachmentList(no);
	}

	@Override
	public List<Map<String, String>> selectBoardCommentList(int no) {
		return tradeDAO.selectTradeCommentList(no);
	}

	@Override
	public int insertTrade(Board board, List<Attachment> attachList) {
int result1 = 0;
		
		try {
			result1 = tradeDAO.insertTrade(board);
			
			if(result1 == 0) throw new BoardException("게시글 등록 실패!");
			
			// mapper의 insert문에서 selectKey 태그를 사용하여 bNo 가져오기
			if(attachList.size() > 0) {
				for(Attachment a : attachList) {
					int result2 = tradeDAO.insertAttachment(a);
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

}
