package com.kh.yoonsart.adminmain.adminConcert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.adminmain.adminConcert.model.vo.AdminConcert;

@Repository
public class AdminConcertDao {

	public ArrayList<AdminConcert> adSelectList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("concertMapper.adSelectList");
	}

}
