<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Google Fonts 링크 추가 -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Alertify CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
   
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
	    margin-top: 15px; /* 원하는 만큼 아래로 내리기 위해 마진 추가 */
	}
	
	.logged-in-links {
	    display: flex;
	    flex-direction: column;
	    align-items: flex-start;
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

</style>
</head>
<body>
<div id="header">  
    <div id="navitb">
        <div><a href="<%= request.getContextPath() %>"><img src="resources/image/8px+텍스트.png" id="logo"></a></div>                    
        <div class="navi"><a href="list.co?category=전체&sort=date">공연정보</a></div>
        <div class="navi"><a href="<%=request.getContextPath()%>/infohall">소개</a></div>
        <div class="navi"><a href="">공지사항</a></div>                      
        <div class="navi"><a href="">유실물센터</a></div>    
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
                            <a href="adminPage.ad">마이페이지</a>
                        </c:when>
                        <c:otherwise>
                            <a href="myPage.me">마이페이지</a>
                        </c:otherwise>
                    </c:choose>
                    <a href="logout.me">로그아웃</a>
                </div>
            </div>
            </c:otherwise>
        </c:choose>
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
                    <label for="userId" class="mr-sm-2">ID : </label>
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID"  name="userId" value="${ cookie.saveId.value }" required> <br>
                    </div>
                    <div class="form-group">
                    <label for="userPwd" class="mr-sm-2">Password : </label>
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
                        <label for="userName">이름:</label>
	                        	<input type="text" class="form-control" name="userName" placeholder="Enter Name" required>
		                    </div>
		                    <div class="form-group">
		                        <label for="phone">전화번호:</label>
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
		                        <label for="userName">이름:</label>
		                        <input type="text" class="form-control"  name="userName" placeholder="Enter Name" required>
		                    </div>
		                    <div class="form-group">
		                        <label for="userId">아이디:</label>
		                        <input type="text" class="form-control"  name="userId" placeholder="Enter ID" required>
		                    </div>
		                    <div class="form-group">
		                        <label for="email">이메일:</label>
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
		                    <div class="form-group">
		                        <label for="authKey">인증번호:</label>
		                        <input type="text" class="form-control" id="authKey" name="authKey" placeholder="Enter Auth Key" required>
		                    </div>
		                    <div class="form-group">
		                        <label for="newPwd">새 비밀번호:</label>
		                        <input type="password" class="form-control" id="newPwd" name="newPwd" placeholder="Enter New Password" required>
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
                    <a href="parking" title="주차장">주차장</a>
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
                    <a href="#" title="주차안내">주차안내</a>
                </li>
            </ul>
        </li>
    </ul>
</div>
   <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <!-- Alertify JS -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
        
<script>
// 사이드 메뉴바 스크립트
document.addEventListener('DOMContentLoaded', function () {
    const items = document.querySelectorAll('#snb .hasThird > a');
    items.forEach(item => {
        item.addEventListener('click', function (e) {
            // 클릭된 항목의 href 값 가져오기
            const hrefValue = this.getAttribute('href');
            // 서브 메뉴가 없는 경우 이동
            if (this.nextElementSibling === null) {
                return;
            }
            e.preventDefault();
            const parent = this.parentElement;
            const subMenu = parent.querySelector('ul.depth3');
            const isActive = parent.classList.contains('active');
            document.querySelectorAll('#snb .hasThird').forEach(el => {
                el.classList.remove('active');
                const innerSubMenu = el.querySelector('ul.depth3');
                if (innerSubMenu) {
                    innerSubMenu.style.maxHeight = '0px';
                }
            });
            if (!isActive) {
                parent.classList.add('active');
                if (subMenu) {
                    subMenu.style.maxHeight = subMenu.scrollHeight + 'px';
                }
            } else {
                if (subMenu) {
                    subMenu.style.maxHeight = '0px';
                }
            }
            adjustSidebarHeight();
            // 서브 메뉴가 없는 경우 이동
            if (hrefValue && this.nextElementSibling === null) {
                window.location.href = hrefValue;
            }
        });
    });
    const subItems = document.querySelectorAll('#snb .depth3 a');
    subItems.forEach(subItem => {
        subItem.addEventListener('click', function (e) {
            e.preventDefault();
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
		$('#signupButton').click(function() {
		    window.location.href = 'enrollForm.me';
		});
		$('#signupLink').click(function(event) {
		    event.preventDefault(); // 기본 링크 동작 방지
		    window.location.href = 'enrollForm.me';
		});
		
		
		 $(document).ready(function() {
		        $('#findIdButton').click(function() {
		            const name = $('#findIdForm input[name=userName]').val();
		            const phone = $('#findIdForm input[name=phone]').val();
		            
		            $.ajax({
		                type: "POST",
		                url: "findId.do",
		                data: { userName: name, phone: phone },
		                success: function(response) {
		                    // 아이디 찾기에 성공했을 때
		                    if (response) {
		                        alert(response); // 회원님의 아이디는 user12입니다.
		                        
		                        // 메시지에서 아이디만 추출
		                        const foundId = response.split("아이디는 ")[1].split("입니다")[0];
		                        
		                        // 아이디 찾기 모달창 닫기
		                        $('#findIdModal').modal('hide');
		                        
		                        // 로그인 모달창 열기
		                        $('#loginModal').modal('show');
		                        
		                        // 로그인 모달창에 찾아온 아이디 입력
		                        $('#loginModal input[name=userId]').val(foundId);
		                    } else {
		                        alert("아이디를 찾을 수 없습니다.");
		                    }
		                },
		                error: function() {
		                    alert("아이디 찾기에 실패했습니다.");
		                }
		            });
		        });

		        $('#findPwdButton').click(function() {
		            const name = $('#findIdForm input[name=userName]').val();
		            const userId = $('#findPwdForm input[name=userId]').val();
		            const email = $('#findPwdForm input[name=email]').val();
		            $.ajax({
		                type: "POST",
		                url: "cert.do",
		                data: { email: email },
		                success: function(response) {
		                    alert("인증번호가 발송되었습니다.");
		                    $('#findPwdModal').modal('hide');
		                    $('#resetPwdModal').modal('show');
		                },
		                error: function() {
		                    alert("인증번호 발송에 실패했습니다.");
		                }
		            });
		        });
    $('#resetPwdButton').click(function() {
        const email = $('#findPwdForm input[name=email]').val();
        const authKey = $('#resetPwdForm #authKey').val();
        const newPwd = $('#resetPwdForm #newPwd').val();

        $.ajax({
            type: "POST",
            url: "validate.do",
            data: { email: email, checkNo: authKey },
            success: function(response) {
                if(response === "인증 성공") {
                    $.ajax({
                        type: "POST",
                        url: "resetPwd.do",
                        data: { email: email, newPwd: newPwd },
                        success: function() {
                            alert("비밀번호가 성공적으로 변경되었습니다.");
                            $('#resetPwdModal').modal('hide');
                        },
                        error: function() {
                            alert("비밀번호 변경에 실패했습니다.");
                        }
                    });
                } else {
                    alert("인증번호가 올바르지 않습니다.");
                }
            },
            error: function() {
                alert("인증에 실패했습니다.");
            }
        });
    });
});

</script>
</body>
</html>
