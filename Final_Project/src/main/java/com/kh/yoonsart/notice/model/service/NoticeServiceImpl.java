package com.kh.yoonsart.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.notice.model.dao.NoticeDao;
import com.kh.yoonsart.notice.model.vo.Notice;
import com.kh.yoonsart.review.model.vo.Review;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public int selectListCount() {
		
		return noticeDao.selectListCount(sqlSession);
	}
	
	@Override
	public int selectSearchListCount(String keyword) {
		
		return noticeDao.selectSearchListCount(sqlSession, keyword);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		
		return noticeDao.selectList(sqlSession, pi);
	}
	
	@Override
	public ArrayList<Notice> selectSearchList(PageInfo pi, String keyword) {
		
		return noticeDao.selectSearchList(sqlSession, pi, keyword);
	}

	@Override
	@Transactional
	public int insertNotice(Notice n) {
		
		return noticeDao.insertNotice(sqlSession, n);
	}

	@Override
	@Transactional
	public int increaseCount(int noticeNo) {
		
		return noticeDao.increaseCount(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		
		return noticeDao.selectNotice(sqlSession, noticeNo);
	}

	@Override
	@Transactional
	public int deleteNotice(int noticeNo) {
		
		return noticeDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	@Transactional
	public int restoreNotice(int noticeNo) {
		
		return noticeDao.restoreNotice(sqlSession, noticeNo);
	}

	@Override
	@Transactional
	public int updateNotice(Notice n) {
		
		return noticeDao.updateNotice(sqlSession, n);
	}
	
	@Override
	@Transactional
	public int deleteNoticeImg(int noticeNo) {
		
		return noticeDao.deleteNoticeImg(sqlSession, noticeNo);
	}

	@Override
	public ArrayList<Notice> selectMainNoticeList() {
		return noticeDao.selectMainNoticeList(sqlSession);
	}

	@Override
	public ArrayList<Notice> adNoticeList() {

		return noticeDao.adNoticeList(sqlSession);
	}
	
	@Override
	public Notice adSelectNotice(int noticeNo) {
		
		return noticeDao.adSelectNotice(sqlSession, noticeNo);
	}
	
}
