package com.kh.yoonsart.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.review.model.dao.ReviewDao;
import com.kh.yoonsart.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public ReviewDao reviewDao;
	
	@Override
	public int insertReview(Review review) {
			
		return reviewDao.insertReview(sqlSession, review); 
	}

	@Override
	public int deleteReview(int reviewId) {
		
		return reviewDao.deleteReview(sqlSession, reviewId);
	}

	@Override
	public int updateReview(Review r) {
		
		return reviewDao.updateReview(sqlSession, r);
	}

	@Override
	public int selectReviewCount(int cno) {
		
		return reviewDao.selectReviewCount(sqlSession, cno);
	}

	@Override
	public ArrayList<Review> selectReviewList(int cno, PageInfo pi) {
		
		return reviewDao.selectReviewList(sqlSession, cno, pi);
	}




	
}
