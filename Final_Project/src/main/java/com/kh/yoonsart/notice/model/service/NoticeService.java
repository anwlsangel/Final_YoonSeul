package com.kh.yoonsart.notice.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.notice.model.vo.Notice;

public interface NoticeService {
	
	// 게시판 리스트 조회 서비스 + 페이징 처리
	// 게시글 총 갯수 조회
	int selectListCount();
	// 검색 게시글 총 갯수 조회
	int selectSearchListCount(String keyword);
	// 게시글 리스트 조회
	ArrayList<Notice> selectList(PageInfo pi);
	// 검색 게시글 리스트 조회
	ArrayList<Notice> selectSearchList(PageInfo pi, String keyword);
	// 게시글 작성하기 서비스
	int insertNotice(Notice n);
	// 게시글 상세조회 서비스
	// 게시글 조회수 증가
	int increaseCount(int noticeNo);
	// 게시글 상세 조회
	Notice selectNotice(int noticeNo);
	
	// 게시글 삭제 서비스
	int deleteNotice(int noticeNo);
	
	// 게시글 수정 서비스
	int updateNotice(Notice n);
	
	// 이미지 삭제
	int deleteNoticeImg(int noticeNo);
	
}






