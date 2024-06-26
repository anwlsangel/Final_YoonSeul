package com.kh.yoonsart.adminmain.adminConcert.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.concert.model.vo.ConcertDateByKwon;
import com.kh.yoonsart.payment.model.vo.Tickets;

public interface AdminConcertService {

	ArrayList<Concert> adSelectList();

	Concert adConcertDetail(int cno);

	int adUpdateConcert(Concert c);
	
	int adDeleteConcert();
	
	//용환
	ArrayList<ConcertDateByKwon> getScheduleWihtHoleName(HashMap<String,String> m);
	int insertConcertInfo(Concert c,ArrayList<String> list);
	ArrayList<String> getHoleList();
	Tickets ticketValidation(String qr);
	int changeStatusTickt(String qr);
	
	Concert ConcertDetail(String id);
	int insertConcertDateById(HashMap map);
}
