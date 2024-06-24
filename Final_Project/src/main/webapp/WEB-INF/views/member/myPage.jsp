<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
    .container {
        max-width: 1000px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        min-height: calc(100vh - 160px);
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
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="container">
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>마이페이지</h2>
            <br>
            <form id="updateForm" action="update.me" method="post">
                <div class="form-group">
                    <label for="userId">* ID : </label>
                    <input type="text" class="form-control" id="userId" value="${sessionScope.loginUser.userId}" name="userId" readonly> <br>

                    <label for="userName">* Name : </label>
                    <input type="text" class="form-control" id="userName" value="${sessionScope.loginUser.userName}" name="userName" required> <br>
                    <input type="hidden" id="initialUserName" value="${sessionScope.loginUser.userName}">

                    <label for="email"> &nbsp; Email : </label>
                    <input type="email" class="form-control" id="email" value="${sessionScope.loginUser.email}" name="email">
                    <div class="invalid-feedback" id="emailFeedback">중복된 이메일이 있습니다.</div> <br>
                    <input type="hidden" id="initialEmail" value="${sessionScope.loginUser.email}">

                    <label for="phone"> &nbsp; Phone : </label>
                    <input type="tel" class="form-control" id="phone" value="${sessionScope.loginUser.phone}" name="phone">
                    <div class="invalid-feedback" id="phoneFeedback">중복된 전화 번호가 있습니다.</div> <br>
                    <input type="hidden" id="initialPhone" value="${sessionScope.loginUser.phone}">

                    <label for="address"> &nbsp; Address : </label>
                    <input type="text" class="form-control" id="address" value="${sessionScope.loginUser.address}" name="address"> <br>
                    <input type="hidden" id="initialAddress" value="${sessionScope.loginUser.address}">
                    
                    <!-- STATUS hidden 필드 추가 -->
                    <input type="hidden" name="status" value="${sessionScope.loginUser.status}">
                </div>
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary" disabled>수정하기</button>
                    <button type="button" class="btn btn-warning" id="changePwdBtn">비밀번호 변경</button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                    <button type="button" class="btn btn-success" id="backBtn">뒤로가기</button> <!-- 뒤로가기 버튼 추가 -->
                </div>
            </form>
        </div>
    </div>
    <br><br>
</div>

<div class="modal fade" id="deleteForm">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">회원탈퇴</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="delete.me" method="post">
                <div class="modal-body">
                    <div align="center">
                        탈퇴 후 복구가 불가능합니다. <br>
                        정말로 탈퇴 하시겠습니까? <br>
                    </div>
                    <br>
                    <label for="userPwd" class="mr-sm-2">Password : </label>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="userPwd" required> <br>
                    <input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }">
                </div>
                <div class="modal-footer" align="center">
                    <button type="submit" class="btn btn-danger">탈퇴하기</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $('#changePwdBtn').click(function() {
            $('#findPwdModal').modal('show');
        });

        $('#backBtn').click(function() {
            window.history.back(); // 뒤로가기 기능 구현
        });

        let emailValid = true;
        let phoneValid = true;

        const initialEmail = $('#initialEmail').val();
        const initialPhone = $('#initialPhone').val();
        const initialUserName = $('#initialUserName').val();
        const initialAddress = $('#initialAddress').val();

        $('#email').on('input', function() {
            checkDuplicate('email', $(this).val());
        });

        $('#phone').on('input', function() {
            checkDuplicate('phone', $(this).val());
        });

        $('#userName, #address').on('input', function() {
            checkForChanges();
        });

        function checkDuplicate(type, value) {
            if ((type === 'email' && value === initialEmail) || (type === 'phone' && value === initialPhone)) {
                removeValidation(type);
                return;
            }

            let url = type === 'email' ? 'checkEmail.me' : 'checkPhone.me';
            $.ajax({
                url: url,
                method: 'POST',
                data: type === 'email' ? { email: value } : { phone: value },
                success: function(response) {
                    let isDuplicate = response.trim() === "1";
                    if (isDuplicate) {
                        if (type === 'email') {
                            $('#email').addClass('is-invalid');
                            $('#email').removeClass('is-valid');
                            $('#emailFeedback').show();
                            emailValid = false;
                        } else if (type === 'phone') {
                            $('#phone').addClass('is-invalid');
                            $('#phone').removeClass('is-valid');
                            $('#phoneFeedback').show();
                            phoneValid = false;
                        }
                    } else {
                        if (type === 'email') {
                            $('#email').addClass('is-valid');
                            $('#email').removeClass('is-invalid');
                            $('#emailFeedback').hide();
                            emailValid = true;
                        } else if (type === 'phone') {
                            $('#phone').addClass('is-valid');
                            $('#phone').removeClass('is-invalid');
                            $('#phoneFeedback').hide();
                            phoneValid = true;
                        }
                    }
                    toggleSubmitButton();
                },
                error: function(xhr, status, error) {
                    console.error(`Error checking ${type}:`, error);
                    if (type === 'email') {
                        $('#email').addClass('is-invalid');
                        $('#email').removeClass('is-valid');
                        $('#emailFeedback').show();
                        emailValid = false;
                    } else if (type === 'phone') {
                        $('#phone').addClass('is-invalid');
                        $('#phone').removeClass('is-valid');
                        $('#phoneFeedback').show();
                        phoneValid = false;
                    }
                    toggleSubmitButton();
                }
            });
        }

        function removeValidation(type) {
            if (type === 'email') {
                $('#email').removeClass('is-invalid');
                $('#email').removeClass('is-valid');
                $('#emailFeedback').hide();
                emailValid = true;
            } else if (type === 'phone') {
                $('#phone').removeClass('is-invalid');
                $('#phone').removeClass('is-valid');
                $('#phoneFeedback').hide();
                phoneValid = true;
            }
            toggleSubmitButton();
        }

        function checkForChanges() {
            const currentEmail = $('#email').val();
            const currentPhone = $('#phone').val();
            const currentUserName = $('#userName').val();
            const currentAddress = $('#address').val();

            if (currentEmail !== initialEmail || currentPhone !== initialPhone || currentUserName !== initialUserName || currentAddress !== initialAddress) {
                $('button[type="submit"]').prop('disabled', false);
            } else {
                $('button[type="submit"]').prop('disabled', true);
            }
        }

        function toggleSubmitButton() {
            if (emailValid && phoneValid) {
                checkForChanges();
            } else {
                $('button[type="submit"]').prop('disabled', true);
            }
        }

        $('#updateForm').on('submit', function(e) {
            if (!validateForm()) {
                e.preventDefault();
            }
        });

        function validateForm() {
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const phonePattern = /^010\d{8}$/;
            const namePattern = /^[가-힣]{2,3}$/;

            const email = $('#email').val();
            const phone = $('#phone').val();
            const userName = $('#userName').val();

            if (!emailPattern.test(email)) {
                alertify.alert('알림', '올바른 이메일 형식을 입력해주세요.');
                return false;
            }

            if (!phonePattern.test(phone)) {
                alertify.alert('알림', '올바른 전화번호 형식을 입력해주세요. 전화번호는 010으로 시작하는 11자리 숫자여야 합니다.');
                return false;
            }

            if (!namePattern.test(userName)) {
                alertify.alert('알림', '올바른 이름 형식을 입력해주세요. 이름은 한글 2~3글자여야 합니다.');
                return false;
            }

            return true;
        }
    });
</script>

<jsp:include page="../common/footer.jsp" />
</body>
</html>
