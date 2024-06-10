package com.kh.yoonsart.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.yoonsart.payment.model.vo.BuyList;

@Repository
public class PaymentDao {

	public int insertPaymentDao(SqlSessionTemplate sqlSession, BuyList bl) {
		return sqlSession.insert("paymentMapper.insertPaymentInfo", bl);
	}

	public int updateReserveRefund(SqlSessionTemplate sqlSession, String merchant_uid) {
		return sqlSession.update("paymentMapper.updateReserveRefund", merchant_uid);
	}

}
