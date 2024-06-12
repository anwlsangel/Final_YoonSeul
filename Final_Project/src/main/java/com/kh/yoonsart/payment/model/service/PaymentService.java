package com.kh.yoonsart.payment.model.service;

import java.io.IOException;
import java.util.ArrayList;

import com.kh.yoonsart.common.model.vo.PageInfo;
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
	
}
