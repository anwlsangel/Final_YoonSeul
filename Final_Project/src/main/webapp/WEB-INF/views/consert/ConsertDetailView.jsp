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
                    <button class="detail-menu">관람후기</button>
                    <button class="detail-menu">예매/취소 안내</button>
                </div>

                <div class="detail-info">
                    <img src="http://tkfile.yes24.com/Upload2/Board/202404/20240426/49133_20426_01.jpg" alt="">
                    <img src="http://tkfile.yes24.com/Upload2/Board/202404/20240426/49133_20426_02.jpg" alt="">
                </div>

                <br><br>

            </div>
        </div>
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
	          merchant_uid: "3838389393", //주문번호
	          name: "tiket",
	          amount: myAmount,
	          buyer_email: "gildonggmailcom",
	          buyer_name: "HongGildong",
	          buyer_tel: "01042424242",
	          buyer_addr: "Seoul",
	          buyer_postcode: "01181",
	          //m_redirect_url: "", // 모바일 결제후 리다이렉트될 주소!!
	        },
	        async (rsp) => {
	          // callback
	          if (rsp.success) {
	            // 결제 성공시
	            console.log("결제성공");
	            console.log(rsp);
	            /*
	            await axios.post(
	              "http://localhost:3000/graphql",
	              {
	                query: `
	                    mutation {
	                      buyTicket(impUid: "${rsp.imp_uid}", amount: ${rsp.paid_amount},pay_method:"${rsp.pay_method}") {
	                        id
	                        count
	                        money
	                        method
	                      }
	                    }
	                  `,
	              },
	              {
	                headers: {
	                  authorization:
	                    "Bearer 액세스토큰",
	                },
	              }
	            );
	            */
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