package com.kh.yoonsart.adminmain.adminConcert.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.kh.yoonsart.adminmain.adminConcert.model.service.AdminConcertService;
import com.kh.yoonsart.concert.model.vo.Concert;

@Controller
public class AdminConcertController {

	@Autowired
	private AdminConcertService adminConcertService;

	@GetMapping("AdConcertList.co")
	public String SelectAdConcert(Model model) {

		ArrayList<Concert> list = adminConcertService.adSelectList();

		model.addAttribute("list", list);

		return "admin/AdminConcertList";

	}

	@GetMapping("AdupdateConcertForm.co")
	public String updateConcertForm(@RequestParam("cno") int cno, Model model) {

		Concert c = adminConcertService.adConcertDetail(cno);

		model.addAttribute("c", c);

		return "admin/AdminConcertDetail";

	}

	@PostMapping("AdMemberUpdate.me")
	public ModelAndView AdminConcertUpdate(Concert c, Model model, ModelAndView mv, HttpSession session) {

		int result = adminConcertService.adUpdateConcert(c);

		// System.out.println(result);

		if (result > 0) { // 성공

			session.setAttribute("alertMsg", "공연 정보 수정 성공!");
			mv.setViewName("redirect:/AdupdateConcertForm.co?cno=" + c.getConcertId());

		} else { // 실패

			mv.addObject("errorMsg", "등록 실패").setViewName("common/errorPage");
		}

		return mv;

	}

	// 용환 작업
	@RequestMapping(value = "getSchedule.ajax", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String getAjax(String startDate, String lastDate, String holeName) {
		HashMap<String, String> dateMap = new HashMap<String, String>();
		dateMap.put("startDate", startDate);
		dateMap.put("lastDate", lastDate);
		dateMap.put("holeName", holeName);

		return new Gson().toJson(adminConcertService.getScheduleWihtHoleName(dateMap));
	}

	@RequestMapping("AdInsertConcert.co")
	public String insertForm(Model m) {
		m.addAttribute("holeList", adminConcertService.getHoleList());
		return "admin/AdminInsertConcert";
	}

	@RequestMapping("insertConcert.ic")
	public String insertFormSubmit(Concert c, MultipartFile thumbnail, MultipartFile detail, String forJson,
			HttpSession session) {
		// c 가공
		String rootPath = session.getServletContext().getRealPath("/resources/image/");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = dateFormat.format(new Date());
		String thumbnailSaveRoot = rootPath + dateString + thumbnail.getOriginalFilename();
		String detailSaveRoot = rootPath + dateString + detail.getOriginalFilename();
		c.setThumbnailRoot("resources/image/" + dateString + thumbnail.getOriginalFilename());
		c.setDetailRoot("resources/image/" + dateString + detail.getOriginalFilename());

		// json 가공
		JsonArray Array = JsonParser.parseString(forJson).getAsJsonArray();
		ArrayList<String> dateList = new ArrayList();
		for (JsonElement date : Array) {
			dateList.add(date.getAsString());
		}
		int insert = adminConcertService.insertConcertInfo(c, dateList);

		// 기본정보 db 저장 완료
		if (insert > 0) {
			// 파일 메모리에 넣기
			try {
				detail.transferTo(new File(thumbnailSaveRoot));
				thumbnail.transferTo(new File(detailSaveRoot));
			} catch (IllegalStateException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

		return "redirect:/AdInsertConcert.co";
	}
	
	@RequestMapping("admin")
	public String xxx() {
		System.out.println("xxxx");
		return "admin/AdminInsertConcert";
	}

}
