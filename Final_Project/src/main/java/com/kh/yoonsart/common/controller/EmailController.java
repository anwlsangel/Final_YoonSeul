package com.kh.yoonsart.common.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.yoonsart.member.model.service.MemberService;

@Controller
public class EmailController {
	
	// 인증번호를 담아 둘 해시맵 생성(전역변수)
	// key : 인증할 email 주소, value : 인증번호
	// 단, 동기화 문제 떄문에 동기화 기능을 제공하게끔 객체를 생성 할 것
	// (동시에 여러 사람이 인증 요청을 보냈을 경우 인증번호를 동시에 put 할 수 있게끔)
	private Map<String, String> certNoList = Collections.synchronizedMap(new HashMap<>());
	

	// 참고) 만약에 인증 시 제한시간을 걸고 싶다면?
	// > CERT 테이블을 만들어야함(EMAIL, CERT_NO, CREATE_DATE)
	// map 이 아니라 테이블에 담아야함
	
	@Autowired
	private JavaMailSender mailSender; // = new JavaMailSenderImpl(); 다형성임
	
	@Autowired
	private MemberService memberService;
	
	@ResponseBody
	@PostMapping(value = "cert.do", produces = "text/html; charset=UTF-8")
	public String getCertNo(String email) {
//		System.out.println(email);
		
		// 6자리의 랜덤 1회성 인증번호 발급
		// (1회성 인증번호 : One Time Password - OTP)
		// > 100000 ~ 999999
		int random = (int)(Math.random() * 900000 + 100000); 
		
		// 발급한 인증번호를 사용자에게 그냥 넘기는게 아니다 대조용으로 Controller 의 Map 에 갖고 있을 거임
		certNoList.put(email, String.valueOf(random));
		// > CERT 테이블에 INSERT 
		System.out.println(certNoList);
		
		// 사용자에게 이메일로 해당 인증번호 보내기
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setSubject("[KH정보교육원] 이메일 인증번호 입니다.");
		message.setText("인증번호 : " + random);
		message.setTo(email); // 보내는 사람이 한명이므로 String 타입
		
		mailSender.send(message);
		
		return "인증번호 발급 완료";
		
	}
	
	@ResponseBody
	@PostMapping(value = "validate.do", produces = "text/html; charset=UTF-8")
	public String validate(String email, String checkNo) {
//		System.out.println(email);
//		System.out.println(checkNo);
		
		String result = "";
		
		// > CERT 테이블에서 SELECT
		// SELECT FROM CERT WHERE SYSDATE < CREATE_DATE + 3분
		if(certNoList.get(email).equals(checkNo)) {
			result = "인증 성공";
		}else {
			result = "인증 실패!";
		}
		
		// 인증이 성공되든 실패되든 간에 아까 발급받았던 인증 번호는 무조건 삭제해야함 !!(일회성이므로)
		certNoList.remove(email);
		// > CERT 테이블에 DELETE
		System.out.println(certNoList);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "findId.do", produces = "text/html; charset=UTF-8")
	public String findId(String userName, String phone) {
	    String userId = memberService.findIdByNameAndPhone(userName, phone);
	    if (userId != null) {
	        return "회원님의 아이디는 " + userId + "입니다.";
	    } else {
	        return "해당 정보로 가입된 아이디가 없습니다.";
	    }
	}
	
	@ResponseBody
	@PostMapping(value = "resetPwd.do", produces = "text/html; charset=UTF-8")
	public String resetPwd(String email, String newPwd) {
	    boolean isSuccess = memberService.resetPassword(email, newPwd);
	    if (isSuccess) {
	        return "비밀번호 변경 성공";
	    } else {
	        return "비밀번호 변경 실패";
	    }
	}
}




















