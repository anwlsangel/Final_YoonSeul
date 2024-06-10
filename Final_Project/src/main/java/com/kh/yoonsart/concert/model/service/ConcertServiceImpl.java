package com.kh.yoonsart.concert.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yoonsart.concert.model.dao.ConcertDao;
import com.kh.yoonsart.concert.model.vo.Concert;

@Service
public class ConcertServiceImpl implements ConcertService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public ConcertDao concertDao;
	
	@Override
	public ArrayList<Concert> selectList() {

		return concertDao.selectList(sqlSession);
	}

	@Override
	public ArrayList<Concert> filterSelectList(String category) {

		return concertDao.filterSelectList(sqlSession, category);
	}

	@Override
	public ArrayList<Concert> selectListAll() {

		return concertDao.selectListAll(sqlSession);
	}
	
	

}
