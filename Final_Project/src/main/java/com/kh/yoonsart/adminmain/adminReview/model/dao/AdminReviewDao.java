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

}
