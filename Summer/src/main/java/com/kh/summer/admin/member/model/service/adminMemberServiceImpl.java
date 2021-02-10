package com.kh.summer.admin.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.admin.member.model.dao.adminMemberDAO;
import com.kh.summer.user.member.model.vo.Member;

@Service
public class adminMemberServiceImpl implements adminMemberService {

	@Autowired
	adminMemberDAO adminmemberDAO;
	
	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		return adminmemberDAO.selectMemberList(cPage, numPerPage);
	}

	@Override
	public int selectMemberTotalContents() {
		return adminmemberDAO.selectMemberTotalContents();
	}

	@Override
	public int membershipUpdate(String userId, String membership) {
		return adminmemberDAO.membershipUpdate(userId, membership);
	}

	@Override
	public String selectMembership(String userId) {
		return adminmemberDAO.selectMembership(userId);
	}

	@Override
	public int mStatusUpdate(String userId, String mstatus) {
		return adminmemberDAO.mStatusUpdate(userId, mstatus);
	}
	
	@Override
	public String selectMstatus(String userId) {
		return adminmemberDAO.selectMstatus(userId);
	}

	@Override
	public List<Map<String, String>> selectAdminList(int cPage, int numPerPage) {
		return adminmemberDAO.selectAdminList(cPage, numPerPage);
	}

	@Override
	public int selectAdminTotalContents() {
		return adminmemberDAO.selectAdminTotalContents();
	}

	@Override
	public List<Map<String, String>> selectMemberSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		return adminmemberDAO.selectMemberSearch(cPage, numPerPage, searchMap);
	}

	@Override
	public int selectMemberSearchCount(Map<String, String> searchMap) {
		return adminmemberDAO.selectMemberSearchCount(searchMap);
	}

	@Override
	public List<Map<String, String>> selectAdminSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		return adminmemberDAO.selectAdminSearch(cPage, numPerPage, searchMap);
	}

	@Override
	public int selectAdminSearchCount(Map<String, String> searchMap) {
		return adminmemberDAO.selectAdminSearchCount(searchMap);
	}

	@Override
	public int insertAdmin(Member member) {
		return adminmemberDAO.insertAdmin(member);
	}

}
