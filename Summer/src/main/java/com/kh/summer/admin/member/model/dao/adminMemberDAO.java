package com.kh.summer.admin.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.member.model.vo.Member;

public interface adminMemberDAO {

	List<Map<String, String>> selectMemberList(int cPage, int numPerPage);

	int selectMemberTotalContents();

	int membershipUpdate(String userId, String membership);

	String selectMembership(String userId);

	int mStatusUpdate(String userId, String mstatus);

	String selectMstatus(String userId);

	List<Map<String, String>> selectAdminList(int cPage, int numPerPage);

	int selectAdminTotalContents();

	List<Map<String, String>> selectMemberSearch(int cPage, int numPerPage, Map<String, String> searchMap);

	int selectMemberSearchCount(Map<String, String> searchMap);

	List<Map<String, String>> selectAdminSearch(int cPage, int numPerPage, Map<String, String> searchMap);

	int selectAdminSearchCount(Map<String, String> searchMap);

	int insertAdmin(Member member);

}
