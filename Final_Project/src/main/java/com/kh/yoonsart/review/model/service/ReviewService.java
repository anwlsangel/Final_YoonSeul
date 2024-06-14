package com.kh.yoonsart.review.model.service;

import com.kh.yoonsart.review.model.vo.Review;

public interface ReviewService {

	int insertReview(Review review);

	int deleteReview(int rno);

	int updateReview(Review r);
	
	
}
