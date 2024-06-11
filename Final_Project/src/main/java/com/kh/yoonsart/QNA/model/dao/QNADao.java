package com.kh.yoonsart.QNA.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.common.model.vo.PageInfo;

@Repository
public class QNADao {
	
	// 문의글 총 갯수
	public int selectListCount(SqlSessionTemplate sqlSession) {
			
			return sqlSession.selectOne("qnaMapper.selectListCount");
	}
	
	// 목록 조회
	public ArrayList<QNA> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
			
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
			
		RowBounds rowBounds = new RowBounds(offset, limit);
			
		return (ArrayList)sqlSession.selectList("qnaMapper.selectList", null, rowBounds);
	}
	
	// 문의글 작성 
	public int insertQNA(SqlSessionTemplate sqlSession, QNA q) {
		
		System.out.println(q.getConcertId());
		return sqlSession.insert("qnaMapper.insertQNA", q);
	}
	
	// 상세조회
	public QNA selectQNA(SqlSessionTemplate sqlSession, int qnaId) {
		
		return sqlSession.selectOne("qnaMapper.selectQna", qnaId);
	}
	
	
}
