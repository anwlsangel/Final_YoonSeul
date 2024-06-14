package com.kh.yoonsart.common.controller;

import java.io.StringWriter;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.kh.yoonsart.member.model.service.MemberService;
import com.kh.yoonsart.member.model.vo.Member;

import freemarker.template.Template;

@Controller
public class EmailController {

	private Map<String, String> certNoList = Collections.synchronizedMap(new HashMap<>());

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private MemberService memberService;

	@Autowired
	private FreeMarkerConfigurer freemarkerConfig;

	@ResponseBody
	@PostMapping(value = "cert.do", produces = "text/html; charset=UTF-8")
	public String getCertNo(@RequestParam("email") String email, 
	                        @RequestParam("userId") String userId, 
	                        @RequestParam("userName") String userName) {
	    Member member = memberService.findMemberByIdAndEmailAndName(userId, email, userName);

	    if (member != null) {

	        // 정확한 필드 값 비교
	        boolean isUserIdMatch = userId.equals(member.getUserId());
	        boolean isEmailMatch = email.equals(member.getEmail());
	        boolean isUserNameMatch = userName.equals(member.getUserName());
	        int status = member.getStatus(); // int 타입으로 처리
	        boolean isStatusActive = (status == 1);


	        if (isUserIdMatch && isEmailMatch && isUserNameMatch && isStatusActive) {
	            String randomCertNo = generateCertNo();
	            certNoList.put(email, randomCertNo);
	            try {
	                sendCertEmail(email, randomCertNo);
	            } catch (MessagingException e) {
	                e.printStackTrace();
	                return "인증번호 발급 실패";
	            }
	            return "인증번호 발급 완료";
	        } else {
	            return "회원 정보가 일치하지 않습니다.";
	        }
	    } else {
	        return "회원 정보가 일치하지 않습니다.";
	    }
	}

	private String generateCertNo() {
		Random random = new Random();
		StringBuilder certNo = new StringBuilder();
		for (int i = 0; i < 6; i++) {
			certNo.append(random.nextInt(10));
		}
		return certNo.toString();
	}

	private void sendCertEmail(String email, String certNo) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

		helper.setSubject("[윤슬아트홀] 이메일 인증번호 입니다.");
		helper.setTo(email);

		String htmlContent = renderEmailTemplate(certNo);

		if (htmlContent == null) {
			throw new MessagingException("템플릿 렌더링 실패");
		}

		helper.setText(htmlContent, true);

		mailSender.send(message);
	}

	private String renderEmailTemplate(String certNo) {
		try {
			Template template = freemarkerConfig.getConfiguration().getTemplate("emailTemplate.ftl");
			Map<String, Object> model = new HashMap<>();
			model.put("certNo", certNo);

			StringWriter writer = new StringWriter();
			template.process(model, writer);
			return writer.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@ResponseBody
	@PostMapping(value = "validate.do", produces = "text/html; charset=UTF-8")
	public String validate(@RequestParam("email") String email, 
	                       @RequestParam("checkNo") String checkNo) {
	    String result = "";
	    String savedCheckNo = certNoList.get(email);

	    if (savedCheckNo != null && savedCheckNo.equals(checkNo)) {
	        result = "인증 성공";
	    } else {
	        result = "인증 실패!";
	    }

	    certNoList.remove(email);

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
	public String resetPwd(@RequestParam("userId") String userId, 
	                       @RequestParam("newPwd") String newPwd) {
	    String encPwd = bcryptPasswordEncoder.encode(newPwd);
	    boolean isSuccess = memberService.resetPassword(userId, encPwd);
	    if (isSuccess) {
	        return "비밀번호 변경 성공";
	    } else {
	        return "비밀번호 변경 실패";
	    }
	}
}
