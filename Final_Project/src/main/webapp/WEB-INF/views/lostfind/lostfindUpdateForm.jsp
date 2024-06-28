<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>윤슬아트홀</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <style>
    	#contentForm {
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
        }
        .image-item img {
            max-width: 100%;
            height: auto;

        }
    </style>
</head>
<body>
   <%@ include file="../common/header.jsp" %>
<div class="container">
<div id="contentForm">
    <form id="updateForm" method="post" action="update.lo" enctype="multipart/form-data">
        <input type="hidden" name="lostNo" id="lostNo" value="${l.lostNo}">
        <input type="hidden" name="existingFilesData" id="existingFilesData">
        <table align="center" class="file-table">
            <tr>
                <th><label for="lostTitle">제목</label></th>
                <td><input type="text" id="title" class="form-control" name="lostTitle" value="${l.lostTitle}" required></td>
            </tr>
            <tr>
                <th>작성일</th>
                    <td colspan="3">
                    	${ l.date }
                    </td>
                </tr>
            <tr>
                <th>
                    <label>첨부파일</label><br>
                    <button type="button" class="btn btn-secondary" onclick="document.getElementById('upfile').click()">파일 추가</button>
                </th>
                <td>
                    <input type="file" id="upfile" class="form-control-file border" accept="image/*" name="reupfiles" style="display:none;" onchange="handleFileChange(event)">
                    <table id="fileList" class="file-table">
                    
                    </table>
                </td>
            </tr>
            <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
            </tr>
            <tr>
                <td colspan="4">
                    <div id="contentPreview" class="image-container">
                        <!-- 기존 파일 미리보기를 여기에 추가할 예정 -->
                    </div>
                    <textarea id="content" class="form-control" name="lostContent" required>${l.lostContent}</textarea>
                </td>
            </tr>
        </table>
        <br>
        <div align="center">
        <a class="btn btn-primary" href="list.lo?cpage=<%= request.getAttribute("currentPage") %>">목록가기</a>
            <button type="submit" class="btn btn-primary" onclick="submitForm(event)">수정하기</button>
            <button type="button" class="btn btn-danger" onclick="clearFileList()">모든 파일 삭제</button>
        </div>
        
    </form>
</div>
</div>
 <jsp:include page="../common/footer.jsp" />
<script>
// 기존 파일 목록을 저장합니다.
let existingFiles = [];
let uploadedFiles = [];

// 페이지 로드 시 기존 파일 목록을 표시합니다.
$(document).ready(function() {
	displayExistingFiles();
});

// 기존 파일 목록을 표시하는 함수입니다.
function displayExistingFiles() {
	existingFiles = ${arrLi};
    const fileListElement = $('#fileList');
    fileListElement.empty(); // 파일 목록 초기화

    // 기존 파일을 순회하며 테이블에 추가합니다.
    existingFiles.forEach(function(file, index) {
        addFileToTable(file, index, fileListElement, true);
    });

    // 기존 파일 미리보기를 업데이트합니다.
    updateFilePreview();
}

// 파일을 테이블에 추가하는 함수입니다.
function addFileToTable(file, index, fileListElement, isExisting = false) {
    const newRow = $('<tr></tr>');
    const fileNameCell = $('<td></td>');
    const deleteCell = $('<td></td>');

    // 파일명을 표시할 span 요소를 생성합니다.
    const fileNameSpan = $('<span></span>');
    fileNameSpan.text(isExisting ? file.fileName : file.name); // 기존 파일과 새 파일의 이름 속성이 다를 수 있습니다.
    fileNameSpan.addClass('fileName');
    fileNameCell.addClass('file-name');
    fileNameCell.append(fileNameSpan);

    // 삭제 버튼을 생성합니다.
    const removeButton = $('<button></button>');
    removeButton.attr('type', 'button');
    removeButton.addClass('btn btn-danger delete-button');
    removeButton.text('삭제');
    removeButton.click(function() {
        if (isExisting) {
            // 기존 파일 목록에서 해당 파일을 삭제합니다.
            existingFiles.splice(index, 1);
        } else {
            // 새로 업로드된 파일을 삭제합니다.
            uploadedFiles.splice(index - existingFiles.length, 1);
        }

        // 파일 목록을 다시 표시합니다.
        updateFileList();

        // 파일 입력 요소 초기화
        resetFileInput();
    });
    deleteCell.addClass('delete-button');
    deleteCell.append(removeButton);

    // 셀을 행에 추가합니다.
    newRow.append(fileNameCell);
    newRow.append(deleteCell);
    fileListElement.append(newRow);
}

// 파일 선택 시 처리하는 함수입니다.
function handleFileChange(event) {
    const fileInput = event.target;
    const newFile = fileInput.files[0];

    // 파일이 이미 업로드된 파일인지 확인합니다.
    if (isFileAlreadyUploaded(newFile)) {
        alert('같은 파일은 중복해서 업로드할 수 없습니다.');
        fileInput.value = ''; // 파일 선택 초기화
        return;
    }

    // 새로 업로드된 파일을 배열에 추가합니다.
    uploadedFiles.push(newFile);

    // 파일 목록을 업데이트하고 미리보기를 생성합니다.
    updateFileList();
}

// 파일 목록을 업데이트하고 테이블에 표시하는 함수입니다.
function updateFileList() {
    const fileListElement = $('#fileList');
    fileListElement.empty(); // 파일 목록 초기화

    existingFiles.forEach(function(file, index) {
        addFileToTable(file, index, fileListElement, true);
    });

    uploadedFiles.forEach(function(file, index) {
        addFileToTable(file, existingFiles.length + index, fileListElement, false);
    });

    // 이미지 미리보기를 업데이트합니다.
    updateFilePreview();
}

// 모든 파일 목록을 초기화하는 함수입니다.
function clearFileList() {
    uploadedFiles = []; // 업로드된 파일 목록 초기화
    existingFiles = [];
    updateFileList(); // 파일 목록 업데이트
    updateFilePreview(); // 이미지 미리보기 업데이트

    // 파일 선택 초기화
    resetFileInput();
}

function isFileAlreadyUploaded(newFile) {
    // 업로드된 파일(새로 추가된 파일)과 기존 파일 모두에서 중복 검사를 수행합니다.
    return uploadedFiles.some(function(file) {
        return file.name === newFile.name;
    }) || existingFiles.some(function(file) {
        return file.fileName === newFile.name;
    });
}

// 파일 입력 요소를 초기화하는 함수입니다.
function resetFileInput() {
    const fileInput = document.getElementById('upfile');
    fileInput.value = '';
}

// 이미지 미리보기를 업데이트하는 함수입니다.
function updateFilePreview() {
    const contentPreview = document.getElementById('contentPreview');
    contentPreview.innerHTML = ''; // 기존 이미지 초기화

    const imageElements = [];

    // 기존 파일을 순회하며 이미지 파일에 대한 미리보기를 생성합니다.
    existingFiles.forEach(function(file, index) {
        const imgElement = document.createElement('img');
        imgElement.src = file.fileRoot; // 이미지 파일 경로를 설정합니다.
        imgElement.classList.add('image-preview');
        imgElement.style.width = '200px';

        imageElements.push({ imgElement: imgElement, index: index });
    });

    // 새로 추가된 파일에 대한 미리보기를 생성합니다.
    uploadedFiles.forEach(function(file, index) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const imgElement = document.createElement('img');
            imgElement.src = e.target.result;
            imgElement.classList.add('image-preview'); // 선택적으로 CSS 클래스 추가
            imgElement.style.width = '200px';

            imageElements.push({ imgElement: imgElement, index: existingFiles.length + index });

            // 모든 이미지를 추가한 후에 정렬하여 미리보기를 업데이트합니다.
            addImagesToPreview(imageElements);
        };
        reader.readAsDataURL(file); // 파일을 Data URL로 읽습니다.
    });

    // 모든 이미지를 추가한 후에 정렬하여 미리보기를 업데이트합니다.
    addImagesToPreview(imageElements);
}

function addImagesToPreview(imageElements) {
    // 이미지를 data-index 값에 따라 정렬합니다.
    imageElements.sort(function(a, b) {
        return parseInt(a.index) - parseInt(b.index);
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

function submitForm(event) {
    event.preventDefault();

    const form = document.getElementById('updateForm');
    const formData = new FormData(form);  // 폼 데이터 생성
    const existingFilesData = document.getElementById('existingFilesData');
    
    // existingFiles 데이터를 JSON 문자열로 변환하여 추가
    formData.append('existingFilesData', JSON.stringify(existingFiles));
    
    // uploadedFiles 배열의 각 파일을 폼 데이터에 추가
    uploadedFiles.forEach(file => {
        formData.append('reupfiles', file);
    });

    // AJAX 요청으로 폼 데이터 전송
    const xhr = new XMLHttpRequest();
    xhr.open('POST', form.action, true);
    xhr.onload = function() {

            alert('게시물이 성공적으로 업로드되었습니다.');
            window.location.href = "list.lo";
     
    };
    xhr.send(formData);  // FormData 객체 전송
}
</script>

</body>
</html>