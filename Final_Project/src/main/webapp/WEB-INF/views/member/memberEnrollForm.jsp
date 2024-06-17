<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- memberEnrollForm.jsp 태그리브 지시어 추가 0604 - 무진 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
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
    
    /* 버튼의 기본 스타일 */
    #idCheckButton, #enrollBtn {
        background: linear-gradient(0deg, #630000, #810000);
        color: #fff;
        cursor: pointer;
    }
    /* 버튼이 비활성화 상태일 때의 스타일 */
    #idCheckButton:disabled, #enrollBtn:disabled  {
        background: #ccc;
        color: #666;
        cursor: not-allowed;
    }
    /* memberEnrollForm.jsp 비밀번호 중복 검사 관련 스타일 추가 0610 - 무진 */
    #checkPwdMsg {
        font-weight: bold;
        display: none;
    }
    
    #checkPwdMsg.match {
        color: green;
    }
    
    #checkPwdMsg.nomatch {
        color: red;
    }

     .is-invalid {
        border-color: #dc3545;
    }
    .is-valid {
        border-color: #28a745;
    }
    .invalid-feedback {
        display: none;
        width: 100%;
        margin-top: 0.25rem;
        font-size: 80%;
        color: #dc3545;
    }
    .invalid-feedback.active {
        display: block;
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
    <jsp:include page="../common/header.jsp" />

    <div class="outer">
        <div class="container">
        <h2 align="center" style="margin-bottom: 5px;">회원가입</h2>
        <div class="hr" style="width: 105px;"></div>
        <br>
        <h6 style="float: right; margin-bottom: 10px;">* 표시는 반드시 입력해야 합니다</h6>
        <br clear="both">
        
        <div class="hr"></div>

        <h3 class="title2">&nbsp;&nbsp;기본 정보</h3>

        <form id="enroll-form" action="<%=request.getContextPath()%>/insert.me" method="post">
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
                        <input id="userName"
                               type="text"
                               name="userName"
                               required
                               placeholder="한글 2~5글자">
                        <div class="invalid-feedback">잘못된 형식의 이름입니다.</div>
                    </td>
                </tr>
                   <tr>
                        <th class="required">아이디 *</th>
                        <td colspan="3">
                            <input id="userId"
                                   type="text"
                                   name="userId"
                                   required
                                   placeholder="영문자, 숫자를 포함하여 총 4~12자로"
                                   oninput="toggleIdCheckButton()">
                            <div class="invalid-feedback">잘못된 형식의 아이디입니다.</div>
                        </td>
                        <td><button type="button"
                                    id="idCheckButton"
                                    onclick="idCheck();"
                                    disabled>중복확인</button></td>
                    </tr>
                    <!-- memberEnrollForm.jsp 비밀번호 중복 검사 관련 로직 추가 0610 - 무진  -->
                 <tr>
                    <th class="required">비밀번호 *</th>
                    <td colspan="4">
                        <input id="userPwd"
                               type="password"
                               name="userPwd"
                               required
                               placeholder="영문자, 숫자, 특수문자로 총 6~15자">
                        <div class="invalid-feedback">잘못된 형식의 비밀번호입니다.</div>
                    </td>
                </tr>
                <tr>
                    <th class="required">비밀번호 확인</th>
                    <td colspan="4">
                        <input id="userPwd_check"
                               type="password"
                               required>
                        <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <p id="checkPwdMsg" style="display:none;"></p>
                    </td>
                </tr>
                
                <tr>
                    <th>생년월일</th>
                    <td colspan="4"><input type="date" min="14" max="100" name="userBirth"></td>
                </tr>
                <tr>
                <th rowspan="3">주소</th>
                <td colspan="3">
                    <input type="text" id="postcode" name="postcode" placeholder="우편번호" value="${sessionScope.loginUser.postcode}">
                </td>
                <td>
                    <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" value="${sessionScope.loginUser.roadAddress}">
                </td>
                <td colspan="2">
                    <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소" value="${sessionScope.loginUser.jibunAddress}" width="30%">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" value="${sessionScope.loginUser.detailAddress}">
                </td>
                <td colspan="2">
                    <input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" value="${sessionScope.loginUser.extraAddress}">
                </td>
            </tr>
                
                <tr>
                    <th class="required">전화번호 *</th>
                    <td colspan="3">
                        <input id="phone"
                               type="number"
                               name="phone"
                               placeholder="- 제외하고 숫자 11글자"
                               required>
                        <div class="invalid-feedback">잘못된 형식의 전화번호입니다.</div>
                    </td>
                    <td><button type="button"
                                onclick="phoneCheck();">중복확인</button></td>
                </tr>
                <tr>
                    <th class="required">이메일 *</th>
                    <td colspan="3">
                        <input id="email" type="email" name="email" required>
                        <div class="invalid-feedback">잘못된 형식의 이메일입니다.</div>
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
                        style="width: 300px; height: 50px; font-size: 20px; font-weight: 900;"
                        disabled>가입하기</button>
            </div>
            <br><br>
        </form>
    </div>
    </div>

    <!-- 푸터바 -->
     <jsp:include page="../common/footer.jsp" />
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <!-- 아이디 중복확인 버튼이 비활성화 일때 보여지는 스타일을 위한 스크립트 0605 - 무진 -->
                <script>
                    function toggleIdCheckButton() {
                        const userId = document.getElementById('userId').value;
                        const idCheckButton = document.getElementById('idCheckButton');
                        idCheckButton.disabled = userId.length < 5;
                    }
                </script>
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
    <!-- 유효성검사 -->
    <script>
    $(document).ready(function() {
        function validate() {
            let isValid = true;
            let userId = $("#userId").val();
            let userPwd = $("#userPwd").val();
            let userPwd_check = $("#userPwd_check").val();
            let userName = $("#userName").val();
            let userPhone = $("#phone").val();
            let userEmail = $("#email").val();

            let checkId = /^[a-z0-9]{4,11}$/i;
            let checkPwd = /^\S{6,15}$/;
            let checkName = /^[가-힣]{2,5}$/;
            let checkPhone = /^[0-9]{11}$/;
            let checkEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            if (!checkId.test(userId)) {
                $("#userId").addClass("is-invalid");
                $("#userId").next(".invalid-feedback").addClass("active").text("잘못된 형식의 아이디입니다.");
                isValid = false;
            } else {
                $("#userId").removeClass("is-invalid").addClass("is-valid");
                $("#userId").next(".invalid-feedback").removeClass("active");
            }

            if (!checkPwd.test(userPwd)) {
                $("#userPwd").addClass("is-invalid");
                $("#userPwd").next(".invalid-feedback").addClass("active").text("잘못된 형식의 비밀번호입니다.");
                isValid = false;
            } else {
                $("#userPwd").removeClass("is-invalid").addClass("is-valid");
                $("#userPwd").next(".invalid-feedback").removeClass("active");
            }

            if (userPwd !== userPwd_check) {
                $("#userPwd_check").addClass("is-invalid");
                $("#userPwd_check").next(".invalid-feedback").addClass("active").text("비밀번호가 일치하지 않습니다.");
                isValid = false;
            } else {
                $("#userPwd_check").removeClass("is-invalid").addClass("is-valid");
                $("#userPwd_check").next(".invalid-feedback").removeClass("active");
            }

            if (!checkName.test(userName)) {
                $("#userName").addClass("is-invalid");
                $("#userName").next(".invalid-feedback").addClass("active").text("잘못된 형식의 이름입니다.");
                isValid = false;
            } else {
                $("#userName").removeClass("is-invalid").addClass("is-valid");
                $("#userName").next(".invalid-feedback").removeClass("active");
            }

            if (!checkPhone.test(userPhone)) {
                $("#phone").addClass("is-invalid");
                $("#phone").next(".invalid-feedback").addClass("active").text("잘못된 형식의 전화번호입니다.");
                isValid = false;
            } else {
                $("#phone").removeClass("is-invalid").addClass("is-valid");
                $("#phone").next(".invalid-feedback").removeClass("active");
            }

            if (!checkEmail.test(userEmail)) {
                $("#email").addClass("is-invalid");
                $("#email").next(".invalid-feedback").addClass("active").text("잘못된 형식의 이메일입니다.");
                isValid = false;
            } else {
                $("#email").removeClass("is-invalid").addClass("is-valid");
                $("#email").next(".invalid-feedback").removeClass("active");
            }

            return isValid;
        }

        function checkInfo() {
            let formIsValid = validate();
            if (formIsValid && checkId && checkPhone && checkEmail && checkMandatoryCheckboxes()) {
                $("#enrollBtn").removeAttr("disabled");
            } else {
                $("#enrollBtn").attr("disabled", true);
            }
        }

        $('#userId, #userPwd, #userPwd_check, #userName, #phone, #email').on('focus', function() {
            $(this).next(".invalid-feedback").removeClass("active");
        });

        $('#userId, #userPwd, #userPwd_check, #userName, #phone, #email').on('input', function() {
            validate();
        });

        $('.checkbox[required]').change(function() {
            checkInfo();
        });

        setInterval(checkInfo, 1000);

        $('#enroll-form').on('submit', function(e) {
            e.preventDefault();
            if (validate()) {
                let formData = $(this).serializeArray();
                let jsonData = {};
                $.each(formData, function() {
                    jsonData[this.name] = this.value;
                    console.log(this.value);
                });
		
                // 주소 필드 그룹화 및 결합
                let fullAddress = [
                    jsonData.postcode,
                    jsonData.roadAddress,
                    jsonData.jibunAddress,
                    jsonData.detailAddress,
                    jsonData.extraAddress
                ].filter(Boolean).join(' '); // 빈 문자열을 제거하고 공백으로 결합

                jsonData['address'] = fullAddress;

                // 불필요한 개별 주소 필드 삭제
                delete jsonData.postcode;
                delete jsonData.roadAddress;
                delete jsonData.jibunAddress;
                delete jsonData.detailAddress;
                delete jsonData.extraAddress;

                $.ajax({
                    url: $(this).attr('action'),
                    type: 'POST',
                    data: JSON.stringify(jsonData),
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function(response) {
                        if (response.status === 'success') {
                            alertify.alert('알림', '회원가입이 성공적으로 완료되었습니다.', function() {
                                window.location.href = '<%=request.getContextPath()%>/index.jsp';
                            });
                        } else if (response.status === 'duplicate') {
                            alert('중복된 값이 존재합니다. 다시 시도해주세요.');
                        } else {
                            alert(response.message);
                        }
                    },
                    error: function(xhr, status, error) {
                        alert('회원가입 중 오류가 발생했습니다.');
                        console.error('Error:', error);
                        console.error('Response:', xhr.responseText);
                    }
                });
            }
        });
    });
    </script>
    <script>
    let checkId = false;
    let checkPhone = false;
    let checkEmail = false;

     // 아이디 중복 확인
        function idCheck() {
            let $userId = $("#userId");
            $.ajax({
                url: "<%=request.getContextPath()%>/idCheck.me",
                type: "post",
                data: { userId: $userId.val() },
                success: function(result) {
                    if (result > 0) {
                        alert("이미 사용중인 아이디입니다.");
                        $userId.focus();
                    } else {
                        if (confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")) {
                            $userId.attr("readonly", true);
                            checkId = true;
                        } else {
                            $userId.focus();
                            checkId = false;
                        }
                    }
                },
                error: function() {
                    alert("아이디 중복 확인 중 오류가 발생했습니다.");
                }
            });
        }
    
        // 비밀번호 일치 검사
        $(function() {
            $('#userPwd, #userPwd_check').keyup(function() {
                let password = $("#userPwd").val();
                let confirmPassword = $("#userPwd_check").val();
                let msg = $("#checkPwdMsg");
    
                if (password === confirmPassword && password !== "") {
                    msg.text("비밀번호가 일치합니다.").removeClass("nomatch").addClass("match").hide();
                } else if (password === "" || confirmPassword === "") {
                    msg.text("").removeClass("match nomatch").hide();
                } else {
                    msg.text("비밀번호가 일치하지 않습니다.").removeClass("match").addClass("nomatch").hide();
                }
            });
        });
    
     // 전화번호 중복 확인
        function phoneCheck() {
            let $phone = $("#phone");
            $.ajax({
                url: "<%=request.getContextPath()%>/checkPhone.me",
                type: "post",
                data: { phone: $phone.val() },
                success: function(result) {
                    if (result > 0) {
                        alert("이미 사용중인 번호입니다.");
                        $phone.focus();
                    } else {
                        if (confirm("사용 가능한 번호입니다. 사용하시겠습니까?")) {
                            $phone.attr("readonly", true);
                            checkPhone = true;
                        } else {
                            $phone.focus();
                            checkPhone = false;
                        }
                    }
                },
                error: function() {
                    alert("전화번호 중복 확인 중 오류가 발생했습니다.");
                }
            });
        }

        // 이메일 중복 확인
        function emailCheck() {
            let $email = $("#email");
            $.ajax({
                url: "<%=request.getContextPath()%>/checkEmail.me",
                type: "post",
                data: { email: $email.val() },
                success: function(result) {
                    if (result > 0) {
                        alert("이미 사용중인 이메일입니다.");
                        $email.focus();
                    } else {
                        if (confirm("사용 가능한 이메일입니다. 사용하시겠습니까?")) {
                            $email.attr("readonly", true);
                            checkEmail = true;
                        } else {
                            $email.focus();
                            checkEmail = false;
                        }
                    }
                },
                error: function() {
                    alert("이메일 중복 확인 중 오류가 발생했습니다.");
                }
            });
        }
    
         // 필수 체크박스 확인
        function checkMandatoryCheckboxes() {
            let allChecked = true;
            $('.checkbox[required]').each(function() {
                if (!$(this).is(':checked')) {
                    allChecked = false;
                    return false;
                }
            });
            return allChecked;
        }
    </script>
</body>
</html>
