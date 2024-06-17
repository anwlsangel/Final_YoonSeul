<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Alertify CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
<!-- Alertify JS -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style type="text/css">
		.container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            min-height: calc(100vh - 160px); /* 화면 높이에서 헤더와 푸터를 제외한 높이 설정 */
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
	<!-- myPage.jsp 일회성 알람문구 처리 script 0604 - 무진 -->
		<c:if test="${not empty sessionScope.alertMsg }">
			<script>
			alertify.alert('알림', '${sessionScope.alertMsg}', function(){ alertify.success('Ok'); });
			</script>
			<c:remove var="alertMsg" scope="session"/>
		</c:if>
    <!-- 마이페이지 (임시) 0604 JSP - 무진 -->
    <jsp:include page="../common/header.jsp" />
	<div class="container">
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>마이페이지</h2>
            <br>
            <form action="update.me" method="post">
                <div class="form-group">
                    <label for="userId">* ID : </label>
                    <input type="text" class="form-control" id="userId" value="${sessionScope.loginUser.userId}" name="userId" readonly> <br>

                    <label for="userName">* Name : </label>
                    <input type="text" class="form-control" id="userName" value="${sessionScope.loginUser.userName}" name="userName" required> <br>

				    <label for="email"> &nbsp; Email : </label>
				    <input type="text" class="form-control" id="email" value="${sessionScope.loginUser.email}" name="email">
				    <div class="invalid-feedback" id="emailFeedback">중복된 이메일이 있습니다.</div> <!-- 추가된 부분 --><br>

                    <label for="phone"> &nbsp; Phone : </label>
				    <input type="tel" class="form-control" id="phone" value="${sessionScope.loginUser.phone}" name="phone">
				    <div class="invalid-feedback" id="phoneFeedback">중복된 전화 번호가 있습니다.</div> <!-- 추가된 부분 --> <br>
                    
                    <label for="address"> &nbsp; Address : </label>
                    <input type="text" class="form-control" id="address" value="${sessionScope.loginUser.address}" name="address"> <br>
                </div> 
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary" disabled>수정하기</button>
                    <button type="button" class="btn btn-warning" id="changePwdBtn">비밀번호 변경</button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                </div>
            </form>
        </div>
    </div>
    <br><br>
</div>

    <!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="delete.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
                            탈퇴 후 복구가 불가능합니다. <br>
                            정말로 탈퇴 하시겠습니까? <br>
                        </div>
                        <br>
                            <label for="userPwd" class="mr-sm-2">Password : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="userPwd" required> <br>
                            <!-- 회원 탈퇴 시 PK 에 해당하는 회원이 아이디도 같이 넘겨야함 -->
                            <input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }">
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            // 비밀번호 변경 버튼 클릭 이벤트 핸들러
            $('#changePwdBtn').click(function() {
                // 헤더에 있는 비밀번호 찾기 모달 창 열기
                $('#findPwdModal').modal('show');
            });

            let emailValid = true;
            let phoneValid = true;

            // 기존 값 저장
            const initialEmail = $('#email').val();
            const initialPhone = $('#phone').val();
            const initialUserName = $('#userName').val();
            const initialAddress = $('#address').val();

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
                let url = type === 'email' ? 'checkEmail.me' : 'checkPhone.me';
                $.ajax({
                    url: url,
                    method: 'POST',
                    data: type === 'email' ? { email: value } : { phone: value },
                    success: function(response) {
                        console.log(`Response for ${type}:`, response);  // 디버깅 메시지 추가
                        // 만약 response가 문자열이 아니거나 null/undefined인 경우 처리
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

            $('form').on('submit', function(e) {
                if (!emailValid || !phoneValid) {
                    e.preventDefault();
                    alertify.error('중복된 이메일 또는 전화번호가 있습니다.');
                }
            });
        });
    </script>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>
