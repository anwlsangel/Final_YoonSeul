package com.kh.yoonsart.QNA.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		
		return qnaDao.selectList(sqlSession, pi);
	}

	@Override
	@Transactional
	public int insertQNA(QNA q) {
		return qnaDao.insertQNA(sqlSession, q);
	}

	@Override
	public QNA selecteQNA(int qnaId) {
		
		return qnaDao.selecteQNA(sqlSession, qnaId);
	}

	@Override
	public int deleteQNA(int qnaId) {
		
		return qnaDao.deleteQNA(sqlSession, qnaId);
	}

	@Override
	@Transactional
	public int updateQNA(QNA q) {
		
		return qnaDao.updateBoard(sqlSession, q);
	}
	
	// 답변 작성
	@Override
	@Transactional
	public int insertAnswer(QNA q) {
		
		return qnaDao.insertAnswer(sqlSession, q);
	}

	// 답변 조회
	@Override
	public QNA selectAnswer(int qnaId) {
		
		return qnaDao.selectAnswer(sqlSession, qnaId);
	}

	@Override
	public ArrayList<QNA> selectQnaCount(int cno, PageInfo pi) {
		
		return qnaDao.selectQnaList(sqlSession, cno, pi);
	}

	@Override
	public int selectQnaCount(int cno) {

		return qnaDao.selectQnaCount(sqlSession, cno);
	}
	
	@Override
	public ArrayList<QNA> selectQnaList(int cno, PageInfo pi) {

		return qnaDao.selectQnaList(sqlSession, cno, pi);
	}

	
	
}
