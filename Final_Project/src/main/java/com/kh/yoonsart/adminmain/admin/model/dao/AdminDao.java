package com.kh.yoonsart.adminmain.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.adminmain.admin.model.vo.AdminCount;

// 0619 수정
@Repository
public class AdminDao {

	public int selectMemberCount(SqlSession sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectMemberCount"); 
	}

	public ArrayList<Integer> admemberAge(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.admemberAge"); 
	}

	public ArrayList<AdminCount> enrollMonth(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.enrollMonth"); 
	}

	public ArrayList<AdminCount> concertSales(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.salesMonth"); 
	}
	
	
	
	

}
