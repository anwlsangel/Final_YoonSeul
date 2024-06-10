package com.kh.yoonsart.payment.model.service;

import com.kh.yoonsart.payment.model.vo.BuyList;

public interface PaymentService {

	//결제정보 DB에 저장
	public int insertPaymentInfo(BuyList bl);
	
}
