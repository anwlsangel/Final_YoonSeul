package com.kh.yoonsart.concert.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.concert.model.vo.Concert;

@Repository
public class ConcertDao {

	public ArrayList<Concert> selectList(SqlSessionTemplate sqlSession, String category, String sort) {

		Map<String, Object> params = new HashMap<>();
        params.put("category", category);
        params.put("sort", sort);
		
		return (ArrayList)sqlSession.selectList("concertMapper.selectList", params);
		
	}

	public ArrayList<Concert> searchList(SqlSessionTemplate sqlSession, String keyword, String category, String sort) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		params.put("category", category);
        params.put("sort", sort);
		
        System.out.println((ArrayList)sqlSession.selectList("concertMapper.searchList", params));
        
		return (ArrayList)sqlSession.selectList("concertMapper.searchList", params); 
		
		
	}

	public Concert concertDetail(SqlSessionTemplate sqlSession, int cno) {
		
		// System.out.println("여기까진 오지?" + cno);

		return sqlSession.selectOne("concertMapper.concertDetail", cno);
	}
	

}
