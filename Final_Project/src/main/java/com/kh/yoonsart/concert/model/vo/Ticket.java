package com.kh.yoonsart.concert.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@Setter // setter
@Getter //getter
@ToString // toString
public class Ticket {
	private int ticketId;		//	TICKET_ID		NUMBER
	private String ticketQr;	//	TICKET_QR		VARCHAR2(100 BYTE)
	private int ticketPrice;	//	TICKET_PRICE	NUMBER
	private int status;			//	STATUS			NUMBER
	private int concertDateId;	//	CONCERT_DATE_ID	NUMBER
	private int seatId;			//	SEAT_ID			NUMBER
	private String buyListId;	//	BUYLIST_ID		VARCHAR2(100 BYTE)
}
