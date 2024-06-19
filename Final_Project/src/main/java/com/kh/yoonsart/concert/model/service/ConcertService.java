package com.kh.yoonsart.concert.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.concert.model.vo.ConcertDate;
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

	int selectQnaCount(int qno);

	int selectStar(int cno);
	// 공연 좋아요 갯수 표시용 - 0618 무진
	int selectWishlistCount(int concertId);

	int selectHoleStatus(int cno);

	int selectSeatCount(int cno);

	ArrayList<ConcertDate> selectDateList(int cno, String dateString);

	boolean isInWishlist(String userId, int concertId);
}
