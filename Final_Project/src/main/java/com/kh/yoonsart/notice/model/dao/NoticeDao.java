package com.kh.yoonsart.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	public int selectSearchListCount(SqlSessionTemplate sqlSession, String keyword) {
		
		return sqlSession.selectOne("noticeMapper.selectSearchListCount", keyword);
	}
	
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}
	
	public ArrayList<Notice> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectSearchList", keyword, rowBounds);
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticeMapper.increaseCount", noticeNo);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}
	
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	public int deleteNoticeImg(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticeMapper.deleteNoticeImg", noticeNo);
	}

	public ArrayList<Notice> selectMainNoticeList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("noticeMapper.selectMainNoticeList");
	}

}




