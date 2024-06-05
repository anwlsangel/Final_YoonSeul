<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 에러 페이지 추가 0603 - 무진 -->

    <jsp:include page="" />

    <br>
    <div align="center">
        <img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-256.png">
        <br><br>
        <h1 style="font-weight:bold;">
        	${ requestScope.errorMsg }
        </h1>
    </div>
    <br>

    <jsp:include page="" />
    
</body>
</html>