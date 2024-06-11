<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 태그립 확인 -->
<c:if test="${not empty 'xxx'}">태그립 확인</c:if>
<c:if test="${empty 'xxx'}">태그립 확인</c:if>
<br> test:input<input id = "x"> <br>
<button onclick="test()">클릭</button>
<script>
	function test(){
		$.ajax({
			url:"test",
			data:{input:$("#x").val()},
			success:function(x){
				alert(x);
				console.log(x)
			},
			error:function(){
				alert("실패")
			}
		})
	}
</script>
</body>
</html>