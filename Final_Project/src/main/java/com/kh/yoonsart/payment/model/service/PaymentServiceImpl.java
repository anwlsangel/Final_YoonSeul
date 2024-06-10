package com.kh.yoonsart.payment.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yoonsart.payment.model.dao.PaymentDao;
import com.kh.yoonsart.payment.model.vo.BuyList;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PaymentDao paymentDao;

	@Override
	public int insertPaymentInfo(BuyList bl) {
		return paymentDao.insertPaymentDao(sqlSession, bl);
	}

}
