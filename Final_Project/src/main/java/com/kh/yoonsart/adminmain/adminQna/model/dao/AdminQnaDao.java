package com.kh.yoonsart.adminmain.adminQna.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.QNA.model.vo.QNA;

@Repository
public class AdminQnaDao {

	public ArrayList<QNA> adQnaService(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectQnaAllList");
	}

	public QNA adqnaDetail(SqlSessionTemplate sqlSession, int qno) {

		return sqlSession.selectOne("qnaMapper.adqnaDetail", qno);
	}

	public int AdupdateAnswer(SqlSessionTemplate sqlSession, QNA q) {
		
		return sqlSession.update("qnaMapper.insertAnswer", q);
	}

}
