package com.kh.yoonsart.adminmain.admin.controller;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import com.kh.yoonsart.adminmain.admin.model.service.AdminService;
import com.kh.yoonsart.adminmain.admin.model.vo.AdminCount;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 관리자페이지 요청 메소드
	@GetMapping("adminPage.ad")
	public ModelAndView adminPage(ModelAndView mv) {
		
		int memCount = adminService.selectMemberCount();
		
		//System.out.println(memCount);
		
		ArrayList<Integer> list = adminService.admemberAge();
		
		// System.out.println(list);
		
		mv.addObject("list", list);
		
		int age20 = 0;
		int age30 = 0;
		int age40 = 0;
		int nullCount = 0;
		int ageEtc = 0;
		
//		ArrayList<Integer> age20 = new ArrayList<>();
//		ArrayList<Integer> age30 = new ArrayList<>();
//		ArrayList<Integer> age40 = new ArrayList<>();
//		ArrayList<Integer> ageEtc = new ArrayList<>();
		//int ageEtc = memCount - (age20 + age30 + age40);
		
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i) == null) {
				nullCount++;
			} else if(list.get(i) >= 20 && list.get(i) < 30) {
				//age20.add(list.get(i));
				age20++;
			} else if (list.get(i) >= 30 && list.get(i) < 40) {
				// age30.add(list.get(i));
				age30++;
			} else if(list.get(i) >= 40 && list.get(i) < 50) {
				//age40.add(list.get(i));
				age40++;
			} else {
				//ageEtc.add(list.get(i));
				ageEtc++;
			}
		}
		
		ageEtc = ageEtc + nullCount;
		
		//System.out.println("20대 수 : " + age20);
		//System.out.println("30대 수 : " + age30);
		//System.out.println("40대 수 : " + age40);
		
		mv.addObject("age20", age20);
		mv.addObject("age30", age30);
		mv.addObject("age40", age40);
		mv.addObject("ageEtc", ageEtc);
		
		ArrayList<AdminCount> mlist = adminService.enrollMonth();
		
		//비어있는 달 0명으로 채우기
		for(int i = 1; i <= 12; i++) {
			if(mlist.get(0).getEnrollDate() == i) {
				for(int j = 1; j < i; j++) {
					mlist.add(j-1, new AdminCount(j, 0));
				}
				break;
			}
		}
		for(int i = 1; i <= 12; i++) {
			if(mlist.get(mlist.size()-1).getEnrollDate() == i) {
				for(int j = i; j < 12; j++) {
					mlist.add(j, new AdminCount(j+1, 0));
				}
				break;
			}
		}
		
		
		//System.out.println(mlist);
		
		mv.addObject("mlist", mlist);
		
		ArrayList<AdminCount> slist = adminService.concertSales();
		
		//System.out.println(list);
		
		//비어있는 달 0명으로 채우기
				/*for(int i = 1; i <= 12; i++) {
					if(slist.get(0).getEnrollDate() == i) {
						for(int j = 1; j < i; j++) {
							slist.add(j-1, new AdminCount(j, 0));
						}
						break;
					}
				}
				for(int i = 1; i <= 12; i++) {
					if(slist.get(slist.size()-1).getEnrollDate() == i) {
						for(int j = i; j < 12; j++) {
							slist.add(j, new AdminCount(j+1, 0));
						}
						break;
					}
				}*/
		
		mv.addObject("slist", slist);
		
		mv.setViewName("admin/adminPage");
		
		return mv;
		//return "admin/adminPage";
	}
	
	// 회원 통계  - 0619 수정
	@GetMapping("admemberAge.me")
	public ModelAndView admemberAge(ModelAndView mv) {
		
		int memCount = adminService.selectMemberCount();
		
		//System.out.println(memCount);
		
		ArrayList<Integer> list = adminService.admemberAge();
		
		// System.out.println(list);
		
		mv.addObject("list", list);
		
		int age20 = 0;
		int age30 = 0;
		int age40 = 0;
		int nullCount = 0;
		int ageEtc = 0;
		
//		ArrayList<Integer> age20 = new ArrayList<>();
//		ArrayList<Integer> age30 = new ArrayList<>();
//		ArrayList<Integer> age40 = new ArrayList<>();
//		ArrayList<Integer> ageEtc = new ArrayList<>();
		//int ageEtc = memCount - (age20 + age30 + age40);
		
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i) == null) {
				nullCount++;
			} else if(list.get(i) >= 20 && list.get(i) < 30) {
				//age20.add(list.get(i));
				age20++;
			} else if (list.get(i) >= 30 && list.get(i) < 40) {
				// age30.add(list.get(i));
				age30++;
			} else if(list.get(i) >= 40 && list.get(i) < 50) {
				//age40.add(list.get(i));
				age40++;
			} else {
				//ageEtc.add(list.get(i));
				ageEtc++;
			}
		}
		
		ageEtc = ageEtc + nullCount;
		
		//System.out.println("20대 수 : " + age20);
		//System.out.println("30대 수 : " + age30);
		//System.out.println("40대 수 : " + age40);
		
		mv.addObject("age20", age20);
		mv.addObject("age30", age30);
		mv.addObject("age40", age40);
		mv.addObject("ageEtc", ageEtc);
		
		ArrayList<AdminCount> mlist = adminService.enrollMonth();
		
		//비어있는 달 0명으로 채우기
		for(int i = 1; i <= 12; i++) {
			if(mlist.get(0).getEnrollDate() == i) {
				for(int j = 1; j < i; j++) {
					mlist.add(j-1, new AdminCount(j, 0));
				}
				break;
			}
		}
		for(int i = 1; i <= 12; i++) {
			if(mlist.get(mlist.size()-1).getEnrollDate() == i) {
				for(int j = i; j < 12; j++) {
					mlist.add(j, new AdminCount(j+1, 0));
				}
				break;
			}
		}
		//System.out.println(mlist);
		
		mv.addObject("mlist", mlist);
		
		mv.setViewName("admin/adminChart");
		
	    return mv;
	}
		
	
	// 매출 통계
	@GetMapping("adsales.sv")
	public ModelAndView concertSales(ModelAndView mv) {
	
		ArrayList<AdminCount> list = adminService.concertSales();
		
		//System.out.println(list);
		
		//비어있는 달 0명으로 채우기
				for(int i = 1; i <= 12; i++) {
					if(list.get(0).getEnrollDate() == i) {
						for(int j = 1; j < i; j++) {
							list.add(j-1, new AdminCount(j, 0));
						}
						break;
					}
				}
				for(int i = 1; i <= 12; i++) {
					if(list.get(list.size()-1).getEnrollDate() == i) {
						for(int j = i; j < 12; j++) {
							list.add(j, new AdminCount(j+1, 0));
						}
						break;
					}
				}
		
		mv.addObject("list", list);
		
		mv.setViewName("admin/adminSalesChart");
		
	    return mv;
	}
	
}