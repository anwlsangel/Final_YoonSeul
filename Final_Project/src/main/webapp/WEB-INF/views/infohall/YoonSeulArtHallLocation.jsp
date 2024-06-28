<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>윤슬아트홀</title>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
            margin: 20px auto;
            margin-top: 130px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            min-height: calc(100vh - 160px);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-family: 'Nanum Brush Script', cursive;
            font-style: italic;
            font-size: 3em;
        }
        .map {
            text-align: center;
            margin: 20px 0;
        }
        .map #map {
            width: 100%;
            height: 450px;
        }
        .directions {
            margin: 20px 0;
        }
        .directions h2 {
            color: #444;
            margin-bottom: 10px;
        }
        .directions p {
            margin: 10px 0;
            color: #555;
        }
        hr {
            border: 0;
            height: 1px;
            background-color: #810000;
            width: 80%;
        }
        .footer {
            background-color: #810000;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: 20px;
        }
    </style>
</head>
<body>
        <jsp:include page="../common/header.jsp" />
    <div class="container">
        <div align="center">
            <h3 class="blinking-text" id="blinkingText"></h3>
        </div>
        <h1>오시는 길</h1>
        <br>
        <div class="map">
            <div id="map"></div>
        </div>
        <br>
        <hr>
        <div class="directions">
            <h2>대중교통 이용 시</h2>
            <p><strong>지하철:</strong> 2호선 강남역 3번 출구에서 도보 10분</p>
            <p><strong>버스:</strong> 341번, 360번, 740번 버스 이용, 강남역 하차 후 도보 5분</p>
            <h2>자가용 이용 시</h2>
            <p><strong>주소:</strong> 서울특별시 강남구 테헤란로 123 윤슬아트홀</p>
            <p>주차는 윤슬아트홀 주차장을 이용하시면 됩니다. 주차 공간이 협소하니 대중교통 이용을 권장드립니다.</p>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2001 - <span id="currentYear"></span> 윤슬아트홀. All rights reserved.</p>
    </div>
    <script>
        function initMap() {
            var seongnamArtsCenter = { lat: 37.58655548095703, lng: 126.97480773925781 };
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: seongnamArtsCenter
            });
            var marker = new google.maps.Marker({
                position: seongnamArtsCenter,
                map: map,
                title: '윤슬아트홀'
            });
        }

        const yearSpan = document.getElementById("currentYear");
        const currentYear = new Date().getFullYear();
        yearSpan.textContent = currentYear;

        document.addEventListener("DOMContentLoaded", function () {
            const text = "윤슬처럼 반짝이는 당신을 위한 공간";
            const container = document.getElementById("blinkingText");
            text.split("").forEach((char, index) => {
                const span = document.createElement("span");
                span.textContent = char;
                span.style.setProperty('--delay', index);
                container.appendChild(span);
            });
        });
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCIMzf-cs1x8YnpGCDGL1qKCF02Mr00H94&callback=initMap"></script>
</body>
</html>
