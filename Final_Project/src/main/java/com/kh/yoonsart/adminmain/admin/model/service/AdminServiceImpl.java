package com.kh.yoonsart.adminmain.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yoonsart.adminmain.admin.model.dao.AdminDao;
import com.kh.yoonsart.adminmain.admin.model.vo.AdminCount;

@Service
public class AdminServiceImpl  implements AdminService{	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public AdminDao adminDao;
	
	@Override
	public int selectMemberCount() {
		
		return adminDao.selectMemberCount(sqlSession);
	}

	@Override
	public ArrayList<Integer> admemberAge() {
		
		return adminDao.admemberAge(sqlSession);
	}

	@Override
	public ArrayList<AdminCount> enrollMonth() {
		
		return adminDao.enrollMonth(sqlSession);
	}

	@Override
	public ArrayList<AdminCount> concertSales() {
		
		return adminDao.concertSales(sqlSession);
	}

	
	
	
}
