package com.kh.yoonsart.adminmain.adminReview.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.review.model.vo.Review;

public interface AdminReviewService {

	ArrayList<Review> AdReviewList();

	int AdReviewDelete(Review r);

	Review adreviewDetail(int rno);

	int AdReviewUpdate(Review r);

}
