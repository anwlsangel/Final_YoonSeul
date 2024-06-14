package com.kh.yoonsart.adminmain.adminConcert.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.yoonsart.adminmain.adminConcert.model.dao.AdminConcertDao;
import com.kh.yoonsart.concert.model.vo.Concert;

@Service
public class AdminConcertServiceImpl implements AdminConcertService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public AdminConcertDao adminConcertDao;

	@Override
	public ArrayList<Concert> adSelectList() {

		return adminConcertDao.adSelectList(sqlSession);
	}

	@Override
	public Concert adConcertDetail(int cno) {

		return adminConcertDao.adConcertDetail(sqlSession, cno);
	}

	@Transactional
	@Override
	public int adUpdateConcert(Concert c) {
		
		return adminConcertDao.adUpdateConcert(sqlSession, c);
	}

}
