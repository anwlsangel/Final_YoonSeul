package com.kh.yoonsart.payment.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yoonsart.payment.model.service.PaymentService;
import com.kh.yoonsart.payment.model.vo.BuyList;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	//결제검증 시 필요
	@Value("${iamport.key}")
    private String restApiKey = "5866740403361550";
    @Value("${iamport.secret}")
    private String restApiSecret = "to3dw2Xf52rRV7SYFFwqjbf4KLDbn3j9XAmfB8cmwmchALntKB6aj7rbQ9Buy6cFuwSB48lnRSlFFWfp";
    
    private IamportClient iamportClient;
    
    public PaymentController() {
        this.iamportClient = new IamportClient(restApiKey, restApiSecret);
    }
    //------
	
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
	
	//결제검증
	@ResponseBody
    @PostMapping(value="checkAmount")
    public IamportResponse<Payment> paymentByImpUid(String imp_uid) throws IamportResponseException, IOException {
    	return iamportClient.paymentByImpUid(imp_uid);
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
