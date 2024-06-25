<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지 수정</title>
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
            width: 25%;
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

        #content, #title, #fileList {
            width: 98%;
            border: none;
        }
        textarea {
            height: 500px;
        }
        .image-item {
            display: inline-block; /* 이미지가 가운데 정렬되도록 inline-block으로 설정 */
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


    </style>
</head>
<%@ include file="../common/header.jsp" %>
<body>
<div class="container">
<div id="contentForm">
    <form id="updateForm" method="post" action="update.no" enctype="multipart/form-data">
        <input type="hidden" name="noticeImg" value="${n.noticeImg}">
        <input type="hidden" name="noticeNo" value="${n.noticeNo}">
        <input type="hidden" name="cpage" value="${currentPage}">
        <table align="center" class="file-table">
            <tr>
                <th><label for="noticeTitle">제목</label></th>
                <td><input type="text" id="title" class="form-control" name="noticeTitle" value="${n.noticeTitle}" required></td>
            </tr>
            <tr>
                <th>작성일</th>
                <td colspan="3">
                    ${n.createDate}
                </td>
            </tr>
            <tr>
                <th>
                    <label>첨부파일</label><br>
                    <button type="button" class="btn btn-secondary" onclick="document.getElementById('upfile').click()">파일 추가</button>
                </th>
                <td>
                    <input type="file" id="upfile" class="form-control-file border" accept="image/*" name="reupfile" style="display:none;" onchange="handleFileChange(event)">
                    <table id="fileList" class="file-table">
                        <tr>
                            <td class="file-name">
                                <span class="fileName" id="fileName"></span>
                            </td>
                            <td>
                                <button type="button" class="btn btn-danger delete-button" onclick="clearFile()">삭제</button>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <th><label for="noticeContent">내용</label></th>
                <td>
                    <div id="contentPreview" class="image-container">
                        <!-- 기존 파일 미리보기를 여기에 추가할 예정 -->
                    </div>
                    <textarea id="content" class="form-control" name="noticeContent" required>${n.noticeContent}</textarea>
                </td>
            </tr>
        </table>
        <br>
        <div align="center">
            <a class="btn btn-primary" href="list.no?cpage= ${currentPage}">목록가기</a>
            <button type="submit" class="btn btn-primary">수정하기</button>
            <button type="button" class="btn btn-danger" onclick="clearFile()">파일 삭제</button>
        </div>
    </form>
</div>
</div>

<script>
    window.onload = function() {
        // 기존 이미지 정보를 가져와서 미리보기
        let noticeImg = "${n.noticeImg}"; // 기존 이미지 경로나 파일명
        let noticeImgName = "${n.noticeImgName}";
        console.log(noticeImgName);
        if (noticeImg) {
            let imgPreview = document.createElement('img');
            imgPreview.src = noticeImg;
            imgPreview.style.width = '500px';
            imgPreview.alt = '기존 이미지 미리보기';
            document.getElementById('contentPreview').appendChild(imgPreview);
            document.getElementById('fileName').innerHTML = noticeImgName;
        }
    };

    function handleFileChange(event) {
        const fileInput = event.target;
        const newFile = fileInput.files[0];
        const contentPreview = document.getElementById('contentPreview');
        contentPreview.innerHTML = ''; // 기존 이미지 초기화
        document.getElementById('fileName').innerHTML = '';
        const reader = new FileReader();
        reader.onload = function(e) {
            let imgPreview = document.createElement('img');
            imgPreview.src = e.target.result;
            imgPreview.style.width = '500px';
            imgPreview.alt = '이미지 미리보기';
            contentPreview.appendChild(imgPreview);
        }
        reader.readAsDataURL(newFile);
        document.getElementById('fileName').innerHTML = newFile.name;
    }

    function clearFile() {
        document.getElementById('upfile').value = '';
        document.getElementById('fileName').innerHTML = '';
        const contentPreview = document.getElementById('contentPreview');
        contentPreview.innerHTML = '';
    }


</script>
</body>
</html>