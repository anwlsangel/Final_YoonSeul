<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>윤슬아트홀</title>
    <style>
        #lostfindList {text-align:center;}
        #lostfindList>tbody>tr:hover {cursor:pointer;}

        #pagingArea {width:fit-content; margin:auto;}
        
       	.searchDiv {
       		display: flex;
       		box-sizing: border-box;
       		margin: auto;
       		display: flex;
  			justify-content: center;
       	}
       	
       	.searchDiv>input {
       		width: 30%;
       	}
       	
       	.searchDiv>button {
       		width: 10%;
       	} 
        .select {width:20%;}
        .text {width:53%;}
    </style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp" />
<div class="container">
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>유실물 센터</h2>
            <br>
            
            <c:if test="${ (not empty sessionScope.loginUser) and (sessionScope.loginUser.userId eq 'admin')}">
	            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
	            <a class="btn btn-secondary" style="float:right;" href="enrollForm.lo">글쓰기</a>
	            <br>
	        </c:if>
            
            <br>
            <table id="lostfindList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="l" items="${ list }">
                		<tr>
                			<td>${ l.lostNo }</td>
                			<td>${ l.lostTitle }</td>
                			<td>${ l.lostCount }</td>
                			<td>${ l.date }</td>
                		</tr>
                	</c:forEach>
                </tbody>
            </table>
            <br>
            
            <script>
            	$(function() {
            		
            		$("#lostfindList>tbody>tr").click(function() {
            			
            			let lno = $(this).children().eq(0).text();
            			let currentPage = "${pi.currentPage}";
            			
            			location.href = "detail.lo?lno=" + lno + "&cpage=" + currentPage;
            		});
            		
            	});
            </script>

            <div id="pagingArea">
                <ul class="pagination">
                
                	<c:choose>
                	<c:when test="${ pi.currentPage eq 1 }">	
                    	<li class="page-item disabled">
                    		<a class="page-link" href="#">Previous</a>
                    	</li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item">
                    		<a class="page-link" 
                    		   href="list.lo?cpage=${ pi.currentPage - 1 }">
                    			Previous
                    		</a>
                    	</li>
                    </c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }"
                    		   end="${ pi.endPage }"
                    		   step="1">
                    	
                    	<c:choose>	   
                    	<c:when test="${ pi.currentPage ne p }">
                    		<li class="page-item">
		                    	<a class="page-link" href="list.lo?cpage=${ p }">
									${ p }
								</a>
		                    </li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item active">
		                    	<a class="page-link">
									${ p }
								</a>
		                    </li>
                    	</c:otherwise>
	                    </c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    <c:when test="${ pi.currentPage eq pi.maxPage }">
	                    <li class="page-item disabled">
	                    	<a class="page-link" href="#">
	                    		Next
	                    	</a>
	                    </li>
                    </c:when>
                    <c:otherwise>
	                    <li class="page-item">
	                    	<a class="page-link" 
	                    	   href="list.lo?cpage=${ pi.currentPage + 1 }">
	                    		Next
	                    	</a>
	                    </li>
	                </c:otherwise>
                    </c:choose>
                </ul>
            </div>

            <br clear="both"><br>

			<div style="width:100%; height: 50px;">
				<form id="searchForm" action="list.lo" method="get">
					<div class="searchDiv">
						<input type="text" class="form-control" name="keyword" placeholder="제목">                
	                	<button type="submit" class="searchBtn btn btn-secondary">검색</button>
					</div>
				</form>
			</div>
            <br><br>
        </div>
        <br><br>

    </div>
</div>
    <jsp:include page="../common/footer.jsp" />

</body>
</html>