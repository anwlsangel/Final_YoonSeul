package com.kh.yoonsart.member.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.member.model.vo.Member;
import com.kh.yoonsart.payment.model.vo.BuyList;

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
	// 전화번호 중복체크 서비스(select) - ajax
	int checkPhone(String phone);
	// 이메일 중복체크 서비스(select) - ajax
	int checkEmail(String email);
	// 아이디 찾기 기능
	String findIdByNameAndPhone(String userName, String phone);
	// 비밀번호 초기화 기능
	boolean resetPassword(String email, String newPwd);
	// 비밀번호 변경용 
	 int updatePassword(String userId, String encPwd);
	//예매내역 수 조회
	int selectTicketCount(String userId);
	//ajax예매내역조회
	ArrayList<BuyList> selectMyTicketList(String userId, PageInfo pi);	
	
	Member findMemberByIdAndEmailAndName(String userId, String email, String userName);

	ArrayList<Concert> selectWishList(String userId, PageInfo pi);

	int selectMyWishList(String userId);
}
