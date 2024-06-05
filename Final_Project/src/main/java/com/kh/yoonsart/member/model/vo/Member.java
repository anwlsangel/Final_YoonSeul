package com.kh.yoonsart.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 0603 member VO 작성 - 무진

@NoArgsConstructor // 기본생성자
@Setter // 세터 메소드
@Getter //게터메소드
@ToString // 투스트링 메소드 오버라이딩
public class Member {
	
	//	USER_ID	VARCHAR2(30 BYTE)
	private String userId;

	//	USER_PWD	VARCHAR2(100 BYTE)
	private String userPwd;
	
	//	USER_NAME	VARCHAR2(30 BYTE)
	private String userName;
	
	//	USER_BIRTH	DATE
	private Date userBirth;
	
	//	EMAIL	VARCHAR2(40 BYTE)
	private String email;
	
	//	PHONE	VARCHAR2(13 BYTE)
	private String phone;
	
	//	ENROLL_DATE	DATE
	private Date enrollDate;
	
	//	STATUS	NUMBER
	private int status;
	
	//	ADDRESS	VARCHAR2(100 BYTE)
	private String address;
}
