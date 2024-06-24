package com.kh.yoonsart.payment.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.concert.model.vo.Concert;
import com.kh.yoonsart.concert.model.vo.Ticket;
import com.kh.yoonsart.payment.model.vo.BuyList;

@Repository
public class PaymentDao {

	public int insertPaymentDao(SqlSessionTemplate sqlSession, BuyList bl) {
		return sqlSession.insert("paymentMapper.insertPaymentInfo", bl);
	}

	public int updateReserveRefund(SqlSessionTemplate sqlSession, String merchant_uid) {
		return sqlSession.update("paymentMapper.updateReserveRefund", merchant_uid);
	}

	public BuyList selectBuyList(SqlSessionTemplate sqlSession, String tno) {
		return sqlSession.selectOne("paymentMapper.selectBuyList", tno);
	}

	public Concert selectConcert(SqlSessionTemplate sqlSession, String concertId) {
		return sqlSession.selectOne("paymentMapper.selectConcert", concertId);
	}

	public ArrayList<BuyList> selectPaymentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("paymentMapper.selectPaymentList");
	}

	public ArrayList<BuyList> selectRefundList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("paymentMapper.selectRefundList");
	}

	public int requestRefund(SqlSessionTemplate sqlSession, String buyListId) {
		return sqlSession.update("paymentMapper.requestRefund", buyListId);
	}
	
	public int cancelRefund(SqlSessionTemplate sqlSession, String buyListId) {
		return sqlSession.update("paymentMapper.cancelRefund", buyListId);
	}

	public int rejectRefund(SqlSessionTemplate sqlSession, String buyListId) {
		return sqlSession.update("paymentMapper.rejectRefund", buyListId);
	}

	public int startPayment(SqlSessionTemplate sqlSession, Ticket ticket) {
		return sqlSession.insert("paymentMapper.startPayment", ticket);
	}

	public int endPayment(SqlSessionTemplate sqlSession, Ticket ticket) {
		return sqlSession.update("paymentMapper.endPayment", ticket);
	}
	
	public int cancelPayment(SqlSessionTemplate sqlSession, Ticket ticket) {
		return sqlSession.delete("paymentMapper.cancelPayment", ticket);
	}

	public int deleteTicket(SqlSessionTemplate sqlSession, String buyListId) {
		return sqlSession.delete("paymentMapper.deleteTicket", buyListId);
	}
	

}
