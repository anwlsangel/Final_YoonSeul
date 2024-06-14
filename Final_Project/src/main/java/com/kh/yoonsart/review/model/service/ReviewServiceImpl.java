package com.kh.yoonsart.review.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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




	
}
