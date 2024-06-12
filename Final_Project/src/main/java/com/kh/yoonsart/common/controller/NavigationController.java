package com.kh.yoonsart.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NavigationController {

    @GetMapping("infohall")
    public String showInfoHall() {
        return "infohall/YoonSeulArtHall"; // WEB-INF 寃쎈줈�� .jsp �솗�옣�옄瑜� �젣�쇅�븳 JSP �뙆�씪�쓽 寃쎈줈
    }
    @GetMapping("moonlight")
    public String showMoonlightField() {
    	return "infohall/MoonlightField"; // WEB-INF 寃쎈줈�� .jsp �솗�옣�옄瑜� �젣�쇅�븳 JSP �뙆�씪�쓽 寃쎈줈
    }
    @GetMapping("starlight")
    public String showStarlightHall() {
    	return "infohall/StarlightHall"; // WEB-INF 寃쎈줈�� .jsp �솗�옣�옄瑜� �젣�쇅�븳 JSP �뙆�씪�쓽 寃쎈줈
    }
    @GetMapping("halllocation")
    public String showYoonSeulArtHallLocation() {
    	return "infohall/YoonSeulArtHallLocation"; // WEB-INF 寃쎈줈�� .jsp �솗�옣�옄瑜� �젣�쇅�븳 JSP �뙆�씪�쓽 寃쎈줈
    }
    @GetMapping("convenience")
    public String showConvenience() {
    	return "infohall/Convenience";
    }
    @GetMapping("videoinfo")
    public String showVideoinfo() {
    	return "infohall/Videoinfo";
    }
    @GetMapping("parking")
    public String showParking() {
    	return "infohall/Parking";
    }
    
    
    
}