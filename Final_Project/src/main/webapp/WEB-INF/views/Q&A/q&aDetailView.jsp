<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의글 보기(상세조회)</title>
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
        background: linear-gradient(0deg, #630000, #810000);
        color: #EEEBDD;
        margin: 3px;
        margin-top: 20px
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
        width: 650px;
        box-sizing: border-box;
        border-radius: 5px;
    }   
</style>
</head>
<body>
 <div class="outer">
	
	 <div class="list-detail">

        <h1 align="center" style="color: #810000">내 문의글</h1>

        <br clear="both">

        <h3>제목</h3>
        <br>
      
        <span style="float: right;">작성일</span>

        <br clear="both;">

        <hr>
 
        <br><br>

        <br>

        <div class="question-content">
        <p>
			내용나오기~~
        </p>
        </div>

        <br><br>

        <hr>
       
         <!-- 관리자로 로그인한 경우 답변 작성 가능 
        <div class="answer-form">

            <form action="">
            <div class="a-answer">
                <tr>
                    <th colspan="2">
                        <textarea id="" style="margin-left: 30px;" required></textarea>
                    </th>
                    <td align="center">
                        <button type="button" onclick="" class="btn-green" disabled>답변 등록</button>
                    </td>
                </tr>
            </div>
         </form>
        </div>
       -->

        <!-- 답변 내용-->
        <div class="answer">

            <h3 style="color: #810000">↪ 답변내용</h3>

            <div class="answer-content">
                연소자의 근로는 특별한 보호를 받는다.
                감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                모든 국민은 직업선택의 자유를 가진다.
                연소자의 근로는 특별한 보호를 받는다.
            </div>
            <div class="answer-info">
                <div class="answer-createDate">2024.06.05</div>
            </div>
        </div>

        <div class="question-btn" align="center">
        
            <a style="text-decoration: none;" 
                href="">
                <button type="button">목록</button>
            </a>
            
            <a style="text-decoration: none;" 
                href=""> 
              	<button type="button">수정</button>
            </a>
            <a style="text-decoration: none;" 
               href="">
                <button type="button">삭제</button>
            </a>
        </div>
	
	<br><br>

    </div>

 
</div>

	
</div>

</body>
</html>