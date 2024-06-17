package com.kh.yoonsart.adminmain.adminMember.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.member.model.vo.Member;

public interface AdminMemberService {
	
	// 회원 전체 조회용
	ArrayList<Member> adSelectList();
	
	// 회원 상세보기
	Member adMemberDetail(String userId);

	int updateMember(Member m); // 이미 존재하는 메소드 사용


}
