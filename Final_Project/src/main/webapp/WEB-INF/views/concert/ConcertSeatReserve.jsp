<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seat Reservation</title>
<!-- 결제 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style>
body {
        font-family: 'Nanum Brush Script', cursive;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
    }
    select, input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    #buy, #clear {
        width: 100%;
        padding: 10px;
        margin-top: 15px;
        background-color: #810000;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }
    #buy, #clear:hover {
        background-color: #630000;
    }
    .container {
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
    }
    .seat {
        width: 100%;
        height: 1500px;
    }
    .row {
        display: flex;
        flex-wrap: wrap;
    }
    .col-md-6, .col-md-3 {
        flex: 1;
        min-width: 200px;
    }
    .table {
        width: 100%;
        border-collapse: collapse;
    }
    .table th, .table td {
        border: 1px solid #ddd;
        padding: 8px;
    }
    .text-center {
        text-align: center;
    }
    .able {
        cursor: pointer;
    }
    .disable {
        background-color: #f9f9f9;
    }
    #seatDiv {
        display: none;
        margin-top: 20px;
    }
    #seatDiv.active {
        display: flex;
    }
    #seat {
        background-image: url("../../../resources/image/seat3.png");
        background-size: 100% 100%;        
        border: 2px solid brown;
        border-radius: 30px;
    }
    #myPlot {
        width: 800px;
        height: 800px;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/d3@7"></script>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
	<div class="seat">
		<div class="row">
            <div id="calendar" class="col-md-8">
                <table class="table" style="width: 100%;">
                    <thead>
                        <tr>
                            <th colspan="7" class="text-center" style="height: 43px;">
                                <button id="previousBtn" onclick="previousMonth()">&lt;</button>
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
           		<table>
           			<tr>
           				<th>시간</th>           				
           			</tr>
           			<tr>
           				<td>19:00</td>           				
           			</tr>           						
           		</table>
           </div>
        </div>
        <div id="seat"></div>

        <!-- 좌석형 홀 -->
        <div id="seatDiv" class="row" style="display: none;" align="center">
            <div id="seat" class="col-sm-6" 
                style="background-image: url(seat3.png);background-size:100% 100%; border: 2px solid brown;  border-radius: 30px;">
                <svg id="myPlot" style="width:800px; height:600px;"></svg>
            </div>

            <div id="info" class="col-sm-3" style=" width: 100%; height:500px" align="center">
                <div  >
                    <h3>선택한 좌석</h3>
                    <table class="table">
                        <tbody id="buylist" align="center"></tbody>
                    </table>
                </div>
                
            <h2>티켓 예약</h2>  
                <div id="priceSummaryDiv" style="position: absolute; bottom: 0; right: 0; width: 100%;" align="center">            
                        <div class="form-group">
					        <div><span for="totalPrice">총 가격 : </span><span id="totalPrice">0</span><span>원</span></div>
					        <button type="submit" id="buy" onclick="startPayment()">결제하기</button>
					        <button id="clear" onclick="removeAll()" type="reset">초기화</button>
					        <input type="hidden" name="concertId" id="concertId" value="${param.cno}">
							<input type="hidden" name="ticketQuantity" id="ticketQuantity" value="0">
							<input type="hidden" name="totalPrice" id="totalPriceInput" value="0">
					    </div>
                </div>
            </div>
        </div>
        <!-- 스탠딩 홀 -->
        <div id="standDiv" class="row" style="display:none" align="center"></div>
    </div>

    <!-- 날짜 선택관련 스크립트 -->
    <script>
        let calendarDiv = document.getElementById("calendar");
        let fullDate = document.getElementById("fullDate");
        // dumy data
        let date = 10;

        //날짜 관련 변수
        let toDay = new Date();
        let year = toDay.getFullYear();
        let month = toDay.getMonth()

        // 달력 그리기
        function drawCalendar(year, month, date/*ajax, 혹은 페이지 로딩시 전달할 데이터*/) {
            const firstDay = new Date(year, month, 1);
            const lastDay = new Date(year, month + 1, 0);
            const dayOfWeek = firstDay.getDay()

            document.getElementById("fullDate").innerHTML = year + "년 " + (month < 9 ? "0" + (month + 1) : (month + 1)) + "월"

            let forAppend = "<tr>";
            // 1일과 요일 맞추기 위해 밀어내기
            for (let i = 0; i < dayOfWeek; i++) {
                forAppend += "<td class='disable'></td>";
            }
            for (; firstDay <= lastDay; firstDay.setDate(firstDay.getDate() + 1)) {
                forAppend += "<td class='able' onclick='pickTime(" + year + "," + (month + 1) + "," + firstDay.getDate() + ")'>" + (firstDay.getDate() < 10 ? "0" + firstDay.getDate() : firstDay.getDate()) + "</td>"
                //if분기 또 나눠서 data와 일치하는 날에는 강조 + click이벤트 아닌 날은 disable class
                if (firstDay.getDay() === 6) {
                    forAppend += "</tr><tr>"
                }
            }
            forAppend += "</tr>"
            //check.innerHTML=forAppend
            document.getElementById("calendarTbody").innerHTML = forAppend;
        }

        
        // 날짜 클릭함수 ============================
        function pickTime(year, month, date) {
            /* document.getElementById("pickDate").innerHTML = year + "/" + month + "/" + date + " 시간선택" */
            // ajax로 요청 시간 리스트 그려주기======================> ajax 요청 아직 없음 왜냐 더미데이터 안 넣었거든]
            /*
            let forAppend = ""
            for (let i = Math.ceil((Math.random() * 10)) + 12; i < 19; i += 2) {
                forAppend += "<tr><td onclick='drawSeat()'>" + i + ":00 \t" + "xxx/yyy</td></tr>"
            }
            */
            drawSeat();
            /*
            document.getElementById("tbodyTimeList").innerHTML = forAppend;
            */
        }
        
        // ============================

        //달 이동 함수=========================
        //공연 시작날 이전 공연 끝난날 이후 선택 못하게 하는 구문 추가해야함
        function previousMonth() {
            $("#nextBtn").removeAttr("disabled")
            month--;
            if (month == -1) {
                year--;
                month = 11;
            }
            drawCalendar(year, month);
            if (month < new Date().getMonth() - 1) {
                $("#previousBtn").attr("disabled", "disabled")
            }
        }
        function nextMonth() {
            month++;
            $("#previousBtn").removeAttr("disabled")
            if (month == 12) {
                year++;
                month = 0;
            }
            drawCalendar(year, month);
            if (month > new Date().getMonth() + 2/*여기 변경*/) {
                $("#nextBtn").attr("disabled", "disabled")
            }

        }

        // 첫로딩시 그려줄 함수
        drawCalendar(year, month, date);
        //공연 시간 리스트 불러오는 함수
        pickTime(year, month + 1, date)
    </script>



    <!-- 좌석관련 스크립트-->

    <script>
        // 이거 디비에서 땡겨오는 값이여야함 range랑 규격 맞춰서 그려줘야 하기에 지금은 하드 코딩이지만...
        let gapx = 39;
        let gapy = 35;
        let ticketPrice = 100;//티켓 한장 값
        let numOfTicket = 0;
        const numPoints = 10;


        function drawSeat() {
            //clear Seat() 좌석 정보 삭제
            removeSeatDiv()
            const data = [];
            for (let i = 0; i < numPoints; i++) {
                for (let j = 0; j < numPoints; j++) {
                    if (i > 4) {
                        data.push([i * gapx + 66, j * gapy + 185, "" + i + j]);
                    } else {
                        data.push([i * gapx + 25, j * gapy + 185, "" + i + j]);
                    }
                }
            }
            const svg = d3.select("#myPlot")
                .append("svg")



            svg.append('g')
                .selectAll("seat")
                .data(data).enter()
                .append("rect")
                .attr("x", function (d) { return d[0]; })        // x 좌표
                .attr("y", function (d) { return d[1]; })        // y 좌표
                .attr("rx", 4)
                .attr("ry", 4)
                .attr("width", 20)   // 너비
                .attr("height", 20) // 높이
                .attr("active", false)
                .attr("seatname", function (d) { return d[2] })
                .style("fill", "lightGray")
                .on('click', function (x, d) {
                    var isActive = $(this).attr("active") === 'true';
                    if (!isActive) {
                        numOfTicket++;
                        $(this)
                            .css("fill", "black")
                            .attr("active", true);
                        $("#buylist").append("<tr id='" + $(this).attr("seatname") + "'><td>" + $(this).attr("seatname") + "좌석 가격:"+ticketPrice+"</td></tr>");
                        console.log("<tr id='" + $(this).attr("seatname") + "'><td>" + $(this).attr("seatname") + "좌석</td></tr>");
                        $("#totalPrice").html(numOfTicket*ticketPrice);
                    } else {
                        numOfTicket--;
                        $(this)
                            .css("fill", "lightGray")
                            .attr("active", false);
                        $("tr[id=" + $(this).attr("seatname") + "]").remove();
                        $("#totalPrice").html(numOfTicket*ticketPrice);
                    }
                });

        }

        // 선택한 좌석들 초기화
        function removeAll() {
            numOfTicket = 0;
            $("#buylist").html("");
            $("rect[active='true']").attr("active", false).attr("style", "fill:red");
            $("#totalPrice").html(numOfTicket);
        }
        // removeSeatDiv() 좌석 지우기
        function removeSeatDiv(){
            d3.select("#seatDiv").style("display","block");
            d3.select("#myPlot").html("");
            removeAll();
        }
        
        
        //좌석 상태 변경 (구매불가)
        function endPayment(uid) {
        	let concertDateId = 1;
        	let seatId = [1, 2]
        	
        	let resultSum = 0;
        	
        	for(let i in seatId) {
        		$.ajax({
            		url: "endPayment.pa",
            		type: "post",
            		data: {
            			cid: concertDateId,
            			sid: seatId[i],
            			buyListId: uid
            		},
            		success: function(result) {
            			if(result > 0) {
            				resultSum++;
            				console.log("좌석 상태 구매불가로 변경 성공");
            				if(resultSum >= seatId.length) {
            	        		console.log("좌석 상태 구매불가로 변경 모두 완료");
            	        	}
            			}
            			else {
            				console.log("좌석 상태 구매불가로 변경 실패");
            			}
            		},
            		error: function() {
            			console.log("좌석 상태 구매불가로 변경 ajax 통신 실패")
            		}
            	});
        	}
        }
        
        // 결제 함수
        function pay() {
		    //var concertId = $("#concertId").val();
		    var ticketQuantity = numOfTicket;
		    var totalPrice = $("#totalPrice").text();

		  	//주문번호(BUYLIST_ID) 랜덤생성
	  		let concertId = $("#concertId").val();
	  		let formattedDate = moment().format('YYYYMMDD');
	  		let randomNum = Math.floor(Math.random() * (90000) + 10000); //10000 ~ 99999
	  		let randomUid = concertId + formattedDate + randomNum;
	  		
		    //const myAmount = Number(document.getElementById("amount").value);
		    const myAmount = totalPrice; //결제금액
		    let userId = "${sessionScope.loginUser.userId}";
		    
		    const IMP = window.IMP; // 생략 가능
		    IMP.init("imp84822672"); // 상점 식별코드
		    IMP.request_pay(
		      {
		      	// param
		         pg: "html5_inicis",
		         pay_method: "card",
		         merchant_uid: randomUid, //주문번호 == BUYLIST_ID
		         name: "공연이름", //결제 시 보이는 상품명
		         amount: myAmount,
		         buyer_email: "gildonggmailcom",
		         buyer_name: "HongGildong",
		         buyer_tel: "01042424242",
		         buyer_addr: "Seoul",
		         buyer_postcode: "01181",
		         
		         //m_redirect_url: "", // 모바일 결제후 리다이렉트될 주소
		      }, function(rsp) {
		      	console.log(rsp);
		      	$.ajax({
		      		url: "checkAmount",
		                 type: "POST",
		                 data: { imp_uid: rsp.imp_uid}
		             }).done(function(data) {
		             	console.log(data);
		             	console.log("rsp.paid_amount : " + rsp.paid_amount);
		             	console.log("data.response.amount : " + data.response.amount);
		             	console.log("--------------------");
		                 if(rsp.paid_amount === data.response.amount){
		                     console.log("결제 성공");
		                     
		                     //결제정보 db에 저장
		                     $.ajax({
		     	            	url: "insertPaymentInfo.pa",
		     	            	type: "post",
		     	            	data: {
		     	            		buyListId: rsp.merchant_uid, //주문번호
		     	            		reserveCode: rsp.pg_tid, //결제코드
		     	            		reserveConcertId: concertId, //예약된 공연 이름
		     	      	            reserveTicket: ticketQuantity, //예약된 티켓 수
		     	      	            reserveSum: myAmount, //결제 금액 합
		     	      	            userId: userId //회원ID
		     	            	},
		     	            	success: function(result) {
		     	            		if(result == "success") {
		     	            			//좌석 상태 구매 불가로 변경
		     	            			endPayment(rsp.merchant_uid);
		     	            			
		     	            			console.log("결제정보 저장 성공");
		     	            			alert("결제 완료되었습니다.");
		     	            			location.href="detail.co?cno=${param.cno}";
		     	            		} else {
		     	            			console.log("결제정보 저장 실패");
		     	            		}
		     	            	},
		     	            	error: function() {
		     	            		console.log("결제정보 저장 AJAX 통신 실패");
		     	            	}
		     	            });
		                 } else {
		                     console.log("결제 실패");
		                 }
		             });
		      	
		   		});
		}
        
        //좌석 상태 변경 (결제중)
        function startPayment() {
        	let concertDateId = 1;
        	let seatId = [1, 2]
        	
        	let resultSum = 0;
        	
        	for(let i in seatId) {
        		$.ajax({
            		url: "startPayment.pa",
            		type: "post",
            		data: {
            			cid: concertDateId,
            			sid: seatId[i]
            		},
            		success: function(result) {
            			if(result > 0) {
            				resultSum++;
            				console.log("좌석 상태 결제중으로 변경 성공");
            				if(resultSum >= seatId.length) {
            	        		console.log("좌석 상태 결제중으로 변경 모두 완료");
            	        		pay();
            	        	}
            			}
            			else {
            				console.log("좌석 상태 결제중으로 변경 실패");
            			}
            		},
            		error: function() {
            			console.log("좌석 상태 결제중으로 변경 ajax 통신 실패")
            		}
            	});
        	}
        }


    </script>   
    
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>