<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
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
            min-height: calc(100vh - 160px); /* 화면 높이에서 헤더와 푸터를 제외한 높이 설정 */
    }
    #enroll-form input[type="radio"] {
        width: 5%;
        accent-color: #810000;
    }
    .title2 {
        margin-left: 55px;
    }

    html,body{
        margin: 0;
        padding: 0;
    }
    div {
        box-sizing: border-box;
    }
    #header{
        width: 100%;
        height: 100px;
        display: flex;
        align-items: center;
        z-index: 2;
        background: linear-gradient(45deg,#810000, #810000, #630000, #630000, #630000);
    }
    #navitb {
      width: 100%;
      display: flex;
      justify-content: space-around;
      align-items: center;
    }
    .navi a {
        text-decoration: none;
        font-size: 25px;
        margin-right: 100px;
        position: relative;
        padding: 6px 12px;
    }
    .navi a::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 0;
        height: 4px;
        background: #EEEBDD;
        transition: all .5s ease-out;
    }
    #navitb a:hover::after {
        width: 100%;
    }
    #logo{
        position: relative;
        top: 10px;
        width: 100px;
        height: 100%;
        text-decoration: none;
    }
    #header {
        top:0;
        left:0;
        position: absolute;
    }
    #header a {
        color : #EEEBDD;
    }
    .footer {
            background-color: #810000;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: 20px;
        }
    

    /*-----------------------*/
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
        color: gray;
        text-decoration: none;
        margin-right: 10px;
    }
    
     .btn-green {
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
            margin : 0px;
        }   

        #star-avg {
            padding-bottom: 20px;
            border : 1px solid gray;
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
		.btn-top {
        padding-top: 5px;
        padding-right: 60px;
        padding-bottom: 40px;
    	}

	    #qbtn {
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
	    .paging-area>a {
	        color :#810000;
	        font-weight: bolder;
	        font-size: 18px;
	        text-decoration: none;
	    }
	
	    .paging-area>a:hover {
	        color : #EEEBDD; 
	    }
		
	
    </style>
</head>
<body>

    <div id="header">
        <div id="navitb">
            <div><a href=""><img src="../resources/image/logo.png" id="logo"></a></div>
            <div class="navi"><a href="">공연정보</a></div>
            <div class="navi"><a href="">소개</a></div>
            <div class="navi"><a href="">공지사항</a></div>
            <div class="navi"><a href="">대관</a></div>
            <div class="navi"><a href="">예매내역</a></div>
        </div>
    </div>


    <div class="outer">
        <div class="container">
            <div id="title-area" style="margin-top: 100px;">
                <h2>스튜디오 지브리 애니메이션의 거장 타카하타 이사오전</h2>
                <h6 style="color: gray;">2024.04.26 ~ 2024.08.03 | 세종문화회관 세종미술관 1관 2관</h6>
                <hr><br>

                <div class="info-area">
                    <table id="info-table">
                        <tr>
                            <td rowspan="10" colspan="3">
                                <img src="http://tkfile.yes24.com/upload2/PerfBlog/202403/20240314/20240314-49133.jpg" style="width: 400px;">
                            </td>
                            <td width="20"></td>
                            <th width="130" height="30">&nbsp; 등급</th>
                            <td width="400">전체 연령 관람 가능</td>
                        </tr>
                        <tr>
                            <td></td>
                            <th height="50">&nbsp; 관람시간</th>
                            <td>60분</td>
                        </tr>
                        <tr>
                            <td></td>
                            <th height="50">&nbsp; 출연</th>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td></td>
                            <th height="50">&nbsp; 가격</th>
                            <td>20,000 원</td>
                        </tr>
                        <tr>
                            <td></td>
                            <th height="50">&nbsp; 혜택</th>
                            <td>무이자할부 | 제휴카드할인</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2" height="50"><hr></td>
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
                            <td colspan="2"  height="50"><hr></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td width="40">
                                <span id="like-icon" style="font-size: 30px; margin: 10px; cursor: pointer;" name="like" value="false" onclick="like();">🤍</span>
                            </td>
                            <td width="190">
                                <span id="like-count" style="color: red;">117</span> &nbsp;Likes
                            </td>
                            <td>
                                <span style="font-size: 25px; color: rgb(255, 206, 44);">★★★★☆</span>
                            </td>
                        </tr>
                        <script>
					        function like() {
					            if($("#like-icon").val() == "false") {
					                $("#like-count").html("118");
					                $("#like-icon").html("❤️");
					                $("#like-icon").val("true");
					            } else {
					                $("#like-count").html("117");
					                $("#like-icon").html("🤍");
					                $("#like-icon").val("false");
					            }
					        }
					    </script>
                    </table>
                </div>

                <br><br>

                <div class="booking-area" align="center">
                    <div style="height: 100px; border: 1px solid orange;">
                        날짜 선택
                    </div>
                    <br>
                    <button style="width: 200px; height: 50px; font-size: 23px; font-weight: 900; color: white; background-color: #810000; border: none; border-radius: 5px;"
                            onclick="payment();">
                            예매하기
                    </button>
                </div>

                <br><br><br><br><br><br>

                <div class="menu-area" style="border-bottom: 2px solid;">
                    <button class="detail-menu" style="border-top: 2px solid gray;">상세정보</button>
                    <button class="detail-menu" onclick=".reviews">관람후기</button>
                    <button class="detail-menu">예매/취소 안내</button>
                    <button class="detail-menu" onclick="#text">문의</button>
                </div>

                <div class="detail-info">
                    <img src="http://tkfile.yes24.com/Upload2/Board/202404/20240426/49133_20426_01.jpg" alt="">
                    <!-- 
                    <img src="http://tkfile.yes24.com/Upload2/Board/202404/20240426/49133_20426_02.jpg" alt="">
                     -->
                </div>

                <br><br>
                
                
          <!----------------------------------------------------->
                
         <!-- 관람 후기 작성 -->
         <!-- 별점 선택 -->
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
            </div>
        </div>

        <!-- 댓글 작성-->
        <div id="reply-area" align="center">

            <table align="center" id="reply-list">
                <thead>
                    <tr>
                        <th colspan="2">
                            <textarea id="replyContent" style="margin-left: 30px;" required></textarea>
                        </th>
                        <td align="center">
                            <button type="button" onclick="" class="btn-green" disabled>등록</button>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <textarea id="replyContent" rows="" cols="60" style="margin-left: 30px;"
                                readonly>로그인 후 이용 가능합니다</textarea>
                        </th>
                        <td align="center">
                            <button type="button" class="btn-green" disabled>등록</button>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <textarea id="replyContent" rows="" cols="60" style="margin-left: 30px;"
                                readonly></textarea>
                        </th>
                        <td align="center">
                            <button type="button" class="btn-green" disabled>등록</button>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="3">
                        </td>
                    </tr>
                </tbody>
            </table>

            <hr>
                
                
                <!-- 관람후기 목록  -->
                <div class="reviews" style="margin: auto; width: 900px">
                    <h2>관람후기 <span style="color: #810000;">32</span></h2>
                    <hr><br>

                    <div class="review">
                        <div class="review-star">★★★★☆</div>
                        <div class="review-content">
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                        </div>
                        <div class="review-info">
                            <div class="review-writer">user01</div>
                            <div class="review-createDate">2024.06.05</div>

                            <!--내 리뷰일 경우 보이게-->
                            <div class="review-update">
                                <a href="">수정</a>
                                <a href="">삭제</a>
                                <br clear="both">
                            </div>
                        </div>
                        <div class="review-line"></div>
                    </div>
                    <div class="review">
                        <div class="review-star">★★★★☆</div>
                        <div class="review-content">
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                        </div>
                        <div class="review-info">
                            <div class="review-writer">user01</div>
                            <div class="review-createDate">2024.06.05</div>
                        </div>
                        <div class="review-line"></div>
                    </div>
                    <div class="review">
                        <div class="review-star">★★★★☆</div>
                        <div class="review-content">
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                            연소자의 근로는 특별한 보호를 받는다.
                            감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                            모든 국민은 직업선택의 자유를 가진다.
                        </div>
                        <div class="review-info">
                            <div class="review-writer">user01</div>
                            <div class="review-createDate">2024.06.05</div>
                        </div>
                        <div class="review-line"></div>
                    </div>
                </div>
                
                <br><br>
                
                <!-- 댓글 수정 모달창 -->
              	<!--
                <div class="modal" id="updateForm">
        			<div class="modal-dialog">
        		<div class="modal-content" style="height: 200px; margin-top: 50px;">
			        <div class="modal-body">
			         	<form action="" method="post" class="modal-center">
			         		<div align="center">
			         			<input type="hidden" id="" name="" val="">
			         			<input type="hidden" id="" name="eventNo" val="">
			         			<textarea name="newReplyContent" id="newReplyContent" rows="4" cols="50" required></textarea>
			         		</div>
							<div align="center" style="margin: 10px;">
								<button type="submit"
									style="background: linear-gradient(0deg, #630000, #810000); color: white; width: 400px; height: 50px">
									댓글 수정</button>
							</div>
						</form>
			        </div>
        		</div>
        	</div>
            </div>
            -->
        </div>
    </div>
    
   		<!----------------------------------------------------->
    	<!-- 문의 목록 -->
    	<br><br>
		
        <div id="text">
        <p>
         	궁금한점을 해결해드립니다. <br>
       		먼저 FAQ를 확인하시면 보다 유용한 정보를 빠르게 확인할 수 있습니다. <br>
        </p>
        </div>

        <!-- 문의하기 버튼 -->
        <div class="btn-top">
            <span>
                <button type="submit" id="qbtn">문의하기</button>
            </span>
        </div>

        <br clear="both">

        <!-- 문의글 목록 -->
        <div class="question-list">
            <table class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th width="70px;" height="30px;">No.</th>
                        <th width="350px;">제목</th>
                        <th width="150px;">날짜</th>
                        <th width="100px;">조회수</th>
                        <th width="120px;">답변 여부</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>문의사항 제목1</td>
                        <td>작성일</td>
                        <td>조회수</td>
                        <td>완료</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>문의사항 제목2</td>
                        <td>작성일</td>
                        <td>조회수</td>
                        <td>완료</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>문의사항 제목3</td>
                        <td>작성일</td>
                        <td>조회수</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

         <!-- 페이징바 -->
         <div class="paging-area" align="center">
            <a href="">
                &lt;
            </a>
            <a href="">1</a>
            <a href="">
                 &gt;
            </a>    
        </div>
        


    <div class="footer">
        <p>&copy; 2001 - <span id="currentYear"></span> 윤슬아트홀. All rights reserved.</p>
    </div>
    
    <script>
      function payment() {
    	  /**/
    	  console.log("test");
    	  
	      //const myAmount = Number(document.getElementById("amount").value);
	      const myAmount = 100;
	
	      const IMP = window.IMP; // 생략 가능
	      IMP.init("imp84822672"); // Example: imp00000000
	      IMP.request_pay(
	        {
	        	// param
		          pg: "html5_inicis",
		          pay_method: "card",
		          merchant_uid: "1111111224132", //주문번호 == BUYLIST_ID
		          name: "공연이름222", //공연이름 == RESERVE_CONCERT_NAME
		          amount: myAmount,
		          buyer_email: "gildonggmailcom",
		          buyer_name: "HongGildong",
		          buyer_tel: "01042424242",
		          buyer_addr: "Seoul",
		          buyer_postcode: "01181",
		          
		          //m_redirect_url: "", // 모바일 결제후 리다이렉트될 주소
	        },
	        async (rsp) => {
	          // callback
	          if (rsp.success) {
	        	// 결제 성공시
	            console.log("결제성공");
	            console.log(rsp);
	            console.log("--------------");
	            
	            $.ajax({
	            	url: "<%=request.getContextPath()%>/insertPaymentInfo.pa",
	            	type: "post",
	            	data: {
	            		buyListId: rsp.merchant_uid, //주문번호
	            		reserveCode: rsp.pg_tid, //결제코드 (환불 시 필요)
	            		reserveConcertName: rsp.name, //예약된 공연 이름
	      	            reserveTicket: 1, //예약된 티켓 수
	      	            reserveSum: myAmount, //결제 금액 합
	      	            userId: "user02" //회원ID
	            	},
	            	success: function(result) {
	            		if(result == "success") {
	            			console.log("결제정보 저장 성공");
	            		} else {
	            			console.log("결제정보 저장 실패");
	            		}
	            	},
	            	error: function() {
	            		console.log("결제정보 저장 AJAX 통신 실패");
	            	}
	            });
	          } else {
	            // 결제 실패시
	            console.log("결제실패");
	          }
	        }
	      );
    	  /**/
      }
    </script>

</body>
</html>