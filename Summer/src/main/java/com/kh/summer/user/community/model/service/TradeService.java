package com.kh.summer.user.community.model.service;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.board.model.vo.Board;

public interface TradeService {

	List<Map<String, String>> selectTradeList(int cPage, int numPerPage);

	int selectTradeTotalContents();

	Map<String, String> selectOneTrade(int no);

	List<Map<String, String>> selectAttachmentList(int no);

	List<Map<String, String>> selectBoardCommentList(int no);

	int insertTrade(Board board, List<Attachment> attachList);

}
