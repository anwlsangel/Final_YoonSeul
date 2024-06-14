package com.kh.yoonsart.payment.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.payment.model.dao.PaymentDao;
import com.kh.yoonsart.payment.model.vo.BuyList;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@RequiredArgsConstructor
@Service
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PaymentDao paymentDao;

	@Override
	public int insertPaymentInfo(BuyList bl) {
		return paymentDao.insertPaymentDao(sqlSession, bl);
	}

	@Override
	public String getToken(String apiKey, String apiSecret) throws IOException {
		URL url = new URL("https://api.iamport.kr/users/getToken");
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
        
        // 요청 방식을 POST로 설정
        conn.setRequestMethod("POST");
        
        // 요청의 Content-Type과 Accept 헤더 설정
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
		
        // 해당 연결을 출력 스트림(요청)으로 사용
        conn.setDoOutput(true);
        
        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
        JsonObject json = new JsonObject();
        json.addProperty("imp_key", apiKey);
        json.addProperty("imp_secret", apiSecret);
        
        // 출력 스트림으로 해당 conn에 요청
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString()); // json 객체를 문자열 형태로 HTTP 요청 본문에 추가
        bw.flush(); // BufferedWriter 비우기
        bw.close(); // BufferedWriter 종료
        
        // 입력 스트림으로 conn 요청에 대한 응답 반환
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        Gson gson = new Gson(); // 응답 데이터를 자바 객체로 변환
        String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
        String accessToken = gson.fromJson(response, Map.class).get("access_token").toString();
        br.close(); // BufferedReader 종료
        
        conn.disconnect(); // 연결 종료
        
        log.info("Iamport 엑세스 토큰 발급 성공 : {}", accessToken);
        return accessToken;
	}

	@Override
	public void refund(String access_token, String merchant_uid, String reason) throws IOException {
		URL url = new URL("https://api.iamport.kr/payments/cancel");
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
        
        // 요청 방식을 POST로 설정
        conn.setRequestMethod("POST");
 
        // 요청의 Content-Type, Accept, Authorization 헤더 설정
        conn.setRequestProperty("Content-type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestProperty("Authorization", access_token);
        
        // 해당 연결을 출력 스트림(요청)으로 사용
        conn.setDoOutput(true);
 
        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
        JsonObject json = new JsonObject();
        json.addProperty("merchant_uid", merchant_uid);
        json.addProperty("reason", reason);
 
        // 출력 스트림으로 해당 conn에 요청
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString());
        bw.flush();
        bw.close();
 
        // 입력 스트림으로 conn 요청에 대한 응답 반환
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        br.close();
        conn.disconnect();
        
        log.info("결제 취소 완료 : 주문 번호 {}", merchant_uid);
	}

	@Override
	public int updateReserveRefund(String merchant_uid) {
		return paymentDao.updateReserveRefund(sqlSession, merchant_uid);
	}

	//예매내역상세조회
	@Override
	public BuyList selectBuyList(String tno) {
		return paymentDao.selectBuyList(sqlSession, tno);
	}
	@Override
	public Concert selectConcert(String concertId) {
		return paymentDao.selectConcert(sqlSession, concertId);
	}

	//관리자-결제내역전체조회
	@Override
	public ArrayList<BuyList> selectPaymentList() {
		return paymentDao.selectPaymentList(sqlSession);
	}
	//관리자-환불요청내역조회
	@Override
	public ArrayList<BuyList> selectRefundList() {
		return paymentDao.selectRefundList(sqlSession);
	}
	
	//마이페이지-환불요청
	@Override
	public int requestRefund(String buyListId) {
		return  paymentDao.requestRefund(sqlSession, buyListId);
	}
	
}
