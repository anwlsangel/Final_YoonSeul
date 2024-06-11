<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- memberEnrollForm.jsp 태그리브 지시어 추가 0604 - 무진 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
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
	.outer {
        width: 1000px;
        /*border: 1px solid red;*/
        margin: auto;
        margin-top: 90px;
    }
    .memberInfo {
        border-spacing: 0px 6px;
    }
    .required,
    #enroll-form a {
        color: #810000;
    }
	#enroll-form input {
		width: 100%;
        box-sizing: border-box;
        padding: 5px;
        border-radius: 0px;
        border: none;
        outline: none;
        padding-left: 10px;
        border-bottom: 1px solid;
	}
    #enroll-form select {
        height: 100%;
        border-radius: 5px;
        border: none;
        outline: none;
        padding-left: 10px;
        background-color: #f3f0e3;
    }
    #enroll-form th {
        text-align: left;
    }
    #enroll-form button,
    #enroll-form input[type=button] {
        width: 100%;
        box-sizing: border-box;
        border: none;
        border-radius: 5px;
        background:  linear-gradient(0deg, #630000, #810000);
        color: rgb(255, 255, 255);
        height: 30px;
        font-weight: 900;
    }
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
    .hr {
        margin: auto;
        width: 850px;
        height: 5px;
        background:  linear-gradient(0deg, #630000, #810000);
    }
    body {
            background-color: #F4F4F4;
            margin: 0;
            padding: 0;
    }
    .container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            min-height: calc(100vh - 160px); /* 화면 높이에서 헤더와 푸터를 제외한 높이 설정 */
    }
    #enroll-form input[type="radio"] {
        width: 5%;
        accent-color: #810000;
    }
    .title2 {
        margin-left: 55px;
    }
</style>
</head>
<body>
	<!-- myPage.jsp 일회성 알람문구 처리 script 0604 - 무진 -->
		<c:if test="${not empty sessionScope.alertMsg }">
			<script>
			alertify.alert('알림', '${sessionScope.alertMsg}', function(){ alertify.success('Ok'); });
			</script>
			<c:remove var="alertMsg" scope="session"/>
		</c:if>
    <!-- 회원가입 폼(임시)  0604 - 무진 -->
    <!-- 메뉴바 -->
    <!--<jsp:include page="" />-->

    <div class="outer">
        <div class="container">
        <h2 align="center" style="margin-bottom: 5px;">회원가입</h2>
        <div class="hr" style="width: 105px;"></div>
        <br>
        <h6 style="float: right; margin-bottom: 10px;">* 표시는 반드시 입력해야 합니다</h6>
        <br clear="both">
        
        <div class="hr"></div>

        <h3 class="title2">&nbsp;&nbsp;기본 정보</h3>

        <form id="enroll-form" action="">
            <table class="memberInfo" align="center" width="600">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td width="20%"></td>
                </tr>
                <tr>
                    <th class="required">이름 *</th>
                    <td colspan="4">
                        <input id="memberName"
                               type="text"
                               name="memberName"
                               required
                               placeholder="한글 2~5글자">
                    </td>
                </tr>
                <tr>
                    <th class="required">아이디 *</th>
                    <td colspan="3">
                        <input id="memberId"
                    		    type="text"
                    		    name="memberId"
                    		    required
                    		    placeholder="영문자, 숫자를 포함하여 총 4~12자로">
                    </td>
                    <td><button type="button"
                    			onclick="idCheck();">중복확인</button></td>
                </tr>
                <tr>
                    <th class="required">비밀번호 *</th>
                    <td colspan="4">
                        <input id="memberPwd"
                    		   type="password"
                    		   name="memberPwd"
                    		   required
                    		   placeholder="영문자, 숫자, 특수문자로 총 6~15자">
                    </td>
                </tr>
                <tr>
                    <th class="required">비밀번호 확인</th>
                    <td colspan="4">
                        <input id="memberPwd_check"
                               type="password"
                               required>
                 
                            </td>
                </tr>
                <tr id="checkPwd-area" style="display: none;">
                	<td></td>
                	<td colspan="3">
                		<p id="checkPwdMsg"></p>
                	</td>
                	<td></td>
                </tr>
                
                <tr>
                    <th>생년월일</th>
                    <td colspan="4"><input type="date" min="14" max="100" name="age"></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td colspan="4" height="25">
                        <input type="radio" name="gender" id="M" value="M">
                         <label for="M">남자</label>
                         <input type="radio" name="gender" id="F" value="F">
                        <label for="F">여자</label>
                    </td>
                </tr>
                <tr>
                    <th rowspan="3">주소</th>
                    <td colspan="3">
                        <input type="text" id="postcode" name="postcode" placeholder="우편번호">
                    </td>
                    <td>
                        <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
                    </td>
                    <td colspan="2">
                        <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소" width="30%">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
                    </td>
                    <td colspan="2">
                        <input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
                    </td>
                </tr>
                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script>
                    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                    function execDaumPostcode() {
                        new daum.Postcode({
                            oncomplete: function(data) {
                                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                
                                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                var roadAddr = data.roadAddress; // 도로명 주소 변수
                                var extraRoadAddr = ''; // 참고 항목 변수
                
                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                    extraRoadAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if(extraRoadAddr !== ''){
                                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                                }
                
                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                document.getElementById('postcode').value = data.zonecode;
                                document.getElementById("roadAddress").value = roadAddr;
                                document.getElementById("jibunAddress").value = data.jibunAddress;
                                
                                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                                if(roadAddr !== ''){
                                    document.getElementById("extraAddress").value = extraRoadAddr;
                                } else {
                                    document.getElementById("extraAddress").value = '';
                                }
                            }
                        }).open();
                    }
                </script>
                <tr>
                    <th class="required">전화번호 *</th>
                    <td colspan="3">
                        <input id="phone"
                    		   type="number"
                    		   name="phone"
                    		   placeholder="- 제외하고 숫자 11글자"
                               required>
                    </td>
                    <td><button type="button"
                    			onclick="phoneCheck();">중복확인</button></td>
                </tr>
                <tr>
                    <th class="required">이메일 *</th>
                    <td colspan="3">
                        <input id="email" type="email" name="email" required>
                    </td>
                    <td><button type="button"
                    			onclick="emailCheck();">중복확인</button></td>
                </tr>
            </table>

            <br><br>
            <div class="hr"></div>

            
            <h3 class="title2">&nbsp;&nbsp;약관 동의</h3>
            <table align="center" width="600px">
                <tr>
                    <th>이용약관 동의</th>
                    <td><input type="checkbox" id="checkAll"></td>
                    <td style="color: #810000; font-weight: 900;">모든 약관을 확인하고 전체 동의합니다.</td>
                    <td></td>
                </tr>
                <tr>
                    <th></th>
                    <td><input type="checkbox" class="checkbox" required></td>
                    <td>(필수) 이용약관</td>
                    <td>전체보기 ></td>
                </tr>
                <tr>
                    <th></th>
                    <td><input type="checkbox" class="checkbox" required></td>
                    <td>(필수) 개인정보 수집 및 이용</td>
                    <td>전체보기 ></td>
                </tr>
                <tr>
                    <th></th>
                    <td><input type="checkbox" class="checkbox"></td>
                    <td>(선택) 정보 수신 동의</td>
                    <td></td>
                </tr>
                <tr>
                    <th></th>
                    <td><input type="checkbox" class="checkbox" required></td>
                    <td>(필수) 본인은 만 14세 이상입니다</td>
                    <td></td>
                </tr>
            </table>
            <script>
                $(function() {
                    // 첫 번째 체크박스가 변경될 때 실행되는 함수
                    $('#checkAll').change(function(){
                        // 첫 번째 체크박스의 상태에 따라 나머지 체크박스들의 상태를 변경
                        $('.checkbox').prop('checked', $(this).prop('checked'));
                    });
                });
            </script>
            <br><br>
            <div id="btns" align="center">
            	<button id="enrollBtn" type="submit"
                        onclick="return validate();"
                        style="width: 300px; height: 50px; font-size: 20px; font-weight: 900;"
                        disabled>가입하기</button>
            </div>
            <br><br>
        </form>
    </div>
    </div>

    <!-- 푸터바 -->
    <!--<jsp:include page="" />-->
    
    
    <!-- 유효성검사 -->
    <script>
        function validate() {
            let memberId = $("#memberId").val();
            let memberPwd = $("#memberPwd").val();
            let memberPwd_check = $("#memberPwd_check").val();
            let memberName = $("#memberName").val();
            let memberPhone = $("#phone").val();

            let checkId = /^[a-z0-9]{4,11}$/i; //영문자, 숫자를 포함하여 총 4~12자
            let checkPwd = /^\S{6,15}$/; //영문자, 숫자, 특수문자로 총 8~15자
            let checkName = /^[가-힣]{2,5}$/; //한글로만 이루어져야 하며 2~5글자
            let checkPhone = /^[0-9]{11}$/; //숫자 11글자

            if(!checkId.test(memberId)) {
                alert("아이디 형식이 잘못되었습니다.");
                $("#memberId").select();
                return false;
            }
            if(!checkPwd.test(memberPwd)) {
                alert("비밀번호 형식이 잘못되었습니다.");
                $("#memberPwd").select();
                return false;
            }
            if(memberPwd != memberPwd_check) {
                alert("비밀번호가 일치하지 않습니다.");
                $("#memberPwd_check").select();
                return false;
            }
            if(!checkName.test(memberName)) {
                alert("이름 형식이 잘못되었습니다.");
                $("#memberName").select();
                return false;
            }
            if(!checkPhone.test(memberPhone)) {
                alert("전화번호 형식이 잘못되었습니다.");
                $("#phone").select();
                return false;
            }
        }
    </script>
    
    <script>
        let checkId = false;
        let checkPhone = false;
        let checkEmail = false;
        //아이디 중복 검사
        function idCheck() {
            let $memberId = $("#memberId");
            $.ajax({
                url: "<%=request.getContextPath()%>/checkId.me",
                type: "post",
                data: {memberId: $memberId.val()},
                success: function(result) {
                    if(result > 0) {
                        alert("이미 사용중인 아이디입니다.");
                        $memberId.focus();
                    } else {
                        if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")) {
                            $memberId.attr("readonly", true);
                            checkId = true;
                        } else {
                            $memberId.focus();
                            checkId = false;
                        }
                    }
                },
                error: function() {}
            });
        }
        
        //비밀번호 일치 검사
        $(function() {
            $('#memberPwd, #memberPwd_check').keyup(function() {
                let a = $("#memberPwd").val();
                let b = $("#memberPwd_check").val();
                let msg = $("#checkPwdMsg");
                if(a == b) {
                    msg.text("일치");
                } else {
                    msg.text("불일치");
                }
            });
        });
        
        //전화번호 중복 검사
        function phoneCheck() {
            let $phone = $("#phone");
            $.ajax({
                url: "<%=request.getContextPath()%>/checkPhone.me",
                type: "post",
                data: {phone: $phone.val()},
                success: function(result) {
                    if(result > 0) {
                        alert("이미 사용중인 번호입니다.");
                        $phone.focus();
                    } else {
                        if(confirm("사용 가능한 번호입니다. 사용하시겠습니까?")) {
                            $phone.attr("readonly", true);
                            checkPhone = true;
                        } else {
                            $phone.focus();
                            checkPhone = false;
                        }
                    }
                },
                error: function() {}
            });
        }
        
        //이메일 중복체크
        function emailCheck() {
            let $email = $("#email");
            $.ajax({
                url: "<%=request.getContextPath()%>/checkEmail.me",
                type: "post",
                data: {email: $email.val()},
                success: function(result) {
                    if(result > 0) {
                        alert("이미 사용중인 이메일입니다.");
                        $email.focus();
                    } else {
                        if(confirm("사용 가능한 이메일입니다. 사용하시겠습니까?")) {
                            $email.attr("readonly", true);
                            checkEmail = true;
                        } else {
                            $email.focus();
                            checkEmail = false;
                        }
                    }
                },
                error: function() {}
            });
        }
            
        //회원가입 가능 여부 체크
        $(function() {
            setInterval(checkInfo, 1000);
        });
        
        function checkInfo() {
            if(checkId && checkPhone && checkEmail) {
                $("#enrollBtn").removeAttr("disabled");
            } else {
                $("#enrollBtn").attr("disabled", true);
            }
        }
    </script>

</body>
</html>