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
public class Concert {

	private String concertId;		//	CONCERT_ID	NUMBER
	private String concertName;		//	CONCERT_NAME	VARCHAR2(50 BYTE)
	private int ageLimit;			//	AGE_LIMIT	NUMBER
	private int price;				//	PRICE	NUMBER
	private String thumbnailRoot;	//	THUMBNAIL_ROOT	VARCHAR2(150 BYTE)
	private String detailRoot;		//	DETAIL_ROOT	VARCHAR2(150 BYTE)
	private String playTime;		//	PLAYTIME	VARCHAR2(10 BYTE)
	private Date startDate;			//	START_DATE	DATE
	private Date endDate;			//	END_DATE	DATE
	private String category;		//	CATEGORY	VARCHAR2(10 BYTE)
	private String holeName;		//	HOLE_NAME	VARCHAR2(20 BYTE)
	private int status;
	private String fullDate;		//  시간과 날짜까지 받기 위해서 컬럼한개 추가함
}
