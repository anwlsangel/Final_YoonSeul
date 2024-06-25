<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
    	#contentForm {
			padding-top : 100px;
			width : 70%;
			margin : auto;
		}
        table * {margin:5px;}
        table {width:100%;}
        #img {     display: block;
            margin: 0 auto;
            max-width : 100% ;
            height: auto;}
    </style>
</head>
<body>
        
    <jsp:include page="../common/header.jsp" />
<div class="container">
    <div id="contentForm">
        <br><br>
        <div class="innerOuter">
            

            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">
						${ requestScope.n.noticeTitle }
					</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td colspan="3">
                    	${ requestScope.n.createDate }
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4">
                    	<c:if test="${not empty n.noticeImg}">
            				<img id="img" src="${n.noticeImg}" alt="이미지">
        				</c:if>
                    	<p style="height:150px;">
                    		${ n.noticeContent }
                    	</p>
                    </td>
                </tr>
            </table>
            <br>

				
	            <div align="center">
	                <a class="btn btn-primary" href="list.no?cpage=${ currentPage }">목록가기</a>
	                <c:if test="${ (not empty sessionScope.loginUser) and (sessionScope.loginUser.userId eq 'admin') }">
	                <a class="btn btn-primary" onclick="postFormSubmit(2);">수정하기</a>
	                <a class="btn btn-danger" onclick="postFormSubmit(3);">삭제하기</a>
	            </div>
	            <br><br>
	            
	            <form id="postForm" action="" method="post">
	            	
	            	<input type="hidden" name="nno" value="${ n.noticeNo }">
	            	<input type="hidden" name="cpage" value="${ currentPage }">
	            	
	            	<input type="hidden" name="filePath" value="${ n.noticeImg }" >
	            </form>
	            
	            <script>
	            	function postFormSubmit(num) {
	            		

	            		
	            		if(num == 2) { // 수정하기 클릭 시
	            			
	            			$("#postForm").attr("action", "updateForm.no")
	            						  .submit();
	            			
	            		} else { // 삭제하기 클릭 시
	            			
	            			$("#postForm").attr("action", "delete.no")
	            						  .submit();
	            		}
	            		
	            	}
	            </script>
	            
			    	</c:if>


    </div>
  </div>  
  </div>
    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>