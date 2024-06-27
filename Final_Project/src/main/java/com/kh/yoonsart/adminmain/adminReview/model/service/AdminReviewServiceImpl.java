package com.kh.yoonsart.adminmain.adminReview.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yoonsart.adminmain.adminReview.model.dao.AdminReviewDao;
import com.kh.yoonsart.review.model.vo.Review;

@Service
public class AdminReviewServiceImpl  implements AdminReviewService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public AdminReviewDao adminreviewDao;	
	
	@Override
	public ArrayList<Review> AdReviewList() {

		return adminreviewDao.AdReviewList(sqlSession);
	}

	// 리뷰 상세조회
	@Override
	public Review adreviewDetail(int rno) {
		
		return adminreviewDao.adreviewDetail(sqlSession, rno);
	}
	
	// 리뷰 삭제
	@Override
	public int AdReviewDelete(Review r) {
		
		return adminreviewDao.AdReviewDelete(sqlSession, r);
	}

	// 리뷰 활성화
	@Override
	public int AdReviewUpdate(Review r) {
		
		return adminreviewDao.AdReviewUpdate(sqlSession, r);
	}

}
