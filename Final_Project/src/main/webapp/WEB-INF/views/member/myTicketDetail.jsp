<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
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

.ticketDiv {
	display: flex;
	align-items: center;
	border: 10px solid #701f2d;
	width: 500px;
	background-color: #701f2d;
}

.qrcode {
	width: 120px;
	height: 120px;
	margin: 5px 20px 5px 5px;
}
.textBox{
	color:white;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="container">
		<div class="content">

			<br> <br>
			<div class="mypage-top">
				<span id="userInfo">환영합니다 <span style="color: #701f2d">${sessionScope.loginUser.userName}</span>님
				</span>
			</div>
			<div class="mypage-top">
				<button onclick="location.href='myTicketList.me'"
					class="myInfoButton">예매 내역</button>
			</div>
			<br> <br>
			<hr style="width: 100%">
			<br> <br>
			<p class="mypage-title">＊ 예매 내역 상세</p>
			<br> <br>

			<div id="ticket-detail-area">
				<table id="ticket-detail-table" border="0">
					<thead>
						<tr>
							<th style="text-align: left; padding-left: 25px;">${requestScope.concert.concertName}</th>
							<th></th>
							<th style="text-align: right; padding-right: 25px;">(
								${requestScope.concert.ageLimit}세 관람가 )</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3" height="50"><hr></td>
						</tr>
						<tr>
							<td rowspan="9" width="400" height="500"><img alt="공연썸네일"
								src="${requestScope.concert.thumbnailRoot}"
								style="width: 420px; margin-left: 20px; margin-right: 20px;"></td>
							<td colspan="2"><span class="detail-title">* 공연 정보</span></td>
						</tr>
						<tr>
							<td colspan="2" style="padding-left: 25px;">${requestScope.concert.fullDate}</td>
						</tr>
						<tr>
							<td colspan="2" style="padding-left: 25px;">공연시간 :
								${requestScope.concert.playTime}</td>
						</tr>
						<tr>
							<td colspan="2" style="padding-left: 25px;">${requestScope.concert.holeName}</td>
						</tr>
						<c:if test="${requestScope.concert.holeName eq '별빛홀' }">
							<tr>
								<td colspan="2" style="padding-left: 25px;">좌석위치 <c:forEach
										var="ticket" items="${requestScope.tl}">
									${ticket.seat }
								</c:forEach>
								</td>
							</tr>
						</c:if>
						<tr>
							<td colspan="2"><hr></td>
						</tr>
						<tr>
							<td colspan="2"><span class="detail-title">* 결제 정보</span></td>
						</tr>
						<tr>
							<td style="padding-left: 25px;">티켓 가격 :
								${requestScope.concert.price}</td>
							<td>구매한 티켓 수 : ${requestScope.tl.size()}</td>
						</tr>
						<tr>
							<td colspan="2" style="padding-left: 25px;">총 결제금액 :
								${requestScope.bl.reserveSum}</td>
						</tr>
						<tr>
							<td colspan="3" height="50"><hr></td>
						</tr>
					</tbody>
				</table>
				<div id="ticketList" style="display:flex; align-items: center; flex-direction: column;" aling="center">
				<button class="myInfoButton" type="button" onclick="ticketDown()">티켓 다운로드</button><br>
				</div>
				<br> <br>

				<div id="refundButton" align="center">
					<c:choose>
						<c:when test="${requestScope.bl.status eq 1}">
							<button class="myInfoButton btn-success"
								onclick="requestRefund();">환불 요청</button>
						</c:when>
						<c:when test="${requestScope.bl.status eq 2}">
							<button class="myInfoButton btn-primary"
								onclick="cancelRefund();">환불 요청 중</button>
						</c:when>
						<c:otherwise>
							<button class="myInfoButton btn-danger" disabled>환불 완료</button>
						</c:otherwise>
					</c:choose>

					<script>
						let buyListId = "${requestScope.bl.buyListId}";

						//환불요청
						function requestRefund() {
							alertify
									.confirm(
											'',
											'환불 요청하시겠습니까?',
											function() {
												$
														.ajax({
															url : "requestRefund.pa",
															type : "post",
															data : {
																buyListId : buyListId
															},
															success : function(
																	result) {
																if (result > 0) {
																	alertify
																			.alert(
																					'알림',
																					'환불 요청되었습니다.',
																					function() {
																						location.href = "myTicketList.me";
																					});
																} else {
																	console
																			.log("환불 요청 실패");
																}
															},
															error : function() {
																console
																		.log("환불 요청 ajax 통신 실패");
															}
														});
											}, function() {
											});

						}

						//환불요청취소
						function cancelRefund() {
							alertify
									.confirm(
											'',
											'환불 요청을 취소하시겠습니까?',
											function() {
												$
														.ajax({
															url : "cancelRefund.pa",
															type : "post",
															data : {
																buyListId : buyListId
															},
															success : function(
																	result) {
																if (result > 0) {
																	alertify
																			.alert(
																					'알림',
																					'환불 요청이 취소되었습니다.',
																					function() {
																						location.href = "myTicketList.me";
																					});
																} else {
																	console
																			.log("환불 요청 취소 실패");
																}
															},
															error : function() {
																console
																		.log("환불 요청 취소 ajax 통신 실패");
															}
														});
											}, function() {
											});
						}
					</script>
				</div>

				<br> <br> <br> <br> <br>

			</div>


		</div>
	</div>
	<script>
		let ticketListJson = '${tlJson}';
		let ticketList = JSON.parse(ticketListJson);
		let root = 'http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}'

		for(let i=0;ticketList.length>i;i++){
			drawTicket(ticketList[i],i);
		}
		
		function drawTicket(ticket,index) {
			let appendString="";
			if(ticket.seat){
				appendString = `
		            <div class="ticketDiv" id="ticketDiv\${index}">
		                <div id="qrcode\${index}" class="qrcode"></div>
		                <div id="textBox" class="textBox">
		                    <div><b>공연명 :</b> \${ticket.concertName}</div>
		                    <div><b>공연일시 :</b> \${ticket.date}</div>
		                    <div><b>공연장 :</b> \${ticket.holeName}</div>
		                    <div><b>좌석 :</b> \${ticket.seat}</div>
		                </div>
		            </div><br>`;
			}else{
				appendString = `
		            <div class="ticketDiv" id="ticketDiv\${index}">
		                <div id="qrcode\${index}" class="qrcode"></div>
		                <div id="textBox" class="textBox">
		                    <div><b>공연명 :</b> \${ticket.concertName}</div>
		                    <div><b>공연일시 :</b> \${ticket.date}</div>
		                    <div><b>공연장 :</b> \${ticket.holeName}</div>
		                </div>
		            </div><br>`;
			}
			
            
			document.getElementById("ticketList").insertAdjacentHTML('beforeend', appendString);
            let url = root+"/ticketCheck?qr="+ticket.qr;
            console.log(url)
			let qrcode = new QRCode(document.getElementById("qrcode"+index), {
			    text: url,
			    width: 120,
			    height: 120,
			    colorDark : "white",
			    colorLight : "#701f2d",
			    correctLevel : QRCode.CorrectLevel.Q
			});
		}
		function ticketDown(){
			for(let i=0;ticketList.length>i;i++){
				html2canvas(document.getElementById("ticketDiv"+i)).then(function(canvas) {
					let a = document.createElement("a");
					a.href = canvas.toDataURL("image/png")
				    a.download = "hole_"+ticketList[i].holeName+"_time_"+ticketList[i].date.replace(" ","-");
				    a.click()
				});
			}
		}

		drawTicket();
	</script>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>