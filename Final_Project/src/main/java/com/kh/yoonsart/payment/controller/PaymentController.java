package com.kh.yoonsart.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yoonsart.concert.model.vo.Concert;
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
	@GetMapping(value="concertDetailView3.co")
	public String concertDetailView3() {
		return "concert/ConcertDetailView3";
	}
	@GetMapping(value="concertDetailView4.co")
	public String concertDetailView4() {
		return "concert/ConcertDetailView4";
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
	
	//access token 발급
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
	
	//예매내역 상세조회
	@GetMapping(value="myTicketDetailView")
	public ModelAndView myTicketDetailView(String tno, ModelAndView mv) {
		//결제내역
		BuyList bl = paymentService.selectBuyList(tno);
		//공연정보
		Concert concert = paymentService.selectConcert(bl.getReserveConcertId());
		mv.addObject("bl", bl).addObject("concert", concert);
		mv.setViewName("member/myTicketDetail");
		return mv;
	}
	
	//관리자-결제내역전체조회
	@GetMapping(value="selectPaymentList.ad")
	public String selectPaymentList(Model model) {
		ArrayList<BuyList> list = paymentService.selectPaymentList();
		model.addAttribute("list", list);
		return "admin/adminPaymentList";
	}
	//관리자-환불요청내역조회
	@GetMapping(value="adminRefund.ad")
	public String adminRefund(Model model) {
		ArrayList<BuyList> list = paymentService.selectRefundList();
		System.out.println(list);
		model.addAttribute("list", list);
		return "admin/adminRefundList";
	}
	
}
