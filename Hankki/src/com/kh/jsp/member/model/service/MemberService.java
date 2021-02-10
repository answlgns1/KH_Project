package com.kh.jsp.member.model.service;

import static com.kh.jsp.common.JDBCTemplate.close;
import static com.kh.jsp.common.JDBCTemplate.commit;
import static com.kh.jsp.common.JDBCTemplate.getConnection;
import static com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.dao.MemberDao;
import com.kh.jsp.member.model.vo.Member;

public class MemberService {

	private MemberDao md = new MemberDao();
	private Connection con;
	
	public int memberInsert(Member m) {
		
		con=getConnection();
		
		int result = md.insertMember(con, m);
		
		if(result>0) {
			
			commit(con);
			System.out.println("회원가입에 성공했어요");
		}else {
			
			rollback(con);
			System.out.println("회원가입에 실패했어요");
		}
		close(con);

		return result;
		
	
	}

	public Member selectMember(Member m) {
		
		con = getConnection();
		
		Member result = md.selectMember(con, m);
		
		close(con);
		
		return result;
	}


	public int idOverlapCheck(String userid) {
		int result = 0;
		
		System.out.println(userid);
		
		con=getConnection();
		
		MemberDao md = new MemberDao();
		
		result = md.idOverlapCheck(con, userid);
		
		
		
		close(con);
		
		return result;
	}

	public int emailOverlapCheck(String email) {
		
		con = getConnection();
		
		MemberDao md = new MemberDao();
		int result = md.emailOverlapCheck(email, con);
		
		close(con);
		return result;
	}
	

	
	public int deleteMember(String userId) throws MemberException {
		con = getConnection();
		
		int result = md.deleteMember(con, userId);
		
		if( result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
		
	}

	public int updateMember(Member m) throws MemberException {
		con = getConnection(); 
		
		int result = md.updateMember(con, m); 

		if(result > 0) { 
			commit(con);
		} else {
			rollback(con);
		} 
		
		close(con);
		
		return result;		
		
	}
}
