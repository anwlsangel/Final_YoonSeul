package com.kh.yoonsart.concert.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.review.model.vo.Review;

public interface ConcertService {

	ArrayList<Concert> selectList(String category, String sort);

	ArrayList<Concert> searchList(String keyword, String category, String sort);

	Concert concertDetail(int concertId);
	
	ArrayList<QNA> selectQnaList(int cno);

	ArrayList<Review> selectReview(int cno);

	int selectCount(int cno);	
	
	int addWishlist(String userId, int concertId);
	int removeWishlist(String userId, int concertId);
}
