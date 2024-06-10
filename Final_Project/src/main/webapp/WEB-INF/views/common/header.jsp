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

html,body{
        margin: 0;
        padding: 0;
    }
    div {
        box-sizing: border-box;
    }
    #header{
        width: 100%;
        height: 100px;
        display: flex;        
        align-items: center;     
        z-index: 2; 
        background: linear-gradient(45deg,#810000, #810000, #630000, #630000, #630000);
    }
    #navitb {
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 30px;
    }

    .navi a {
        text-decoration: none;
        font-size: 25px;
        margin-right: 100px;
        position: relative;        
        padding: 6px 12px;     
        color: white;   
    }
    .navi a::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 0;
        height: 4px;
        background: #EEEBDD;
        transition: all .5s ease-out;        
    }

    #navitb a:hover::after {
        width: 100%;
    }

    #logo{
        position: relative;
        top: 5px;
        width: 120px;
        height: 100%;
        text-decoration: none;
    }

    .swiper-slide>img {
        width: 100%;
        height: 100%;
    }
    
    #header {
        top:0;
        left:0;
        position: absolute;
    }

    .container {
            max-width: 1000px;
            margin: 20px auto;
            margin-top: 100px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            min-height: calc(100vh - 160px);
        }
       
        hr {
            border: 0;
            height: 1px;
            background-color: #810000;
            width: 80%;
        }
       
       /* 사이드 메뉴바 스타일 */
        #snb {
            width: 180px;
            background: rgba(255, 255, 240, 0.9); /* 옅은 아이보리색과 투명도 추가 */
            padding: 20px;
            color: #810000;
            position: absolute; /* 절대 위치로 고정 */
            top: 300px; /* 페이지 상단에서의 위치를 조정 */
            left: 120px; /* 페이지 왼쪽에서의 위치를 조정 */
            height: 410px; /* 화면 높이에 맞게 조정 */
            overflow-y: auto; /* 스크롤을 자동으로 */
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            text-align: center;
            border-radius: 10px;
        }

        #snb h2 {
            color: #810000;
            text-align: center;
        }
        #snb ul {
            list-style: none;
            padding: 0;
            text-align: left;
            max-height: 100%;
            overflow-y: auto;
        }
        #snb ul li {
            margin-bottom: 10px;
        }
        #snb ul li a {
            color: #810000;
            text-decoration: none;
            display: block;
            padding: 10px;
            transition: background 0.3s;
        }
        #snb ul li a:hover {
            background: #630000;
        }
        #snb ul li ul {
            display: none;
            padding-left: 20px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease;
        }
        #snb ul li.active > ul {
            display: block;
            max-height: 300px; /* 하위 메뉴의 최대 높이를 설정하여 펼쳐짐 */
        }
        #snb ul li.active > a {
            background: rgba(128, 128, 128, 0.2); /* 활성화된 링크 배경색을 짙은 회색 계열로 변경 */
        }
        #snb ul li:not(:last-child)::after {
            content: "";
            display: block;
            border-bottom: 1px solid #810000;
            margin: 10px 0;
        }
        #snb ul li a:hover {
            background: rgba(128, 128, 128, 0.2); /* 호버 시 배경색을 짙은 회색 계열로 변경 */
        }

    .main-login {
        display: flex;
        justify-content: space-between;
        width: 150px; 
        margin-right: 30px;
    }

    .main-login a {
        font-size: 15px; /* Adjust the font size as needed */
        text-decoration: none;
        color: white;
    }

</style>
<body>

<div id="header">                                
        <div id="navitb">
            <div><a href="<%= request.getContextPath() %>"><img src="resources/image/logo.png" id="logo"></a></div>                    
            <div class="navi"><a href="">공연정보</a></div>
            <div class="navi"><a href="">소개</a></div>
            <div class="navi"><a href="">공지사항</a></div>                      
            <div class="navi"><a href="">대관</a></div>                 
            <div class="main-login">
                <div><a href="">로그인</a></div>   
                <div><a href="">회원가입</a></div>       
            </div>
        </div>       
    </div> 

    <div class="container">
        <!-- 사이드 메뉴바 -->
        <div id="snb">
            <h2>
                <img src="img/8px+텍스트.png" alt="윤슬아트홀" style="display: block; margin: 0 auto;">
            </h2>
            <ul class="depth2">
                <li class="hasThird">
                    <a href="#" title="윤슬아트홀 소개">윤슬아트홀 소개</a>
                </li>
                <li class="hasThird">
                    <a href="#" title="공연장" class="over">공연장</a>
                    <ul class="depth3">
                        <li>
                            <a href="#" title="콘서트홀">콘서트홀</a>
                        </li>
                        <li>
                            <a href="#" title="스탠딩홀">스탠딩홀</a>
                        </li>
                    </ul>
                </li>
                <li class="hasThird">
                    <a href="#" title="시설안내">시설안내</a>
                    <ul class="depth3">
                        <li>
                            <a href="#" title="주차장">주차장</a>
                        </li>
                        <li>
                            <a href="#" title="편의시설">편의시설</a>
                        </li>
                        <li>
                            <a href="#" title="영상정보처리기기 운영/관리 방침">영상정보처리기기 운영/관리 방침</a>
                        </li>
                    </ul>
                </li>
                <li class="hasThird">
                    <a href="#" title="오시는길">오시는길</a>
                    <ul class="depth3">
                        <li>
                            <a href="#" title="오시는길">오시는길</a>
                        </li>
                        <li>
                            <a href="#" title="주차안내">주차안내</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        

    <script>
        

       // 사이드 메뉴바 스크립트
        document.addEventListener('DOMContentLoaded', function () {
            const items = document.querySelectorAll('#snb .hasThird > a');
            items.forEach(item => {
                item.addEventListener('click', function (e) {
                    e.preventDefault();
                    const parent = this.parentElement;
                    const subMenu = parent.querySelector('ul.depth3');
                    const isActive = parent.classList.contains('active');
                    
                    document.querySelectorAll('#snb .hasThird').forEach(el => {
                        el.classList.remove('active');
                        const innerSubMenu = el.querySelector('ul.depth3');
                        if (innerSubMenu) {
                            innerSubMenu.style.display = 'none';
                        }
                    });

                    if (!isActive) {
                        parent.classList.add('active');
                        if (subMenu) {
                            subMenu.style.display = 'block';
                            adjustSidebarHeight();
                        }
                    } else {
                        adjustSidebarHeight();
                    }
                });
            });

            const subItems = document.querySelectorAll('#snb .depth3 a');
            subItems.forEach(subItem => {
                subItem.addEventListener('click', function () {
                    window.location.href = this.getAttribute('href');
                });
            });

            function adjustSidebarHeight() {
                const snb = document.getElementById('snb');
                const activeItems = snb.querySelectorAll('.hasThird.active ul');
                let totalHeight = 410; // 기본 높이
                activeItems.forEach(item => {
                    totalHeight += item.scrollHeight;
                });
                snb.style.height = `${totalHeight}px`;
            }
        });

    </script>

</body>
</html>