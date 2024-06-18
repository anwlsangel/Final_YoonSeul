package com.kh.yoonsart.concert.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.concert.model.dao.ConcertDao;
import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.review.model.vo.Review;

@Service
public class ConcertServiceImpl implements ConcertService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public ConcertDao concertDao;
	
	@Override
	public ArrayList<Concert> selectList(String category, String sort) {

		return concertDao.selectList(sqlSession, category, sort);
	}

	@Override
	public ArrayList<Concert> searchList(String keyword, String category, String sort) {

		return concertDao.searchList(sqlSession, keyword, category, sort);
	}

	@Override
	public Concert concertDetail(int cno) {

		return concertDao.concertDetail(sqlSession, cno);
	}
	
	@Override
	public ArrayList<QNA> selectQnaList(int cno) {

		return concertDao.selectQnaList(sqlSession, cno);
	}

	@Override
	public ArrayList<Review> selectReview(int cno) {
		
		return concertDao.selectReview(sqlSession, cno);
	}

	@Override
	public int selectCount(int cno) {
		
		return concertDao.selectCount(sqlSession, cno);
	}

	 @Override
	    public int addWishlist(String userId, int concertId) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("userId", userId);
	        map.put("concertId", concertId);
	        return concertDao.insertWishlist(sqlSession,map);
	    }
	 @Override
	    public int removeWishlist(String userId, int concertId) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("userId", userId);
	        map.put("concertId", concertId);
	        return concertDao.deleteWishlist(sqlSession,map);
	    }

	@Override
	public int selectQnaCount(int cno) {
		
		return concertDao.selectQnaCount(sqlSession, cno);
	}

	@Override
	public int selectStar(int cno) {
		
		return concertDao.selectStar(sqlSession, cno);
	}
	
	// 공연 좋아요 갯수 표시용 - 0618 무진
	@Override
    public int selectWishlistCount(int concertId) {
        return concertDao.selectWishlistCount(sqlSession, concertId);
    }

	@Override
	public int selectHoleStatus(int cno) {
		return concertDao.selectHoleStatus(sqlSession, cno);
	}
}
