package com.kh.yoonsart.adminmain.adminConcert.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.yoonsart.adminmain.adminConcert.model.dao.AdminConcertDao;
import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.concert.model.vo.ConcertDateByKwon;
import com.kh.yoonsart.payment.model.vo.Tickets;

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

	// 용환
	@Override
	public ArrayList<ConcertDateByKwon> getScheduleWihtHoleName(HashMap<String,String> m) {
		return adminConcertDao.getScheduleWihtHoleName(sqlSession, m);
	}

	@Override
	@Transactional
	public int insertConcertInfo(Concert c, ArrayList<String> list) {
		int result = 0;
		if(adminConcertDao.insertConcertInfo(sqlSession, c)>0) {
			if(adminConcertDao.insertConcertDate(sqlSession, list)>0) {
				int concertId = adminConcertDao.getLastConcertId(sqlSession);
				if(adminConcertDao.updateConsertStartEnd(sqlSession,concertId)>0) {
					result = 1;
				}
			}
		}
		return result;		
	}

	@Override
	public ArrayList<String> getHoleList() {		
		return adminConcertDao.getHoleList(sqlSession);
	}

	@Override
	public int adDeleteConcert() {
		return adminConcertDao.adDeleteConcert(sqlSession);
	}

	@Override
	public Tickets ticketValidation(String qr) {
		
		return adminConcertDao.ticketValidation(sqlSession, qr);
	}

	@Override
	@Transactional
	public int changeStatusTickt(String qr) {
		
		return adminConcertDao.changeStatusTickt(sqlSession,qr);
	}

	@Override
	public Concert ConcertDetail(String id) {
		return adminConcertDao.ConcertDetail(sqlSession, id);
	}
	
	@Override
	@Transactional
	public int insertConcertDateById(HashMap map) {
		return adminConcertDao.insertConcertDateById(sqlSession, map);
	}
}
