<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>윤슬아트홀</title>
    <style>
    #contentForm{
    padding-top : 100px;
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
            height: 500px;
        }
        .image-item {
            border: 1px solid #ddd;
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
            margin: aouto;
        }
        .image-item img {
            max-width: 100%; /* 이미지 너비를 최대 부모 요소 너비로 조정 */
            height: auto; /* 높이는 자동으로 조정하여 원본 비율 유지 */
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
<body>
<div class="container">
<div id="contentForm">
    <form id="enrollForm" method="post" action="insert.adlo" enctype="multipart/form-data">

        <table align="center" class="table table-bordered">
            <tr>
                <th colspan="2">제목</th>
                <td><input type="text" id="title" class="form-control" name="lostTitle" required></td></td>
            </tr>
           
          
            <tr>
                <th colspan="2">
                    <label>첨부파일</label>
                    <button type="button" class="btn btn-secondary" onclick="document.getElementById('upfile').click()">파일 추가</button>
                    <br>
                </th>
                <td>
                    <input type="file" id="upfile" class="form-control-file border" accept="image/*" name="upfiles" style="display:none;" onchange="handleFileChange(event)">
                    <table id="fileList" class="file-table">
                        <!-- 업로드된 파일 목록이 여기에 나열됩니다. -->
                    </table>
                </td>
            </tr>
            <tr>
                <th colspan="2"><label for="noticeContent">내용</label></th>
                <td>
                    <div id="contentPreview" class="image-container">
                        <!-- 여기에 이미지 미리보기가 표시됩니다. -->
                    </div>
                    <textarea id="content" class="form-control" name="lostContent" required></textarea>
                </td>
            </tr>
        </table>
        <br>
        <div align="center">
	                <a class="btn btn-secondary" href="list.adno">목록가기</a>
	        <button type="submit" class="btn btn-primary" onclick="submitForm(event)">등록하기</button>
            <button type="reset" class="btn btn-danger" onclick="clearFileList()">초기화</button>
            <button type="button" class="btn btn-danger" onclick="clearFileList()">파일 초기화</button>

    </div>    
    </form>
</div>
</div>
</div>
</div>
</div>
    <script>
        let uploadedFiles = []; // 업로드된 파일 목록을 저장할 배열

        // 파일 선택 처리
        function handleFileChange(event) {
            const fileInput = event.target;
            const newFile = fileInput.files[0];

            // 중복 파일 체크
            if (isFileAlreadyUploaded(newFile)) {
                alert('같은 파일은 중복해서 업로드할 수 없습니다.');
                fileInput.value = ''; // 파일 선택 초기화
                return;
            }

            // 업로드된 파일 목록에 추가
            uploadedFiles.push(newFile);

            // 파일 목록을 업데이트
            updateFileList();

            // 이미지 미리보기 업데이트
            previewImages();
        }

        // 업로드된 파일 목록을 표시
        function updateFileList() {
            const fileListElement = document.getElementById('fileList');
            fileListElement.innerHTML = ''; // 파일 목록 초기화

            uploadedFiles.forEach(function(file, index) {
                const newRow = fileListElement.insertRow();
                const fileNameCell = newRow.insertCell();
                const deleteCell = newRow.insertCell();

                // 파일명 표시
                const fileNameSpan = document.createElement('span');
                fileNameSpan.textContent = file.name;
                fileNameCell.classList.add('file-name');
                fileNameCell.appendChild(fileNameSpan);

                // 삭제 버튼
                const removeButton = document.createElement('button');
                removeButton.type = 'button';
                removeButton.className = 'btn btn-danger delete-button';
                removeButton.textContent = '삭제';
                removeButton.onclick = function() {
                    // 파일 목록에서 삭제
                    uploadedFiles.splice(index, 1);

                    // 파일 목록 업데이트
                    updateFileList();

                    // 파일 선택 초기화
                    document.getElementById('upfile').value = '';

                    // 이미지 미리보기 업데이트
                    previewImages();
                };
                deleteCell.classList.add('delete-button');
                deleteCell.appendChild(removeButton);
            });
        }

        // 모든 파일 목록 초기화
        function clearFileList() {
            uploadedFiles = []; // 배열 초기화
            updateFileList(); // 목록 업데이트

            // 파일 선택 초기화
            document.getElementById('upfile').value = '';

            // 이미지 미리보기 초기화
            const contentPreview = document.getElementById('contentPreview');
            contentPreview.innerHTML = '';
        }

        // 중복 파일 체크 함수
		function isFileAlreadyUploaded(newFile) {
		    return uploadedFiles.some(function(file) {
		        return file.name === newFile.name && file.size === newFile.size;
		    });
		}

        // 이미지 미리보기 업데이트 함수
        function previewImages() {
            const contentPreview = document.getElementById('contentPreview');
            contentPreview.innerHTML = ''; // 기존 이미지를 초기화

            // 이미지를 순차적으로 처리하기 위한 배열
            const imageElements = [];

            // 업로드된 파일을 순회
            uploadedFiles.forEach(function(file, index) {
                if (file.type.match('image.*')) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        const imgElement = document.createElement('img');
                        imgElement.src = e.target.result;
                        imgElement.classList.add('preview-image'); // 선택적으로 CSS 클래스 추가
                        imgElement.setAttribute('data-index', index); // 인덱스 속성 추가
                        imgElement.style.width = '200px';

                        // 이미지 요소와 파일 정보를 가지고 있는 객체를 배열에 추가
                        imageElements.push({ imgElement, file });

                        // 모든 파일을 처리한 후에 이미지 추가 함수 호출
                        if (imageElements.length === uploadedFiles.length) {
                            addImagesToPreview(imageElements);
                      
                        }
                    }
                    reader.readAsDataURL(file);
                }
            });
        }

        // 이미지 요소를 미리보기에 추가하는 함수
    function addImagesToPreview(imageElements) {
    // 이미지를 data-index 값에 따라 정렬합니다.
    imageElements.sort(function(a, b) {
        return parseInt(a.imgElement.getAttribute('data-index')) - parseInt(b.imgElement.getAttribute('data-index'));
    });

    const contentPreview = document.getElementById('contentPreview');
    contentPreview.innerHTML = ''; // 이미지를 초기화합니다.

    const imageContainer = document.createElement('div');
    imageContainer.classList.add('image-container');

    // 정렬된 순서대로 이미지를 추가합니다.
		imageElements.forEach(function(imageElement) {
		    const imgElement = imageElement.imgElement;
		    const imgDiv = document.createElement('div');
		    imgDiv.classList.add('image-item');
		    imgDiv.appendChild(imgElement);
		    imageContainer.appendChild(imgDiv);
		});
    contentPreview.appendChild(imageContainer);
}
        
        // 폼 데이터 전송 처리
        function submitForm(event) {
            event.preventDefault();

            const form = document.getElementById('enrollForm');
            const formData = new FormData(form);

            // 업로드된 파일들을 FormData에 추가
            uploadedFiles.forEach(file => {
                formData.append('upfiles', file);
            });

            // AJAX 요청으로 폼 데이터 전송
            const xhr = new XMLHttpRequest();
            xhr.open('POST', form.action, true);
            xhr.onload = function() {
               
                    alert('게시물이 성공적으로 업로드되었습니다.');
                    window.location.href = "list.adlo";
         
            };
            xhr.send(formData);
        }
    </script>
</body>
</html>