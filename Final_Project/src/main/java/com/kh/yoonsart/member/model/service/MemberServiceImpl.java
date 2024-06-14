package com.kh.yoonsart.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.member.model.dao.MemberDao;
import com.kh.yoonsart.member.model.vo.Member;
import com.kh.yoonsart.payment.model.vo.BuyList;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MemberDao memberDao;

	@Override
	public Member loginMember(Member m) {

		return memberDao.loginMember(m);

	}

	@Override
	@Transactional
	public int insertMember(Member m) {
		// 회원가입용 서비스 MemberServiceImpl 0604 - 무진
		return memberDao.insertMember(m);
	}

	@Override
	@Transactional
	public int updateMember(Member m) {
		// MemberServiceImpl 회원 정보 수정용 서비스 0604 - 무진
		return memberDao.updateMember(m);
	}

	@Override
	@Transactional
	public int deleteMember(String userId) {

		return memberDao.deleteMember(userId);

	}

	// MemberServiceImpl 아이디 중복 검사용 서비스 0604 - 무진
	// MemberServiceImpl idCheck() 변경 아이디 중복 검사 0605 - 무진
	@Override
	public int idCheck(String userId) {

		return memberDao.idCheck(userId);
	}

	// MemberServiceImpl 전화번호 중복 검사용 메소드 0610 - 무진
	@Override
	public int checkPhone(String phone) {

		return memberDao.checkPhone(phone);
	}

	// MemberServiceImpl 이메일 중복 검사용 메소드 0610 - 무진
	@Override
	public int checkEmail(String email) {

		return memberDao.checkEmail(email);
	}

	@Override
	public String findIdByNameAndPhone(String userName, String phone) {

		return memberDao.findIdByNameAndPhone(userName, phone);
	}

	@Override
	public boolean resetPassword(String email, String newPwd) {

		int result = memberDao.updatePasswordByEmail(email, newPwd);
		return result > 0;
	}

	public int selectTicketCount(String userId) {
		return memberDao.selectTicketCount(sqlSession, userId);
	}
	
	@Override
	public int updatePassword(String userId, String encPwd) {
	    Map<String, String> param = new HashMap<>();
	    param.put("userId", userId);
	    param.put("encPwd", encPwd);
	    return memberDao.updatePassword(sqlSession,param);
	}
	
	@Override
	public ArrayList<BuyList> selectMyTicketList(String userId, PageInfo pi) {
		if (userId == null) {
			return null;
		} else {
			return memberDao.selectMyTicketList(sqlSession, userId, pi);
		}
	}
	@Override
	public Member findMemberByIdAndEmailAndName(String userId, String email, String userName) {
	   return memberDao.findMemberByIdAndEmailAndName(sqlSession,userId, email, userName);
	   
	}

	@Override
	public ArrayList<Concert> selectWishList(String userId) {

		return memberDao.selectWishList(sqlSession, userId);
	}
}
