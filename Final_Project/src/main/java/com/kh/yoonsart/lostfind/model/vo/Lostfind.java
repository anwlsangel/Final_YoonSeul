package com.kh.yoonsart.lostfind.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Lostfind {
	private int lostNo;
	private String lostTitle;
	private String lostContent;
	private String date;
	private int lostCount;
	private String status;
}
