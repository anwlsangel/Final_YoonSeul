package com.kh.yoonsart.QNA.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.common.model.vo.PageInfo;

public interface QNAService {
	
	// 총 갯수
	int selectListCount();
	
	// 목록 조회 (select)
	ArrayList<QNA> selectList(PageInfo pi);
	
	// 작성하기 (insert)
	int insertQNA(QNA q);
	
	// 상세 조회  (select)
	QNA selecteQNA(int qnaId);
	
	// 삭제 (update)
	int deleteQNA(int qnaId);
	
	// 수정 (update)
	int updateQNA(QNA q);


	int insertAnswer(QNA q);

	QNA selectAnswer(int qnaId);

	
	ArrayList<QNA> selectQnaCount(int cno, PageInfo pi);
	
	int selectQnaCount(int qno);

	ArrayList<QNA> selectQnaList(int cno, PageInfo pi);

	
}
