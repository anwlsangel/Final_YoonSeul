package com.kh.yoonsart.payment.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@Setter // setter
@Getter //getter
@ToString // toString
public class Tickets {

	private String concertName;//concert에서 받아옴
	private String date;	 //쿼리
	private String seat;	 //쿼리
	private String holeName; //concert에서 받아옴
	private String qr;		 //쿼리
	private String status;
}
