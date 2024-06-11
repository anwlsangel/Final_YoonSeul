package com.kh.yoonsart.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NavigationController {

    @GetMapping("infohall")
    public String showInfoHall() {
        return "infohall/YoonSeulArtHall"; // WEB-INF 경로와 .jsp 확장자를 제외한 JSP 파일의 경로
    }
    @GetMapping("moonlight")
    public String showMoonlightField() {
    	return "infohall/MoonlightField"; // WEB-INF 경로와 .jsp 확장자를 제외한 JSP 파일의 경로
    }
    @GetMapping("starlight")
    public String showStarlightHall() {
    	return "infohall/StarlightHall"; // WEB-INF 경로와 .jsp 확장자를 제외한 JSP 파일의 경로
    }
    @GetMapping("halllocation")
    public String showYoonSeulArtHallLocation() {
    	return "infohall/YoonSeulArtHallLocation"; // WEB-INF 경로와 .jsp 확장자를 제외한 JSP 파일의 경로
    }
    @GetMapping("convenience")
    public String showConvenience() {
    	return "infohall/Convenience";
    }
}