package com.kh.yoonsart.concert.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@Setter // setter
@Getter //getter
@ToString // toString
public class SeatInfo {
	private String x;
	private String y;
	private String name;
	private String id;
	private String able;
}
