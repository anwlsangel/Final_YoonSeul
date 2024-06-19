package com.kh.yoonsart.concert.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@Setter // 세터 메소드
@Getter //게터메소드
@ToString // 투스트링 메소드 오버라이딩
public class ConcertDate {
	
	private int concertDateId;
	private Date concertDate;
	private String runningTime;
	private int concertId;
	private String timeOnly;
}