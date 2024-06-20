<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 0603  -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>윤슬아트홀</title>
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
		html, body {
		    margin: 0;
		    padding: 0;
		}
		
		div {
		    box-sizing: border-box;
		}
		
		#main-header {
		    width: 100%;
		    height: 80px; /* 헤더 높이 조정 */
		    display: flex;        
		    align-items: center;     
		    z-index: 2;
		    position: absolute;
		    top: 0;
		    left: 0;
		}
		
		#main-navi {
		    width: 100%;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 0 30px;
		}
		
		.navi a, .main-login a, .logged-in-links a {
		    text-decoration: none;
		    font-size: 18px;
		    position: relative;
		    padding: 6px 12px;
		    color: white;
		}
		
		.navi a {
		    font-size: 25px;
		    margin-right: 100px;
		}
		
		.navi a::after, .main-login a::after, .logged-in-links a::after {
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
		
		.navi a:hover::after, .main-login a:hover::after, .logged-in-links a:hover::after {
		    width: 100%;
		}
		
		#logo {
		    position: relative;
		    top: 10px;
		    width: 80px;
		    height: 80px;
		    text-decoration: none;
		}
		
		.swiper-slide > img {
		    width: 100%;
		    height: 700px;
		}
		
		#mainImage {
		    position: relative;
		    width: 100%;
		    margin: auto;
		}
		
		.jbFixed {
		    position: fixed;
		    top: 0px;
		    width: 100%;
		    background: linear-gradient(45deg,#810000, #810000, #630000, #630000, #630000);     
		    justify-content: space-between;
		    align-items: center;  
		}
		
		div[class^=swiper-button] {
		    color: white;
		}  
		
		.swiper {
		    z-index: 2;
		}
		
		.main-page-schedule {
		    margin: auto;
		    width: 80%;
		    height: 650px;
		    align-items: center;
		    margin-top: 300px;
		    object-fit: cover;
		    text-align: center;
		}
		
		.schedule-list {
		    display: flex;
		    justify-content: center;
		    flex-wrap: wrap;
		    gap: 3px;
		    margin: 10px;
		    height: 400px;
		}
		
		.schedule-list2 {
		    display: flex;
		    justify-content: center;
		    flex-wrap: wrap;
		    gap: 3px;
		    margin: 10px;
		    height: 400px;
		}
		
		.schedule {
		    box-sizing: border-box;   
		    height: 300px;
		    width: 280px;        
		    align-items: center;
		    padding: 0 30px;
		    float: left;
		}
		
		.schedule img {
		    transition: all 0.3s linear;        
		}
		
		.schedule:hover img {
		    transform: scale(1.1);
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
		
		.footer {
		    background-color: #810000;
		    color: white;
		    text-align: center;
		    padding: 10px 0;
		    margin-top: 20px;
		    box-sizing: border-box;
		    width: 100%;
		    height: 180px;
		}
		
		.footer > div { width: 100%; }
		
		#footer_1 { height: 20%; }
		
		#footer_2 { 
		    height: 60%;
		    display: flex;
		    align-items: center;
		    flex-wrap: wrap;
		    margin: 0;
		    justify-content: center;
		}
		
		#footer_3 {
		    height: 20%;
		    font-size: 12px;
		}
		
		#footer_2 > p {
		    width: 100%;
		    margin: 0px;
		    box-sizing: border-box;
		}
		
		#footer_p1 {
		    height: 80%; 
		    padding: 5px 15px;
		    text-align: left;
		    display: flex;
		    font-size: 11px;
		    flex-direction: column;
		}
		
		#footer_1 > a {
		    text-decoration: none;
		    color: white;
		    font-weight: 600;
		    margin: 15px;
		    vertical-align: middle;
		}
		
		.footer_logo {
		    display: inline-block;
		    align-self: flex-start;
		    margin: 0 20px;
		}
		
		#footer_text {
		    display: inline-block;
		    flex-direction: column;
		    gap: 10px;
		    margin-right: 120px;
		}
		
		#schedule-button {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    width: 100%;
		    height: 50px;
		    margin: 50px auto; /* 상하 50px, 좌우 자동 */
		}
		
		#sc-button {
			padding: 10px 20px;
		    background-color: #810000;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
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
		
		.main-notice {
		    width: 80%;
		    height: 500px;
		    margin: auto;
		    border: 1px solid #630000;
		    margin-top: 150px;
		}
		
		.main-notice h1 {
		    text-align: center;    
		}
		
		.notice-list {
		    width: 100%;
		    text-align: center;  
		    height: 100%;     
		    position: relative;
		}
		
		.notice-list tbody {
		    height: 80%;
		}
		
		.notice-list thead {
		    height: 20%;
		}
		
		.main-top-img {
		    width: 100%;
		    height: 500px;
		    margin-top: 80px;
		    display: flex;
		    justify-content: center;
		}
		
		.top-img {
		    width: 20%;
		    height: 100%;
		    display: block;
		    margin-left: auto;
		    margin-right: auto;
		    position: relative;
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
		
		.overlay:hover {
			cursor: pointer;
		}
		
		.top-img:hover .overlay {
		    opacity: 1;
		    color: white;
		    text-align: center;
		}
		
		.top-img img {
		    width: 100%;
		    object-fit: cover
		}
		
		.detail-text {
		    height: 50px;
		    margin-top: 10px;
		}
		
		/* 로그인 및 회원가입 링크 스타일 및 효과 추가 */
		.main-login {
		    display: flex;
		    align-items: center;
		    justify-content: space-between;
		    width: 300px; /* 영역을 넓힘 */
		    margin-right: 30px;
		}
		
		.main-login a {
		    margin-right: 20px; /* 간격 조정 */
		    top: 10px; 
		}
		
		.main-login-logged-in {
		    display: flex;
		    align-items: center;
		    margin-left: auto; /* 오른쪽으로 이동 */
		    margin-right: 60px; /* 오른쪽으로 더 이동 */
		}
		
		.welcome-message {
		    color: white;
		    margin-right: 20px;
		    margin-top: 15px;
		    white-space: nowrap; /* 텍스트가 줄바꿈되지 않도록 설정 */
		    text-align: center;
		}
		
		.logged-in-links {
		    display: flex;
		    flex-direction: column;
		    align-items: flex-start;
		    white-space: nowrap; /* 텍스트가 줄바꿈되지 않도록 설정 */
		}
		
		.logged-in-links a {
		    margin-left: 0;
		    margin-top: 5px;
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
		<!-- 로그인 모달창 -->
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-centered" role="document">
		        <div class="modal-content">
		            <!-- Modal Header -->
		            <div class="modal-header">
		                <h4 class="modal-title" id="loginModalLabel">Login</h4>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span>
		                </button>
		                </div>
		            <form action="login.me" method="post">
		                <!-- Modal body -->
		                <div class="modal-body">
		                    <div class="form-group">
		                    <label class="mr-sm-2">ID : </label>
		                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID"  name="userId" value="${ cookie.saveId.value }" required> <br>
		                    </div>
		                    <div class="form-group">
		                    <label class="mr-sm-2">Password : </label>
		                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password"  name="userPwd" required>
		                    </div>
		                    <div class="form-group form-check">
		                        <input type="checkbox" class="form-check-input" id="saveId" name="saveId" value="y" ${ not empty cookie.saveId ? 'checked' : '' }>
		                        <label class="form-check-label" for="saveId">아이디 저장</label>
		                    </div>               
		                </div>
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                    <div class="d-flex justify-content-between w-100">
		                        <div class="d-flex flex-column">
		                            <button type="button" class="btn btn-link mb-2" data-toggle="modal" data-target="#findIdModal">아이디 찾기</button>
		                            <button type="button" class="btn btn-link" data-toggle="modal" data-target="#findPwdModal">비밀번호 찾기</button>
		                        </div>
		                        <div class="d-flex align-items-center">
		                            <button type="submit" class="btn btn-primary mr-2">로그인</button>
		                            <button type="button" class="btn btn-info mr-2" id="signupButton">회원가입</button>
		                            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
		                        </div>
		                    </div>
		                </div>
		            </form>
		            </div>
		    	</div>
			</div>
            <!-- 아이디 찾기 모달창 -->
			<div class="modal fade" id="findIdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered" role="document">
			        <div class="modal-content" style="min-height: 464px;">
			            <!-- Modal Header -->
			            <div class="modal-header">
			                <h4 class="modal-title" id="findIdModalLabel">아이디 찾기</h4>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    		<span aria-hidden="true">&times;</span>
			                </button>
			                </div>
			            <form id="findIdForm">
			                <!-- Modal body -->
			                <div class="modal-body">
			                    <div class="form-group">
                        <label>이름:</label>
	                        	<input type="text" class="form-control" name="userName" placeholder="Enter Name" required>
		                    </div>
		                    <div class="form-group">
		                        <label>전화번호:</label>
		                        <input type="text" class="form-control"  name="phone" placeholder="Enter Phone" required>
		                    </div>
			                </div>
			                <!-- Modal footer -->
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-primary" id="findIdButton">아이디 찾기</button>
			                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			                </div>
			            </form>
			        </div>
			    </div>
			</div>
            <!-- 비밀번호 찾기 모달창 -->
			<div class="modal fade" id="findPwdModal" tabindex="-1" role="dialog" aria-labelledby="findPwdModalLabel" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered" role="document">
			        <div class="modal-content">
			            <!-- Modal Header -->
			            <div class="modal-header">
			                <h5 class="modal-title" id="findPwdModalLabel">비밀번호 찾기</h5>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <form id="findPwdForm">
			                <!-- Modal body -->
			                <div class="modal-body">
			                    <div class="form-group">
			                        <label>이름:</label>
			                        <input type="text" class="form-control" name="userName" placeholder="Enter Name" required>
			                    </div>
			                    <div class="form-group">
			                        <label>아이디:</label>
			                        <input type="text" class="form-control" name="userId" placeholder="Enter ID" required>
			                    </div>
			                    <div class="form-group">
			                        <label>이메일:</label>
			                        <input type="email" class="form-control" name="email" placeholder="Enter Email" required>
			                    </div>
			                </div>
			                <!-- Modal footer -->
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-primary" id="findPwdButton">인증번호 발송</button>
			                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			                </div>
			            </form>
			        </div>
			    </div>
			</div>
			
			<!-- 비밀번호 변경 모달창 -->
			<div class="modal fade" id="resetPwdModal" tabindex="-1" role="dialog" aria-labelledby="resetPwdModalLabel" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered" role="document">
			        <div class="modal-content">
			            <!-- Modal Header -->
			            <div class="modal-header">
			                <h5 class="modal-title" id="resetPwdModalLabel">비밀번호 변경</h5>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <form id="resetPwdForm">
			                <!-- Modal body -->
			                <div class="modal-body">
			                    <input type="hidden" name="userId" id="resetUserId">
			                    <input type="hidden" name="email" id="resetEmail"> <!-- 추가된 부분 -->
			                    <div class="form-group">
			                        <label>인증번호:</label>
			                        <input type="text" class="form-control" name="authKey" placeholder="Enter Auth Key" required>
			                    </div>
			                    <div class="form-group">
			                        <label>새 비밀번호:</label>
			                        <input type="password" class="form-control" name="newPwd" placeholder="Enter New Password" required>
			                    </div>
			                </div>
			                <!-- Modal footer -->
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-primary" id="resetPwdButton">비밀번호 변경</button>
			                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			                </div>
			            </form>
			        </div>
			    </div>
			</div>

	<!-- 인덱스 시작 -->
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
                    <div><a href=""><img src="resources/image/8px+텍스트.png"id="logo"></a></div>                    
                    <div class="navi"><a href="list.co?category=전체&sort=date">공연정보</a></div>
                    <div class="navi"><a href="<%=request.getContextPath()%>/infohall">소개</a></div>
                    <div class="navi"><a href="">공지사항</a></div>                      
                    <div class="navi"><a href="">유실물센터</a></div>    
                    <!-- 로그인 전후 화면 변경 0603 -무진 -->
                     <div class="main-login">
			            <c:choose>
						    <c:when test="${empty sessionScope.loginUser }">
						        <!-- 로그인 전 -->
						        <div class="main-login">
						            <!-- 로그인 버튼 -->
						            <div><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></div>
						            <!-- 회원가입 버튼 -->
						            <div><a id="signupLink" href="#">회원가입</a></div>
						        </div>
						    </c:when>
						    <c:otherwise>
						        <!-- 로그인 후 -->
						        <div class="main-login-logged-in">
						            <div class="welcome-message">
						                <span>${ sessionScope.loginUser.userName } 님</span><br>
						                <span>환영합니다</span>
						            </div>
						            <div class="logged-in-links">
						                <c:choose>
						                    <c:when test="${ sessionScope.loginUser.userId eq 'admin' }">
						                        <a href="adminPage.ad">관리자페이지</a>
						                    </c:when>
						                    <c:otherwise>
						                        <a href="myTicketList.me">마이페이지</a>
						                    </c:otherwise>
						                </c:choose>
						                <a href="logout.me">로그아웃</a>
						            </div>
						        </div>
						    </c:otherwise>
						</c:choose>

			        </div>
                </div> 
            </div>
            
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-scrollbar"></div>
        </div>    
    </div>
    	<h1 style="text-align: center; margin-top: 80px;">리뷰 TOP 3</h1>
        	
	<script>
	    $(function() {	    	
	    	loadTopConcerts('콘서트');
	    	
	        $.ajax({
	            url: "mainTopList.co",
	            method: "GET",
	            success: function(result) {
	                let mainTopImg = $(".main-top-img"); // 클래스 선택자로 변경
	                mainTopImg.empty();
	                result.forEach(function(concert) {
	                	let month = concert.startDate.split(" ")[0].replace("월", "");
	                	let date = concert.startDate.split(" ")[1].replace(",", "");
	                	let year = concert.startDate.split(" ")[2];
	                	
	                	if(month < 10) { month = "0" + month; }
	                	if(date < 10) { date = "0" + date; }
	                	
	                	let startDate = year + "-" + month + "-" + date;
	                	
	                	let endmonth = concert.endDate.split(" ")[0].replace("월", "");
	                	let enddate = concert.endDate.split(" ")[1].replace(",", "");
	                	let endyear = concert.endDate.split(" ")[2];
	                	
	                	if(endmonth < 10) { endmonth = "0" + endmonth; }
	                	if(enddate < 10) { enddate = "0" + enddate; }
	                	
	                	let endDate = endyear + "-" + endmonth + "-" + enddate;
	                	
	                    let concertHtml = `
	                        <div class="top-img">
                            	<img src="\${concert.thumbnailRoot}" class="top-img">
	                            <div class="overlay" onclick="location.href='<%=request.getContextPath()%>/detail.co?cno=\${concert.concertId}'">
	                                <p>
	                                    \${concert.concertName}<br>
	                                    \${startDate} ~ \${endDate}<br>	                                    
	                                </p>
	                            </div>
	                        </div>
	                    `;
	                    mainTopImg.append(concertHtml);
	                });
	            },
	            error: function() {
	                console.log("메인 탑이미지 조회용 ajax 실패");
	            }
	        });
	    });
	</script>
	
	<div class="main-top-img">
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
            <h1 style="text-align: center;">장르별 TOP 5</h1>
            		<menu class="category">
                        <input type="button" id="category-button" value="콘서트" onclick="loadTopConcerts('콘서트')">
			            <input type="button" id="category-button" value="아동" onclick="loadTopConcerts('아동')">
			            <input type="button" id="category-button" value="공포" onclick="loadTopConcerts('공포')">
			            <input type="button" id="category-button" value="로맨스" onclick="loadTopConcerts('로맨스')">
			            <input type="button" id="category-button" value="뮤지컬" onclick="loadTopConcerts('뮤지컬')">
			            <input type="button" id="category-button" value="연극" onclick="loadTopConcerts('연극')">
			            <input type="button" id="category-button" value="클래식" onclick="loadTopConcerts('클래식')">
                    </menu>
                <div class="schedule-list">여기에 공연이 들어가야됨</div>                
                <div id="schedule-button"><input type="button" value="공연 목록" id="sc-button" onclick="location.href='<%=request.getContextPath()%>/list.co?category=전체&sort=populer'"></div>
        </div>
    </div>
    
    <script>
    	
    	
    </script>
    
    <!-- 장르별 TOP 게시물 조회용  -->
    <script>
	    function loadTopConcerts(category) {
	        console.log('Selected category:', category); // 카테고리 값을 콘솔에 출력
	        $.ajax({
	            url: 'selectTopConcerts.co', // 서버의 엔드포인트 URL
	            method: 'GET',
	            data: { category: category },
	            success: function(result) {
	                console.log('AJAX 요청 성공:', result); // 성공 시 응답 출력
	                const scheduleList = $('.schedule-list'); 
	                scheduleList.empty();
	                result.forEach(function(concert) {
	                	let month = concert.startDate.split(" ")[0].replace("월", "");
	                	let date = concert.startDate.split(" ")[1].replace(",", "");
	                	let year = concert.startDate.split(" ")[2];
	                	
	                	if(month < 10) { month = "0" + month; }
	                	if(date < 10) { date = "0" + date; }
	                	
	                	let startDate = year + "-" + month + "-" + date;
	                	
	                	let endmonth = concert.endDate.split(" ")[0].replace("월", "");
	                	let enddate = concert.endDate.split(" ")[1].replace(",", "");
	                	let endyear = concert.endDate.split(" ")[2];
	                	
	                	if(endmonth < 10) { endmonth = "0" + endmonth; }
	                	if(enddate < 10) { enddate = "0" + enddate; }
	                	
	                	let endDate = endyear + "-" + endmonth + "-" + enddate;
	                	
	                    const concertHtml = `
	                        <div class="schedule">
	                            <a href="<%=request.getContextPath()%>/detail.co?cno=\${concert.concertId}">
	                                <img src="\${concert.thumbnailRoot}" style="width: 100%; height: 100%;">
	                            </a>
	                            <div class="detail-text">\${concert.concertName}</div>
	                            <div class="detail-text">\${startDate} ~ \${endDate}</div>
	                        </div>
	                    `;
	                    scheduleList.append(concertHtml);
	                    console.log(concertHtml);
	                });
	            },
	            error: function(xhr, status, error) {
	                console.log('카테고리별 공연 조회용 AJAX 실패');
	                console.log('Status:', status);
	                console.log('Error:', error);
	                console.log('Response:', xhr.responseText);
	            }
	        });
	    }
	</script>
    
    <div class="main-page-schedule">
        <div class="schedule-main">
            <h1 style="text-align: center;">오픈 예정</h1>
                <div class="schedule-list2">
                    <div class="schedule"><img src="resources/image/b1.jpg" style="width: 100%; height: 100%;"><div class="detail-text">공연제목</div></div>
                    <div class="schedule"><img src="resources/image/b2.jpg" style="width: 100%; height: 100%;"><div class="detail-text">공연제목</div></div>
                    <div class="schedule"><img src="resources/image/b3.jpg" style="width: 100%; height: 100%;"><div class="detail-text">공연제목</div></div>
                    <div class="schedule"><img src="resources/image/b4.jpg" style="width: 100%; height: 100%;"><div class="detail-text">공연제목</div></div>
                    <div class="schedule"><img src="resources/image/b5.jpg" style="width: 100%; height: 100%;"><div class="detail-text">공연제목</div></div>
                </div>    
        </div>
    </div>
    
    
    <script>
        $(document).ready(function() {
            var jbOffset = $('#mainImage').offset().top + $('#mainImage').height();
            $(window).scroll(function() {
                if ($(document).scrollTop() > jbOffset) {
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
    <!-- index.jsp 회원가입 동작용 자바스크립트 구문 추가 0610 - 무진 -->
    <script>
   
    $('#signupButton').click(function() {
        window.location.href = 'enrollForm.me';
    });
    $('#signupLink').click(function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        window.location.href = 'enrollForm.me';
    });
    
    
    $(document).ready(function() {
        var globalEmail = '';

        // 회원가입 버튼 클릭 이벤트 핸들러
        $('#signupButton, #signupLink').click(function() {
            window.location.href = 'enrollForm.me';
        });

        // 아이디 찾기 버튼 클릭 이벤트 핸들러
        $('#findIdButton').click(function() {
            var name = $('#findIdForm input[name=userName]').val();
            var phone = $('#findIdForm input[name=phone]').val();

            $.ajax({
                type: "POST",
                url: "findId.do",
                data: { userName: name, phone: phone },
                success: function(response) {
                    if (response.includes("회원님의 아이디는")) {
                        var foundId = response.split("아이디는 ")[1].split("입니다")[0];
                        alertify.alert("아이디 찾기 성공", "회원님의 아이디는 " + foundId + "입니다.");

                        // 아이디 찾기 모달창 닫기
                        $('#findIdModal').modal('hide');
                        
                        // 로그인 모달창 열기
                        $('#loginModal').modal('show');
                        
                        // 로그인 모달창에 찾아온 아이디 입력
                        $('#loginModal input[name=userId]').val(foundId);
                    } else {
                        alertify.alert("아이디 찾기 실패", response);
                    }
                },
                error: function(xhr, status, error) {
                    alertify.alert("아이디 찾기 실패", "아이디 찾기에 실패했습니다.");
                }
            });
        });

        // 비밀번호 찾기 버튼 클릭 이벤트 핸들러
        $('#findPwdButton').click(function() {
            var name = $('#findPwdForm input[name=userName]').val();
            var userId = $('#findPwdForm input[name=userId]').val();
            var email = $('#findPwdForm input[name=email]').val();
            $('#resetEmail').val(email); // 숨겨진 필드에 이메일 설정

            $.ajax({
                type: "POST",
                url: "cert.do",
                data: { email: email, userName: name, userId: userId },
                success: function(response) {
                    if (response.includes("인증번호 발급 완료")) {
                        alertify.alert("인증번호 발송 성공", response);
                        $('#findPwdModal').modal('hide');
                        $('#resetUserId').val(userId);
                        $('#resetPwdModal').modal('show');
                    } else {
                        alertify.alert("인증번호 발송 실패", response);
                    }
                },
                error: function(xhr, status, error) {
                    alertify.alert("인증번호 발송 실패", "인증번호 발송에 실패했습니다.");
                }
            });
        });

        // 비밀번호 재설정 버튼 클릭 이벤트 핸들러
        $('#resetPwdButton').click(function() {
            var userId = $('#resetUserId').val();
            var authKey = $('#resetPwdForm input[name=authKey]').val();
            var newPwd = $('#resetPwdForm input[name=newPwd]').val();
            var email = $('#resetEmail').val(); // 숨겨진 필드에서 가져오기

            $.ajax({
                type: "POST",
                url: "validate.do",
                data: { email: email, checkNo: authKey },
                success: function(response) {
                    if(response.includes("인증 성공")) {
                        $.ajax({
                            type: "POST",
                            url: "resetPwd.do",
                            contentType: "application/json",
                            data: JSON.stringify({ userId: userId, newPwd: newPwd }),
                            success: function(response) {
                                alertify.alert("비밀번호 변경 성공", response);
                                $('#resetPwdModal').modal('hide');
                            },
                            error: function(xhr, status, error) {
                                alertify.alert("비밀번호 변경 실패", "비밀번호 변경에 실패했습니다.");
                            }
                        });
                    } else {
                        alertify.alert("인증 실패", "인증번호가 올바르지 않습니다.");
                    }
                },
                error: function(xhr, status, error) {
                    alertify.alert("인증 실패", "인증에 실패했습니다.");
                }
            });
        });
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
</div>
    
</body>
</html>