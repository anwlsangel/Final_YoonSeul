<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#dataTable {
		text-align: center;
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
	        
	        <h1 class="h3 mb-4 text-gray-800">공연 정보 조회</h1>
	    	    
	
	        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	            <thead>
	                <tr>
	                    <th>공연ID</th>
	                    <th>공연명</th>
	                    <th>연령제한</th>
	                    <th>공연가격</th>
	                    <th>썸네일주소</th>
	                    <th>상세정보 주소</th>
	                    <th>공연시간</th>
	                    <th>공연시작날짜</th>
	                    <th>공연종료날짜</th>
	                    <th>카테고리</th>
	                    <th>공연장이름</th>
	                    <th>상태값</th>
	                </tr>
	            </thead>
	            <tbody>		
	            <c:forEach var="co" items="${requestScope.list}">
	            	<tr>
	                    <td>${co.concertId}</td>
	                    <td>${co.concertName}</td>
	                    <td>${co.ageLimit}</td>
	                    <td>${co.price}</td>
	                    <td>${co.thumbnailRoot}</td>
	                    <td>${co.detailRoot}</td>
	                    <td>${co.playTime}</td>
	                    <td>${co.startDate}</td>
	                    <td>${co.endDate}</td>
	                    <td>${co.category}</td>
	                    <td>${co.holeName}</td>
	                    <td>${co.status}</td>
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
    	        let cno = $(this).find("td:eq(0)").text().trim();
    	        console.log(cno);
    	        location.href = "AdupdateConcertForm.co?cno=" + cno;
    	    });    	
    	});
    </script>

</body>
</html>