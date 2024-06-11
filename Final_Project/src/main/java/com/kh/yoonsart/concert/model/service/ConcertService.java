package com.kh.yoonsart.concert.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.concert.model.vo.Concert;

public interface ConcertService {

	ArrayList<Concert> selectList(String category, String sort);

	ArrayList<Concert> searchList(String keyword, String category, String sort);

	Concert concertDetail(int concertId);
	
}
