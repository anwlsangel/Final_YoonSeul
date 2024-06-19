package com.kh.yoonsart.adminmain.admin.model.service;

import java.util.ArrayList;

import com.kh.yoonsart.adminmain.admin.model.vo.AdminCount;

public interface AdminService {

	int selectMemberCount();

	ArrayList<Integer> admemberAge();

	ArrayList<AdminCount> enrollMonth();

	ArrayList<AdminCount> concertSales();

}
