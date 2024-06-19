package com.kh.yoonsart.adminmain.admin.model.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@Setter // 세터 메소드
@Getter //게터메소드
@ToString // 투스트링 메소드 오버라이딩
public class AdminCount {
	
	private int enrollDate;
    private int enrollCount;

    
}
