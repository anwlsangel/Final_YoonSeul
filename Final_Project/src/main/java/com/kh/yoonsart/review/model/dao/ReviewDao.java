package com.kh.yoonsart.review.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.review.model.vo.Review;

@Repository
public class ReviewDao {

	public int insertReview(SqlSessionTemplate sqlSession, Review review) {
		
		return sqlSession.insert("reviewMapper.insertReview", review);
	}
	
	public int deleteReview(SqlSessionTemplate sqlSession, int reviewId) {
		
		return sqlSession.update("reviewMapper.deleteReview", reviewId);
	}

	public int updateReview(SqlSessionTemplate sqlSession, Review r) {

		System.out.println("dao test");
		return sqlSession.update("reviewMapper.updateReview", r);
	}

	public int selectReviewCount(SqlSessionTemplate sqlSession, int cno) {
		
		return sqlSession.selectOne("reviewMapper.selectCount", cno);
	}

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, int cno, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewList", cno, rowBounds);
	}

	
	
}
