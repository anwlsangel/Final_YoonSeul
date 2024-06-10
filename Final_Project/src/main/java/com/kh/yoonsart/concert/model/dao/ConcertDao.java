package com.kh.yoonsart.concert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.concert.model.vo.Concert;

@Repository
public class ConcertDao {

	public ArrayList<Concert> selectList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("concertMapper.selectList");
		
	}

	public ArrayList<Concert> filterSelectList(SqlSessionTemplate sqlSession, String category) {

		return (ArrayList)sqlSession.selectList("concertMapper.filterSelectList", category);
		
	}

	public ArrayList<Concert> selectListAll(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("concertMapper.selectList");
	}
	
	

}
