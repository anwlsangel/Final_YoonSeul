<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>윤슬아트홀</title>
    
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Alertify CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <!-- Alertify JS -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
     <style>
        @font-face {
            font-family: 'Gmarket Sans Medium';
            src: url('${pageContext.request.contextPath}/resources/css/GmarketSansTTFMedium.ttf') format('truetype');
            font-weight: 700;
        }

        * {
            font-family: 'Gmarket Sans Medium', sans-serif;
        }
    </style>
<style>
    html, body {
        margin: 0;
        padding: 0;
    }
    
    div {
        box-sizing: border-box;
    }
    
    #header {
         width: 100%;
        height: 100px;
        display: flex;
        align-items: center;
        z-index: 2;
        background: linear-gradient(45deg,#810000, #810000, #630000, #630000, #630000);
        position: fixed;
        top: 0;
    }
    
    #navitb {
         width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 30px;
    }
    
    .navi a,
    .main-login a,
    .logged-in-links a {
        text-decoration: none;
        font-size: 18px;
        color: white;
        position: relative;
        padding: 6px 12px;
    }
    
    .navi a::after,
    .main-login a::after,
    .logged-in-links a::after {
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
    
    .navi a:hover::after,
    .main-login a:hover::after,
    .logged-in-links a:hover::after {
        width: 100%;
    }
    
    #logo {
       position: relative;
        top: 5px;
        width: 80px;
        height: 80px;
        text-decoration: none;
    }
    
    .swiper-slide > img {
        width: 100%;
        height: 100%;
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
        background: rgba(255, 255, 240, 0.9);
        padding: 20px;
        color: #810000;
        position: absolute;
        top: 300px;
        left: 120px;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        text-align: center;
        border-radius: 10px;
        transition: height 0.3s ease;
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
        display: block;
        padding: 10px;
        transition: background 0.3s;
    }
    
    #snb ul li a:hover {
        background: rgba(128, 128, 128, 0.2);
    }
    
    #snb ul li ul {
        display: block;
        padding-left: 20px;
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.3s ease;
    }
    
    #snb ul li.active > ul {
        display: block;
        max-height: 300px;
    }
    
    #snb ul li.active > a {
        background: rgba(128, 128, 128, 0.2);
    }
    
    #snb ul li:not(:last-child)::after {
        content: "";
        display: block;
        border-bottom: 1px solid #810000;
        margin: 10px 0;
    }
    
    .main-login {
       display: flex;
        justify-content: space-between;
        align-items: center;
        width: 200px;
        margin-right: 30px;
    }
    
    .main-login-logged-in {
        display: flex;
        align-items: center;
        margin-left: auto;
        margin-right: 60px;
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
    
    #navitb label {
        color: white;
    }
    
    .container {
        margin-top: 120px; /* 컨테이너 위치 조정 */
    }
    
    .logged-in-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .is-invalid {
        border-color: #dc3545;
    }

    .is-valid {
        border-color: #28a745;
    }

    .invalid-feedback.active {
        display: block;
    }
</style>
</head>
<body>
<c:if test="${not empty sessionScope.alertMsg}">
    <script>
        alertify.alert('알림', '${sessionScope.alertMsg}', function() {
            alertify.success('Ok');
        });
    </script>
    <c:remove var="alertMsg" scope="session"/>
</c:if>
<div id="header">  
    <div id="navitb">
        <div><a href="<%= request.getContextPath() %>"><img src="resources/image/8px+텍스트.png" id="logo"></a></div>                    
        <div class="navi"><a href="list.co?category=전체&sort=date">공연정보</a></div>
        <div class="navi"><a href="<%=request.getContextPath()%>/infohall">소개</a></div>
        <div class="navi"><a href="list.no">공지사항</a></div>                      
        <div class="navi"><a href="list.lo">유실물센터</a></div>    
        <!-- 로그인 전후 화면 변경 -->
        <c:choose>
                    <c:when test="${empty sessionScope.loginUser }">
                    <!-- 로그인 전 -->             
                    <div class="main-login">
                        <div><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></div>                    
                        <div><a id="signupLink" href="#">회원가입</a></div>       
                    </div>
                    </c:when>
                    <c:otherwise>
                    <!-- 로그인 후 -->
                    <div class="logged-in-container">
                        <label class="welcome-message">${ sessionScope.loginUser.userName }님 환영합니다</label>
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
                                <label class="mr-sm-2">ID :</label>
                                <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" name="userId" value="${cookie.saveId.value}" required>
                            </div>
                            <div class="form-group">
                                <label class="mr-sm-2">Password :</label>
                                <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" name="userPwd" required>
                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="saveId1" name="saveId" value="y" ${not empty cookie.saveId ? 'checked' : ''}>
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
                                    <button type="button" class="btn btn-info mr-2" id="signupButton1">회원가입</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
                                <input type="checkbox" class="form-check-input" id="saveId2" name="saveId" value="y" ${ not empty cookie.saveId ? 'checked' : '' }>
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
                                    <button type="button" class="btn btn-info mr-2" id="signupButton2">회원가입</button>
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
                        <div class="invalid-feedback">인증번호가 올바르지 않습니다.</div>
                    </div>
                    <div class="form-group">
                        <label>새 비밀번호:</label>
                        <input type="password" class="form-control" name="newPwd" placeholder="Enter New Password" required>
                        <div class="invalid-feedback">잘못된 형식의 비밀번호입니다.</div>
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="resetPwdButton" disabled>비밀번호 변경</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>
    
		<!-- 사이드 메뉴바 -->
		<div id="snb">
		    <h2>
		        <img src="resources/image/8px.png" alt="윤슬아트홀" style="display: block; margin: 0 auto;">
		    </h2>
		    <ul class="depth2">
		        <li class="hasThird">
		            <a href="<%=request.getContextPath()%>/infohall" title="윤슬아트홀 소개">윤슬아트홀 소개</a>
		        </li>
		        <li class="hasThird">
		            <a href="#" title="공연장" class="over">공연장</a>
		            <ul class="depth3">
		                <li>
		                    <a href="<%=request.getContextPath()%>/starlight" title="콘서트홀">별빛홀</a>
		                </li>
		                <li>
		                    <a href="<%=request.getContextPath()%>/moonlight" title="스탠딩홀">달빛마당</a>
		                </li>
		            </ul>
		        </li>
		        <li class="hasThird">
		            <a href="#" title="시설안내">시설안내</a>
		            <ul class="depth3">
		                <li>
		                    <a href="<%=request.getContextPath()%>/parking" title="주차장">주차장</a>
		                </li>
		                <li>
		                    <a href="convenience" title="편의시설">편의시설</a>
		                </li>
		                <li>
		                    <a href="<%=request.getContextPath()%>/videoinfo" title="영상정보처리기기 운영/관리 방침">영상정보처리기기 운영/관리 방침</a>
		                </li>
		            </ul>
		        </li>
		        <li class="hasThird">
		            <a href="" title="오시는길">오시는길</a>
		            <ul class="depth3">
		                <li>
		                    <a href="<%=request.getContextPath()%>/halllocation" title="오시는길">오시는길</a>
		                </li>
		                <li>
		                    <a href="<%=request.getContextPath()%>/parking" title="주차안내">주차안내</a>
		                </li>
		            </ul>
		        </li>
		    </ul>
		</div>
        
    <script>
    $(document).ready(function() {
        $('#signupButton1, #signupButton2, #signupLink').click(function() {
            window.location.href = 'enrollForm.me';
        });

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
                        $('#findIdModal').modal('hide');
                        $('#loginModal').modal('show');
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

        var isCertRequested = false; // 인증번호 발송 상태를 추적

        $('#findPwdButton').click(function() {
            if (isCertRequested) return; // 이미 발송 요청 중이면 중단

            var name = $('#findPwdForm input[name=userName]').val();
            var userId = $('#findPwdForm input[name=userId]').val();
            var email = $('#findPwdForm input[name=email]').val();
            $('#resetEmail').val(email);

            isCertRequested = true; // 발송 요청 시작

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
                },
                complete: function() {
                    isCertRequested = false; // 발송 요청 완료
                }
            });
        });

        $('#resetPwdButton').click(function() {
            var userId = $('#resetUserId').val();
            var authKey = $('#resetPwdForm input[name=authKey]').val();
            var newPwd = $('#resetPwdForm input[name=newPwd]').val();
            var email = $('#resetEmail').val();

            // 유효성 검사
            var checkPwd = /^\S{6,15}$/;
            if (!checkPwd.test(newPwd)) {
                $('#resetPwdForm input[name=newPwd]').addClass('is-invalid');
                return;
            } else {
                $('#resetPwdForm input[name=newPwd]').removeClass('is-invalid').addClass('is-valid');
            }

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
                                alertify.alert("비밀번호 변경 성공", response.message, function() {
                                    if (response.redirect === "true") {
                                        window.location.href = 'http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}'; // 메인 페이지로 리디렉션
                                        setTimeout(function() {
                                            $('#loginModal').modal('show'); // 로그인 모달 띄우기
                                        }, 1000); // 1초 후에 모달 창 띄우기
                                    }
                                });
                                $('#resetPwdModal').modal('hide');
                                $('.modal-backdrop').remove();
                            },
                            error: function(xhr, status, error) {
                                alertify.alert("비밀번호 변경 실패", "비밀번호 변경에 실패했습니다.");
                            }
                        });
                    } else {
                        $('#resetPwdForm input[name=authKey]').addClass('is-invalid');
                        alertify.alert("인증 실패", "인증번호가 올바르지 않습니다.");
                    }
                },
                error: function(xhr, status, error) {
                    alertify.alert("인증 실패", "인증에 실패했습니다.");
                }
            });
        });

        // 사이드 메뉴바 스크립트
        const items = document.querySelectorAll('#snb .hasThird > a');
        items.forEach(function(item) {
            item.addEventListener('click', function(e) {
                if (this.getAttribute('href') === "<%=request.getContextPath()%>/infohall") {
                    return; // 윤슬아트홀 소개로 이동
                }
                e.preventDefault();
                const parent = this.parentElement;
                const subMenu = parent.querySelector('ul.depth3');
                const isActive = parent.classList.contains('active');

                document.querySelectorAll('#snb .hasThird').forEach(function(el) {
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
        subItems.forEach(function(subItem) {
            subItem.addEventListener('click', function() {
                window.location.href = this.getAttribute('href');
            });
        });

        function adjustSidebarHeight() {
            const snb = document.getElementById('snb');
            const activeItems = snb.querySelectorAll('.hasThird.active ul');
            let totalHeight = 410; // 기본 높이
            activeItems.forEach(function(item) {
                totalHeight += item.scrollHeight;
            });
            snb.style.height = `${totalHeight}px`;
        }

        // 유효성 검사
        $('#resetPwdForm input[name=newPwd], #resetPwdForm input[name=authKey]').on('input', function() {
            var checkPwd = /^\S{6,15}$/;
            var newPwd = $('#resetPwdForm input[name=newPwd]').val();
            var authKey = $('#resetPwdForm input[name=authKey]').val();

            if (checkPwd.test(newPwd) && authKey.length > 0) {
                $('#resetPwdButton').removeAttr('disabled');
            } else {
                $('#resetPwdButton').attr('disabled', true);
            }
        });
    });
    </script>
</body>
</html>
