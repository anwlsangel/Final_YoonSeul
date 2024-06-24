package com.kh.yoonsart.lostfind.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.lostfind.model.dao.LostfindDao;
import com.kh.yoonsart.lostfind.model.vo.LostImg;
import com.kh.yoonsart.lostfind.model.vo.Lostfind;


@Service
public class LostfindServiceImpl implements LostfindService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private LostfindDao lostfindDao;
	
	@Override
	public int selectListCount() {
		
		return lostfindDao.selectListCount(sqlSession);
	}
	
	@Override
	public int selectSearchListCount(String keyword) {
		
		return lostfindDao.selectSearchListCount(sqlSession, keyword);
	}

	@Override
	public ArrayList<Lostfind> selectList(PageInfo pi) {
		
		return lostfindDao.selectList(sqlSession, pi);
	}
	
	@Override
	public ArrayList<Lostfind> selectSearchList(PageInfo pi, String keyword) {
		
		return lostfindDao.selectSearchList(sqlSession, pi, keyword);
	}

	@Override
	@Transactional
	public int insertLostfind(Lostfind l) {
		
		return lostfindDao.insertLostfind(sqlSession, l);
	}
	
	@Override
	@Transactional
	public int insertLostImg(LostImg li) {
		
		return lostfindDao.insertLostImg(sqlSession, li);
	}

	@Override
	@Transactional
	public int increaseCount(int lostNo) {
		
		return lostfindDao.increaseCount(sqlSession, lostNo);
	}

	@Override
	public Lostfind selectLostfind(int lostNo) {
		
		return lostfindDao.selectLostfind(sqlSession, lostNo);
	}
	
	@Override
	public ArrayList<LostImg> selectLostImg(int lostNo) {
		
		return lostfindDao.selectLostImg(sqlSession, lostNo);
	}

	@Override
	@Transactional
	public int deleteLostfind(int lostNo) {
		
		return lostfindDao.deleteLostfind(sqlSession, lostNo);
	}

	@Override
	@Transactional
	public int updateLostfind(Lostfind l) {
		
		return lostfindDao.updateLostfind(sqlSession, l);
	}
	
	@Override
	@Transactional
	public int updateLostImg(LostImg li) {
		
		return lostfindDao.updateLostImg(sqlSession, li);
	}
	
	@Override
	public int selectUpLostNo() {
		
		return lostfindDao.selectUpLostNo(sqlSession);
	}
	
	@Override
	public int deleteLostImg(int lostNo) {
		
		return lostfindDao.deleteLostImg(sqlSession, lostNo);
	}

	@Override
	public int deleteExImg(List<LostImg> list) {
		
		return lostfindDao.deleteExImg(sqlSession, list);
	}



}
