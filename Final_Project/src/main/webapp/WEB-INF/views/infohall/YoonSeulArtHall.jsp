<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yoon Seul Art Hall - intro</title>
    <style>
        /* 반짝이 효과 스타일 */
        @keyframes blink {
            0% {
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
            100% {
                opacity: 1;
            }
        }
        body{
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        .container {
            position: relative;
            max-width: 1000px;
            margin: 20px auto;
            margin-top: 130px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            min-height: calc(100vh - 160px); /* 화면 높이에서 헤더와 푸터를 제외한 높이 설정 */
        }

        .blinking-text span {
            opacity: 0;
            animation: blink 1s forwards;
            animation-delay: calc(var(--delay) * 0.2s);
            font-family: 'Nanum Brush Script', cursive; /* 필기체 설정 */
            font-style: italic; /* 기울이기 */
            color: rgba(0, 0, 0, 0.7); /* 약간 회색과 투명도 */
           
        }

        .introTitle h1 {
            font-family: 'Nanum Brush Script', cursive; /* 필기체 설정 */
            font-style: italic; /* 기울이기 */
            font-size: 3em;
        }

        .introDescription {
            
            font-size: 1.2em;
            color: #333;
            margin: 20px auto;
            width: 65%;
            text-align: left;
            /* background-color: #f5f5f5;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); */
        }

        .slider {
            position: relative;
            width: 90%; /* 슬라이더 너비를 조정 */
            max-width: 1200px; /* 최대 너비 설정 */
            margin: auto;
            overflow: hidden;
            height: 500px; /* 슬라이더 높이 설정 */
        }

        .slides {
            display: flex;
            transition: transform 0.5s ease-in-out;
            width: 100%; /* 슬라이더 너비만큼 설정 */
        }

        .slide {
            min-width: 100%; /* 슬라이더 너비만큼 설정 */
            box-sizing: border-box; /* padding과 border를 포함한 너비 계산 */
        }

        .slide img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* 이미지 비율 유지하며 컨테이너에 맞춤 */
            border: 2px solid #ddd;
            border-radius: 5px;
        }

        .nav-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            z-index: 10;
        }

        .nav-button.left {
            left: 10px;
        }

        .nav-button.right {
            right: 10px;
        }

        .highlight-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 20px auto;
            width: 90%;
            max-width: 1200px;
            font-family: Arial, sans-serif;
            color: #333;
        }

        .highlight {
            flex: 1 1 300px;
            margin: 10px;
            background-color: #f5f5f5;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .highlight img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .highlight-title {
            font-weight: bold;
            margin-top: 10px;
        }

        .highlight-description {
            margin-top: 5px;
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
    <div class="introOuter">
    <jsp:include page="../common/header.jsp" />
        <!-- 메인 타이틀 (필기체 적용) -->
        <div class="container">
        <div class="introTitle" align="center"><h1>윤슬아트홀</h1></div>
        <!-- 서브 타이틀 (필기체 적용) -->
        <div align="center"><h3 class="blinking-text" id="blinkingText"></h3></div>

        <div class="slider">
            <div class="slides">
                <div class="slide"><img src="resources/image/예술의전당.jpg" alt="Image 1"></div>
                <div class="slide"><img src="resources/image/소극장1.png" alt="Image 2"></div>
                <div class="slide"><img src="resources/image/소극장2.jpg" alt="Image 3"></div>
                <!-- 추가 이미지 -->
            </div>
            <button class="nav-button left" onclick="moveSlide(-1)">&#10094;</button>
            <button class="nav-button right" onclick="moveSlide(1)">&#10095;</button>
        </div>
        <br><br>
        <hr>
        <br>

        <!-- 아트센터 소개 -->
        <div class="introDescription">
            <p><strong>윤슬아트홀</strong>은 2001년 10월 14일에 화려하게 개관한 작은 아트센터로, 개관 이후 공연예술의 최첨단 트렌드를 수용하면서도 지역 정서를 보듬는 지역밀착형 문화공간을 지향하고 있습니다.</p>
            <p>윤슬아트홀은 지역 내 문화 인구를 발굴하고 활동을 지원하는 비영리 기구인 '윤슬문화재단'이 운영하고 있습니다. 최근 수도권 내 공연장이 많이 늘어나고 있지만, 윤슬아트홀은 자체 제작 프로그램을 선보이며 '윤슬문화재단'을 통해 문화 향유층과 잠재 청중을 발굴하는 사업을 벌이며 수도권 내 문화재단의 역할을 리드하고 있습니다.</p>
            <p>한국 초연, 윤슬아트홀 단독 공연 유치 및 자체 제작에 힘써 타 공연장에 대한 경쟁력을 키워온 윤슬아트홀은 50석 규모의 소극장, 스탠딩 홀 등 2개의 극장을 갖추고 있습니다.</p>
            <p>지금까지 세계적인 아티스트들의 첫 내한 무대와 다양한 장르의 공연을 선보여왔고, 자체 제작 오페라와 연극, 콘서트는 큰 호평을 받고 있습니다. 또한, 지역 사회와 함께하는 다양한 문화예술축제와 청소년을 위한 교육 프로그램도 운영하여 지역문화 발전에 크게 기여하고 있습니다.</p>
            <p>윤슬아트홀은 공연, 전시, 예술강좌 등 다양한 문화 활동을 통해 시민들과 함께하고 있으며, 아름다운 자연과 함께하는 쉼터이자 자기계발의 공간으로 자리잡고 있습니다. 수도권 지역의 문화 허브로 더욱 발전해 나갈 윤슬아트홀에서 잊지 못할 추억을 만들어 보세요!</p>
        </div>
        <br>
        <hr>
        <br>
        <!-- 하이라이트 섹션 -->
        <div class="highlight-section">
            <div class="highlight">
                <img src="resources/image/소개1.jpg" alt="Highlight 1">
                <div class="highlight-title">명성 높은 오페라 공연</div>
                <div class="highlight-description">세계적인 오페라 공연을 국내 최초로 선보입니다.</div>
            </div>
            <div class="highlight">
                <img src="resources/image/소개4.jpg" alt="Highlight 2">
                <div class="highlight-title">글로벌 뮤지컬 초연</div>
                <div class="highlight-description">유명 뮤지컬을 윤슬아트홀에서 만나보세요.</div>
            </div>
            <div class="highlight">
                <img src="resources/image/소개3.jpg" alt="Highlight 3">
                <div class="highlight-title">클래식 콘서트</div>
                <div class="highlight-description">세계 최고의 클래식 공연을 자랑하는 콘서트홀.</div>
            </div>
            <div class="highlight">
                <img src="resources/image/소개2.jpg" alt="Highlight 4">
                <div class="highlight-title">발레와 무용</div>
                <div class="highlight-description">아름다운 발레와 현대 무용 공연을 제공합니다.</div>
            </div>
            <div class="highlight">
                <img src="resources/image/청소년뮤직페스티벌.jpg" alt="Highlight 5">
                <div class="highlight-title">청소년 음악 페스티벌</div>
                <div class="highlight-description">청소년들을 위한 특별한 음악 축제.</div>
            </div>
            <div class="highlight">
                <img src="resources/image/소개5.jpg" alt="Highlight 6">
                <div class="highlight-title">지역 문화 예술 축제</div>
                <div class="highlight-description">지역 사회와 함께하는 다양한 문화 예술 축제.</div>
            </div>
            
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2001 - <span id="currentYear"></span> 윤슬아트홀. All rights reserved.</p>
    </div>
    </div>
    <script>
        // 반짝이는 글씨 위한 자스
        document.addEventListener("DOMContentLoaded", function () {
            const text = "윤슬처럼 반짝이는 당신을 위한 공간";
            const container = document.getElementById("blinkingText");

            text.split("").forEach(function(character, index)  {
                const span = document.createElement("span");
                span.textContent = character;
                span.style.setProperty('--delay', index);
                container.appendChild(span);
            });
        });

        // 이미지 슬라이드 위한 자스
        let currentSlide = 0;

        function showSlide(index) {
            const slides = document.querySelector('.slides');
            const totalSlides = slides.children.length;

            if (index >= totalSlides) {
                currentSlide = 0;
            } else if (index < 0) {
                currentSlide = totalSlides - 1;
            } else {
                currentSlide = index;
            }

            const slideWidth = slides.children[0].clientWidth;
            slides.style.transform = `translateX(${-currentSlide * slideWidth}px)`;
        }

        function moveSlide(step) {
            showSlide(currentSlide + step);
        }

        window.addEventListener('resize', function()  {
            showSlide(currentSlide); // 슬라이더 크기 변경 시 올바른 위치로 이동
        });

        showSlide(currentSlide); // 초기 슬라이드 설정

        // 자동 슬라이드 (선택사항)
        setInterval(function()  {
            moveSlide(1);
        }, 3000); // 3초마다 슬라이드 변경

        // 현재 연도 표시
        const yearSpan = document.getElementById("currentYear");
        const currentYear = new Date().getFullYear();
        yearSpan.textContent = currentYear;


    </script>
</body>
</html>