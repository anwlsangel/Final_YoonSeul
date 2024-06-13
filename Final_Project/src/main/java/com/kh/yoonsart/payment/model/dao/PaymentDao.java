package com.kh.yoonsart.payment.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.common.model.vo.PageInfo;
import com.kh.yoonsart.concert.model.vo.Concert;
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

	public Concert selectConcert(SqlSessionTemplate sqlSession, int concertId) {
		return sqlSession.selectOne("paymentMapper.selectConcert", concertId);
	}

}
