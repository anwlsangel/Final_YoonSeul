package com.kh.yoonsart.payment.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yoonsart.payment.model.service.PaymentService;
import com.kh.yoonsart.payment.model.vo.BuyList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	//공연 상세페이지 포워딩
	@GetMapping(value="concertDetailView.co")
	public String concertDetailView() {
		return "concert/ConcertDetailView";
	}
	//공연 상세페이지 포워딩
		@GetMapping(value="concertDetailView2.co")
		public String concertDetailView2() {
			return "concert/ConcertDetailView2";
		}
	
	//결제 정보 DB에 저장
	@ResponseBody
	@PostMapping(value="insertPaymentInfo.pa", produces="text/html; charset=UTF-8")
	public String insertPaymentInfo(BuyList bl) {
		//System.out.println(bl);
		
		int result = paymentService.insertPaymentInfo(bl);
		
		if(result > 0) {
			return "success";
		} else {
			return "failed";
		}
	}
	
	//token 얻어내기
	@ResponseBody
	@PostMapping(value="getToken.pa", produces="text/html; charset=UTF-8")
	public String getToken(String apiKey, String apiSecret) {
		String token;
		try {
			token = paymentService.getToken(apiKey, apiSecret);
			return token;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//환불
	@ResponseBody
	@PostMapping(value="refund.pa", produces="text/html; charset=UTF-8")
	public void refund(String access_token, String merchant_uid, String reason) {
		try {
			paymentService.refund(access_token, merchant_uid, reason);
			paymentService.updateReserveRefund(merchant_uid);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
