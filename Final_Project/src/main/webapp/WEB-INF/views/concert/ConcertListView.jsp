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
        height: 230px;
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
        text-decoration: none; /* 링크 밑줄 제거 */        
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
        font-size: 15px;
        text-decoration: none; /* 링크 밑줄 제거 */
        color: inherit; /* 부모 요소의 색상 상속 */
        padding: 5px 10px; /* 패딩 추가 */
        transition: background-color 0.3s ease; /* 배경색 전환 효과 */
        
    }

    .concert-navi-2 a:hover {
        background-color: #f0f0f0; /* 호버 시 배경색 */
        cursor: pointer;
        text-decoration: none; /* 링크 밑줄 제거 */
    }

    .search {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        margin: 30px;
    }
    
    .search input {
        padding: 5px;
        font-size: large;
        width: 20%; /* 원하는 너비로 설정 */
        box-sizing: border-box;
        margin-right: 10px; /* 버튼과의 간격 조절 */
    }
    
    .search button {
        padding: 5px 10px;
        font-size: large;
        border: none;
        background-color: lightgray;
        color: black;
        cursor: pointer;
        border-radius: 5px; /* 둥근 모서리 추가 */
        transition: background-color 0.3s ease; /* 배경색 전환 효과 */
    }

    .search button:hover {
        background-color: gray; /* 호버 시 배경색 */
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

<c:set var="sort" value="${param.sort != null ? param.sort : 'date'}" />
<c:set var="category" value="${param.category != null ? param.category : '전체보기'}" />

<div class="container">
    <div class="concert-navi">
        <div class="concert-navi-category">
            <a href="list.co?category=전체&sort=${sort}">전체</a>
            <a href="list.co?category=콘서트&sort=${sort}">콘서트</a>
            <a href="list.co?category=연극&sort=${sort}">연극</a>
            <a href="list.co?category=뮤지컬&sort=${sort}">뮤지컬</a>
            <a href="list.co?category=로맨스&sort=${sort}">로맨스</a>
            <a href="list.co?category=아동&sort=${sort}">아동</a>
            <a href="list.co?category=전시&sort=${sort}">전시</a>
        </div>                     
    </div>
    <form action="search.co">
        <div class="search">
            <input type="text" name="keyword" placeholder="공연 제목" style="text-align: center;">
            <input type="hidden" name="category" value="${category}">
            <input type="hidden" name="sort" value="${sort}">
            <button type="submit">검색</button>
        </div>
    </form>
    <hr>
    <div class="concert-navi-2">
        <div class="concert-navi-category-2"> 
            <a href="list.co?category=${category}&sort=popularity">인기순</a>
            <a href="list.co?category=${category}&sort=date">최신순</a>
            <a href="list.co?category=${category}&sort=price">저렴한 가격순</a>
            <a href="list.co?category=${category}&sort=price">스탠딩</a> 
            <a href="list.co?category=${category}&sort=price">좌석</a>              
        </div>                    
    </div>
    <hr>

    <h1 id="page-title" style="text-align: center; color: black;">${category}</h1>

    <div id="concert-list" class="concert-list">
        <c:forEach var="co" items="${requestScope.list}">
            <div class="concert-list-detail">
                <a href="detail.co?cno=${co.concertId}">
                    <img src="${co.thumbnailRoot}">
                </a>
                <div class="detail-title">${co.concertName}</div>
                <div class="detail-text">${co.startDate}</div>
            </div>
        </c:forEach >
    </div>
</div>
<script>
    $(function() {
        selectList();
    });

    document.addEventListener('DOMContentLoaded', function() {
        const categoryLinks = document.querySelectorAll('.concert-navi-category a');
        const pageTitle = document.getElementById('page-title');

        categoryLinks.forEach(link => {
            link.addEventListener('click', function(event) {
                const category = this.innerText.trim();
                pageTitle.textContent = category;
            });
        });
    });
</script>
</body>
</html>
