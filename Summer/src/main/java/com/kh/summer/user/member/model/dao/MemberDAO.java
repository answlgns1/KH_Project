package com.kh.summer.user.member.model.dao;

import java.util.HashMap;

import com.kh.summer.user.member.model.vo.Member;

public interface MemberDAO {

	/**
	 * 회원 추가
	 * @param member
	 * @return int
	 */
	int insertMember(Member member);

	/**
	 * 회원 상세 조회
	 * @param userId
	 * @return Member
	 */
	Member selectOneMember(String userId);

	/**
	 * 회원정보 수정
	 * @param member
	 * @return int
	 */
	int updateMember(Member member);

	/**
	 * 회원 삭제
	 * @param userId
	 * @return int
	 */
	int deleteMember(String userId);
	
	/**
	 * 아이디 중복 체크
	 * @param hmap
	 * @return int
	 */
	int checkIdDuplicate(HashMap<String, Object> hmap);

	/**
	 * 닉네임 중복 체크
	 * @param hmap
	 * @return int
	 */
	int nickNameDupChk(HashMap<String, Object> hmap);
	
	/**
	 * 이메일 중복 체크
	 * @param hmap
	 * @return int
	 */
	int emailDupChk(HashMap<String, Object> hmap);

	Member findID(Member member);

	int findInfoCheck(Member member);

	int changePW(Member member);

}