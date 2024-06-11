package com.kh.yoonsart.member.model.service;

import com.kh.yoonsart.member.model.vo.Member;

// 인터 페이스 기본 메소드 틀 구성 0603 - 무진
// 로그인, 회원가입, 회원 정보 수정, 회원 탈퇴, 아이디 중복 체크
public interface MemberService {

	// 로그인 서비스(select)
		/* public abstract */
		Member loginMember(Member m);
		
		// 회원가입 서비스 (insert)
		int insertMember(Member m);
		
		// 회원정보 수정 서비스 (update)
		int updateMember(Member m);
		
		// 회원탈퇴 서비스(update)
		int deleteMember(String userId);
		
		// 아이디 중복체크 서비스(select) - ajax
		int idCheck(String checkId);
		
}
