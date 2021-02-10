package com.kh.jsp.member.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.vo.Member;

public class MemberDao {

	private Properties prop;
	
	public MemberDao() {
		
		prop = new Properties();
		
		try { 
			String path = MemberDao.class.getResource("/config/member-sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public int insertMember(Connection con, Member m) {
		
		int result = 0;
		
		PreparedStatement pstmt= null;
		
		String sql = prop.getProperty("insertmember");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getUserPhone());
			pstmt.setString(5, m.getUserEmail());
			pstmt.setString(6, m.getUserBirth());
			pstmt.setString(7, m.getUserAddress());
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt); 
			
		}
		
		return result;
	}


	public Member selectMember(Connection con, Member m) {
		
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				
				result = new Member();
				
				result.setUserId(m.getUserId());
				result.setUserPwd(m.getUserPwd());
				result.setUserNo(rset.getInt(2));
				result.setUserPoint(rset.getInt(3));
				result.setUserName(rset.getString(5));
				result.setUserPhone(rset.getString(6));
				result.setUserEmail(rset.getString(7));
				result.setUserBirth(rset.getString(8));
				result.setUserAddress(rset.getString(9));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int updateMember(Connection con, Member m) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		// 비밀번호, 이메일, 휴대폰, 주소, 생일
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,m.getUserPwd());
			pstmt.setString(2,m.getUserEmail());
			pstmt.setString(3,m.getUserPhone());
			pstmt.setString(4,m.getUserAddress());
			pstmt.setString(5,m.getUserBirth());
			pstmt.setString(6,m.getUserId());
			//pstmt.setString(7,m.getUserName());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
			
		} finally {
			close(pstmt);
			
		}
			return result;
	}

	public int deleteMember(Connection con, String userId) throws MemberException {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());		

		} finally {			
			close(pstmt);
		}				
		return result;
	}

public int idOverlapCheck(Connection con, String userid) {
	
	int result = 0;
	
	PreparedStatement pstmt=null;
	ResultSet rset = null;
	
	String sql=prop.getProperty("idoverlapcheck");
	
	try {
		pstmt=con.prepareStatement(sql);
		
		pstmt.setString(1, userid);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()){
			result = rset.getInt(1);
		}
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		
		close(rset);
		close(pstmt);
		
	}
	
	
	return result;
}


public int emailOverlapCheck(String email, Connection con) {
	int result=0;
	
	PreparedStatement pstmt=null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("emailoverlapcheck");
	
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, email);
		rset = pstmt.executeQuery();
		
		if(rset.next()) {
			
			result=rset.getInt(1); // 숫자 중 가장 높은 수를 가져옴 오름차순일경우 1번째 수를 가져옴
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	close(rset);
	close(pstmt);
	return result;
}

}
