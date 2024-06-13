package com.kh.yoonsart.payment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class BuyList {
	
	private String buyListId;			//	BUYLIST_ID			NUMBER
	private String reserveCode;			//	RESERVE_CODE		VARCHAR2(255 BYTE)
	private String reserveConcertId;	//	RESERVE_CONSERT_ID	NUMBER
	private int reserveTicket;			//	RESERVE_TICKET		NUMBER
	private int reserveSum;				//	RESERVE_SUM			NUMBER
	private Date reservePayment;		//	RESERVE_PAYMENT		DATE
	private Date reserveRefund;			//	RESERVE_REFUND		DATE
	private String userId;				//	USER_ID				VARCHAR2(30 BYTE)
	private int status;
	
	public void BuyList() {}
	public BuyList(String buyListId, String reserveCode, String reserveConcertId, int reserveTicket, int reserveSum,
			Date reservePayment, Date reserveRefund, String userId, int status) {
		super();
		this.buyListId = buyListId;
		this.reserveCode = reserveCode;
		this.reserveConcertId = reserveConcertId;
		this.reserveTicket = reserveTicket;
		this.reserveSum = reserveSum;
		this.reservePayment = reservePayment;
		this.reserveRefund = reserveRefund;
		this.userId = userId;
		this.status = status;
	}
	
	public String getBuyListId() {
		return buyListId;
	}
	public void setBuyListId(String buyListId) {
		this.buyListId = buyListId;
	}
	public String getReserveCode() {
		return reserveCode;
	}
	public void setReserveCode(String reserveCode) {
		this.reserveCode = reserveCode;
	}
	public String getReserveConcertId() {
		return reserveConcertId;
	}
	public void setReserveConcertName(String reserveConcertId) {
		this.reserveConcertId = reserveConcertId;
	}
	public int getReserveTicket() {
		return reserveTicket;
	}
	public void setReserveTicket(int reserveTicket) {
		this.reserveTicket = reserveTicket;
	}
	public int getReserveSum() {
		return reserveSum;
	}
	public void setReserveSum(int reserveSum) {
		this.reserveSum = reserveSum;
	}
	public Date getReservePayment() {
		return reservePayment;
	}
	public void setReservePayment(Date reservePayment) {
		this.reservePayment = reservePayment;
	}
	public Date getReserveRefund() {
		return reserveRefund;
	}
	public void setReserveRefund(Date reserveRefund) {
		this.reserveRefund = reserveRefund;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	

	@Override
	public String toString() {
		return "BuyList [buyListId=" + buyListId + ", reserveCode=" + reserveCode + ", reserveConcertId="
				+ reserveConcertId + ", reserveTicket=" + reserveTicket + ", reserveSum=" + reserveSum
				+ ", reservePayment=" + reservePayment + ", reserveRefund=" + reserveRefund + ", userId=" + userId
				+ ", status=" + status + "]";
	}
	
}
