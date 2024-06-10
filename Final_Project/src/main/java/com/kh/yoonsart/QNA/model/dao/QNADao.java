package com.kh.yoonsart.QNA.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QNADao {
	
	// 게시글 갯수
	public int selectListCount(SqlSessionTemplate sqlSession) {
			
			return sqlSession.selectOne("qnaMapper.selectListCount");
	}
	
	
	
	
}
