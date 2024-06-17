package com.kh.yoonsart.adminmain.adminQna.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.adminmain.adminQna.model.dao.AdminQnaDao;

@Service
public class AdminQnaServiceImpl implements AdminQnaService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public AdminQnaDao adminQnaDao;
	
	@Override
	public ArrayList<QNA> adQnaService() {
		
		return adminQnaDao.adQnaService(sqlSession);
	}

}
