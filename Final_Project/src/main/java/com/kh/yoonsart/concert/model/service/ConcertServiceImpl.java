package com.kh.yoonsart.concert.model.service;

import java.util.ArrayList;

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
	
	// pageInfo 매개변수로 넣어서 페이징 처리 하려고 dao까지 코드 수정했다가 
	// 계속 오류떠서 있던 리스트 조회도 동작안될거 같길래 우선 관련 코드 주석처리 아니면 삭제하고
	// 원래 코드는 남겨뒀어!! 
	// concert-mappter 에 총 갯수 구하는 쿼리문은 주석 안치고 일단 놔둠!! 
//	@Override
//	public ArrayList<QNA> selectQnaList(int cno,PageInfo pi) {
//
//		return concertDao.selectQnaList(sqlSession, cno, pi);
//	}

	@Override
	public ArrayList<Review> selectReview(int cno) {

		return concertDao.selectReview(sqlSession, cno);
	}
	
	// 총 갯수 
//	@Override
//	public int selectListCount() {
//			
//		return concertDao.selectListCount(sqlSession);
//	}

}
