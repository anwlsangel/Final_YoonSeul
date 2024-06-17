package com.kh.yoonsart.adminmain.adminMember.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.member.model.vo.Member;

@Repository
public class AdminMemberDao {

	public ArrayList<Member> adSelectList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("memberMapper.adSelectList");
	}

	public Member adMemberDetail(SqlSessionTemplate sqlSession, String userId) {
	    return sqlSession.selectOne("memberMapper.adMemberDetail", userId);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
        return sqlSession.update("memberMapper.updateMember", m);
    }


}
