<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Google Fonts 링크 추가 -->
     <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
     <!-- jQuery library -->
     <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
     <!-- 온라인 방식 -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     <!-- Popper JS -->
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
     <!-- Latest compiled JavaScript -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
     <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
     <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
</head>
<style>
	.concert-list {
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        gap: 3px;
        margin: 10px auto;
}

    .concert-list-detail {
        display: flex;
        flex-direction: column;
        width: 170px;
        height: 200px;
        margin: auto;
        align-items: center;
        margin-bottom: 200px;
    }

    .concert-list-detail img {
        width: 100%;
        height: auto;
        object-fit: cover;
        cursor: pointer;
    }

    .detail-title {
        width: 100%;
        height: 50px;
        margin-top: auto;
        text-align: center;
        line-height: 50px;
    }

    .detail-title {
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .detail-text {
        font-size: 14px;
        color: #555;
        text-align: center;
    }

    .concert-navi {
        display: flex;
        flex-direction: column; /* 수직 정렬 */
        align-items: center; /* 가운데 정렬 */
        width: 100%;
        margin: 20px 0;
    }

    .concert-navi-category {
        display: flex;
        justify-content: center; /* 링크들을 가운데 정렬 */
        gap: 80px; /* 링크들 사이의 간격 */
        width: 100%;
    }

    .concert-navi a {
        font-size: large;
        text-decoration: none; /* 링크 밑줄 제거 */
        color: inherit; /* 부모 요소의 색상 상속 */
        padding: 5px 10px; /* 패딩 추가 */
        transition: background-color 0.3s ease; /* 배경색 전환 효과 */
    }

    .concert-navi a:hover {
        background-color: #f0f0f0; /* 호버 시 배경색 */
        cursor: pointer;
        
    }

    .concert-navi input {
        margin-left: auto;
        margin-top: 20px;
        padding: 5px;
        font-size: large;
        width: 20%; /* 원하는 너비로 설정 */
        box-sizing: border-box; /* 패딩을 포함한 너비 계산 */
    }
    
    .concert-navi-2 {
        display: flex;
        flex-direction: column; /* 수직 정렬 */
        align-items: center; /* 가운데 정렬 */
        width: 100%;
        margin: 20px 0;
    }

    .concert-navi-category-2 {
        display: flex;
        justify-content: center; /* 링크들을 가운데 정렬 */
        gap: 80px; /* 링크들 사이의 간격 */
        width: 100%;
    }

    .concert-navi-2 a {
        font-size: large;
        text-decoration: none; /* 링크 밑줄 제거 */
        color: inherit; /* 부모 요소의 색상 상속 */
        padding: 5px 10px; /* 패딩 추가 */
        transition: background-color 0.3s ease; /* 배경색 전환 효과 */
    }

    .concert-navi-2 a:hover {
        background-color: #f0f0f0; /* 호버 시 배경색 */
        cursor: pointer;
        
    }

    .concert-navi-2 input {
        margin-left: auto;
        margin-top: 20px;
        padding: 5px;
        font-size: large;
        width: 20%; /* 원하는 너비로 설정 */
        box-sizing: border-box; /* 패딩을 포함한 너비 계산 */
    }
    .container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            min-height: calc(100vh - 160px); /* 화면 높이에서 헤더와 푸터를 제외한 높이 설정 */
    }
</style>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
<div class="concert-navi">
        <div class="concert-navi-category">
        	<button onclick="selectList()">전체보기</button> 
            <button onclick="filterConcerts('콘서트')">콘서트</button>
            <button onclick="filterConcerts('연극')">연극</button>
            <button onclick="filterConcerts('뮤지컬')">뮤지컬</button>
            <button onclick="filterConcerts('로맨스')">로맨스</button>
            <button onclick="filterConcerts('아동')">아동</button>
            <button onclick="filterConcerts('전시')">전시</button>
        </div>               
        <input type="text" value="공연 검색" style="text-align: center;">
    </div>
    <hr>
    <div class="concert-navi-2">
        <div class="concert-navi-category-2"> 
            <button>인기 순</button>
            <button>최신 순</button>
            <button>가격 순</button>
        </div>                    
    </div>
    <hr>

    <h1 id="page-title" style="text-align: center; color: black;">전체보기</h1>
    <div id="concert-list" class="concert-list">
      
    </div>   
</div>
	<script>
	$(function() {
		
		selectList();
	})
	
    document.addEventListener('DOMContentLoaded', function() {
        const categoryButtons = document.querySelectorAll('.concert-navi-category button');
        const pageTitle = document.getElementById('page-title');

        categoryButtons.forEach(button => {
            button.addEventListener('click', function(event) {
                event.preventDefault();
                const category = this.innerText.trim();
                pageTitle.textContent = category;
            });
        });
    });    
    
    
    // 필터링용 ajax
    function filterConcerts(category) {
    	
    $.ajax({
        url: '${pageContext.request.contextPath}/filterConcerts',
        type: 'GET',
        data: { category: category },
        success: function(response) {
            const concertList = document.getElementById("concert-list");
            if (concertList) {
                concertList.innerHTML = '';

                response.forEach(function(concert) {
                	
                	// console.log(concert.startDate); // "6월 10, 2024"
                	// console.log(concert.startDate.split(" ")); // ['6월', '10,', '2024']
                	
                	// console.log(concert.startDate.split(" ")[0].replace("월", ""));
                	// console.log(concert.startDate.split(" ")[1].replace(",", ""));
                	// console.log(concert.startDate.split(" ")[2]);
                	let month = concert.startDate.split(" ")[0].replace("월", "");
                	let date = concert.startDate.split(" ")[1].replace(",", "");
                	let year = concert.startDate.split(" ")[2];
                	
                	if(month < 10) { month = "0" + month; }
                	if(date < 10) { date = "0" + date; }
                	
                	let startDate = year + "-" + month + "-" + date;
                	console.log(startDate)
                	
                    const concertDetail = document.createElement('div');
                    concertDetail.classList.add('concert-list-detail');
					
                    concertDetail.innerHTML = 
                        '<a href="list.co?cno=' + concert.concertId + '">' +
                        '<img src="' + concert.thumbnailRoot + '" style="width: 100%; height: 100%;">' +
                   		'</a>' +
                    	'<div class="detail-title">' + concert.concertName + '</div>' +
                    	'<div class="detail-text">' + startDate + '</div>';
                    ;

                    concertList.appendChild(concertDetail);
                    console.log(concertDetail);
                });
                console.log("성공", response);
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("ajax 통신 실패!");
        }
    });
}
    
    // 전체 조회용 ajax
    function selectList() {
    $.ajax({
        url: '<%= request.getContextPath() %>/selectListAll',
        type: 'GET',
        success: function(response) {
            const concertList = document.getElementById("concert-list");
            if (concertList) {
                concertList.innerHTML = '';
                response.forEach(function(concert) {
                	

                	let month = concert.startDate.split(" ")[0].replace("월", "");
                	let date = concert.startDate.split(" ")[1].replace(",", "");
                	let year = concert.startDate.split(" ")[2];
                	
                	if(month < 10) { month = "0" + month; }
                	if(date < 10) { date = "0" + date; }
                	
                	let startDate = year + "-" + month + "-" + date;
                	console.log(startDate)
                	
                	
                    const concertDetail = document.createElement('div');
                    concertDetail.classList.add('concert-list-detail');

                    concertDetail.innerHTML = 
                        '<a href="list.co?cno=' + concert.concertId + '">' +
                        '<img src="' + concert.thumbnailRoot + '" style="width: 100%; height: 100%;">' +
                   		'</a>' +
                    	'<div class="detail-title">' + concert.concertName + '</div>' +
                    	'<div class="detail-text">' + startDate + '</div>';
                    ;

                    concertList.appendChild(concertDetail);
                });
                console.log("성공", response);
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("ajax 통신 실패!");
        }
    });
}    
    
</script> 
</body>
</html>
