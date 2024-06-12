<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>별빛홀 - 윤슬아트홀</title>
    <style>
        body {
            font-family: 'Nanum Gothic', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .star-container {
            max-width: 1000px;
            margin: 20px auto;
            margin-top: 130px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .star-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .star-header h1 {
            color: #333;
            font-size: 2em;
            margin: 0;
            margin-right: 20px;
        }
        .star-intro-text {
            color: #555;
            font-size: 1.2em;
        }
        .star-intro-text span {
            font-weight: bold;
        }
        .star-content-wrapper {
            display: flex;
            flex-direction: row;
        }
        .star-image-section {
            width: 40%;
            margin-left: 20px;
        }
        .star-image-section img {
            width: 100%;
            height: auto;
            margin-bottom: 20px;
        }
        .star-content {
            width: 55%;
        }
        .star-content h3 {
            color: #810000;
            font-size: 1.2em;
            margin-bottom: 20px;
        }
        .star-content p {
            line-height: 1.6;
            color: #333;
            margin-bottom: 20px;
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
    <div class="star-container">
    
        <div class="star-header">
            <h1>별빛홀</h1>
            <div class="star-intro-text">
                <span>윤슬아트홀 별빛홀을 소개합니다.</span><br>
                윤슬아트홀은 최고의 문화시설로 여러분을 기다립니다.
            </div>
        </div>
        <div class="star-content-wrapper">
            <div class="star-content">
                <h3>전통과 현대를 넘어 첨단 전위예술까지 아우르는 다목적 홀</h3>
                <p>별빛홀은 윤슬아트홀 내에 위치한 150석 규모의 콘서트홀입니다. 최상의 음향 시설과 편안한 좌석을 갖추고 있어 다양한 음악 공연과 행사를 개최할 수 있는 공간입니다.</p>
                <p>대형 오페라, 발레, 뮤지컬과 더불어 콘서트까지 수용하는 공간 속에서 창의 역동적이고 감동적인 음질과 소리로 채워지는 별빛홀은 첨단 기술의 무대를 갖추고 건축 공간의 효율적인 활용과 최대의 안락함을 고려하였습니다.</p>
                <p>무대 예술을 다양하게 표현하기 위해 음향을 설계해 건립하는 어쿠스틱 배너 커튼 8조가 설치되어 있고 기본 음향을 1.6초 기준으로 음향환경 최적화를 위한 공연장입니다. 공연 시 잔향 시간은 최대 3초까지 조절할 수 있기 때문에 모든 객석에서 최적의 음향효과를 감상할 수 있습니다.</p>
                <p>백 스테이지 공간에는 개인, 그룹 분장을 할 수 있는 분장실과 편안하게 쉴 수 있는 공간이 마련되어 있습니다. 또한, 최신 음향과 조명 시스템을 통해 다양한 공연을 최상의 상태로 감상할 수 있습니다.</p>
            </div>
            <div class="star-image-section">
                <img src="resources/image/별빛홀1.jpg" alt="별빛홀">
                <img src="resources/image/별빛홀2.jpg" alt="별빛홀 내부">
            </div>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2001 - <span id="currentYear"></span> 윤슬아트홀. All rights reserved.</p>
    </div>
</body>
</html>