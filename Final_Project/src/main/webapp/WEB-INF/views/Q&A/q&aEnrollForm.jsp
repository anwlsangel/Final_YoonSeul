<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성하기</title>
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

    hr {
        border: 0;
        height: 6px;
        background-color: #810000;
        width: 80%;
     }

    .question table {
        height: 300px;
        width: 450px;
    }

    .question textarea {
        height: 150px;
        width: 550px;
        border: none;
        border-bottom: 1px solid #EEEBDD;
        resize: none;
    }

    .question textarea:focus {
        outline: none;
    }

    .question td{
        padding: 5px;
        padding-left: 20px;
        padding-bottom: 10px;
    }

    .question input {
        box-sizing: border-box;
        width: 550px;
        height: 45px;
        /*
        background-color: #EEEBDD;
        border-style: none;
        */
       /* border-style: solid;
        border-color: #810000; */
        /*border-radius: 5px;*/
        border: none;
        outline: none;
        border-bottom: 1px solid #EEEBDD;
        color: black;
    }

    .question button {
        margin: auto;
        display: block;
        width: 100px;
        height: 35px;
        font-size: 18px;
        font-weight: bolder;
        background: linear-gradient(0deg, #630000, #810000);
       /* background-color: #810000 ;*/
        color: #EEEBDD;
        border: none;
        border-radius: 7px;
    }

    .button-container {
        text-align: center;
    }

    .button-container button {
        display: inline-block;
        margin: 5px;
    }
</style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="outer">
        
        <br><br>

        <!-- 공연 문의글 작성 -->
        <div class="question">

            <h1 align="center" style="color: #810000">문의글 작성</h1>


            <form action="insert.qa" method="post">
            <input type="hidden" name="concertId" value="1">
                <table align="center">
                    <tr>
                        <td>
                            <input type="text" id="title" name="qnaTitle" placeholder="문의글 제목" required>
                        </td>
                    </tr>
                      <tr>
                        <td>
                        	<input type="text" id="userId" class="form-control" value="${ sessionScope.loginUser.userId }" name="userId" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea id="content" name="qnaContent"  placeholder="문의 사항"></textarea>
                            <!-- <input type="text" placeholder="문의 사항"> -->
                        </td>
                    </tr>
                </table>
                <br>
                <div class="button-container">
                <button type="submit">등록</button> 
                <button type="reset">취소</button>
                </div>
            </form>
        </div>
    </div>
    
   <!-- 푸터 들어갈 자리  -->
</body>
</html>