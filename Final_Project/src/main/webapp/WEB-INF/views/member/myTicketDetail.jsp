<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	.container {
	    max-width: 1000px;
	    margin: 20px auto;
	    padding: 20px;
	    background-color: #fff;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    min-height: calc(100vh - 160px); /* 화면 높이에서 헤더와 푸터를 제외한 높이 설정 */
	}
	.mypage-top {
            box-sizing: border-box;
            display: inline-block;
            width: 49%;
            text-align: center;
    }
    #userInfo {
    	font-size: 22px;
    	font-weight: 700;
    	color: gray;
    }
    .myInfoButton {
        width: 180px;
        height: 40px;
        border: none;
        border-radius: 5px;
        background-color: #701f2d;
        color: #fff;
        font-size: 20px;
        font-weight: 700;
    }
    .mypage-title {
    	font-size: 30px;
    	color: #701f2d;
    	font-weight: 700;
    	margin-left: 20px;
    }
    #ticket-detail-table {
    	margin: auto;
		width: 95%;
	}
	#ticket-detail-table th {
        color: #701f2d;
		text-align: center;
		font-size: 20px;
	}
    #ticket-detail-table td {
        text-align: left;
    }
    #ticket-detail-table>tbody>tr>td>hr {
    	width: 95%;
    	background-color: lightgray;
    }
    .detail-title {
    	font-size: 20px;
    	color: #701f2d;
    	font-weight: 700;
    	margin-left: 20px;
    }
</style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
	<div class="content">
	
		<br><br>
		<div class="mypage-top">
			<span id="userInfo">환영합니다 <span style="color: #701f2d">${sessionScope.loginUser.userName}</span>님</span>
		</div>
		<div class="mypage-top">
			<button onclick="location.href='myTicketList.me'" class="myInfoButton">예매 내역</button>
		</div>
		<br><br>
		<hr style="width: 100%">
		<br><br>
		<p class="mypage-title">＊ 예매 내역 상세</p>
		<br><br>
		
		<div id="ticket-detail-area">
			<table id="ticket-detail-table" border="0">
				<thead>
					<tr>
						<th>${requestScope.concert.concertName}</th>
						<th>${requestScope.concert.category}</th>
						<th>${requestScope.concert.ageLimit}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="3" height="50"><hr></td>
					</tr>
					<tr>
						<td rowspan="9" width="400" height="500"><img alt="공연썸네일" src="${reauestScope.concert.thumbnailRoot}" style="border: 1px solid black;"></td>
						<td colspan="2"><span class="detail-title">* 공연 정보</span></td>
					</tr>
					<tr>
						<td colspan="2">공연날짜</td>
					</tr>
					<tr>
						<td colspan="2">${requestScope.concert.playTime}</td>
					</tr>
					<tr>
						<td colspan="2">${requestScope.concert.holeName}</td>
					</tr>
					<tr>
						<td colspan="2">좌석위치</td>
					</tr>
					<tr>
						<td colspan="2"><hr></td>
					</tr>
					<tr>
						<td colspan="2"><span class="detail-title">* 결제 정보</span></td>
					</tr>
					<tr>
						<td>${requestScope.concert.price}</td>
						<td>${requestScope.bl.reserveTicket}</td>
					</tr>
					<tr>
						<td colspan="2">${requestScope.bl.reserveSum}</td>
					</tr>
					<tr>
						<td colspan="3" height="50"><hr></td>
					</tr>
				</tbody>
			</table>
			
			<br><br>
			
			<div id="refundButton" align="center">
				<c:choose>
					<c:when test="${empty requestScope.bl.reserveRefund}">
						<button class="myInfoButton" onclick="getToken();">환불 요청</button>
					</c:when>
					<c:otherwise>
						<button class="myInfoButton" disabled>환불 완료</button>
					</c:otherwise>
				</c:choose>
				<script>
			    	const apiKey = "5866740403361550";
			    	const apiSecret = "to3dw2Xf52rRV7SYFFwqjbf4KLDbn3j9XAmfB8cmwmchALntKB6aj7rbQ9Buy6cFuwSB48lnRSlFFWfp";
			    	let buyListId = "${requestScope.bl.buyListId}";
			    	let token = "";
			    	
			    	//환불
			    	function refund() {
			    		console.log("환불 요청...");
			    		$.ajax({
			    			url: "refund.pa",
			    			type: "post",
			    			data: {
			    				access_token: token,
			    				merchant_uid: buyListId, //BUYLIST_ID
			    				reason: "환불사유" //환불사유
			    			},
			    			success: function(result) {
			    				console.log("환불 성공");
			    			},
			    			error: function() {
			    				console.log("환불 ajax 통신 실패");
			    			}
			    		});
			    	}
			    	
			    	//access token 발급
			    	function getToken() {
			    		console.log("access token 발급 요청...");
			    		$.ajax({
			    			url: "getToken.pa",
			    			type: "post",
			    			data: {
			    				apiKey: apiKey,
			    				apiSecret: apiSecret
			    			},
			    			success: function(response) {
			    				//console.log(response);
			    				token = response;
			    				console.log("access token 발급 성공");
			    				refund();
			    			},
			    			error: function() {
			    				console.log("access token 발급 ajax 통신 실패")
			    			}
			    		});
			    	}
			    	
			    </script>
			</div>
			
			<br><br><br><br><br>
			
		</div>
		
	
	</div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>