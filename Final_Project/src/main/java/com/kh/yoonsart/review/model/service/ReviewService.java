package com.kh.yoonsart.review.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.review.model.vo.Review;

public interface ReviewService {

	int insertReview(Review review);

	int deleteReview(int rno);

	int updateReview(Review r);

	int selectReviewCount(int cno);

	ArrayList<Review> selectReviewList(int cno, PageInfo pi);	
	
}
