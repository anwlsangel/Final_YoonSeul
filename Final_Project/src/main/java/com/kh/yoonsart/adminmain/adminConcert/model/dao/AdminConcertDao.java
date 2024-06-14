package com.kh.yoonsart.adminmain.adminConcert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.concert.model.vo.Concert;

@Repository
public class AdminConcertDao {

	public ArrayList<Concert> adSelectList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("concertMapper.adSelectList");
	}

	public Concert adConcertDetail(SqlSessionTemplate sqlSession, int cno) {

		return sqlSession.selectOne("concertMapper.adConcertDetail", cno);
	}

	public int adUpdateConcert(SqlSessionTemplate sqlSession, Concert c) {
		
	    // System.out.println("Concert: " + c);	    
		// System.out.println("dao야");
		return sqlSession.update("concertMapper.adUpdateConcert", c);
		
	}

}
