<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>윤슬아트홀</title>
 <style>
   body{
            background-color: #F4F4F4;
            margin: 0;
            padding: 0;
    }

    .outer{
        max-width: 1000px;
        margin: 20px auto;
        margin-top: 120px;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        min-height: calc(100vh - 160px); /* 화면 높이에서 헤더와 푸터를 제외한 높이 설정 */
    }

    .list-detail {
        margin : auto;
        margin-top : 50px;
        width : 80%;
    }

    .question-btn button {
        border-radius : 5px;
        font-size: 15px; 
        font-weight : bold;
        border : 1px solid #810000;
        width: 60px;
        height: 30px;
        border: none;
        background: linear-gradient(0deg, #630000, #810000);
        color: #EEEBDD;
        margin: 3px;
        margin-top: 20px
    }  

    .answer {
        margin: auto;
        width: 80%;    
    }

    .answer-info>div {
        display: inline-block;
        font-size: 15px;
    }

    .answer-info {
        margin-top: 7px;
        text-align: right;
    }

    .answer-form {
        margin-top: 30px;
    }

    .btn-green {
        width: 90px;
        height: 60px;
        font-size: 16px;
        font-weight: bolder;
        float: right;
        border: none;
        background: linear-gradient(0deg, #630000, #810000);
        color: white;
        border-radius : 5px;
        margin-top: 7px;
        }

    .a-answer textarea {
        height: 70px;
        resize: none;
        width: 600px;
        box-sizing: border-box;
        border-radius: 5px;
    }   

    #qnaTitle {
        padding-left: 13px;
    }

    .list-detail>hr {
        width: 100%;
    }  
</style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

 <div class="outer">
	
	 <div class="list-detail">

        <h1 align="center" style="color: #810000">내 문의글</h1>

        <br clear="both">

        <h4>${q.qnaTitle}</h4>
        <br>
      
        <span style="float: right;">${q.createDate}</span>

        <br clear="both;">

        <hr>
 
        <br><br>

        <br>

        <div class="question-content">
        <p>
			${q.qnaContent}
        </p>
        </div>

        <br><br>

        <hr>
       
         <!-- 관리자로 로그인한 경우 답변 작성 가능  -->
        <div class="answer-form">
            <form action="insert.as">
            <c:if test="${sessionScope.loginUser.userId eq 'admin'}">
            <div class="a-answer">
            		<tr>
                    <th colspan="2">
                        <textarea id="answer" style="margin-left: 30px;" required></textarea>
                    </th>
                    <td align="center">
                        <button type="button" onclick="addAnswer();" class="btn-green">답변 등록</button>
                    </td>
                </tr>
            </div>
            </c:if>
         </form>
        </div>
      

        <!-- 답변 내용-->
        <div class="answer">

            <h5 style="color: #810000; padding-top: 10px;">↳ 문의 답변</h5>

            <div class="answer-content">
           		
            </div>
            <div class="answer-info">
                <div class="answer-createDate">
                	
                </div>
            </div>
        </div>
        
        <script>
        $(function() {
        	selectAnswer();
        });
        	function addAnswer() {
						
        		// console.log($("#answer").val());
        		
        		if($("#answer").val().trim().length != 0) {
					$.ajax({
						url : "insert.as",
						type : "post",
						data : {
							//console.log(${q.qnaId});
							qnaId : ${q.qnaId},
							qnaAnswer : $("#answer").val()
						},
						success : function(result) {
							//console.log(result);	
							if(result == "success") {

								selectAnswer();
								$("#answer").val("");
							}
						},
						error : function() {
							console.log('QNA 답변 작성 실패');
						}
					});  
        		}
        	}
        	
         	function selectAnswer() {
	    		$.ajax({
	    			url : "answer.as",
	    			type : "get",
	    			data : {
	    				qno : ${q.qnaId}
	    			},   
	    			success : function(result) {	
	    				// console.log(result);
	    				//결제일 형식 수정
	                	let month = result.answerDate.split(" ")[0].replace("월", "");
	                	let date = result.answerDate.split(" ")[1].replace(",", "");
	                	let year = result.answerDate.split(" ")[2];
	                	if(month < 10) { month = "0" + month; }
	                	if(date < 10) { date = "0" + date; }
	                	let startDate = year + "-" + month + "-" + date;
	    				//$(".answer-createDate").html(result.answerDate);
	    				$(".answer-createDate").html(startDate);
	    				$(".answer-content").html(result.qnaAnswer);
	    				
	    				
	    			},
	    			error : function() {
	    			 	console.log("답변 조회용 ajax 통신 실패");
	    			}
	    		});
	    	}
        </script>

        <div class="question-btn" align="center">
        
        	<!-- <input type="hidden" name="qno">  -->
    
            <a style="text-decoration: none;" href="detail.co?cno=${q.concertId}#text">
                <button type="button">목록</button>
            </a>
            
            <a style="text-decoration: none;" onclick="updateQna();"> 
              	<button type="button">수정</button>	
            </a>
            <a style="text-decoration: none;" onclick="deleteQna();">
                <button type="button">삭제</button>
            </a>
            <script>
            	function deleteQna() {
            		location.href = "delete.qa?qno=${q.qnaId}&cno=${q.concertId}";
            	}
            	
            	function updateQna() {
            		// console.log(${q.qnaId});
            		location.href = "updateForm.qa?qno=${q.qnaId}";
            	}
            </script>
        </div>
			      	
	<br><br>
    </div>
</div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>