<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 태그리브 지시어 추가 0611 - 무진 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>달빛마당 - 윤슬아트홀</title>
    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            overflow: auto; /* 전체 페이지에 스크롤 허용 */
        }
        body {
            font-family: 'Nanum Gothic', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
        }
        .moon-container {
            width: 1000px; /* 고정 너비 */
            margin: 120px auto 0 auto; /* 상단에 헤더 높이만큼 여백 추가 */
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height: auto;
        }
        .moon-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .moon-header h1 {
            color: #333;
            font-size: 2em;
            margin: 0;
            margin-right: 20px;
        }
        .moon-intro-text {
            color: #555;
            font-size: 1.2em;
        }
        .moon-intro-text span {
            font-weight: bold;
        }
        .moon-content-wrapper {
            display: flex;
            flex-direction: row;
        }
        .moon-image-section {
            width: 400px;
            margin-left: 20px;
        }
        .moon-image-section img {
            width: 100%;
            height: auto;
            margin-bottom: 20px;
        }
        .moon-content {
            width: 550px;
        }
        .moon-content h3 {
            color: #810000;
            font-size: 1.2em;
            margin-bottom: 20px;
        }
        .moon-content p {
            line-height: 1.6;
            color: #333;
            margin-bottom: 20px;
        }
        .footer {
            background-color: #810000;
            color: white;
            text-align: center;
            padding: 10px 0;
            width: 100%;
            flex-shrink: 0;
            position: fixed; /* 화면 하단에 고정 */
            bottom: 0;
            left: 0;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="moon-container">
        <div class="moon-header">
            <h1>달빛마당</h1>
            <div class="moon-intro-text">
                <span>윤슬아트홀 달빛마당을 소개합니다.</span><br>
                윤슬아트홀은 최고의 문화시설로 여러분을 기다립니다.
            </div>
        </div>
        <div class="moon-content-wrapper">
            <div class="moon-content">
                <h3>자유로운 분위기의 스탠딩 콘서트홀</h3>
                <p>달빛마당은 윤슬아트홀 내에 위치한 스탠딩 콘서트홀입니다. 다양한 장르의 음악과 공연을 자유로운 분위기 속에서 즐길 수 있는 공간입니다. 달빛마당은 현대적인 인테리어와 최신 기술이 적용된 음향 시스템을 자랑합니다.</p>
                <p>달빛마당은 최첨단 음향 및 조명 시스템을 갖추고 있으며, 무대 면적은 250제곱미터입니다. 백스테이지 및 분장실도 완비되어 있어 출연진들이 편안하게 준비할 수 있습니다. 홀은 스탠딩 공연을 위해 설계되었으며, 최대 300명의 관객을 수용할 수 있습니다.</p>
                <p>달빛마당에서는 다양한 장르의 음악 공연이 열립니다. 락 콘서트, 인디 밴드 공연, DJ 파티 등 다양한 행사가 진행됩니다. 최신 공연 정보는 윤슬아트홀 웹사이트에서 확인할 수 있습니다.</p>
                <p>달빛마당 예약은 윤슬아트홀 공식 웹사이트에서 가능합니다. 예약 절차는 간단하며, 온라인으로 쉽게 예약할 수 있습니다. 자세한 사항은 예약 안내 페이지를 참고하시기 바랍니다.</p>
            </div>
            <div class="moon-image-section">
                <img src="resources/image/달빛마당1.jpg" alt="달빛마당">
                <img src="resources/image/달빛마당2.jpg" alt="달빛마당 내부">
            </div>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2001 - <span id="currentYear"></span> 윤슬아트홀. All rights reserved.</p>
    </div>
    <script>

        // 현재 연도 설정
        document.getElementById('currentYear').textContent = new Date().getFullYear();
    </script>
</body>
</html>