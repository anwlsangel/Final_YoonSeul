<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>윤슬아트홀</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        #contentForm {
            padding-top: 100px;
        }
        .file-table {
            width: 70%;
            margin-top: 10px;
            border-collapse: collapse;
            border: 1px solid;
        }
        .file-table th, .file-table td {
            padding: 8px;
            border: 1px solid;
        }
        .file-table td {
            width: 80%;
            vertical-align: top;
        }
        .file-name {
            width: 75%;
            padding-right: 10px;
        }
        .delete-button {
            width: 100%;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        #content, #title, #fileList {
            width: 98%;
            border: none;
        }
        textarea {
            height: 500px;
        }
        .image-item {
            display: block; /* 이미지가 가운데 정렬되도록 inline-block으로 설정 */
            text-align: center; /* 내부 요소들을 가운데 정렬하기 위한 스타일 */
            mega-width: 100%;
            height: auto;
            margin-bottom: 30px;
        }
        .image-container {
             width: 100%;
            height: auto;
            text-align: center; 
            margin-bottom: 30px;
        }
        
        #fileList td{
        	width:100px;
        	height: 70px;
        	border: none;
        }
        
        #fileList tr {
        	border: none;
        }
        
        #fileList {
        	width:100%;
        	height: 100px;
        	border: none;
        }


    </style>
</head>
	<div id="wrapper">
	
	    <jsp:include page="../common/adminNav.jsp" />
		
		<div id="content-wrapper" class="d-flex flex-column">
	        	
	    	<!-- Main Content -->
	        <div id="content">
	        
	        <jsp:include page="../common/adminTop.jsp" />
<body>
<div class="container">
<div id="contentForm">
    <form id="enrollForm" method="post" action="insert.adno" enctype="multipart/form-data">

        <table align="center" class="table table-bordered">
            <tr>
                <th colspan="2">제목</th>
                <td><input type="text" id="title" class="form-control form-control-user" name="noticeTitle" required></td>
            </tr>
           
          
            <tr>
                <th colspan="2">
                    <label>첨부파일</label><br>
                </th>
                <td>
                    <input type="file" id="upfile" class="form-control-file border" accept="image/*" name="upfile" onchange="previewImages()">

                </td>
            </tr>
            <tr>
                <th colspan="2"><label for="noticeContent">내용</label></th>
                <td>
                    <div class="preview-image" id="preview-image">

                    </div>                                    
                    <textarea id="content" class="form-control" name="noticeContent" required></textarea>
                </td>
            </tr>
        </table>
        <br>
        <div align="center">
	                <a class="btn btn-secondary" href="list.adno">목록가기</a>
	                <button type="submit" class="btn btn-primary">등록하기</button>
	                <button type="reset" class="btn btn-danger" onclick="clearFile()">초기화</button>
            		<button type="button" class="btn btn-danger" onclick="clearFile()">파일 초기화</button>

    </div>    
    </form>
</div>
</div>
</div>
</div>
</div>
    <script>
        
        // 파일 초기화
        function clearFile() {
            console.log("초기화 함수 실행");
            // 파일 선택 초기화
            document.getElementById('upfile').value = '';

            // 이미지 미리보기 초기화
            const contentPreview = document.getElementById('preview-image');
            contentPreview.innerHTML = '';
        }


        // 이미지 미리보기 업데이트 함수
        function previewImages() {
            console.log("이미지 추가용 함수 실행");
        const fileInput = event.target;
        const contentPreview = document.querySelector('.preview-image');

        contentPreview.innerHTML = ''; // 기존 이미지를 초기화
        const file = fileInput.files[0];

        if (fileInput.files.length === 0 || !file.type.match('image.*')) {
            return;
        }

        const reader = new FileReader();
        reader.onload = function(e) {
            const imgElement = document.createElement('img');
            imgElement.src = e.target.result;
            imgElement.classList.add('preview-image');
            

            // 이미지를 추가할 div 요소 생성
            const imageDiv = document.createElement('div');
            imageDiv.classList.add('image-item');
            imageDiv.appendChild(imgElement);

            // 이미지 미리보기 영역에 추가
            contentPreview.appendChild(imageDiv);
        };

        reader.readAsDataURL(file);
    }
           
   


    </script>
</body>
</html>