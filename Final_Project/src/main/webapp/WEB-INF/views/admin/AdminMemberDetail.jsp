<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>윤슬아트홀</title>
<style>
    #sb-btn {
        display: flex;
        justify-content: end;
    }
    #content {
        margin: auto;
        width: 90%;
    }
</style>
<!-- alertify CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
</head>
<body>

    <div id="wrapper">

        <jsp:include page="../common/adminNav.jsp" />

        <div id="content-wrapper" class="d-flex flex-column">

            <div id="content">

                <jsp:include page="../common/adminTop.jsp" />

                <h1 class="h3 mb-4 text-gray-800">회원 정보 수정</h1>

                <form action="adminUpdateMember.me" method="post">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <tr>
                            <th colspan="2">회원 아이디</th>
                            <td>
                                <input type="text" class="form-control form-control-user" value="${m.userId}" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">회원 이름</th>
                            <td>
                                <input type="text" class="form-control form-control-user" name="userName" value="${m.userName}">
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">생년월일</th>
                            <td>
                                <input type="date" class="form-control form-control-user" name="userBirth" value="${m.userBirth}">
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">이메일</th>
                            <td>
                                <input type="text" class="form-control form-control-user" name="email" value="${m.email}" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">전화번호</th>
                            <td>
                                <input type="text" class="form-control form-control-user" name="phone" value="${m.phone}" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">회원 상태</th>
                            <td>
                                <select name="status" class="form-control form-control-user">
                                    <option value="1" <c:if test="${m.status == 1}">selected</c:if>>일반회원</option>
                                    <option value="2" <c:if test="${m.status == 2}">selected</c:if>>탈퇴</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">주소</th>
                            <td>
                                <input type="text" class="form-control form-control-user" name="address" value="${m.address}">
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" value="${m.userId}" name="userId">
                    <hr>
                    <div id="sb-btn">
                        <button type="submit" class="btn btn-sm btn-warning">수정</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <!-- alertify JavaScript -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
    <script>
        // 기본 제목 설정
        alertify.defaults.glossary.title = "알림";
        
        window.onload = function() {
            // 회원 정보 수정 성공 메시지
            <c:if test="${not empty alertMsg}">
                alertify.success('${alertMsg}');
            </c:if>
            
            // 회원 정보 수정 실패 메시지
            <c:if test="${not empty errorMsg}">
                alertify.error('${errorMsg}');
            </c:if>
        };
    </script>
</body>
</html>
