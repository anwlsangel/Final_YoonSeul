package com.kh.yoonsart.QNA.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yoonsart.QNA.model.dao.QNADao;
import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.common.model.vo.PageInfo;

@Service
public class QNAServiceImpl implements QNAService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private QNADao qnaDao;
		
	@Override
	public int selectListCount() {
		
		return qnaDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<QNA> selectList(PageInfo pi) {
		
		return null;
	}

	@Override
	public int insertQNA(QNA q) {
		
		return 0;
	}

	@Override
	public QNA selectlQNA(int qnaId) {
		
		return null;
	}

	@Override
	public int deleteQNA(int qnaId) {
		
		return 0;
	}

	@Override
	public int updateQNA(QNA q) {
		
		return 0;
	}
	
}
