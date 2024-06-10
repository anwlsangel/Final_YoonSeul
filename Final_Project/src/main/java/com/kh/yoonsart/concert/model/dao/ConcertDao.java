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
	

}
