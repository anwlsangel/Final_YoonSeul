package com.kh.yoonsart.concert.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.concert.model.vo.Concert;

public interface ConcertService {

	ArrayList<Concert> selectList();

	ArrayList<Concert> filterSelectList(String category);

	ArrayList<Concert> selectListAll();
	
}
