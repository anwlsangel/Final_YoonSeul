<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 0603  -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>윤슬아트홀MAIN</title>
</head>
<!-- jQuery library -->
    <!-- 온라인 방식 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <!-- 부트스트랩 및 각종 연동구문 추가 0603 -무진 -->
     <!-- alertify 연동 구문 -->
     <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
<style>

    html,body{
        margin: 0;
        padding: 0;
    }
    div {
        box-sizing: border-box;
    }
    #main-header{
        width: 100%;
        height: 100px;
        display: flex;        
        align-items: center;     
        z-index: 2; 
    }
    
    #main-navi {
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

    #main-navi a:hover::after {
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
        height: 700px;
    }
    
    #mainImage {
        position: relative;
        width: 100%;
        margin:auto;
    }
    #main-header {
        top:0;
        left:0;
        position: absolute;
    }
    #main-header a {        
        color : #EEEBDD;
    }
    .jbFixed{
        position: fixed;
        top: 0px;
        width: 100%;
        background: linear-gradient(45deg,#810000, #810000, #630000, #630000, #630000);     
        justify-content: space-between;
        align-items: center;  
      }
    
    div[class^=swiper-button] {
        color : white;
    }  

    .swiper {
        z-index: 2;
    }

    .main-page-schedule{
        margin: auto;
        width: 80%;
        height: 650px;
        align-items: center;
        margin-top: 300px;
        object-fit: cover;
    }

    .schedule-main {
        text-align: center;        
    }

    .main-page-schedule .schedule-list .schedule {
        justify-content: space-between;
        width: 280px;        
        align-items: center;
        padding: 0 30px;
        float: left;
        /* border: 1px solid red; */            
    }

    .schedule img {
        transition: all 0.3s linear;        
    }
    .schedule:hover img {
        transform: scale(1.1);
    }

    .schedule-list {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 3px;
        margin: 10px;
        height: 700px;
    }
    .schedule {
        box-sizing: border-box;   
        height: 300px;    
    }

    .category {
        width: 100%;
        height: 100px;   
        display: flex;
        flex-wrap: wrap;          
    }
    #category-button {
            margin: auto;
            width: 150px;
            background: #810000;
            color: #fff;
            font-size: 16px;
            padding: 16px 32px;
            line-height: 16px;
            border-radius: 24px;
            display: block;
            outline: none;
            appearance: none;
            border: none;
            text-decoration: none;
            letter-spacing: .5px;
            box-shadow: 0 2px 8px -1px rgba(0, 0, 0, 0.32);
            transform: translateY(0) translateZ(0);
            transition: transform .44s ease, box-shadow .44s ease;
        }
        #category-button:hover {
            transform: translateY(-4px);
            box-shadow: 0 4px 20px -2px rgba(12, 12, 12, 0.5);
        }
        #category-button.reverse {
            font-size: 16px;
        }
        #category-button.reverse:hover span {
            margin-top: 16px;
        }
}

    /* footer */
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
            margin: 0;
            justify-content: center;
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
            margin: 0 20px; 
        }
        #footer_text {
            display: inline-block;
            flex-direction: column;
            gap: 10px; /* 텍스트 요소 간 간격 */
            margin-right: 120px;
        }

        #schedule-button {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 50px;
        align-self: center;
        margin: 50px;
        display: flex;
        flex-wrap: wrap;  
}
    #sc-button {
            margin-top: 10px;
            background: #810000;
            color: #fff;
            font-size: 16px;
            padding: 16px 32px;
            font-family: 'Roboto';
            font-weight: 500;
            line-height: 16px;
            border-radius: 24px;
            display: block;
            outline: none;
            appearance: none;
            border: none;
            text-decoration: none;
            letter-spacing: .5px;
            box-shadow: 0 2px 8px -1px rgba(0, 0, 0, 0.32);
            transform: translateY(0) translateZ(0);
            transition: transform .44s ease, box-shadow .44s ease;
        }
        #sc-button:hover {
            transform: translateY(-4px);
            box-shadow: 0 2px 8px -1px rgba(0, 0, 0, 0.32);
        }
        #sc-button span {
            display: inline-block;
            transition: margin-top .44s ease;
        }
        #sc-button:hover span {
            margin-top: -16px;
        }
        #sc-button.reverse span {
            margin-top: 16px;
        }
        #sc-button.reverse:hover span {
            margin-top: 32px;
        }
}

.main-notice {
    width: 80%;
    height: 500px;
    margin: auto;
    border: 1px solid #630000;
    margin-top: 150px;
}

.main-notice h1{
    text-align: center;    
}

.notice-list {
    width: 100%;
    text-align: center;  
    height: 100%;     
    position: relative;
}

.notice-list tbody{
    height: 80%;
}

.notice-list thead{
    height: 20%;
}

.main-top-img {
    width: 100%;
    height: 500px;
    /* border: 1px solid red; */
    margin-top: 50px;
    display: flex;
    justify-content: center;
}

.top-img {
    width: 20%;
    height: 100%;
    display: block;
    margin-left: auto;
    margin-right: auto;
}

.overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        background: rgb(0, 0, 0, 0.5);
        opacity: 0;
}

.top-img:hover .overlay {
    opacity: 1;
    color: white;
    text-align: center;
}


.top-img {
    position: relative;
}

.top-img img {
    width: 100%;
    object-fit: cover
}

.detail-text {
    border: 1px solid red;
    height: 50px;
    margin-top: 13px;
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
}


</style>
<body>    
<!-- index.jsp 일회성 알람문구 처리 script 0604 - 무진 -->
		<c:if test="${not empty sessionScope.alertMsg }">
			<script>
			alertify.alert('알림', '${sessionScope.alertMsg}', function(){ alertify.success('Ok'); });
			</script>
			<c:remove var="alertMsg" scope="session"/>
		</c:if>
<!-- 로그인 모달창 추가 0603 -무진 -->
    <!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭 시 보임) -->
    <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Login</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <form action="login.me" method="post">
					<!-- Modal body -->
					<div class="modal-body">
						<label for="userId" class="mr-sm-2">ID : </label>
						<!--
							EL 구문을 통해 쿠키값을 손쉽게 얻어올 수 있다.
							[ 표현법 ]
							cookie.키값.value
						-->
						<input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId"
							   name="userId" value="${ cookie.saveId.value }" required> <br>
						<label for="userPwd" class="mr-sm-2">Password : </label>
						<input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="userPwd" required>
						<br>
						<c:choose>
							<c:when test="${ not empty cookie.saveId }">
								<!-- 만약 saveId 라는 쿠키가 있다면 : 체크박스가 체크되게끔 -->
								<input type="checkbox" id="saveId" name="saveId" value="y" checked>
								<label for="saveId">아이디 저장</label>
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="saveId" name="saveId" value="y">
								<label for="saveId">아이디 저장</label>
							</c:otherwise>	
						</c:choose>				
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">로그인</button>
						<!-- index.jsp 회원가입 버튼 추가 0604 - 무진 -->
						<button type="button" class="btn btn-info" id="signupButton">회원가입</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</form>
            </div>
        </div>
    </div>      
    <div id="mainPage">
    <div id="mainImage">
        <div class="swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="resources/image/a10.jpg"></div>
                <div class="swiper-slide"><img src="resources/image/c11.jpg"></div>
                <div class="swiper-slide"><img src="resources/image/c12.jpg"></div>
                <div class="swiper-slide"><img src="resources/image/c13.jpg"></div>
                
            </div>                
            <div id="main-header">                                
                <div id="main-navi">
                    <div><a href=""><img src="/resources/image/logo.png"id="logo"></a></div>                    
                    <div class="navi"><a href="">공연정보</a></div>
                    <div class="navi"><a href="">소개</a></div>
                    <div class="navi"><a href="">공지사항</a></div>                      
                    <div class="navi"><a href="">유실물센터</a></div>    
                    <!-- 로그인 전후 화면 변경 0603 -무진 -->
                    <c:choose>
            		<c:when test="${empty sessionScope.loginUser }">
                    <!-- 로그인 전 -->             
                    <div class="main-login">
                    	<!-- 인덱스.jsp 로그인 버튼 누르면 모달창 보여지게끔 세팅 0605 -무진 -->
                    	<div><a data-toggle="modal" data-target="#loginModal">로그인</a></div>                    
                    	<div><a href="">회원가입</a></div>       
                	</div>
                    </c:when>
                	<c:otherwise>
                	<!-- 로그인 후 -->
                
                    <label>${ sessionScope.loginUser.userName }님 환영합니다</label> &nbsp;&nbsp;
                    <a href="myPage.me">마이페이지</a>
                    <a href="logout.me">로그아웃</a>
               
                	</c:otherwise>
            </c:choose>
                </div> 

    
            </div>
            
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-scrollbar"></div>
        </div>    
    </div>

    <div class="main-top-img">        
            <div class="top-img">
                <img src="resources/image/b2.jpg" class="top-img">
                <div class="overlay">
                    <p>
                        연극어쩌구 저쩌구<br>
                        2024-05-30<br>
                        연극 설명이 들어갈 저쩌구
                        저쩌구 저쩌구 저쩌구 어쩌구
                    </p>
                </div>
            </div>
            <div class="top-img">
            <img src="resources/image/b4.jpg" class="top-img">
            <div class="overlay">
                <p>
                    연극어쩌구 저쩌구<br>
                    2024-05-30<br>
                    연극 설명이 들어갈 저쩌구
                    저쩌구 저쩌구 저쩌구 어쩌구
                </p>
            </div>
            </div>
            <div class="top-img">
            <img src="resources/image/post1.jpg" class="top-img">
            <div class="overlay">
                <p>
                    연극어쩌구 저쩌구<br>
                    2024-05-30<br>
                    연극 설명이 들어갈 저쩌구
                    저쩌구 저쩌구 저쩌구 어쩌구
                </p>
            </div>
            </div>
            <div class="top-img">
                <img src="resources/image/b4.jpg" class="top-img">
                <div class="overlay">
                    <p>
                        연극어쩌구 저쩌구<br>
                        2024-05-30<br>
                        연극 설명이 들어갈 저쩌구
                        저쩌구 저쩌구 저쩌구 어쩌구
                    </p>
                </div>
                </div>
    </div>

    <div class="main-page-schedule">
        <div class="schedule-main">
            <h1 style="text-align: center;">장르별 TOP</h1>
                <div class="schedule-list">
                    <menu class="category">
                        <input type=button id="category-button" value="콘서트">
                        <input type=button id="category-button" value="아동">
                        <input type=button id="category-button" value="공포">
                        <input type=button id="category-button" value="로맨스">
                        <input type=button id="category-button" value="뮤지컬">
                        <input type=button id="category-button" value="연극">
                        <input type=button id="category-button" value="클래식">
                    </menu>
                    <div class="schedule"><img src="resources/image/post1.png" style="width: 100%; height: 100%;">
                        공연제목                        
                    </div>                    
                    <div class="schedule"><img src="resources/image/post2.png" style="width: 100%; height: 100%;"><div class="detail-text">공연제목</div></div>
                    <div class="schedule"><img src="resources/image/b2.jpg" style="width: 100%; height: 100%;">공연제목</div>
                    <div class="schedule"><img src="resources/image/b4.jpg" style="width: 100%; height: 100%;">공연제목</div>
                    <div class="schedule"><img src="resources/image/b5.jpg" style="width: 100%; height: 100%;">공연제목</div>
                    <div id="schedule-button"><input type="button" value="자세히보기" id="sc-button"></div>
                </div>    
        </div>
    </div>
    <div class="main-page-schedule">
        <div class="schedule-main">
            <h1 style="text-align: center;">오픈 예정</h1>
                <div class="schedule-list">
                    <div class="schedule"><img src="resources/image/b1.jpg" style="width: 100%; height: 100%;">공연제목</div>                    
                    <div class="schedule"><img src="resources/image/b2.jpg" style="width: 100%; height: 100%;">공연제목</div>
                    <div class="schedule"><img src="resources/image/b3.jpg" style="width: 100%; height: 100%;">공연제목</div>
                    <div class="schedule"><img src="resources/image/b4.jpg" style="width: 100%; height: 100%;">공연제목</div>
                    <div class="schedule"><img src="resources/image/b5.jpg" style="width: 100%; height: 100%;">공연제목</div>
                    <div id="schedule-button"><input type="button" value="자세히보기" id="sc-button"></div>
                </div>    
        </div>
    </div>
    <div class="main-notice">
            
            <table class="notice-list">                
                <thead>
                <tr>
                    <td colspan="5"><h1>공지 사항</h1></td>
                </tr>
                <tr>
                    <th style="width: 5%;">글번호</th>
                    <th style="width: 15%;">제목</th>
                    <th style="width: 60%;">내용</th>
                    <th>조회수</th>
                    <th style="width: 10%;">작성일자</th>                    
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>공지사항제목</td>
                    <td>공지사항 내용</td>
                    <td>1</td>
                    <td>2024/05/22</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>공지사항제목</td>
                    <td>공지사항 내용</td>
                    <td>1</td>
                    <td>2024/05/22</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>공지사항제목</td>
                    <td>공지사항 내용</td>
                    <td>1</td>
                    <td>2024/05/22</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>공지사항제목</td>
                    <td>공지사항 내용</td>
                    <td>1</td>
                    <td>2024/05/22</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>공지사항제목</td>
                    <td>공지사항 내용</td>
                    <td>1</td>
                    <td>2024/05/22</td>
                </tr>
            </tbody>
            </table>
    </div>
    <div class="main-page-schedule">
        <div class="schedule-main">
            <h1 style="text-align: center;">가장 인기 있는 공연</h1>
                <div class="schedule-list">
                    <div class="schedule"><img src="resources/image/b1.jpg" style="width: 100%; height: 100%;">공연제목</div>                    
                    <div class="schedule"><img src="resources/image/b2.jpg" style="width: 100%; height: 100%;">공연제목</div>
                    <div class="schedule"><img src="resources/image/b3.jpg" style="width: 100%; height: 100%;">공연제목</div>
                    <div class="schedule"><img src="resources/image/b4.jpg" style="width: 100%; height: 100%;">공연제목</div>
                    <div class="schedule"><img src="resources/image/b5.jpg" style="width: 100%; height: 100%;">공연제목</div>
                    <div id="schedule-button"><input type="button" value="자세히보기" id="sc-button"></div>
                </div>    
        </div>
    </div>
    
    <script>
        $(document).ready(function() {
            var jbOffset = $('#mainImage').offset().top + $('#mainImage').height();
            $(window).scroll(function() {
                if ($(document).scrollTop() > jbOffset) {
                    console.log("시작")
                    $('#main-navi').addClass('jbFixed');
                } else {
                    $('#main-navi').removeClass('jbFixed');
                }
            });
        });
    </script>

    <script>
        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 5000 // 5초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        }); 
    </script>
    <!-- index.jsp 회원가입 버튼용 자바스크립트 구문 추가 0604 - 무진 -->
    <script>
   
        $('#signupButton').click(function() {
            window.location.href = 'enrollForm.me';
        });
   
	</script>
    

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
            <div class="footer_logo"><a href=""><img src="resources/image/8px+텍스트.png" alt=""></a></div>
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
</div>
    
</body>
</html>