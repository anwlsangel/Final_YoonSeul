package com.kh.yoonsart.concert.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.concert.model.vo.ConcertDate;
import com.kh.yoonsart.review.model.vo.Review;

@Repository
public class ConcertDao {

	public ArrayList<Concert> selectList(SqlSessionTemplate sqlSession, String category, String sort) {

		Map<String, Object> params = new HashMap<>();
        params.put("category", category);
        params.put("sort", sort);
		
		return (ArrayList)sqlSession.selectList("concertMapper.selectList", params);
		
	}

	public ArrayList<Concert> searchList(SqlSessionTemplate sqlSession, String keyword, String category, String sort) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		params.put("category", category);
        params.put("sort", sort);
        
		return (ArrayList)sqlSession.selectList("concertMapper.searchList", params); 
		
		
	}

	public Concert concertDetail(SqlSessionTemplate sqlSession, int cno) {
		
		return sqlSession.selectOne("concertMapper.concertDetail", cno);
	}

	public ArrayList<QNA> selectQnaList(SqlSessionTemplate sqlSession, int cno) {
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectQnaList", cno);
	}

	public ArrayList<Review> selectReview(SqlSessionTemplate sqlSession, int cno) {
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReview", cno);
	}

	public int selectCount(SqlSessionTemplate sqlSession, int cno) {
		
		return sqlSession.selectOne("reviewMapper.selectCount", cno);
	}
	
	public int insertWishlist(SqlSessionTemplate sqlSession, Map<String, Object> map) {
	    try {
	        return sqlSession.insert("concertMapper.insertWishlist", map);
	    } catch (Exception e) {
	        return 0;  // 중복 키 예외를 무시합니다.
	    }
	}

	public int deleteWishlist(SqlSessionTemplate sqlSession, Map<String, Object> map) {
	    return sqlSession.delete("concertMapper.deleteWishlist", map);
	}
	
	// 관심공연 확인용 쿼리문
	public int isInWishlist(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
	    return sqlSession.selectOne("concertMapper.isInWishlist", map);
	}


	public int selectQnaCount(SqlSessionTemplate sqlSession, int cno) {
	
		return sqlSession.selectOne("qnaMapper.selectQnaCount", cno);
	}

	public int selectStar(SqlSessionTemplate sqlSession, int cno) {
		
		Integer starRating = sqlSession.selectOne("reviewMapper.selectStar", cno);
	    return starRating != null ? starRating : 0; // null 값이 반환되면 0을 반환
	}
	
	// 공연 좋아요 갯수 표시용 - 0618 무진
	public int selectWishlistCount(SqlSessionTemplate sqlSession, int concertId) {
        return sqlSession.selectOne("concertMapper.selectWishlistCount", concertId);
    }

	public int selectHoleStatus(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.selectOne("concertMapper.selectHoleStatus", cno);
	}

	public int selectSeatCount(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.selectOne("concertMapper.selectSeatCount", cno);
	}

	public ArrayList<ConcertDate> selectDateList(SqlSessionTemplate sqlSession, int cno, String dateString) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("concertId", cno);
		params.put("dateString", dateString);
		
		System.out.println((ArrayList)sqlSession.selectList("concertMapper.selectDateList", params));
		
		return (ArrayList)sqlSession.selectList("concertMapper.selectDateList", params);
	}

	public ArrayList<Concert> selectMainTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectMainTopList");
	}

	public ArrayList<Concert> selectTopConcerts(SqlSessionTemplate sqlSession, String category) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectTopConcerts", category);
	}

	public ArrayList<Concert> selectOpenConcerts(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectOpenConcerts");
	}
	
	
	
}
