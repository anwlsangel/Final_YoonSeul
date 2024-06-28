<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>윤슬아트홀</title>
<style>
	#as-btn {
		display: flex;
		justify-content: end;
	}
	
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

			<div id="content">

				<jsp:include page="../common/adminTop.jsp" />

				<h1 class="h3 mb-4 text-gray-800">공연 문의 답변</h1>

				<form action="AdupdateAnswer.qa" method="post">
					<table class="table table-bordered" width="100%" cellspacing="0">
						<tr>
							<th colspan="2">회원 아이디</th>
							<td><input type="text"
								class="form-control form-control-user" name="userId" readonly
								value="${q.userId}"></td>
						</tr>
						<tr>
							<th colspan="2">문의 제목</th>
							<td><input type="text"
								class="form-control form-control-user" name="qnaTitle" readonly
								value="${q.qnaTitle}"></td>
						</tr>
						<tr>
							<th colspan="2">문의 내용</th>
							<td><input type="text"
								class="form-control form-control-user" name="qnaContent" readonly
								value="${q.qnaContent}">
							</td>
						</tr>
						<tr>
							<th colspan="2">문의 답변</th>
							<td><input type="text"
								class="form-control form-control-user" name="qnaAnswer"
								value="${q.qnaAnswer}"></td>
						</tr>
						
					</table>
					<input type="hidden" value="${q.qnaId}" name="qnaId">
					<hr>
					<div id="as-btn">
						<button type="submit" class="btn btn-sm btn-danger">답변 등록</button>
					</div>
				</form>
				
				<script>
					$(function() {
						console.log('${q.qnaTitle}');
					});
				</script>

			</div>
		</div>
	</div>


</body>
</html>