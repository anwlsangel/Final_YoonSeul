package com.kh.yoonsart.review.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@Setter // 세터 메소드
@Getter //게터메소드
@ToString // 투스트링 메소드 오버라이딩
public class Review {
	
	private int reviewId;//	REVIEW_ID	NUMBER
	private String reviewContent;//	REVIEW_CONTENT	VARCHAR2(200 BYTE)
	private int reviewPoint;//	REVIEW_POINT	NUMBER
	private Date writeDate;//	WRITE_DATE	DATE
	private String userId;//	USER_ID	VARCHAR2(30 BYTE)
	private int concertId;//	CONCERT_ID	NUMBER
	private int status;
}
