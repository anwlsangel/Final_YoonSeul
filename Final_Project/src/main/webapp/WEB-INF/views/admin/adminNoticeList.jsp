<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>윤슬아트홀</title>
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
	
			 <h1 class="h3 mb-4 text-gray-800">NOTICE 리스트 조회</h1> <br>
			 <a class="btn btn-secondary" style="float:right;" href="enrollForm.adno">글쓰기</a>
	
	        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	            <thead>
	                <tr>
	                    <th>공지 ID</th>
						<th>공지 제목</th>
						<th>첨부파일명</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>상태값</th>
	                </tr>
	            </thead>
	            <tbody>		
	            <c:forEach var="n" items="${requestScope.list}">
	            	<tr>
	                    <td>${n.noticeNo}</td>
	                    <td>${n.noticeTitle}</td>
	                    <td>${n.noticeImgName}</td>
	                    <td>${n.createDate}</td>
	                    <td>${n.noticeCount}</td>
	                    <td>${n.status}</td>
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
    	        let nno = $(this).find("td:eq(0)").text().trim();
    	        console.log(nno);
    	        location.href = "updateForm.adno?nno=" + nno;
    	    });    	
    	});
    </script>
	
</body>
</html>