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
    #content{
        margin-left: 50px;
        margin-right: 50px;
    }
</style>
</head>
<body>


    <div id="wrapper">
    
        <jsp:include page="../common/adminNav.jsp" />
        
        <div id="member-wrapper" class="d-flex flex-column">
                
            <!-- Main Content -->
            <div id="content">
            
            <jsp:include page="../common/adminTop.jsp" />
            
            <h1 class="h3 mb-4 text-gray-800">회원 정보 조회</h1>
                
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th style="width: 70px;">회원ID</th>
                        <th style="width: 50px;">이름</th>
                        <th style="width: 100px;">생년월일</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th style="width: 100px;">회원 가입일</th>
                        <th style="width: 70px;">회원 상태</th>
                        <th>주소</th>
                    </tr>
                </thead>
                <tbody>     
                <c:forEach var="me" items="${requestScope.list}">
                    <tr>
                        <td>${me.userId}</td>
                        <td>${me.userName}</td>
                        <td>${me.userBirth}</td>
                        <td>${me.email}</td>
                        <td>${me.phone}</td>
                        <td>${me.enrollDate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${me.status == 1}">
                                  	  활성
                                </c:when>
                                <c:when test="${me.status == 2}">
                                    	비활성
                                </c:when>
                                <c:otherwise>
                                    	알 수 없음
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${me.address}</td>
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
                let userId = $(this).find("td:eq(0)").text().trim();
                location.href = "AdupdateMemberForm.me?userId=" + userId;
            });     
        });
    </script>
	
</body>
</html>