<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        #noticeList {text-align:center;}
        #noticeList>tbody>tr:hover {cursor:pointer;}

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
    </style>
</head>
<body>
    
	<div id="wrapper">
	
	    <jsp:include page="../common/adminNav.jsp" />
		
		<div id="content-wrapper" class="d-flex flex-column">
	        	
	    	<!-- Main Content -->
	        <div id="content">
	        
	        <jsp:include page="../common/adminTop.jsp" />
<div class="container">
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>공지사항</h2>
            <br>
            
            <c:if test="${ (not empty sessionScope.loginUser) and (sessionScope.loginUser.userId eq 'admin')}">
	            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
	            <a class="btn btn-secondary" style="float:right;" href="enrollForm.adno">글쓰기</a>
	            <br>
	        </c:if>
            
            <br>
            <table id="noticeList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="n" items="${ list }">
                		<tr>
                			<td>${ n.noticeNo }</td>
                			<td>${ n.noticeTitle }</td>
                			<td>${ n.noticeCount }</td>
                			<td>${ n.createDate }</td>
                		</tr>
                	</c:forEach>
                </tbody>
            </table>
            <br>
            
            <script>
            	$(function() {
            		
            		$("#noticeList>tbody>tr").click(function() {
            			
            			let nno = $(this).children().eq(0).text();
            			let currentPage = "${pi.currentPage}";
            			console.log(currentPage);
            			location.href = "detail.adno?nno=" + nno + "&cpage=" + currentPage;
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
                    		   href="list.adno?cpage=${ pi.currentPage - 1 }">
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
		                    	<a class="page-link" href="list.adno?cpage=${ p }">
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
	                    	   href="list.adno?cpage=${ pi.currentPage + 1 }">
	                    		Next
	                    	</a>
	                    </li>
	                </c:otherwise>
                    </c:choose>
                </ul>                
            </div>

			<br clear="both"><br>
			
			<div style="width:100%; height: 50px;">
				<form id="searchForm" action="list.adno" method="get">
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
</div>
</div>
</div>

</body>
</html>