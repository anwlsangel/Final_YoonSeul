package com.kh.yoonsart.lostfind.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.lostfind.model.vo.LostImg;
import com.kh.yoonsart.lostfind.model.vo.Lostfind;
import com.kh.yoonsart.notice.model.vo.Notice;

@Repository
public class LostfindDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("lostfindMapper.selectListCount");
	}
	
	public int selectSearchListCount(SqlSessionTemplate sqlSession, String keyword) {
		
		return sqlSession.selectOne("lostfindMapper.selectSearchListCount", keyword);
	}
	
	public ArrayList<Lostfind> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("lostfindMapper.selectList", null, rowBounds);
	}
	
	public ArrayList<Lostfind> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("lostfindMapper.selectSearchList", keyword, rowBounds);
	}
	
	public int insertLostfind(SqlSessionTemplate sqlSession, Lostfind l) {
		
		return sqlSession.insert("lostfindMapper.insertLostfind", l);
	}
	public int insertLostImg(SqlSessionTemplate sqlSession, LostImg li) {
		
		return sqlSession.insert("lostfindMapper.insertLostImg", li);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int lostNo) {
		
		return sqlSession.update("lostfindMapper.increaseCount", lostNo);
	}
	
	public Lostfind selectLostfind(SqlSessionTemplate sqlSession, int lostNo) {
		
		return sqlSession.selectOne("lostfindMapper.selectLostfind", lostNo);
	}
	public ArrayList<LostImg> selectLostImg(SqlSessionTemplate sqlSession, int lostNo) {
		
		return (ArrayList)sqlSession.selectList("lostfindMapper.selectLostImg", lostNo);
	}
	
	public int deleteLostfind(SqlSessionTemplate sqlSession, int lostNo) {
		
		return sqlSession.update("lostfindMapper.deleteLostfind", lostNo);
	}
	
	public int restoreLostfind(SqlSessionTemplate sqlSession, int lostNo) {
		
		return sqlSession.update("lostfindMapper.restoreLostfind", lostNo);
	}
	
	public int updateLostfind(SqlSessionTemplate sqlSession, Lostfind l) {
		
		return sqlSession.update("lostfindMapper.updateLostfind", l);
	}
	public int updateLostImg(SqlSessionTemplate sqlSession, LostImg li) {
	
		return sqlSession.update("lostfindMapper.updateLostImg", li);
	}
	public int selectUpLostNo(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("lostfindMapper.selectUpLostNo");
	}
	public int deleteLostImg(SqlSessionTemplate sqlSession, int lostNo) {
		
		return sqlSession.delete("lostfindMapper.deleteLostImg", lostNo);
	}
	public int deleteExImg(SqlSessionTemplate sqlSession, List<LostImg> list) {
		
		return sqlSession.delete("lostfindMapper.deleteExImg", list);
	}
	public ArrayList<Lostfind> adSelectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lostfindMapper.adSelectList");
	}

}




