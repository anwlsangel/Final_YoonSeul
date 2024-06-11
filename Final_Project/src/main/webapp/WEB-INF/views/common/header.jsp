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
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- 부트스트랩 및 각종 연동구문 추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
html,body {
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
#logo {
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
    box-shadow: 2px 0 5px rgba(0,0,0,0.1);
    text-align: center;
    border-radius: 10px;
    transition: height 0.3s ease; /* 높이 전환에 대한 부드러운 효과 추가 */
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
    display: block;
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
    width: 200px; 
    margin-right: 30px;
}
.main-login a {
    text-decoration: none;
    font-size: 18px;
    margin-right: 100px;
    margin: auto;  
    color: white;    
}
.main-login a:hover {
    cursor: pointer;
}
#navitb a {
    color: white;
}
#navitb label {
    color: white;
}
</style>
</head>
<body>
<div id="header">  
    <div id="navitb">
        <div><a href="<%= request.getContextPath() %>"><img src="resources/image/logo.png" id="logo"></a></div>                    
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
            <div>
                <label>${ sessionScope.loginUser.userName }님 환영합니다</label> &nbsp;&nbsp;
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
            </c:otherwise>
        </c:choose>
    </div>       
</div> 

<!-- 로그인 모달창 -->
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
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="" name="userId" value="${ cookie.saveId.value }" required> <br>
                    <label for="userPwd" class="mr-sm-2">Password : </label>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="" name="userPwd" required>
                    <br>
                    <c:choose>
                        <c:when test="${ not empty cookie.saveId }">
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
                    <button type="button" class="btn btn-info" id="signupButton">회원가입</button>
                    <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#findIdModal">아이디 찾기</button>
                    <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#findPwdModal">비밀번호 찾기</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </form>
            <!-- 아이디 찾기 모달창 -->
			<div class="modal fade" id="findIdModal">
			    <div class="modal-dialog modal-sm">
			        <div class="modal-content">
			            <!-- Modal Header -->
			            <div class="modal-header">
			                <h4 class="modal-title">아이디 찾기</h4>
			                <button type="button" class="close" data-dismiss="modal">&times;</button>
			            </div>
			            <form id="findIdForm">
			                <!-- Modal body -->
			                <div class="modal-body">
			                    <label for="userName" class="mr-sm-2">이름 : </label>
			                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter Name"  name="userName" required> <br>
			                    <label for="phone" class="mr-sm-2">전화번호 : </label>
			                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter Phone"  name="phone" required>
			                </div>
			                <!-- Modal footer -->
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-primary" id="findIdButton">아이디 찾기</button>
			                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			                </div>
			            </form>
			        </div>
			    </div>
			</div>
            <!-- 비밀번호 찾기 모달창 -->
			<div class="modal fade" id="findPwdModal">
			    <div class="modal-dialog modal-sm">
			        <div class="modal-content">
			            <!-- Modal Header -->
			            <div class="modal-header">
			                <h4 class="modal-title">비밀번호 찾기</h4>
			                <button type="button" class="close" data-dismiss="modal">&times;</button>
			            </div>
			            <form id="findPwdForm">
			                <!-- Modal body -->
			                <div class="modal-body">
			                    <label for="userName" class="mr-sm-2">이름 : </label>
			                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter Name"  name="userName" required> <br>
			                    <label for="userId" class="mr-sm-2">아이디 : </label>
			                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID"  name="userId" required> <br>
			                    <label for="email" class="mr-sm-2">이메일 : </label>
			                    <input type="email" class="form-control mb-2 mr-sm-2" placeholder="Enter Email"  name="email" required>
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
			<div class="modal fade" id="resetPwdModal">
			    <div class="modal-dialog modal-sm">
			        <div class="modal-content">
			            <!-- Modal Header -->
			            <div class="modal-header">
			                <h4 class="modal-title">비밀번호 변경</h4>
			                <button type="button" class="close" data-dismiss="modal">&times;</button>
			            </div>
			            <form id="resetPwdForm">
			                <!-- Modal body -->
			                <div class="modal-body">
			                    <label for="authKey" class="mr-sm-2">인증번호 : </label>
			                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter Auth Key" id="authKey" name="authKey" required> <br>
			                    <label for="newPwd" class="mr-sm-2">새 비밀번호 : </label>
			                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter New Password" id="newPwd" name="newPwd" required>
			                </div>
			                <!-- Modal footer -->
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-primary" id="resetPwdButton">비밀번호 변경</button>
			                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			                </div>
			            </form>
			        </div>
			    </div>
			</div>
            	
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
                    <a href="#" title="주차장">주차장</a>
                </li>
                <li>
                    <a href="convenience" title="편의시설">편의시설</a>
                </li>
                <li>
                    <a href="#" title="영상정보처리기기 운영/관리 방침">영상정보처리기기 운영/관리 방침</a>
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
        const name = $('#findIdForm #userName').val();
        const phone = $('#findIdForm #phone').val();
        
        $.ajax({
            type: "POST",
            url: "findId.do",
            data: { userName: name, phone: phone },
            success: function(response) {
                alert(response);
            },
            error: function() {
                alert("아이디 찾기에 실패했습니다.");
            }
        });
    });

    $('#findPwdButton').click(function() {
        const name = $('#findPwdForm #userName').val();
        const userId = $('#findPwdForm #userId').val();
        const email = $('#findPwdForm #email').val();

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
        const email = $('#findPwdForm #email').val();
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
