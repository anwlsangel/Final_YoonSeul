package com.kh.yoonsart.payment.model.service;

import java.io.IOException;
import java.util.ArrayList;

import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.concert.model.vo.Ticket;
import com.kh.yoonsart.payment.model.vo.BuyList;

public interface PaymentService {

	//결제정보 DB에 저장
	int insertPaymentInfo(BuyList bl);
	
	//access token 발급
	String getToken(String apiKey, String apiSecret) throws IOException;
	
	//결제 환불
	void refund(String access_token, String merchant_uid, String reason) throws IOException;
	
	//결제 정보에 환불일 업데이트
	int updateReserveRefund(String merchant_uid);
	
	//예매내역 상세조회
	//결제정보
	BuyList selectBuyList(String tno);
	//공연정보
	Concert selectConcert(String concertId);
	
	//관리자-결제내역전체조회
	ArrayList<BuyList> selectPaymentList();
	//관리자-환불요청내역조회
	ArrayList<BuyList> selectRefundList();
	
	//마이페이지-환불요청
	int requestRefund(String buyListId);
	//환불 거부
	int rejectRefund(String buyListId);
	
	//좌석 상태 변경 (결제중)
	int startPayment(Ticket ticket);
	//좌석 상태 변경 (구매불가)
	int endPayment(Ticket ticket);
	
}
