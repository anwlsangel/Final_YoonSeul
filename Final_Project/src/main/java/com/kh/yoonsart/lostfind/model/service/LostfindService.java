package com.kh.yoonsart.lostfind.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.lostfind.model.vo.LostImg;
import com.kh.yoonsart.lostfind.model.vo.Lostfind;

public interface LostfindService {
	
	// 게시판 리스트 조회 서비스 + 페이징 처리
	// 게시글 총 갯수 조회
	int selectListCount();
	// 검색 게시글 총 갯수 조회
	int selectSearchListCount(String keyword);
	// 게시글 리스트 조회
	ArrayList<Lostfind> selectList(PageInfo pi);
	// 검색 게시글 리스트 조회
	ArrayList<Lostfind> selectSearchList(PageInfo pi, String keyword);
	// 게시글 작성하기 서비스
	int insertLostfind(Lostfind l);
	int insertLostImg(LostImg li);

	// 게시글 상세조회 서비스
	// 게시글 조회수 증가
	int increaseCount(int lostNo);
	// 게시글 상세 조회
	Lostfind selectLostfind(int lostNo);
	// 게시글 첨부파일 조회
	ArrayList<LostImg> selectLostImg(int lostNo);
	
	// 게시글 삭제 서비스
	int deleteLostfind(int LostNo);
	
	// 게시글 수정 서비스
	int updateLostfind(Lostfind l);
	int updateLostImg(LostImg li);
	
	// 업로드한 게시물 번호 조회
	int selectUpLostNo();
	
	// 분실물 사진 삭제
	int deleteLostImg(int lostNo);

	// 분실물 사진 삭제2
	int deleteExImg(List<LostImg> list);
	
	

}






