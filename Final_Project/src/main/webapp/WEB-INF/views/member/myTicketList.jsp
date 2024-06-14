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
    #myInfoButton {
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
	#ticketlist-table {
		width: 100%;
	}
	#ticketlist-table th {
        color: #701f2d;
		text-align: center;
		font-size: 20px;
	}
    #ticketlist-table td {
        text-align: center;
    }
    #ticketlist-table>tbody>tr>td>hr {
    	width: 95%;
    	background-color: lightgray;
    }
    
    .ticketInfo {
    	height: 30px;
    }
    .ticketInfo:hover {
    	cursor: pointer;
    }
    
    /*ticketList-paging-area*/
    #ticketList-paging-area>button {
    	border: none;
    	background-color: white;
    	width: 30px;
    	height: 30px;
    	font-size: 20px;
    	font-weight: 700;
    }

	#wishlist {
        display: flex;
        width: 100%;
        height: 300px;
        margin: auto;
        align-items: center;
        justify-content: center; /* 아이템들을 중앙에 배치 */
        gap: 20px; /* 아이템 사이의 간격 조정 */
    }
    .item {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    #wishlist a {
        text-align: center;
        display: block;
        margin: auto;
    }
    #wishlist img {
        width: 180px;
        height: 250px;
        border-radius: 20px;
    }
    .detail-title {
        width: 180px; /* 이미지와 동일한 너비 */
        height: 30px;
        text-align: center;
        line-height: 30px; /* 제목 높이 조정 */
        font-size: 16px;
        font-weight: bold;
        margin-top: 10px; /* 이미지와 제목 사이의 간격 */
        margin-bottom: 5px;
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
			<button onclick="location.href='myPage.me'" id="myInfoButton">내 정보 수정</button>
		</div>
		<br><br>
		<hr style="width: 100%">
		<br><br>
		
		<p class="mypage-title">＊ 예매 내역</p>
		<br>
		
		<div id="ticketList" style="height: 470px">
			<table id="ticketlist-table">
				<thead>
					<tr>
						<th>예매번호</th>
						<th>공연명</th>
						<th>티켓 수</th>
						<th>총 결제금액</th>
						<th>결제일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div id="ticketList-paging-area" align="center"></div>
		
		<script>
			$(function() {
				ajaxTicketList(1);
			});
			
			function myTicketDetailView(num) {
				location.href = "myTicketDetailView?tno=" + num;
			}
			
			function ajaxTicketList(num) {
				$.ajax({
					url: "ajaxTicketList.me",
					type: "get",
					data: {
						currentPage: num,
						userId: "${sessionScope.loginUser.userId}"
					},
					success: function(result) {
						//예매내역 출력
						if(result.ticketList.length > 0) {
							//console.log("예매내역 O");
							let str = "<tr><td colspan='6'><hr></td></tr>";
							for(let i in result.ticketList) {
								//결제일 형식 수정
			                	let month = result.ticketList[i].reservePayment.split(" ")[0].replace("월", "");
			                	let date = result.ticketList[i].reservePayment.split(" ")[1].replace(",", "");
			                	let year = result.ticketList[i].reservePayment.split(" ")[2];
			                	if(month < 10) { month = "0" + month; }
			                	if(date < 10) { date = "0" + date; }
			                	let startDate = year + "-" + month + "-" + date;
								
								str += "<tr class='ticketInfo' onclick='myTicketDetailView(" + result.ticketList[i].buyListId + ")'>";
								str	+= "<td>" + result.ticketList[i].buyListId + "</td>";
					            str	+= "<td>" + result.ticketList[i].reserveConcertId + "</td>";
					            str	+= "<td>" + result.ticketList[i].reserveTicket + "</td>";
					            str	+= "<td>" + result.ticketList[i].reserveSum + "</td>";
					            //str	+= "<td>" + result.ticketList[i].reservePayment + "</td>";
					            str	+= "<td>" + startDate + "</td>";
								if(result.ticketList[i].status == '1') {
									str += "<td style='color: green; width: 100px'>결제 완료</td>";
								} else if(result.ticketList[i].status == '2') {
									str += "<td style='color: blue; width: 100px'>환불 요청 중</td>";
								} else {
									str += "<td style='color: red; width: 100px'>환불 완료</td>";
								}
								str += "</tr>";
								str += "<tr><td colspan='6'><hr></td></tr>";
							}
							$("#ticketlist-table>tbody").html(str);
							
						} else {
							//console.log("예매내역 X");
						}
						
						//페이징바 출력
						let currentPage = result.pageInfo.currentPage;
        				let startPage = result.pageInfo.startPage;
        				let endPage = result.pageInfo.endPage;
        				let maxPage = result.pageInfo.maxPage;
        				
        				let str = "";
        				
        				if(currentPage != 1) {
    						str += "<button onclick='ajaxTicketList(" + (num - 1) + ");'>"
    		        			 + "&lt;"
    			        		 + "</button>"
    					} else {
    						str += "<button onclick='ajaxTicketList(" + (num - 1) + ");' disabled>"
		        			 + "&lt;"
			        		 + "</button>"
    					}
        				for(let p = startPage; p <= endPage; p++) {
        					if(p != currentPage) {
        						str += "<button onclick='ajaxTicketList(" + p + ");'>"
        							 + p
        							 + "</button>"
        					} else {
        						str += "<button disabled style='color: #701f2d;'>"
	       							 + "<u>" + p + "</u>"
	       							 + "</button>"
        					}
        				}
        				if(currentPage != maxPage) {
    						str += "<button onclick='ajaxTicketList(" + (num + 1) + ");'>"
    		        			 + "&gt;"
    		        			 + "</button>"
    					} else {
    						str += "<button onclick='ajaxTicketList(" + (num + 1) + ");' disabled>"
		        			 + "&gt;"
		        			 + "</button>"
    					}
        				if(endPage == 0) { str = "" }
        				$("#ticketList-paging-area").html(str);
					},
					erorr: function() {}
				});
			}
		</script>
		
		<br><br>
		
		<p class="mypage-title">＊ 찜 내역</p>
		<!-- 
		<c:choose>
		    <c:when test="${empty requestScope.list}">
		    	<div id="wishlist">
		        	<h1 align="center">찜한 공연이 없습니다.</h1>
		        </div>
		    </c:when>
		    <c:otherwise>
		    		<div id="wishlist">
			    <c:forEach var="co" items="${requestScope.list}">		    
			        <div class="item">
			            <a href="detail.co?cno=${co.concertId}">
			                <img src="${co.thumbnailRoot}" alt="이미지">
			            </a>
			            <div class="detail-title">${co.concertName}</div>
			        </div>			        
		    	</c:forEach>
		    	</div>
		    </c:otherwise>
		</c:choose>
		 -->
		 
		 <div id="wishlist">
			    <c:forEach var="co" items="${requestScope.list}">		    
			        <div class="item">
			            <a href="detail.co?cno=${co.concertId}">
			                <img src="${co.thumbnailRoot}" alt="이미지">
			            </a>
			            <div class="detail-title">${co.concertName}</div>
			        </div>			        
		    	</c:forEach>
		    	</div>
		
		<br>
			
		</div>		
	</div>
	<script>
	$(function() {	
	    var userId = "${sessionScope.loginUser.userId}";

	    $.ajax({
	        url: "getWishList",
	        type: "get",
	        data: { userId: userId },
	        success: function(response) {
	            console.log("성공");
	            console.log(response);
	            renderWishlist(response);
	        },
	        error: function() {
	            console.error("위시리스트 호출용 ajax 구문 실패");
	        }
	    });

	    function renderWishlist(list) {
	        var wishlist = $('#wishlist');
	        wishlist.empty(); // 기존 내용을 지웁니다.

	        if (list && list.length > 0) {
	            $.each(list, function(index, co) {
	                var item = '<div class="item">'
	                    + '<a href="detail.co?cno=' + co.concertId + '">'
	                    + '<img src="' + co.thumbnailRoot + '" alt="이미지">'
	                    + '</a>'
	                    + '<div class="detail-title">' + co.concertName + '</div>'
	                    + '</div>';
	                wishlist.append(item);
	            });
	        } else {
	            wishlist.append('<h1 align="center">찜한 공연이 없습니다.</h1>');
	        }
	    }
	});
	</script>

</body>
</html>