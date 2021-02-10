package com.kh.summer.user.board.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.summer.user.attachment.model.vo.Attachment;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Board implements Serializable {

	private static final long serialVersionUID = 202012142233L;
	
	private int bNo;
	private int btNo;
	private String bTitle;
	private String bContents;
	private String userId;
	private Date bDate;
	private int views;
	private String bStatus;
	
	//가상컬럼에 대한 필드추가
	private int fileCount;
	//첨부파일에 대한 필드추가
	private List<Attachment> files = new ArrayList<>();
}
