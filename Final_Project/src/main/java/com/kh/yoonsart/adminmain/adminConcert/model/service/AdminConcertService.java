package com.kh.yoonsart.adminmain.adminConcert.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.concert.model.vo.Concert;

public interface AdminConcertService {

	ArrayList<Concert> adSelectList();

	Concert adConcertDetail(int cno);

	int adUpdateConcert(Concert c);


}
