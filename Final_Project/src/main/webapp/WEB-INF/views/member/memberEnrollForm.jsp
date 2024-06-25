<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
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
        min-height: calc(100vh - 160px);
    }
    #enroll-form input[type="radio"] {
        width: 5%;
        accent-color: #810000;
    }
    .title2 {
        margin-left: 55px;
    }
    #idCheckButton, #enrollBtn {
        background: linear-gradient(0deg, #630000, #810000);
        color: #fff;
        cursor: pointer;
    }
    #idCheckButton:disabled, #enrollBtn:disabled  {
        background: #ccc;
        color: #666;
        cursor: not-allowed;
    }
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
    <c:if test="${not empty sessionScope.alertMsg }">
        <script>
            alertify.alert('알림', '${sessionScope.alertMsg}', function(){ alertify.success('Ok'); });
        </script>
        <c:remove var="alertMsg" scope="session"/>
    </c:if>
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
                            <input id="userName" type="text" name="userName" required placeholder="한글 2~5글자" onblur="validateField('userName')">
                            <div class="invalid-feedback">잘못된 형식의 이름입니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <th class="required">아이디 *</th>
                        <td colspan="3">
                            <input id="userId" type="text" name="userId" required placeholder="영문자, 숫자를 포함하여 총 4~12자로" onblur="validateField('userId')" oninput="toggleIdCheckButton()">
                            <div class="invalid-feedback">잘못된 형식의 아이디입니다.</div>
                        </td>
                        <td><button type="button" id="idCheckButton" onclick="idCheck();" disabled>중복확인</button></td>
                    </tr>
                    <tr>
                        <th class="required">비밀번호 *</th>
                        <td colspan="4">
                            <input id="userPwd" type="password" name="userPwd" required placeholder="영문자, 숫자, 특수문자를 포함하여 총 6~15자" onblur="validateField('userPwd')">
                            <div class="invalid-feedback">잘못된 형식의 비밀번호입니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <th class="required">비밀번호 확인</th>
                        <td colspan="4">
                            <input id="userPwd_check" type="password" required onblur="validateField('userPwd_check')">
                            <div id="checkPwdMsg" class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td colspan="4"><input type="date" min="14" max="100" name="userBirth"></td>
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
                            <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소">
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
                    <tr>
                        <th class="required">전화번호 *</th>
                        <td colspan="3">
                            <input id="phone" type="number" name="phone" placeholder="- 제외하고 숫자 11글자" required onblur="validateField('phone')">
                            <div class="invalid-feedback">잘못된 형식의 전화번호입니다.</div>
                        </td>
                        <td><button type="button" onclick="phoneCheck();">중복확인</button></td>
                    </tr>
                    <tr>
                        <th class="required">이메일 *</th>
                        <td colspan="3">
                            <input id="email" type="email" name="email" required onblur="validateField('email')">
                            <div class="invalid-feedback">잘못된 형식의 이메일입니다.</div>
                        </td>
                        <td><button type="button" onclick="emailCheck();">중복확인</button></td>
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
                    </tr>
                    <tr>
                        <th></th>
                        <td><input type="checkbox" class="checkbox" required></td>
                        <td>(필수) 본인은 만 14세 이상입니다</td>
                    </tr>
                </table>
                <script>
                    $(function() {
                        $('#checkAll').change(function(){
                            $('.checkbox').prop('checked', $(this).prop('checked'));
                        });
                    });
                </script>
                <br><br>
                <div id="btns" align="center">
                    <button id="enrollBtn" type="submit" style="width: 300px; height: 50px; font-size: 20px; font-weight: 900;" disabled>가입하기</button>
                </div>
                <br><br>
            </form>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function toggleIdCheckButton() {
            const userId = document.getElementById('userId').value;
            const idCheckButton = document.getElementById('idCheckButton');
            idCheckButton.disabled = userId.length < 5;
        }

        function validateField(fieldId) {
            let isValid = true;
            let value = $("#" + fieldId).val();
            let checkId = /^[a-z0-9]{4,11}$/i;
            let checkPwd = /^(?=.*[!@#$%^&*(),.?":{}|<>]).{6,15}$/;
            let checkName = /^[가-힣]{2,5}$/;
            let checkPhone = /^[0-9]{11}$/;
            let checkEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            switch(fieldId) {
                case 'userId':
                    if (!checkId.test(value)) {
                        $("#" + fieldId).addClass("is-invalid");
                        $("#" + fieldId).next(".invalid-feedback").addClass("active").text("잘못된 형식의 아이디입니다.");
                        isValid = false;
                    } else {
                        $("#" + fieldId).removeClass("is-invalid").addClass("is-valid");
                        $("#" + fieldId).next(".invalid-feedback").removeClass("active");
                    }
                    break;
                case 'userPwd':
                    if (!checkPwd.test(value)) {
                        $("#" + fieldId).addClass("is-invalid");
                        $("#" + fieldId).next(".invalid-feedback").addClass("active").text("잘못된 형식의 비밀번호입니다.");
                        isValid = false;
                    } else {
                        $("#" + fieldId).removeClass("is-invalid").addClass("is-valid");
                        $("#" + fieldId).next(".invalid-feedback").removeClass("active");
                    }
                    break;
                case 'userPwd_check':
                    let password = $("#userPwd").val();
                    let feedback = $("#checkPwdMsg");
                    if (value !== password) {
                        feedback.addClass("active").text("비밀번호가 일치하지 않습니다.").removeClass("match").addClass("nomatch");
                        isValid = false;
                    } else {
                        feedback.addClass("active").text("비밀번호가 일치합니다.").removeClass("nomatch").addClass("match");
                        isValid = true;
                    }
                    break;
                case 'userName':
                    if (!checkName.test(value)) {
                        $("#" + fieldId).addClass("is-invalid");
                        $("#" + fieldId).next(".invalid-feedback").addClass("active").text("잘못된 형식의 이름입니다.");
                        isValid = false;
                    } else {
                        $("#" + fieldId).removeClass("is-invalid").addClass("is-valid");
                        $("#" + fieldId).next(".invalid-feedback").removeClass("active");
                    }
                    break;
                case 'phone':
                    if (!checkPhone.test(value)) {
                        $("#" + fieldId).addClass("is-invalid");
                        $("#" + fieldId).next(".invalid-feedback").addClass("active").text("잘못된 형식의 전화번호입니다.");
                        isValid = false;
                    } else {
                        $("#" + fieldId).removeClass("is-invalid").addClass("is-valid");
                        $("#" + fieldId).next(".invalid-feedback").removeClass("active");
                    }
                    break;
                case 'email':
                    if (!checkEmail.test(value)) {
                        $("#" + fieldId).addClass("is-invalid");
                        $("#" + fieldId).next(".invalid-feedback").addClass("active").text("잘못된 형식의 이메일입니다.");
                        isValid = false;
                    } else {
                        $("#" + fieldId).removeClass("is-invalid").addClass("is-valid");
                        $("#" + fieldId).next(".invalid-feedback").removeClass("active");
                    }
                    break;
            }
            return isValid;
        }

        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var roadAddr = data.roadAddress;
                    var extraRoadAddr = '';
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("roadAddress").value = roadAddr;
                    document.getElementById("jibunAddress").value = data.jibunAddress;
                    if(roadAddr !== ''){
                        document.getElementById("extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("extraAddress").value = '';
                    }
                }
            }).open();
        }

        function idCheck() {
            let $userId = $("#userId");
            if (!validateField('userId')) return;

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
                        } else {
                            $userId.focus();
                        }
                    }
                },
                error: function() {
                    alert("아이디 중복 확인 중 오류가 발생했습니다.");
                }
            });
        }

        function phoneCheck() {
            let $phone = $("#phone");
            if (!validateField('phone')) return;

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
                        } else {
                            $phone.focus();
                        }
                    }
                },
                error: function() {
                    alert("전화번호 중복 확인 중 오류가 발생했습니다.");
                }
            });
        }

        function emailCheck() {
            let $email = $("#email");
            if (!validateField('email')) return;

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
                        } else {
                            $email.focus();
                        }
                    }
                },
                error: function() {
                    alert("이메일 중복 확인 중 오류가 발생했습니다.");
                }
            });
        }

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

        $(document).ready(function() {
            $('#enroll-form').on('submit', function(e) {
                e.preventDefault();
                let isValid = true;
                isValid &= validateField('userId');
                isValid &= validateField('userPwd');
                isValid &= validateField('userPwd_check');
                isValid &= validateField('userName');
                isValid &= validateField('phone');
                isValid &= validateField('email');

                if (isValid && checkMandatoryCheckboxes()) {
                    let formData = $(this).serializeArray();
                    let jsonData = {};
                    $.each(formData, function() {
                        jsonData[this.name] = this.value;
                    });
                    let fullAddress = [
                        jsonData.postcode,
                        jsonData.roadAddress,
                        jsonData.jibunAddress,
                        jsonData.detailAddress,
                        jsonData.extraAddress
                    ].filter(Boolean).join(' ');
                    jsonData['address'] = fullAddress;
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

            // 비밀번호 확인 유효성 검사 추가
            $('#userPwd, #userPwd_check').keyup(function() {
                let password = $("#userPwd").val();
                let confirmPassword = $("#userPwd_check").val();
                let feedback = $("#checkPwdMsg");

                if (password === confirmPassword && password !== "") {
                    feedback.text("비밀번호가 일치합니다.").removeClass("nomatch").addClass("match").show();
                } else if (password === "" || confirmPassword === "") {
                    feedback.text("").removeClass("match nomatch").hide();
                } else {
                    feedback.text("비밀번호가 일치하지 않습니다.").removeClass("match").addClass("nomatch").show();
                }
            });
        });
    </script>
</body>
</html>
