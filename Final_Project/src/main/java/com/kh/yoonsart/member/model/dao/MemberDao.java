package com.kh.yoonsart.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.member.model.vo.Member;
import com.kh.yoonsart.payment.model.vo.BuyList;

// 0603 member DAO 작성 - 무진

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "memberMapper.";

	// 0603 로그인 메소드 작성 - 무진
	public Member loginMember(Member m) {
			
			return sqlSession.selectOne("memberMapper.loginMember", m);
		}
	
	// 회원 가입용 메소드 DAO 0604 - 무진
	public int insertMember(Member m) {
			
			return sqlSession.insert("memberMapper.insertMember", m);
			
		}
	
	// MemberDao 아이디 체크용 메소드 0604 - 무진
	public int idCheck(String userId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}
	
	// MemberDao 회원정보 수정용 메소드 0604 - 무진
	public int updateMember(Member m) {
		
		  return sqlSession.update("memberMapper.updateMember", m);
	}

	// MemberDao 전화번호 중복 검사용 메소드 0610 - 무진
	public int checkPhone(String phone) {
		
		return sqlSession.selectOne("memberMapper.checkPhone", phone);
	}

	// MemberDao 이메일 중복 검사용 메소드 0610 - 무진
	public int checkEmail(String email) {
		
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}

	public int deleteMember( String userId) {
		
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	public String findIdByNameAndPhone(String userName, String phone) {
		
		 Map<String, String> params = new HashMap<>();
	        params.put("userName", userName);
	        params.put("phone", phone);
	        return sqlSession.selectOne(NAMESPACE + "findIdByNameAndPhone", params);
	}

	public int updatePasswordByEmail(String email, String newPwd) {
		
		 Map<String, String> params = new HashMap<>();
	        params.put("email", email);
	        params.put("newPwd", newPwd);
	        return sqlSession.update(NAMESPACE + "updatePasswordByEmail", params);
	}
	
	public int selectTicketCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.selectTicketCount", userId);
	}

	public ArrayList<BuyList> selectMyTicketList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMyTicketList", userId, rowBounds);
	}
	
	public Member findMemberByIdAndEmailAndName(SqlSessionTemplate sqlSession,String userId, String email, String userName) {
	    Map<String, String> params = new HashMap<>();
	    params.put("userId", userId);
	    params.put("email", email);
	    params.put("userName", userName);
	    return sqlSession.selectOne(NAMESPACE + "findMemberByIdAndEmailAndName", params);
	     
	}
	
	public int updatePassword(SqlSessionTemplate sqlSession, Map<String, String> param) {
	    	return sqlSession.update("memberMapper.updatePassword", param);
	    }

}
