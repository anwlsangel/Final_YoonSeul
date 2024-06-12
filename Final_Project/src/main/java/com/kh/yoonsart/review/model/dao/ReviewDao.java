package com.kh.yoonsart.review.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.review.model.vo.Review;

@Repository
public class ReviewDao {

	public int insertReview(SqlSessionTemplate sqlSession, Review review) {
		
		return sqlSession.insert("reviewMapper.insertReview", review);
	}

}
