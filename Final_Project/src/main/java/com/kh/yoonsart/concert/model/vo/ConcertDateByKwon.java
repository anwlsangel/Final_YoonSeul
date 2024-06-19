package com.kh.yoonsart.concert.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 콘서트 Date만 다루기 위해 만든 vo
@NoArgsConstructor // 기본생성자
@Setter // 세터 메소드
@Getter //게터메소드
@ToString // 투스트링 메소드 오버라이딩
public class ConcertDateByKwon {

	private String concertId;
	private String concertName;
	private String startDate;
	private String endDate;
	private String holeName;	
	private String thumbnailRoot;
}
