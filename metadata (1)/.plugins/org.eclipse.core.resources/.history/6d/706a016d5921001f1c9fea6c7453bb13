package com.kh.yoonsart.member.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//db test용 함수
	@RequestMapping(value = "test",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	@Transactional
	public String dbTest(String input) {
		System.out.println(input);
		int x =sqlSession.insert("memberMapper.testInsert", input);
		
		String y=null;
		if(x>0) {
			y = sqlSession.selectOne("memberMapper.testSelect",input);
		}
		int k = sqlSession.update("memberMapper.testUpdate",input);
		int z = 0; // sqlSession.delete("memberMapper.testDelete",input+1);
		
		return "넣음"+x+" 찾음"+y+" 변경"+k+" 지움"+z;
	}
}
