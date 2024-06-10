<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        width: 150px;
        height: 200px;
        margin: auto;
        align-items: center;
        margin-bottom: 200px;
    }

    .concert-list-detail img {
        width: 100%;
        height: auto;
        object-fit: cover;
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
</style>
<body>

<jsp:include page="../common/header.jsp" />

<div class="concert-navi">
        <div class="concert-navi-category"> 
            <a>콘서트</a>
            <a>연극</a>
            <a>뮤지컬</a>
            <a>로맨스</a>
            <a>아동</a>
            <a>전시</a>
        </div>            
        <input type="text" value="공연 검색" style="text-align: center;">
    </div>
    <hr>
    <div class="concert-navi">
        <div class="concert-navi-category"> 
            <a>최신순</a>
            <a>인기 많은 순</a>
            <a>가격 순</a>
        </div>                    
    </div>
    <hr>

    <h1 style="text-align: center; color: black;">콘서트</h1>
    <div class="concert-list">
            <div class="concert-list-detail"><img src="resources/image/b1.jpg" style="width: 100%; height: 100%;">
                <div class="detail-title">공연제목</div>
                <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
            </div>                    
            <div class="concert-list-detail"><img src="resources/image/b2.jpg" style="width: 100%; height: 100%;">
                <div class="detail-title">공연제목</div>
                <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
            </div>
            <div class="concert-list-detail"><img src="resources/image/b3.jpg" style="width: 100%; height: 100%;">
                <div class="detail-title">공연제목</div>
                <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
            </div>
            <div class="concert-list-detail"><img src="resources/image/b4.jpg" style="width: 100%; height: 100%;">
                <div class="detail-title">공연제목</div>
                <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
            </div>
            <div class="concert-list-detail"><img src="resources/image/b5.jpg" style="width: 100%; height: 100%;">
                <div class="detail-title">공연제목</div>
                <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
            </div>
    </div>

    <div class="concert-list">
        <div class="concert-list-detail"><img src="resources/image/b1.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>                    
        <div class="concert-list-detail"><img src="resources/image/b2.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>
        <div class="concert-list-detail"><img src="resources/image/b3.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>
        <div class="concert-list-detail"><img src="resources/image/b4.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>
        <div class="concert-list-detail"><img src="resources/image/b5.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>
    </div>
    <div class="concert-list">
        <div class="concert-list-detail"><img src="resources/image/b1.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>                    
        <div class="concert-list-detail"><img src="resources/image/b2.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>
        <div class="concert-list-detail"><img src="resources/image/b3.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>
        <div class="concert-list-detail"><img src="resources/image/b4.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>
        <div class="concert-list-detail"><img src="resources/image/b5.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>
    </div>
    <div class="concert-list">
        <div class="concert-list-detail"><img src="resources/image/b1.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>                    
        <div class="concert-list-detail"><img src="resources/image/b2.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>
        <div class="concert-list-detail"><img src="resources/image/b3.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>
        <div class="concert-list-detail"><img src="resources/image/b4.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>
        <div class="concert-list-detail"><img src="resources/image/b5.jpg" style="width: 100%; height: 100%;">
            <div class="detail-title">공연제목</div>
            <div class="detail-text">어쩌구저쩌구 저쩌구 어쩌구</div>
        </div>
    </div>

</body>
</html>