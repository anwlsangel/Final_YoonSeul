package com.kh.yoonsart.adminmain.adminConcert.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.concert.model.vo.ConcertDateByKwon;

public interface AdminConcertService {

	ArrayList<Concert> adSelectList();

	Concert adConcertDetail(int cno);

	int adUpdateConcert(Concert c);
	
	//용환
	ArrayList<ConcertDateByKwon> getScheduleWihtHoleName(HashMap<String,String> m);
	int insertConcertInfo(Concert c,ArrayList<String> list);
}
