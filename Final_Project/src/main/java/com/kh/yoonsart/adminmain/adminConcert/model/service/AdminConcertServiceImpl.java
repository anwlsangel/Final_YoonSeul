package com.kh.yoonsart.adminmain.adminConcert.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yoonsart.adminmain.adminConcert.model.dao.AdminConcertDao;
import com.kh.yoonsart.adminmain.adminConcert.model.vo.AdminConcert;

@Service
public class AdminConcertServiceImpl implements AdminConcertService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public AdminConcertDao adminConcertDao;

	@Override
	public ArrayList<AdminConcert> adSelectList() {

		return adminConcertDao.adSelectList(sqlSession);
	}

}
