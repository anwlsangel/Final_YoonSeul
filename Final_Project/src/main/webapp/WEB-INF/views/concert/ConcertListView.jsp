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
        border-radius: 20px;
    }

    .detail-title {
        width: 100%;
        height: 30px;
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
        font-size: 10px;
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
        gap: 50px; /* 링크들 사이의 간격 */
        width: 100%;
        font-weight: bold;
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
        color: red;     
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
        color: red;
    }

    .search {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        height: 70px;
    }
    
    .search input {
        padding: 5px;
        font-size: large;
        width: 20%; /* 원하는 너비로 설정 */
        box-sizing: border-box;
        margin-right: 10px; /* 버튼과의 간격 조절 */
    }
    
    .container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            min-height: calc(100vh - 160px); /* 화면 높이에서 헤더와 푸터를 제외한 높이 설정 */
    }    
    .active-sort {
	    font-weight: bold;
        font-size: 20px !important;
	}

    .search-input {
        position: relative;
        width: 300px;
        margin-left: 50px;
        display: flex;
    }
    
    .search-input > input {
        font-size: 15px;
        color: #222222;
        width: 300px;
        border: none;
        border-bottom: solid #aaaaaa 1px;
        padding-bottom: 10px;
        padding-left: 10px;
        position: relative;
        background: none;
        z-index: 5;
    }

    #keyword::placeholder { color: #aaaaaa; }
    #keyword:focus { outline: none; }

    .search-input span {
        display: block;
        position: absolute;
        bottom: 0;
        left: 0%;  /* right로만 바꿔주면 오 - 왼 */
        background-color: #666;
        width: 0;
        height: 2px;
        border-radius: 2px;
        transition: 0.5s;
    }

    .search-input label {
        position: absolute;
        color: #aaa;
        left: 10px;
        font-size: 20px;
        bottom: 8px;
        transition: all .2s;
    }

    #keyword:focus ~ label, #keyword:valid ~ label {
        font-size: 16px;
        bottom: 40px;
        color: #666;
        font-weight: bold;
    }

    .search-input img {
        width: 30px;
        height: 30px;
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
            <a href="list.co?category=콘서트&sort=${sort}">콘서트&#127908;</a>
            <a href="list.co?category=연극&sort=${sort}">연극&#127916;</a>
            <a href="list.co?category=뮤지컬&sort=${sort}">뮤지컬&#127926;</a>
            <a href="list.co?category=로맨스&sort=${sort}">로맨스&#128149;</a>
            <a href="list.co?category=아동&sort=${sort}">아동&#128118;</a>
            <a href="list.co?category=공포&sort=${sort}">공포👻</a>
        </div>                     
    </div>
    <form action="search.co">
        <div class="search">
            <div class="search-input">
                <input type="text" required name="keyword" id="keyword">
                <label>공연 검색</label>
                <button type="submit"><img src="${pageContext.request.contextPath}/resources/image/searchButton.png" alt="Search"></button>
            </div>
            <input type="hidden" name="category" value="${category}">
            <input type="hidden" name="sort" value="${sort}">            
        </div>
    </form>
    <hr>
    <div class="concert-navi-2">
    <div class="concert-navi-category-2">
        <a href="list.co?category=${category}&sort=popularity" class="${param.sort == 'popularity' ? 'active-sort' : ''}">인기순</a>
        <a href="list.co?category=${category}&sort=date" class="${param.sort == 'date' ? 'active-sort' : ''}">최신순</a>
        <a href="list.co?category=${category}&sort=price" class="${param.sort == 'price' ? 'active-sort' : ''}">저렴한 가격순</a>
        <a href="list.co?category=${category}&sort=standing" class="${param.sort == 'standing' ? 'active-sort' : ''}">스탠딩</a>
        <a href="list.co?category=${category}&sort=seating" class="${param.sort == 'seating' ? 'active-sort' : ''}">좌석</a>
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
                <span>${co.price} 원</span>
                <div class="detail-text">${co.startDate} ~ ${co.endDate}</div>
            </div>
        </c:forEach >
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>
