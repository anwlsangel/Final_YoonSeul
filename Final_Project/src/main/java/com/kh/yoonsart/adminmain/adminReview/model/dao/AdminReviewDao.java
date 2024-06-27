package com.kh.yoonsart.adminmain.adminReview.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.review.model.vo.Review;

@Repository
public class AdminReviewDao {

	public ArrayList<Review> AdReviewList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reviewMapper.AdReviewList");
	}
	
	// 리뷰 상세조회
	public Review adreviewDetail(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectOne("reviewMapper.adreviewDetail", rno);
	}

	// 리뷰 삭제
	public int AdReviewDelete(SqlSessionTemplate sqlSession, Review r) {
	
		return sqlSession.update("reviewMapper.AdReviewDelete", r);
	}


}
