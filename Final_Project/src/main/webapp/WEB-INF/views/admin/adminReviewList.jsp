<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 조회</title>
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
	                    <th>리뷰 ID</th>
						<th>리뷰 내용</th>
						<th>리뷰 점수</th>
						<th style="width:80px;">작성일</th>
						<th>회원 ID</th>
						<th style="width:30px;">공연ID</th>
						<th>상태값</th>
	                </tr>
	            </thead>
	            <tbody>		
	            <c:forEach var="r" items="${requestScope.list}">
	            	<tr>
	                    <td>${r.reviewId}</td>
	                    <td>${r.reviewContent}</td>
	                    <td>${r.reviewPoint}</td>
	                    <td>${r.writeDate}</td>
	                    <td>${r.userId}</td>
	                    <td>${r.concertId}</td>
	             		<td>${r.status}</td>
	                </tr>
	            </c:forEach>
	            </tbody>
	        </table>
			</div>
    	</div>            
    </div>
	
</body>
</html>