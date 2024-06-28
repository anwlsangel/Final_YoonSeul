<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>윤슬아트홀</title>
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
    <style>
        .footer {
            background-color: #810000;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: 20px;
            box-sizing : border-box;
            width : 100%;
            height : 180px;
        }
        .footer>div { width : 100%; }
        #footer_1 { height : 20%; }
        #footer_2 {
            height : 60%;
            display: flex;
            align-items: center; /* 이미지와 텍스트 수직 정렬 */
            flex-wrap: wrap; /* 필요시 줄 바꿈 */
            gap: px; /* 요소 간 간격 */
            margin-left: 10%;
        }
        #footer_3 {
            height : 20%;
            font-size: 12px;
        }
        #footer_2>p {
            /* border : 1px solid blue; */
            width : 100%;
            margin : 0px;
            box-sizing : border-box;
        }
        #footer_p1 {
            height : 80%;
            padding : 5px 15px;
            text-align: left;
            display: flex;
            font-size : 11px;
            flex-direction: column;
        }
        #footer_1>a {
            text-decoration : none;
            color : white;
            font-weight : 600;
            margin : 15px;
            vertical-align : middle;
            /*
                수직 구조에서 가운데로 오게끔 해주는 속성
            */
        }
        .footer_logo {
            display: inline-block;
            align-self: flex-start;
            margin: 0 20px 0 0;
        }
        #footer_text {
            display: inline-block;
            flex-direction: column;
            gap: 10px; /* 텍스트 요소 간 간격 */
        }
    </style>
</head>
<body>
    <div class="footer">
        <div id="footer_1">
            <a href="">아트홀소개</a> |
            <a href="">이용약관</a> |
            <a href="">개인정보처리방침</a> |
            <a href="">청소년보호정책</a> |
            <a href="">이용안내</a> |
            <a href="">티켓판매안내</a>
        </div>
        <div id="footer_2">
            <div class="footer_logo"><a href=""><img src="resources/image/8px+텍스트.png" alt=""></a></div>
            <div id="footer_text">
            <p id="footer_p1">
                "예술을 통해 세상을 밝히는 공간, 윤슬아트홀"<br>
                여러분의 방문을 환영합니다. 언제나 예술과 함께하는 윤슬아트홀이 되겠습니다. <br>
                문의: contact@yunseularthall.com | 전화: 02-123-4567 <br>
                주소: 서울특별시 강남구 테헤란로 123 윤슬아트홀<br>
            </p>
            </div>
            <!-- p 도 블럭요소라 영역 나누기 가능 -->
        </div>
        <div id="footer_3">
            <p>&copy; 2001 - <span id="currentYear"></span> 윤슬아트홀. All rights reserved.</p>
        </div>
    </div>
    <script>
        let leftoff = $("#footer_1 > a").eq(0).offset().left
        $(".footer_logo").offset( { left: leftoff })
        $("#footer_text").offset( {left:(leftoff+$(".footer_logo").width()*2)})
        // 현재 연도 표시
        const yearSpan = document.getElementById("currentYear");
        const currentYear = new Date().getFullYear();
        yearSpan.textContent = currentYear;
    </script>
</body>
</html>