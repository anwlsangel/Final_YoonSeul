<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>유실물 게시글 상세 정보</title>
        <!-- Google Fonts 링크 추가 -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <!-- 온라인 방식 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <style>
    
    	#img{width: 200px;}
		#contentForm {
			padding-top : 100px;
			
		}
        .file-table {
            width: 90%;
            margin-top: 10px;
            border-collapse: collapse;
        }
        .file-table th, .file-table td {
            padding: 8px;
            border-top: 2px solid #dee2e6;
            border-bottom: 2px solid #dee2e6;
        }
        .file-table td {
            vertical-align: top;
        }
        .file-name {
            width: 80%;
            padding-right: 10px;
        }
        .delete-button {
            width: 20%;
            text-align: center;
        }
        .delete-button button {
            width: 100%;
            padding: 5px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        .image-preview img {
            max-width: 100%;
            height: auto;
        }
        #content, #title, #fileList {
            width: 98%;
            border: none;
        }
        textarea {
            height: 100px;
        }
        .image-item {
            border: none;
            padding: 5px;
            margin: 5px;
            display: inline-block;
            width: 98%;
            text-align: center;
        }
        .image-container {
            display: flex;
            flex-direction: column;
            width: 98%;
        }
        .image-item img {
            max-width: 100%;
            height: auto;
        }
        th {
        	width : 20%;
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
    <div id="contentForm" align="center">
        <input type="hidden" name="id" value="${l.lostNo}">
        <table align="center" class="file-table">
            <tr>
                <th>제목</label></th>
                <td colspan="3">${l.lostTitle}</td>
            </tr>
        <tr>
                    <th>작성일</th>
                    <td colspan="3">
                    	${ l.date }
                    </td>
            </tr>    
                    <tr>
                    <th>내용</th>
                    <td colspan="3">
                    
                    </td>
            </tr>  
            <tr>
                <td colspan="4">
                    <table align="center" id="contentPreview">
                        <c:forEach var="lI" items="${arrLi}">
                            <div class="image-item">
                                <img id="img" src="${lI.fileRoot}" alt="${lI.fileName}">
                            </div>
                        </c:forEach>
                    </table>
                    <pre>${l.lostContent}</pre>
                </td>
            </tr>
        </table>
        <br>
        		
			
	            <div align="center">
	                <a class="btn btn-primary" href="list.adlo?cpage=${ currentPage }">목록가기</a>
	                <c:if test="${ (not empty sessionScope.loginUser) and (sessionScope.loginUser.userId eq 'admin') }">
	                <a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
	                <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
	            </div>
	            <br><br>
	            
	            <form id="postForm" action="" method="post">
	            	
	            	<input type="hidden" name="lno" value="${ l.lostNo }">
	            	<input type="hidden" name="filePath" value="${ lI.fileRoot }" >
	            	<input type="hidden" name="cpage" value="${ currentPage }" >
	            </form>
	            
	            <script>
	            	function postFormSubmit(num) {
	            		

	            		
	            		if(num == 1) { // 수정하기 클릭 시
	            			
	            			$("#postForm").attr("action", "updateForm.adlo")
	            						  .submit();
	            			
	            		} else { // 삭제하기 클릭 시
	            			
	            			$("#postForm").attr("action", "delete.adlo")
	            						  .submit();
	            		}
	            		
	            	}
	            </script>
	            
			</c:if>
    </div>    
</div>
</div>
</div>
</div>
</body>
</html>