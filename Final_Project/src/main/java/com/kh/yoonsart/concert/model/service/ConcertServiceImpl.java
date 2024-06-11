package com.kh.yoonsart.concert.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.concert.model.dao.ConcertDao;
import com.kh.yoonsart.concert.model.vo.Concert;

@Service
public class ConcertServiceImpl implements ConcertService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public ConcertDao concertDao;
	
	@Override
	public ArrayList<Concert> selectList(String category, String sort) {

		return concertDao.selectList(sqlSession, category, sort);
	}

	@Override
	public ArrayList<Concert> searchList(String keyword, String category, String sort) {

		return concertDao.searchList(sqlSession, keyword, category, sort);
	}

	@Override
	public Concert concertDetail(int cno) {

		return concertDao.concertDetail(sqlSession, cno);
	}

	@Override
	public ArrayList<QNA> selectQnaList(int cno) {

		return concertDao.selectQnaList(sqlSession, cno);
	}
	

}
