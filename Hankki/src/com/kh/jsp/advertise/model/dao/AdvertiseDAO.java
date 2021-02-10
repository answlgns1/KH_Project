package com.kh.jsp.advertise.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jsp.advertise.model.dao.AdvertiseDAO;
import com.kh.jsp.advertise.model.vo.Advertisement;
import com.kh.jsp.member.model.vo.Member;

public class AdvertiseDAO {
	
	private Properties prop;
	
	public AdvertiseDAO() {
		prop = new Properties();
		
		String filePath = AdvertiseDAO.class
								  .getResource("/config/Advertise-sql.properties")
								  .getPath();
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertAdvertise(Connection con, Advertisement ad) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAdvertise");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,  ad.getAd_name());
			pstmt.setString(2, ad.getAd_content());
			pstmt.setString(3, ad.getAd_attachment());
			pstmt.setString(4, ad.getAd_link());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Advertisement> selectList(Connection con) {
		
		ArrayList<Advertisement> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while( rset.next() ) {
				
				Advertisement ad = new Advertisement();
				
				ad.setAd_no(rset.getInt("ad_no"));
				ad.setAd_name(rset.getString("ad_name"));
				ad.setAd_content(rset.getString("ad_content"));
				ad.setAd_attachment(rset.getString("ad_attachment"));
				ad.setAd_link(rset.getString("ad_link"));
				
				
				list.add(ad);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;

	}

	public ArrayList<Advertisement> searchList(Connection con, String condition, String keyword) {

		ArrayList<Advertisement> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(condition) {
		case "ad_no" :			// 광고 번호로 검색 시
			sql = prop.getProperty("searchNo");
			break;
		case "ad_name" :		// 광고 이름으로 검색 시
			sql = prop.getProperty("searchName");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Advertisement ad = new Advertisement();
				
				ad.setAd_no(rset.getInt("AD_NO"));
				ad.setAd_attachment(rset.getString("AD_ATTACHMENT"));
				ad.setAd_name(rset.getString("AD_NAME"));
				ad.setAd_content(rset.getString("AD_CONTENT"));
				
				list.add(ad);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Advertisement> searchAll(Connection con, String keyword) {

		ArrayList<Advertisement> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql =  prop.getProperty("searchAll");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Advertisement ad = new Advertisement();
				
				ad.setAd_no(rset.getInt("AD_NO"));
				ad.setAd_attachment(rset.getString("AD_ATTACHMENT"));
				ad.setAd_name(rset.getString("AD_NAME"));
				ad.setAd_content(rset.getString("AD_CONTENT"));
				
				list.add(ad);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
}
