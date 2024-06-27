package com.kh.yoonsart.adminmain.adminConcert.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.concert.model.vo.ConcertDateByKwon;
import com.kh.yoonsart.payment.model.vo.Tickets;

@Repository
public class AdminConcertDao {

	public ArrayList<Concert> adSelectList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("concertMapper.adSelectList");
	}

	public Concert adConcertDetail(SqlSessionTemplate sqlSession, int cno) {

		return sqlSession.selectOne("concertMapper.adConcertDetail", cno);
	}

	public int adUpdateConcert(SqlSessionTemplate sqlSession, Concert c) {
		
	    // System.out.println("Concert: " + c);	    
		// System.out.println("dao야");
		return sqlSession.update("concertMapper.adUpdateConcert", c);
		
	}
	
	//용환
	public ArrayList<ConcertDateByKwon> getScheduleWihtHoleName(SqlSessionTemplate sqlSession,HashMap<String,String> m){
		return (ArrayList)sqlSession.selectList("concertMapper.getScheduleWihtHoleName", m);
	}

	public int insertConcertInfo(SqlSessionTemplate sqlSession,Concert c) {
		return sqlSession.insert("concertMapper.incertConcertInfo",c);
	}
	
	public int insertConcertDate(SqlSessionTemplate sqlSession, ArrayList list) {
		return sqlSession.update("concertMapper.insertConcertDate",list);
	}
	public int getLastConcertId(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("concertMapper.getLastConcertId");
	}
	public int updateConsertStartEnd(SqlSessionTemplate sqlSession,int id) {
		return sqlSession.update("concertMapper.updateConsertStartEnd", id);
	}
	
	public ArrayList<String> getHoleList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("concertMapper.getHoleList");
	}

	public int adDeleteConcert(SqlSessionTemplate sqlSession) {
		return sqlSession.update("concertMapper.adDeleteConcert");
	}
	
	public Tickets ticketValidation(SqlSessionTemplate sqlSession, String qr) {
		return sqlSession.selectOne("concertMapper.ticketValidation", qr);
	}
	
	public int changeStatusTickt(SqlSessionTemplate sqlSession,String qr) {
		return sqlSession.update("concertMapper.changeStatusTickt",qr);
	}
	
	public Concert ConcertDetail(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("concertMapper.concertDetail",Integer.parseInt(id));
	}
	
	public int insertConcertDateById(SqlSessionTemplate sqlSession,HashMap map) {
		int x = sqlSession.insert("concertMapper.insertConcertDateById", map);
		updateConsertStartEnd(sqlSession,Integer.parseInt((String) map.get("id")));
		return x;
	}
}
