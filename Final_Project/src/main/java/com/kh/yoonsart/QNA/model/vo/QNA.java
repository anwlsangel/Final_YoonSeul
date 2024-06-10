package com.kh.yoonsart.QNA.model.vo;

//0610 qna VO 작성 - 수정
import java.sql.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@Setter // 세터 메소드
@Getter //게터메소드
@ToString // 투스트링 메소드 오버라이딩
public class QNA {
	
	private int qnaId;  	// QNA_ID	NUMBER
	private String userId; 	//	USER_ID	VARCHAR2(30 BYTE)
	private String qnaTitle; //	QNA_TITLE	VARCHAR2(100 BYTE)
	private String qnaContent; //	QNA_CONTENT	VARCHAR2(4000 BYTE)
	private Date createDate;  //	CREATE_DATE	DATE
	private String qnaAnswer; //	QNA_ANSWER	VARCHAR2(4000 BYTE)
	private Date answerDate;//	ANSWER_DATE	DATE 
	private int status;    //	STATUS	NUMBER
	private int concertId; //	CONCERT_ID	NUMBER
}
