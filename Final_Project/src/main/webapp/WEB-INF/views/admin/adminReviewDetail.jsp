<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세조회</title>
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
	
			 <h1 class="h3 mb-4 text-gray-800">REVIEW 상세 조회</h1>
	
	        <form id="AdDelete" action="<%=request.getContextPath()%>/AdDelete.re" method="post">
					<table class="table table-bordered" width="100%" cellspacing="0">
						<tr>
							<th colspan="2">회원 아이디</th>
							<td><input type="text"
								class="form-control form-control-user" name="userId" readonly
								value="${r.userId}"></td>
						</tr>
						<tr>
							<th colspan="2">별점</th>
							<td><input type="text"
								class="form-control form-control-user" name="reviewPoint" readonly
								value="${r.reviewPoint}"></td>
						</tr>
						<tr>
							<th colspan="2">댓글 내용</th>
							<td><input type="text"
								class="form-control form-control-user" name="reviewContent" readonly
								value="${r.reviewContent}">
							</td>
						</tr>
						<tr>
							<th colspan="2">삭제 여부</th>
							<td>
                                <select name="number" class="form-control form-control-user">
                                    <option value="1" <c:if test="${r.status == 1}">selected</c:if>>활성화</option>
                                    <option value="2" <c:if test="${r.status == 2}">selected</c:if>>삭제</option>
                                </select>
                            </td>
						</tr>
						
					</table>
					<input type="hidden" value="${r.reviewId}" name="reviewId">
					<hr>
					<div id="as-btn">
						<button type="submit" class="btn btn-sm btn-danger">확인</button>
					</div>
				</form>
			
			</div>
		</div>
	</div>
    

</body>
</html>