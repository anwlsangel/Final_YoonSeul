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
	        // 중복된 키가 존재할 경우 무시
	        return 0;
	    }
	}
	 public int deleteWishlist(SqlSessionTemplate sqlSession, Map<String, Object> map) {
	        return sqlSession.delete("concertMapper.deleteWishlist", map);
	    }

	public int selectQnaCount(SqlSessionTemplate sqlSession, int cno) {
	
		return sqlSession.selectOne("qnaMapper.selectQnaCount", cno);
	}

	public int selectStar(SqlSessionTemplate sqlSession, int cno) {
		
		// System.out.println("디에오");		
		return sqlSession.selectOne("reviewMapper.selectStar", cno);
	}
	
	// 공연 좋아요 갯수 표시용 - 0618 무진
	public int selectWishlistCount(SqlSessionTemplate sqlSession, int concertId) {
        return sqlSession.selectOne("concertMapper.selectWishlistCount", concertId);
    }
	
	
}
