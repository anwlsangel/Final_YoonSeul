package com.kh.yoonsart.adminmain.adminMember.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yoonsart.adminmain.adminMember.model.dao.AdminMemberDao;
import com.kh.yoonsart.member.model.vo.Member;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public AdminMemberDao adminMemberDao;

	@Override
	public ArrayList<Member> adSelectList() {

		return adminMemberDao.adSelectList(sqlSession);
	}

	@Override
	public Member adMemberDetail(String userId) {
	    return adminMemberDao.adMemberDetail(sqlSession, userId);
	}

	@Override
    public int updateMember(Member m) {
        return adminMemberDao.updateMember(sqlSession, m);
    }
}
