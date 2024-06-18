<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A List</title>
<style>
	#content {
			width : 90%;  
			margin-left : 60px;
		}
</style>
</head>
<body>

	<div id="wrapper">
	
	    <jsp:include page="../common/adminNav.jsp" />
		
		<div id="content-wrapper" class="d-flex flex-column">
		
	    	<!-- Main Content -->
	        <div id="content">
	        
	        <jsp:include page="../common/adminTop.jsp" />
	
			 <h1 class="h3 mb-4 text-gray-800">Q&A 리스트 조회</h1>
	
	        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	            <thead>
	                <tr>
	                    <th>문의 ID</th>
						<th>회원 ID</th>
						<th>제목</th>
						<th>내용</th>
						<th style="width:80px;">작성일</th>
						<th>답변</th>
						<th style="width:80px;">답변일</th>
						<th style="width:30px;">상태</th>
						<th style="width:30px;">공연ID</th>
	                </tr>
	            </thead>
	            <tbody>		
	            <c:forEach var="q" items="${requestScope.list}">
	            	<tr>
	                    <td>${q.qnaId}</td>
	                    <td>${q.userId}</td>
	                    <td>${q.qnaTitle}</td>
	                    <td>${q.qnaContent}</td>
	                    <td>${q.createDate}</td>
	                    <td>${q.qnaAnswer}</td>
	             		<td>${q.answerDate}</td>
	             		<td>${q.status}</td>
	             		<td>${q.concertId}</td>
	                </tr>
	            </c:forEach>
	            </tbody>
	        </table>
			</div>
    	</div>            
    </div>
	
	<script>
    	$(document).ready(function(){
    	    $("#dataTable tbody").on("click", "tr", function(){
    	        let qno = $(this).find("td:eq(0)").text().trim();
    	        location.href = "AdinsertAnswer.qa?qno=" + qno;
    	    });    	
    	});
    </script>

</body>
</html>