package com.kh.yoonsart.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.member.model.vo.Member;

// 0603 member DAO 작성 - 무진
// 0603 로그인 메소드 작성 - 무진
@Repository
public class MemberDao {

	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
			
			return sqlSession.selectOne("memberMapper.loginMember", m);
		}
}
