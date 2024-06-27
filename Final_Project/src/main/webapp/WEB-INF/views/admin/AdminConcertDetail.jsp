<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#sb-btn{
		display: flex;
		justify-content: end;
	}
</style>
</head>
<body>

	<div id="wrapper">
	
		<jsp:include page="../common/adminNav.jsp" />
		
		<div id="content-wrapper" class="d-flex flex-column">
		
			<div id="content">
			
			<jsp:include page="../common/adminTop.jsp" />
			
    	        <h1 class="h3 mb-4 text-gray-800">공연 정보 수정</h1>
    	        
    	        <form action="AdConcertUpdate.co" method="post">
                                	<table class="table table-bordered" width="100%" cellspacing="0">
                                		<tr>
                                			<th colspan="2">공연 이름</th>
                                			<td>
                                				<input type="text" class="form-control form-control-user" name="concertName" value="${c.concertName}">	                                				
                               				</td>
                                		</tr>
                                		<tr>
                                			<th colspan="2">연령 제한</th>
                                			<td>
                                				<input type="number" class="form-control form-control-user" name="ageLimit" value="${c.ageLimit}">
                               				</td>
                                		</tr>
                                		<tr>
                                			<th colspan="2">공연 가격</th>
                                			<td>
                                				<input type="number" class="form-control form-control-user" name="price" value="${c.price}">
                               				</td>
                                		</tr>
                                		<tr>
                                			<th colspan="2">썸네일</th>
                                			<td>
                                				<input type="text" class="form-control form-control-user" name="thumbnailRoot" value="${c.thumbnailRoot}">
                               				</td>
                                		</tr>
                                		<tr>
                                			<th colspan="2">상세정보</th>
                                			<td>
                                				<input type="text" class="form-control form-control-user" name="detailRoot" value="${c.detailRoot}">
                               				</td>
                                		</tr>
                                		<tr>
                                			<th colspan="2">공연 시간</th>
                                			<td>
                                				<input type="text" class="form-control form-control-user" name="playTime" value="${c.playTime}">
                               				</td>
                                		</tr>
                                		<tr>
                                			<th colspan="2">공연 시작 날짜</th>
                                			<td>
                                				<input type="Date" class="form-control form-control-user" name="startDate" value="${c.startDate}">
                               				</td>
                                		</tr>
                                		<tr>
                                			<th colspan="2">공연 종료 날짜</th>
                                			<td>
                                				<input type="Date" class="form-control form-control-user" name="endDate" value="${c.endDate}">
                               				</td>
                                		</tr>
                                		<tr>
                                			<th colspan="2">공연 카테고리</th>
                                			<td>
                                				<input type="text" class="form-control form-control-user" name="category" value="${c.category}">
                               				</td>
                                		</tr>
                                		<tr>
                                			<th colspan="2">공연장</th>
                                			<td>
                                				<input type="text" class="form-control form-control-user" name="holeName" value="${c.holeName}">
                               				</td>
                                		</tr>
                                	
                                	</table>
	                               <input type="hidden" value="${c.concertId}" name="concertId">
                                   <hr>
                                   <div id="sb-btn">
                                    <button type="submit" class="btn btn-sm btn-danger">수정</button>
								</div>                                    
                              	</form>
			
			</div>			
		</div>	
	</div>

</body>
</html>