package com.kh.yoonsart.adminmain.adminQna.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.QNA.model.vo.QNA;

@Repository
public class AdminQnaDao {

	public ArrayList<QNA> adQnaService(SqlSessionTemplate sqlSession) {
	
		return (ArrayList)sqlSession.selectList("qnaMapper.selectQnaList");
	}

}
