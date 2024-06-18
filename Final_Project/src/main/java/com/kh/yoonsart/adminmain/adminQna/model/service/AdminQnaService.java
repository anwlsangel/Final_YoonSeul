package com.kh.yoonsart.adminmain.adminQna.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.QNA.model.vo.QNA;
import com.kh.yoonsart.concert.model.vo.Concert;

public interface AdminQnaService {

	ArrayList<QNA> adQnaService();

	QNA adqnaDetail(int qno);

	int AdupdateAnswer(QNA q);

}
