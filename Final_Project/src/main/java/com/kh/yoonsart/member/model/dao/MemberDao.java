package com.kh.yoonsart.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.member.model.vo.Member;

// 0603 member DAO 작성 - 무진

@Repository
public class MemberDao {

	// 0603 로그인 메소드 작성 - 무진
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
			
			return sqlSession.selectOne("memberMapper.loginMember", m);
		}
	
	// 회원 가입용 메소드 DAO 0604 - 무진
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
			
			return sqlSession.insert("memberMapper.insertMember", m);
			
		}
	
	// MemberDao 아이디 체크용 메소드 0604 - 무진
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	// MemberDao 회원정보 수정용 메소드 0604 - 무진
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		  return sqlSession.update("memberMapper.updateMember", m);
	}
}
