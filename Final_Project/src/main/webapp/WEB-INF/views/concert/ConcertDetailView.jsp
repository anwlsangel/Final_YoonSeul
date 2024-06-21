<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
			<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
			<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
			<script src="https://code.jquery.com/jquery-3.3.1.min.js"
				integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
			<style>
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
					/* 화면 높이에서 헤더와 푸터를 제외한 높이 설정 */
				}

				#enroll-form input[type="radio"] {
					width: 5%;
					accent-color: #810000;
				}

				.title2 {
					margin-left: 55px;
				}

				html,
				body {
					margin: 0;
					padding: 0;
				}

				div {
					box-sizing: border-box;
				}

				.footer {
					background-color: #810000;
					color: white;
					text-align: center;
					padding: 10px 0;
					margin-top: 20px;
				}


				/*-----------------------*/
				.info-hr {
					width: 100%;
					background-color: gray;
				}

				#info-table {
					font-size: 15px;
					border-spacing: 0px;
				}

				#info-table th {
					text-align: left;
				}

				.detail-menu {
					border: none;
					background-color: white;
					color: rgb(0, 0, 0);
					width: 150px;
					height: 50px;
					font-size: 18px;
					font-weight: bold;
					text-align: center;
				}

				/*리뷰 스타일*/
				.review-star {
					color: #810000;
					font-size: 20px;
					margin-top: 15px;
					margin-bottom: 15px;
				}

				.review-writer {
					margin-top: 15px;
					margin-bottom: 15px;
				}

				.review-info>div {
					display: inline-block;
					font-size: 15px;
				}

				.review-writer {
					font-weight: 600;
					margin-right: 15px;
				}

				.review-line {
					height: 1px;
					background-color: rgb(219, 219, 219);
				}

				.review-update {
					float: right;
				}

				.review-update>a {
					color: #810000;
					text-decoration: none;
					margin-right: 10px;
				}

				.-green {
					width: 70px;
					height: 30px;
					font-size: 16px;
					font-weight: bolder;
					float: right;
					border: none;
					background: linear-gradient(0deg, #630000, #810000);
					color: white;
				}

				.paging-area a {
					text-decoration: none;
					color: gray;
					font-size: 15px;
					font-weight: 600;
				}

				#reply-list {
					width: 900px;
					border-collapse: separate;
					border-spacing: 0px 20px;
				}

				#reply-list th {
					vertical-align: top;
				}

				#reply-list>thead>tr>th {
					width: 88%;
				}

				#reply-list>thead>tr>td {
					width: 12%;
				}

				#reply-list>thead textarea {
					height: 70px;
					resize: none;
				}

				#reply-list>thead button {
					height: 50px;
				}

				#reply-list>thead textarea,
				#reply-list>thead button {
					width: 95%;
					box-sizing: border-box;
					border-radius: 5px;
				}

				#reply-list>tbody>tr>th {
					width: 13%;
					text-align: center;
					padding: 10px;
				}

				#reply-list>tbody>tr {
					vertical-align: top;
					height: 45px;
					margin: 5px;
				}

				#review-list {
					padding-top: 15px;
				}

				#review-list>table {
					padding-left: 200px;
				}

				/* 별점 */
				#star-area {
					padding-top: 40px;
					padding-left: 90px;
					font-size: 25px;
				}

				#star-area input[type="radio"] {
					opacity: 0;
					margin: 0;
				}

				.star-rating {
					direction: rtl;
					display: inline-block;
					font-size: 2rem;
				}

				.star-rating input[type="radio"] {
					display: none;
				}

				.star-rating label {
					color: #ddd;
					cursor: pointer;
					font-size: 2rem;
				}

				.star-rating label:hover,
				.star-rating label:hover~label {
					color: #ffc700;
				}

				.star-rating input[type="radio"]:checked~label {
					color: #ffc700;
				}

				.star-rating input[type="radio"]:checked+label:hover,
				.star-rating input[type="radio"]:checked+label:hover~label,
				.star-rating input[type="radio"]:checked~label:hover,
				.star-rating input[type="radio"]:checked~label:hover~label {
					color: #ffed85;
				}

				#star-text {
					font-size: 15px;
					padding: 0px;
					margin: 0px;
				}

				#star-avg {
					padding-bottom: 20px;
					border: 1px solid gray;
					border-radius: 5px;
					margin: 5px;
					padding: 5px;
					width: 450px;
					text-align: center;
					padding-left: 50px;
				}

				.rating {
					display: flex;
					flex-direction: column;
					align-items: center;
					/* margin: auto; */
					font-size: 1.5em;
					/* width: 200px; */
				}

				/* 별 색깔 지정 */
				.rating-stars {
					color: rgb(255, 222, 36);
					font-weight: bold;
				}

				.container-star-avg table {
					width: 100%;
				}


				/*--------문의 목록----------*/
				.-top {
					padding-top: 5px;
					padding-right: 60px;
					padding-bottom: 40px;
				}

				#q {
					margin: auto;
					display: block;
					width: 90px;
					height: 35px;
					font-size: 15px;
					font-weight: bolder;
					background: linear-gradient(0deg, #630000, #810000);
					color: #EEEBDD;
					border: none;
					border-radius: 7px;
					float: right;
				}

				.question-list>table {
					text-align: center;
					width: 90%;
				}

				#text {
					padding-left: 45px;
				}

				/* 페이징바 */
				.paging-area>button {
					border: none;
					background-color: white;
					width: 30px;
					height: 30px;
					font-size: 20px;
					font-weight: 700;
				}

				.review-paging-area>button {
					border: none;
					background-color: white;
					width: 30px;
					height: 30px;
					font-size: 20px;
					font-weight: 700;
					padding-top: 45px;
				}

				#newReviewContent {
					resize: none;
				}

				.ticketContainer {
					display: flex;
					justify-content: center;
					/* 변경: flex-end -> center */
					margin-top: 20px;
				}

				.ticketCount {
					display: flex;
					align-items: center;
					justify-content: center;
					/* 추가: 내용도 중앙 정렬 */
				}

				.ticketCount label {
					margin-right: 10px;
					font-weight: bold;
				}

				.ticketCount select {
					padding: 5px 10px;
					border: 1px solid #ccc;
					border-radius: 4px;
					background-color: #fff;
					font-size: 14px;
				}

				.selected-date {
					background-color: #810000;
					color: white;
				}

				.hover-date {
					background-color:

						#f0f0f0;
				}
			</style>
		</head>

		<body>

			<jsp:include page="../common/header.jsp" />

			<div class="outer">
				<div class="container">

					<!-- 알림 메시지 표시 -->
					<c:if test="${not empty sessionScope.alertMsg}">
						<script>
							alert('${sessionScope.alertMsg}');
						</script>
						<c:remove var="alertMsg" scope="session" />
					</c:if>

					<div id="title-area" style="margin-top: 100px;">
						<input type="hidden" id="concertID" value="${concert.concertId}"> <!-- 주문번호생성시 필요 -->
						<h2>${concert.concertName}</h2>
						<h6 style="color: gray;">${concert.startDate} ~ ${concert.endDate} | ${concert.holeName}</h6>
						<hr class="info-hr"><br>

						<div class="info-area">
							<table id="info-table">
								<tr>
									<td rowspan="10" colspan="3">
										<img src="${concert.thumbnailRoot}" style="width: 400px;">
									</td>
									<td width="20"></td>
									<th width="130" height="30">&nbsp; 등급</th>
									<td width="400">${concert.ageLimit} 세 이상</td>
								</tr>
								<tr>
									<td></td>
									<th height="50">&nbsp; 관람시간</th>
									<td>${concert.playTime}분</td>
								</tr>
								<tr>
									<td></td>
									<th height="50">&nbsp; 출연</th>
									<td>-</td>
								</tr>
								<tr>
									<td></td>
									<th height="50">&nbsp; 가격</th>
									<td>${concert.price} 원</td>
								</tr>
								<tr>
									<td></td>
									<th height="50">&nbsp; 혜택</th>
									<td>무이자할부 | 제휴카드할인</td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2" height="50">
										<hr class="info-hr">
									</td>
								</tr>
								<tr>
									<td></td>
									<th height="50">&nbsp; 공연시간 안내</th>
									<td>매일 10:00 ~ 20:00 (입장마감 19:00)</td>
								</tr>
								<tr>
									<td></td>
									<th height="50">&nbsp; 배송정보</th>
									<td>현장 수령만 가능</td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2" height="50">
										<hr class="info-hr">
									</td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td width="40">
										<input type="hidden" id="isLoggedIn"
											value="${not empty sessionScope.loginUser}">
										<span id="like-icon" style="font-size: 30px; margin: 10px; cursor: pointer;"
											name="like" value="false" onclick="toggleLike();">🤍</span>
									</td>
									<!-- 좋아요 수 표시 - 0618 무진 -->
									<td width="190">
										<span id="like-count" style="color: red;">${likeCount}</span> &nbsp;Likes
									</td>

									<td>
										<span style="font-size: 25px; color: rgb(255, 206, 44);">
											<c:choose>
												<c:when test="${starCount == 5}">★★★★★</c:when>
												<c:when test="${starCount == 4}">★★★★☆</c:when>
												<c:when test="${starCount == 3}">★★★☆☆</c:when>
												<c:when test="${starCount == 2}">★★☆☆☆</c:when>
												<c:when test="${starCount == 1}">★☆☆☆☆</c:when>
												<c:otherwise>☆☆☆☆☆</c:otherwise>
											</c:choose>
										</span>
									</td>
								</tr>

							</table>
						</div>

						<br><br>
						<div class="booking-area" align="center">
							<c:choose>
								<c:when test="${holeStatus == 2}">

									<div class="row" style="width: 80%; height: 400px; border: 1px solid black;">
										<div id="calendar" class="col-md-8">
											<table class="table" style="width: 100%;">
												<thead>
													<tr>
														<th colspan="7" class="text-center" style="height: 43px;">
															<button id="previousBtn"
																onclick="previousMonth()">&lt;</button>
															<span id="fullDate"></span>
															<button id="nextBtn" onclick="nextMonth()">&gt;</button>
														</th>
													</tr>
													<tr>

													</tr>
													<tr align="center">
														<td>일</td>
														<td>월</td>
														<td>화</td>
														<td>수</td>
														<td>목</td>
														<td>금</td>
														<td>토</td>
													</tr>
												</thead>
												<tbody id="calendarTbody" align="center"></tbody>
											</table>
										</div>
										<div class="col-sm-4">시간선택
											<table id="time-table">
												<thead>
													<tr>
														<th colspan="1" style="text-align: center;">시간</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>상영중인 공연이 없습니다.</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</c:when>
							</c:choose>
							<br>
							<div class="ticketContainer">
								<c:choose>
									<c:when test="${holeStatus == 2}">
										<div class="ticketCount">
											<label for="ticketCount">티켓 갯수 선택 : </label>
											<select id="ticketCount" name="ticketCount">
												<c:forEach var="i" begin="1" end="10">
													<option value="${i}">${i}</option>
												</c:forEach>
											</select>
										</div>
									</c:when>
								</c:choose>
								<div>
									<span>&nbsp;잔여 티켓 : ${seatCount}</span>
								</div>
							</div>


							<c:choose>
								<c:when test="${holeStatus == 1}">
									<c:choose>
										<c:when test="${empty sessionScope.loginUser}">
											<!-- 로그인 전 -->
											<button
												style="width: 200px; height: 50px; font-size: 23px; font-weight: 900; color: white; background-color: #810000; border: none; border-radius: 5px;"
												onclick="alert('로그인 후 예매 가능합니다.');">
												좌석예매
											</button>
										</c:when>
										<c:otherwise>
											<!-- 로그인 후 -->
											<button
												style="width: 200px; height: 50px; font-size: 23px; font-weight: 900; color: white; background-color: #810000; border: none; border-radius: 5px;"
												onclick="seatReservation(${concert.concertId});">
												좌석예매
											</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${holeStatus == 2}">
									<c:choose>
										<c:when test="${empty sessionScope.loginUser}">
											<!-- 로그인 전 -->
											<button
												style="width: 200px; height: 50px; font-size: 23px; font-weight: 900; color: white; background-color: #810000; border: none; border-radius: 5px;"
												onclick="alert('로그인 후 예매 가능합니다.');">
												예매하기
											</button>
										</c:when>
										<c:otherwise>
											<!-- 로그인 후 -->
											<button style="width: 200px; height: 50px; font-size: 23px; font-weight: 900; color: white; background-color: #810000; border: none; border-radius:

 5px;" onclick="payment();">
												예매하기
											</button>
										</c:otherwise>
									</c:choose>
								</c:when>
							</c:choose>
							<!-- 
                <button style="width: 200px; height: 50px; font-size: 23px; font-weight: 900; color: white; background-color: #810000; border: none; border-radius: 5px;"
				        onclick="seatReservation(${cno});">
				    좌석예매
				</button>
				 -->

							<br><br><br><br><br><br>

							<div class="menu-area" style="border-bottom: 2px solid;">
								<button class="detail-menu" style="border-top: 2px solid gray;">상세정보</button>
								<a href="#reviews"><button class="detail-menu">관람후기</button></a>
								<button class="detail-menu">예매/취소 안내</button>
								<a href="#text"><button class="detail-menu">문의</button></a>
							</div>

							<div class="detail-info">
								<img src="${concert.detailRoot}" alt="">
								<!-- 
                    <img src="http://tkfile.yes24.com/Upload2/Board/202404/20240426/49133_20426_02.jpg" alt="">
                     -->
							</div>

							<br><br>


							<!----------------------------------------------------->

							<!-- 관람 후기 작성 -->
							<!-- 별점 선택 -->

							<form id="reviewForm" action="insertReview" method="post">
								<div id="star-area" align="center">

									<p id="star-text">별점을 선택해주세요.</p>

									<div class="star-rating">
										<input type="radio" id="star5" name="rating" value="5" /><label for="star5"
											title="5 stars">&#9733;</label>
										<input type="radio" id="star4" name="rating" value="4" /><label for="star4"
											title="4 stars">&#9733;</label>
										<input type="radio" id="star3" name="rating" value="3" /><label for="star3"
											title="3 stars">&#9733;</label>
										<input type="radio" id="star2" name="rating" value="2" /><label for="star2"
											title="2 stars">&#9733;</label>
										<input type="radio" id="star1" name="rating" value="1" /><label for="star1"
											title="1 star">&#9733;</label>
										<input type="hidden" id="star1" name="rating" value="0" checked />

									</div>
								</div>

								<!-- 댓글 작성-->
								<div id="reply-area" align="center">
									<table align="center" id="reply-list">
										<thead>
											<tr>
												<th colspan="2">
													<c:choose>
														<c:when test="${empty sessionScope.loginUser}">
															<!-- 로그인 전 -->
															<textarea id="replyContent" rows="" cols="60"
																style="margin-left: 30px;"
																readonly>로그인 후 이용 가능합니다</textarea>
												<td align="center">
													<button type="button" class="-green" disabled>등록</button>
												</td>
												</c:when>
												<c:otherwise>
													<!-- 로그인 후 -->
													<input type="hidden" value="${sessionScope.loginUser.userId}"
														name="userId">
													<input type="hidden" name="cno" value="${cno}">
													<textarea id="replyContent" rows="" cols="60" name="reviewContent"
														style="margin-left: 30px;"
														placeholder="관람 후기를 작성해주세요"></textarea>
													<td align="center">
														<button type="submit" class="-green">등록</button>
													</td>
												</c:otherwise>
												</c:choose>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="3">
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</form>

							<!-- 관람후기 목록  -->
							<div id="reviews" class="reviews" style="margin: auto; width: 850px;">
								<hr>
								<h2 align="center">관람후기 <span style="color: #810000;">(${reviewCount})</span></h2>
								<hr><br>
						
							<!-- review 는 ajax로 출력함 -->
							<div id="review"></div>

						<!-- 
						 <c:choose>
							<c:when test="${empty rvList}">
								<div align="center">
		                			<p>작성된 후기가 없습니다.</p>
		            			</div> 
							</c:when>
							<c:otherwise>
									<c:forEach var="r" items="${rvList}">
										 <div class="review">
		                     				<div class="review-star"> 
											 	<c:choose>
		                            				<c:when test="${r.reviewPoint == 5}">★★★★★</c:when>
		                            				<c:when test="${r.reviewPoint == 4}">★★★★☆</c:when>
		                            				<c:when test="${r.reviewPoint == 3}">★★★☆☆</c:when>
		                            				<c:when test="${r.reviewPoint == 2}">★★☆☆☆</c:when>
		                           					 <c:when test="${r.reviewPoint == 1}">★☆☆☆☆</c:when>
		         								</c:choose> 
								</div>
                    
								<div class="review-content"></div> 
								
								<div class="review-info">
										<div class="review-writer"></div>
										<div class="review-createDate"></div>
									</div> 
									
									/* 작성자만 수정,삭제 버튼 보이게 */
									<c:if test="${sessionScope.loginUser.userId eq r.userId}">
										<div class="review-update">
											<a href="#" data-toggle="modal" data-target="#updateReview" class="update" data-id="${r.reviewContent}" data-rno="${r.reviewId}" data-cno="${r.concertId}">수정</a>
											<a onclick="deleteReview();">삭제</a>
											<br clear="both"> 
										</div>
									</c:if>

									<div class="review-line"></div>
									
								</div>
									</c:forEach>
							</c:otherwise>
						</c:choose>
					-->
						</div>

						

						<!-- 후기 페이징바 출력 부분-->
						<div class="review-paging-area" align="center"></div>

						<script>
							$(document).on("click", ".updateBtn", function () {
								var reviewContent = $(this).data('id');
								var reviewId = $(this).data('rno');
								var concertId = $(this).data('cno');
								$("#newReviewContent").html(reviewContent);
								$("#reviewId").val(reviewId);
								$("#concertId").val(concertId);
								//console.log("rno : " + reviewId);
								//console.log("cno : " + concertId);
							});

							function deleteReview() {
								location.href = "delete.re?reviewId=" + ${ rvList[0].reviewId } + "&concertId=" + ${ rvList[0].concertId };
							}
						</script>


						<br><br>

						<!-- 관람 후기 수정 모달창 -->
						<div class="modal" id="updateReview">
							<div class="modal-dialog">
								<div class="modal-content" style="height: 200px; margin-top: 50px;">
									<div class="modal-body">
										<form action="update.re" method="post" class="modal-center">
											<div align="center">
												<input type="hidden" name="reviewId" id="reviewId">
												<input type="hidden" name="concertId" id="concertId">
												<textarea name="newReviewContent" id="newReviewContent" rows="4"
													cols="50" required></textarea>
											</div>
											<div align="center" style="margin: 10px;">
												<button type="submit" style="background: linear-gradient(0deg, #630000, #810000); border:none; 
									      color: white; width: 110px; height: 40px; border-radius : 10px;">
													댓글 수정</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>

					


					<!----------------------------------------------------->
					<!-- 문의 목록 -->
					<br><br>

					<div id="text">
						<hr>
						<h2 align="center">Q&A <span style="color: #810000;"> (${qnaCount})</span></h2>
						<hr><br>

						<p>
							궁금한점을 해결해드립니다. <br>
							문의글 남겨주시면 순차적으로 답변드립니다. <br>
						</p>
					</div>

					<!-- 문의하기 버튼 -->
					<div class="-top">
						<span>
							<a href="enrollform.qa?cno=${cno}"><button type="button" id="q">문의하기</button></a>
						</span>
					</div>

					<br clear="both">

					<!-- 문의글 목록 -->
					<div class="question-list">
						<table id="qnaList" class="table table-hover" align="center">
							<thead>
								<tr>
									<th width="70px;" height="30px;">No.</th>
									<th width="350px;">제목</th>
									<th width="150px;">날짜</th>
									<th width="100px;">작성자</th>
									<th width="120px;">답변 여부</th>
								</tr>
							</thead>
							<tbody>
								<!--  
                <c:forEach var="q" items="${qnaList}">       
                <tr>
                    <td>${q.qnaId}</td>
                    <td>${q.qnaTitle}</td>
                    <td>${q.createDate}</td>
                    <td>${q.userId}</td>
                    <td style="color : #810000;">
                    <c:if test="${not empty q.qnaAnswer}">
                    	완료
                    </c:if>
                    </td>
                </tr>
            	</c:forEach>
            	-->
							</tbody>
						</table>
					</div>

					<!-- 페이징바 -->
					<div class="paging-area" align="center"> </div>
				
				</div>

					<!-- 후기 페이징 -->
					<script>
						$(function () {

							ajaxReviewList(1);
						});

						function ajaxReviewList(num) {
							$.ajax({
								url: "list.rv",
								type: "post",
								data: {
										currentPage: num,
										cno: ' ${requestScope.cno} '
									 },
								success: function (result) {

									// console.log(result);	
									$(document.getElementById('review')).html("")
									if (result.rList.length > 0) {

										for (let i in result.rList) {

											let writeDate = new Date(result.rList[i].writeDate).toLocaleString().slice(0, -13);
											let reviewContent = result.rList[i].reviewContent;
											let userId = result.rList[i].userId;
											let star = result.rList[i].reviewPoint;
											// console.log(star);
											// console.log(userId);
											// console.log(writeDate);
											// console.log(reviewContent);
											// console.log(i);
											review(star, userId, writeDate, reviewContent)
										}
										
									} else {

										let str = '<div align="center">';
										str += '<p>작성된 후기가 없습니다.</p>';
										str += '</div>';

										$(document.getElementById('review')).html(str);
									} 

									// 페이징바 출력 
									let currentPage = result.pageInfo.currentPage;
									let startPage = result.pageInfo.startPage;
									let endPage = result.pageInfo.endPage;
									let maxPage = result.pageInfo.maxPage;

									let str = "";

									if (currentPage != 1) {
										str += "<button onclick='ajaxReviewList(" + (num - 1) + ");'>"
											+ "&lt;"
											+ "</button>"
									} else {
										str += "<button onclick='ajaxReviewList(" + (num - 1) + ");' disabled>"
											+ "&lt;"
											+ "</button>"
									}
									for (let p = startPage; p <= endPage; p++) {
										if (p != currentPage) {
											str += "<button onclick='ajaxReviewList(" + p + ");'>"
												+ p
												+ "</button>"
										} else {
											str += "<button disabled style='color: #EEEEE;'>"
												+ "<u>" + p + "</u>"
												+ "</button>"
										}
									}
									if (currentPage != maxPage) {
										str += "<button onclick='ajaxReviewList(" + (num + 1) + ");'>"
											+ "&gt;"
											+ "</button>"
									} else {
										str += "<button onclick='ajaxReviewList(" + (num + 1) + ");' disabled>"
											+ "&gt;"
											+ "</button>"
									} 
									if (endPage == 0) { str = "" }
									$(".review-paging-area").html(str);

								}, error: function () { }
							});
						}

						function review(star, userId, writeDate, reviewContent) {
							//console.log(star, userId, writeDate, reviewContent)
							
							switch (star) {
								case 5: stars = '★★★★★'; break;
								case 4: stars = '★★★★☆'; break;
								case 3: stars = '★★★☆☆'; break;
								case 2: stars = '★★☆☆☆'; break;
								case 1: stars = '★☆☆☆☆'; break;
							}

							let review = '<div class="review">';

							review += '<div class="review-star">';
							review += stars;
							review += '</div>';

							review += ' <div class="review-content">';
							review += reviewContent;
							review += '</div> ';

							review += '<div class="review-info">';
							review += '<div class="review-writer">';
							review += userId;
							review += '</div>';
							review += '<div class="review-createDate">';
							review += new Date(writeDate).toLocaleString().slice(0, -13);
							review += '</div>';
							review += ' </div>';

							if (${sessionScope.loginUser.userId ne userId}) {
								review += '<div class="review-update">';
								review += ' <a href="#" data-toggle="modal" data-target="#updateReview" class="update" data-id="${r.reviewContent}" data-rno="${r.reviewId}" data-cno="${r.concertId}">수정</a>';
								review += '  <a onclick="deleteReview();">삭제</a>';
								review += '  <br clear="both"> ';
								review += ' </div>';

							}

							review += '<div class="review-line"></div>';
							console.log(review)
							$(document.getElementById('review')).append(review);
						}

						/*
						function paging (currentPage, startPage, endPage, maxPage) {

							let str = "";

							if (currentPage != 1) {
								str += "<button onclick='ajaxReviewList(" + (num - 1) + ");'>"
									+ "&lt;"
									+ "</button>"
							} else {
								str += "<button onclick='ajaxReviewList(" + (num - 1) + ");' disabled>"
									+ "&lt;"
									+ "</button>"
							}
							for (let p = startPage; p <= endPage; p++) {
								if (p != currentPage) {
									str += "<button onclick='ajaxReviewList(" + p + ");'>"
										+ p
										+ "</button>"
								} else {
									str += "<button disabled style='color: #EEEEE;'>"
										+ "<u>" + p + "</u>"
										+ "</button>"
								}
							}
							if (currentPage != maxPage) {
								str += "<button onclick='ajaxReviewList(" + (num + 1) + ");'>"
									+ "&gt;"
									+ "</button>"
							} else {
								str += "<button onclick='ajaxReviewList(" + (num + 1) + ");' disabled>"
									+ "&gt;"
									+ "</button>"
							}
							if (endPage == 0) { str = "" }
							$(".review-paging-area").html(str);
						}
						*/
					</script>

					<!-- 문의 페이징 -->
					<script>
						var flag;

						$(function () {

							ajaxQnaList(1);
							
						});


						function ajaxQnaList(num) {
							$.ajax({
								url: "list.qa",
								type: "post",
								data: {
									currentPage: num,
									cno: ${ requestScope.cno } },
						success: function(result) {

							if (result.qList.length > 0) {

								let str = "";

								for (let i in result.qList) {
									let createDate = new Date(result.qList[i].createDate).toLocaleString().slice(0, -13);

									/*
									let month = result.qList[i].createDate.split(" ")[0].replace("월", "");
									let date = result.qList[i].createDate.split(" ")[1].replace(",", "");
									let year = result.qList[i].createDate.split(" ")[2];
									if(month < 10) { month = "0" + month; }
									if(date < 10) { date = "0" + date; }
									let createDate = year + "-" + month + "-" + date;
									*/

									str += "<tr>"
									str += "<td>" + result.qList[i].qnaId + "</td>";
									str += "<td>" + result.qList[i].qnaTitle + "</td>";
									str += "<td>" + createDate + "</td>";
									str += "<td>" + result.qList[i].userId + "</td>";
									if (result.qList[i].qnaAnswer != null) {
										str += "<td style='color : #810000;'>Y</td>";
									} else if (result.qList[i].qnaAnswer == null) {
										str += "<td style='color : gray;'>N</td>";
									} else {
										str += "</td>"
									}
									str += "</tr>"
								}

								$("#qnaList>tbody").html(str);
							}
							// console.log(str);

							// 페이징바 출력 
							let currentPage = result.pageInfo.currentPage;
							let startPage = result.pageInfo.startPage;
							let endPage = result.pageInfo.endPage;
							let maxPage = result.pageInfo.maxPage;

							let str = "";

							if (currentPage != 1) {
								str += "<button onclick='ajaxQnaList(" + (num - 1) + ");'>"
									+ "&lt;"
									+ "</button>"
							} else {
								str += "<button onclick='ajaxQnaList(" + (num - 1) + ");' disabled>"
									+ "&lt;"
									+ "</button>"
							}
							for (let p = startPage; p <= endPage; p++) {
								if (p != currentPage) {
									str += "<button onclick='ajaxQnaList(" + p + ");'>"
										+ p
										+ "</button>"
								} else {
									str += "<button disabled style='color: #EEEEE;'>"
										+ "<u>" + p + "</u>"
										+ "</button>"
								}
							}
							if (currentPage != maxPage) {
								str += "<button onclick='ajaxQnaList(" + (num + 1) + ");'>"
									+ "&gt;"
									+ "</button>"
							} else {
								str += "<button onclick='ajaxQnaList(" + (num + 1) + ");' disabled>"
									+ "&gt;"
									+ "</button>"
							}
							if (endPage == 0) { str = "" }
							$(".paging-area").html(str);
						}, error: function() { }
       			});
       			
       		}	
			</script>


				</div>
				<input type="hidden" name="cno" value="${cno}">

				<script>
					// 좌석예매용
					function seatReservation(cno) {

						location.href = "seat.co?cno=" + cno;
					}

					// 문의 상세로 이동 - 0621 수정 (코드 수정)
					$(document).ready(function () {
						$("#qnaList tbody").on("click", "tr", function () {

							let qno = $(this).find("td:eq(0)").text().trim();
							let userId = $(this).find("td:eq(3)").text().trim();

							//console.log(userId);
							//console.log(qno);

							if ("${sessionScope.loginUser.userId}" != null) {

								if ("${sessionScope.loginUser.userId}" == userId
									|| "${sessionScope.loginUser.userId}" == 'admin') {

									location.href = "detail.qa?qno=" + qno;
								} else {
									alert("작성자만 확인할 수 있습니다.");
								}
							}
						});
					});
				</script>

				<!-- 날짜 선택 관련  -->
				<script>
					/* 초기 연도와 월 설정
					let toDay = new Date();
					let year = toDay.getFullYear();
					let month = toDay.getMonth();
					let selectedElement = null;
				
					$(function() {
						initializeLikeIcon();
					});
				
					// 달력 그리기
					function drawCalendar(year, month) {
						const firstDay = new Date(year, month, 1);
						const lastDay = new Date(year, month + 1, 0);
						const dayOfWeek = firstDay.getDay();
				
						document.getElementById("fullDate").innerHTML = year + "년 " + (month < 9 ? "0" + (month + 1) : (month + 1)) + "월";
				
						let forAppend = "<tr>";
						// 1일과 요일 맞추기 위해 밀어내기
						for (let i = 0; i < dayOfWeek; i++) {
							forAppend += "<td class='disable'></td>";
						}
						for (; firstDay <= lastDay; firstDay.setDate(firstDay.getDate() + 1)) {
							let day = firstDay.getDate();
							forAppend += "<td class='able' onclick='pickTime(this, " + year + "," + (month + 1) + "," + day + ")' onmouseover='hoverDate(this)' onmouseout='unhoverDate(this)'>" + (day < 10 ? "0" + day : day) + "</td>";
							if (firstDay.getDay() === 6) {
								forAppend += "</tr><tr>";
							}
						}
						forAppend += "</tr>";
						document.getElementById("calendarTbody").innerHTML = forAppend;
					}
				
				 // 시간 선택
					function pickTime(element, year, month, date) {
						if (selectedElement) {
							selectedElement.classList.remove("selected-date");
						}
						element.classList.add("selected-date");
						selectedElement = element;
			
						let formattedMonth = month < 10 ? '0' + month : month;
						let formattedDate = date < 10 ? '0' + date : date;
						let selectedDate = year + formattedMonth + formattedDate;
			
			
						$.ajax({
							url: 'date.co',
							type: 'GET',
							data: {
								cno: ${cno}, // 콘서트 ID
								dateString: selectedDate
							},
							success: function(response) {
								updateDateList(response); // DateList 업데이트 함수 호출
							},
							error: function(error) {
								console.error('Error:', error);
							}
						});
					}
			
					function updateDateList(dateList) {
						const tableBody = $("#time-table tbody");
						tableBody.empty(); // 기존 내용 삭제
			
						if (dateList.length === 0) {
							tableBody.append("<tr><td>상영중인 공연이 없습니다.</td></tr>");
						} else {
							dateList.forEach(function(date) {
								tableBody.append("<tr><td>" + date.timeOnly + "</td></tr>");
							});
						}
					}
			
					$(document).ready(function() {
						drawCalendar(year, month);
					});
				    
					// 날짜 hover 이벤트 ============================
					function hoverDate(element) {
						if (!element.classList.contains("selected-date")) {
							element.classList.add("hover-date");
						}
					}
				
					function unhoverDate(element) {
						element.classList.remove("hover-date");
					}
				
					// 달 이동 함수
					function previousMonth() {
						$("#nextBtn").removeAttr("disabled");
						month--;
						if (month == -1) {
							year--;
							month = 11;
						}
						drawCalendar(year, month);
						if (month < new Date().getMonth() - 1) {
							$("#previousBtn").attr("disabled", "disabled");
						}
					}
				
					function nextMonth() {
						month++;
						$("#previousBtn").removeAttr("disabled");
						if (month == 12) {
							year++;
							month = 0;
						}
						drawCalendar(year, month);
						if (month > new Date().getMonth() + 2/*여기
			
			 변경) {
							$("#nextBtn").attr("disabled", "disabled");
						}
					}
				
					// 첫로딩시 그려줄 함수
					drawCalendar(year, month);
					*/
					// 좋아요 아이콘 초기화 함수
					function initializeLikeIcon() {
						const userId = "${sessionScope.loginUser.userId}";
						const concertId = $("#concertID").val();
						//console.log(concertId);
						//console.log(userId);
						if (userId) {
							$.ajax({
								url: "isInWishlist",
								type: "GET",
								data: { userId: userId, concertId: concertId },
								success: function (result) {
									if (result) {
										$("#like-icon").html("❤️");
										$("#like-icon").attr("value", "true");
									} else {
										$("#like-icon").html("🤍");
										$("#like-icon").attr("value", "false");
									}
								}
							});
						}
					}

					// 좋아요 버튼 클릭 시 실행할 함수
					function toggleLike() {
						const userId = "${sessionScope.loginUser.userId}";
						const concertId = $("#concertID").val();
						if (!userId) {
							alert("로그인 후 이용 가능합니다.");
							return;
						}
						const isLiked = $("#like-icon").attr("value") === "true";
						$.ajax({
							url: isLiked ? "wishlistremove" : "wishlistadd",
							type: "POST",
							data: { userId: userId, concertId: concertId },
							success: function (response) {
								if (response) {
									$("#like-icon").html(isLiked ? "🤍" : "❤️");
									$("#like-icon").attr("value", isLiked ? "false" : "true");
									let likeCount = parseInt($("#like-count").text());
									likeCount = isLiked ? likeCount - 1 : likeCount + 1;
									$("#like-count").text(likeCount);
									alert(response);
								}
							}
						});
					}
				</script>

				<div class="footer">
					<p>&copy; 2001 - <span id="currentYear"></span> 윤슬아트홀. All rights reserved.</p>
				</div>

				<script>

					//결제 전 검증 후 결제, 결제 완료 시 결제정보 DB에 저장
					function payment() {
						//주문번호(BUYLIST_ID) 랜덤생성
						let concertName = $("#concertID").val();
						let formattedDate = moment().format('YYYYMMDD');
						let randomNum = Math.floor(Math.random() * (90000) + 10000); //10000 ~ 99999
						let randomUid = concertName + formattedDate + randomNum;

						let ticketPrice = ${ concert.price };
						let ticketCount = $("#ticketCount").val();

						const myAmount = ticketPrice * ticketCount; //총 결제금액
						let userId = "${sessionScope.loginUser.userId}";
						let concertId = $("#concertID").val();

						const IMP = window.IMP; // 생략 가능
						IMP.init("imp84822672"); // 상점 식별코드
						IMP.request_pay(
							{
								// param
								pg: "html5_inicis",
								pay_method: "card",
								merchant_uid: randomUid, //주문번호 == BUYLIST_ID
								name: "공연이름", //공연이름 == RESERVE_CONCERT_NAME
								amount: myAmount,
								buyer_email: "gildonggmailcom",
								buyer_name: "HongGildong",
								buyer_tel: "01042424242",
								buyer_addr: "Seoul",
								buyer_postcode: "00000",

								//m_redirect_url: "", // 모바일 결제후 리다이렉트될 주소
							}, function (rsp) {
								console.log(rsp);
								$.ajax({
									url: "checkAmount",
									type: "POST",
									data: { imp_uid: rsp.imp_uid }
								}).done(function (data) {
									console.log(data);
									console.log("rsp.paid_amount : " + rsp.paid_amount);
									console.log("data.response.amount : " + data.response.amount);
									console.log("--------------------");
									if (rsp.paid_amount === data.response.amount) {
										console.log("결제 성공");

										//결제정보 db에 저장
										$.ajax({
											url: "insertPaymentInfo.pa",
											type: "post",
											data: {
												buyListId: rsp.merchant_uid, //주문번호
												reserveCode: rsp.pg_tid, //결제코드
												reserveConcertId: concertId, //예약된 공연 이름
												reserveTicket: 1, //예약된 티켓 수
												reserveSum: myAmount, //결제 금액 합
												userId: userId //회원ID
											},
											success: function (result) {
												if (result == "success") {
													console.log("결제정보 저장 성공");
												} else {
													console.log("결제정보 저장 실패");
												}
											},
											error: function () {
												console.log("결제정보 저장 AJAX 통신 실패");
											}
										});
									} else {
										console.log("결제 실패");
									}
								});

							});
					}
				</script>

		</body>

		</html>