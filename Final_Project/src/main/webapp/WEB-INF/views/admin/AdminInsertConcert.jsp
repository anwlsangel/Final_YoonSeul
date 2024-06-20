<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/main.min.js'></script>
<script	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/locales-all.min.js'></script>
<script	src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.14/index.global.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@6.1.14/index.global.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.14/index.global.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@6.1.14/index.global.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<title>Document</title>

<style>
</style>

</head>

<body>
	<div id="wrapper">

		<jsp:include page="../common/adminNav.jsp" />

		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<jsp:include page="../common/adminTop.jsp" />

				
				<!-- img 확인용 div -->
				<div id="checkImgModal" style="display: none; position: absolute;">
					<img id="modalImg" src="" alt="없어요"
						onclick="document.getElementById('checkImgModal').style.display='none'">
					<button type="button"
						onclick="document.getElementById('checkImgModal').style.display='none'">닫기</button>
				</div>

				<h1 class="h3 mb-4 text-gray-800">공연 등록</h1>
				
				<form action="insertConcert.ic" method="post" id="insertConcertForm"
					enctype="multipart/form-data">
					<table class="table table-bordered" style="width: 500px;">
						<tr>
							<td style="width:150px;"><label for="concertState">상태</label></td>
							<td><select id="status" name="status" required>
									<option value="0">오픈</option>
									<option value="1">히든</option>
							</select></td>
						</tr>
						<!-- 이름 -->
						<tr>
							<td><label for="concertName">공연명 :</label></td>
							<td><input id="concertName" name="concertName" required></td>
						</tr>
						<!-- 연령 -->
						<tr>
							<td><label for="ageLimit">연령제한 :</label></td>
							<td><select id="ageLimit" name="ageLimit" required>
									<option value="0">없음</option>
									<option value="8">8</option>
									<option value="12">12</option>
									<option value="15">15</option>
									<option value="19">19</option>
							</select></td>
						</tr>
						<!-- 가격 -->
						<tr>
							<td><label for="price">가격 :</label></td>
							<td><input id="price" name="price" type="number"
								value="10000" step="1000" min="0" requireds><span>원</span></td>

						</tr>
						<!-- 카테고리 -->
						<tr>
							<td><label for="category">카테고리 :</label></td>
							<td><select name="category" id="category" required>
									<option value="콘서트">콘서트</option>
									<option value="아동">아동</option>
									<option value="공포">공포</option>
									<option value="로맨스">로맨스</option>
									<option value="뮤지컬">뮤지컬</option>
									<option value="연극">연극</option>
									<option value="클래식">클래식</option>
							</select></td>
						</tr>
						<!-- 러닝타임 -->
						<tr>
							<td><label for="playtime">공연시간 :</label></td>
							<td><input id="hour" type="number" step="1" max="4"
								value="1" min="0" onchange="hourValid(this)">시간 <input
								id="min" type="number" step="5" value="0" max="60" min="-5"
								onchange="minValid(this)">분<br> <input
								id="playtime" name="playTime" type="text" value="1:0"
								name="playtime" style="width: 60px;" readonly required></td>
						</tr>
						<!-- 썸네일 -->
						<tr>
							<td><label for="thumbnailRoot">썸네일이미지 :</label></td>
							<td><input id="thumbnailRoot" name="thumbnail" type="file"
								accept="image/*">
								<button type="button" onclick="imgCheck('thumbnailRoot')">썸네일확인</button>
							</td>
						</tr>
						<!-- 디테일 -->
						<tr>
							<td><label for="detailRoot">설명이미지 :</label></td>
							<td><input id="detailRoot" name="detail" type="file"
								accept="image/*">
								<button type="button" onclick="imgCheck('detailRoot')">설명이미지확인</button>
							</td>
						</tr>
						<!-- 홀 -->
						<tr>
							<td><label for="hole">홀선택 :</label></td>
							<td><select name="holeName" id="hole"
								oninput="drawScheduleCalendarEI()">
									<option value="0">선택안함</option>
									<c:forEach var="list" items="${holeList}">
										<option value='${list}'>${list}</option>
									</c:forEach>

							</select></td>
						</tr>
					</table>

					<!-- hole 스케쥴용 div-->
					<div id='calendar' style="width: 50%;"></div>
					<div id="listDiv">
						<a href="#listDiv" hidden></a>
						<button type="button" onclick="submitConcert()">공연등록</button>
						<h2>
							총 일정 수 <span id="totalListNum">0</span>
						</h2>
						<table id="listTable"></table>
					</div>
					<input hidden id="forJson" name="forJson">
				</form>
			</div>
		</div>
	</div>



	<script>
 // 홀 정보 넣기 페이지 로딩시 값 건내받기 
    // 추가 되는 공연 날짜 정보 변수
    let addIndex = 0;
    let addScheduleList = [];
    // 이미 있는 공연 스케쥴
    let alredyScheduleList = [];

    // 날짜 관련 변수
    let toDay = new Date();
    let year = toDay.getFullYear();
    let month = toDay.getMonth() + 1;
    const currentYear = year;
    const currentMonth = month;

    // 공연시간 확인 변수
    let checkRunningTime = true;

    //==================================== 초기 단 1회적용 코드


    //이미지 확인용 펑션
    function imgCheck(x) {
        let modalImg = document.getElementById("modalImg");
        let rect = document.getElementById(x).getBoundingClientRect();
        let modal = document.getElementById("checkImgModal");
        modalImg.src = ""
        modal.style.top = rect.top + "px";
        modal.style.left = rect.left + "px";
        modal.style.display = "block";
        let file = document.getElementById(x).files[0];
        let reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function (e) {
            modalImg.src = reader.result;
        }
    }
    // 공연시간 용 함수
    function hourValid(x) {
        if (isNaN(x.value)) {
            x.value = x.min;
        }
        x.value = Math.floor(x.value);

        if (x.value <= 0) {
            x.value = x.min;
        }
        if (Number(x.value) >= Number(x.max)) {
            x.value = x.max;
        }
        document.getElementById("playtime").value = x.value + ":" + document.getElementById("min").value;
    }

    function minValid(x) {
        if (isNaN(x.value)) {
            x.value = x.min;
        }
        x.value = Math.floor(x.value);

        if (x.value % 10 >= 5) {
            x.value = Math.floor(x.value / 10) * 10 + 5;
        } else {
            x.value = Math.floor(x.value / 10) * 10;
        }
        if (x.value < 0) {
            x.value = 55;
            if (document.getElementById("hour").value > 0) {
                document.getElementById("hour").value--;
            }
        }
        if (Number(x.value) >= 60) {
            x.value = 0;
            if (document.getElementById("hour").value < 4) {
                document.getElementById("hour").value++;
            };
        }
        document.getElementById("playtime").value = document.getElementById("hour").value + ":" + x.value;
    }

    //스케쥴러 관련 함수들
    let index = 0;
    let addMap = new Map();
    let timeFix = false;
    let calendar;

    function drawScheduleCalendarEI() {
        let hour = document.getElementById('hour').value;
        let min = document.getElementById('min').value;
        let select = document.getElementById("hole");
        let holeName = select.options[select.selectedIndex].value;
        if(holeName==0){
            alert("공연장을 선택하세요");
            select.focus()
            document.getElementById('calendar').innerHTML="";
            return;
        }
        if (confirm(holeName + "공연장, 공연시간(" + hour + ":" + min + ")을 사용하여 스케쥴을 추가하시겠습니까?")) {
            document.getElementById("hour").readOnly = true;
            document.getElementById('min').readOnly = true;
            addMap = new Map();
        } else {        
            document.getElementById("hole").options[0].selected = true;
            document.getElementById("hour").readOnly=false;
            document.getElementById("min").readOnly=false;
            document.getElementById("hour").focus();
            return;
        }        
        
        var calendarEl = document.getElementById('calendar');

             calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'timeGridWeek',
            locale: "ko",
            allDaySlot: false,
            editable: true,
            selectOverlap: false,
            slotEventOverlap: false,
            eventOverlap: false,
            slotDuration: '00:05:00',
            eventDurationEditable: false,
            height: 600,
            contentHeight: 600,
            views: {
                timeGridForMonth: {
                    type: 'timeGrid',
                    duration: { month: 1 },
                    buttonText: 'month',
                    allDaySlot: false,
                    dayHeaderContent: function (arg) {
                        var weekday = arg.date.toLocaleDateString('ko', { weekday: 'short' });
                        var day = arg.date.getDate();
                        return `\${day}\${weekday}`;
                    },
                },

            },
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'timeGridForMonth,timeGridWeek'
            },
            validRange: {
                start: (new Date().setDate(new Date().getDate() + 1))
            }
            ,
            // 날짜 이동시 함수 ajax로 데이터 끌고오기       
            datesSet: function (info) {
                var visibleRange = info.view.activeRange;                
                $.ajax({
                    url: 'getSchedule.ajax',
                    method:'post',
                    data: {
                        startDate: trimDate(info.view.activeStart),
                        lastDate: trimDate(info.view.activeEnd),
                        holeName:document.getElementById("hole").options[select.selectedIndex].value
                    },
                    success: function (response) {
                    	let eventArray = JSON.parse(response)
                    	console.log(eventArray)
                    	if(calendar.getEvents().length>0){
	                        calendar.getEvents().events.forEach(function (event) {	                        	
	                            if (event.classNames.includes("remove")) {
	                                event.remove();
	                            }
	                        });                 
                    	}
                        
                        for(let i=0;eventArray.length>i;i++){
                        	let addEventObj = {                                    
                                    title: "fix",
                                    start: new Date(eventArray[i].startDate),
                                    end: new Date(eventArray[i].endDate),
                                    classNames: 'remove',
                                    color: 'black'                                    
                                }
                        	console.log(addEventObj);
                        	calendar.addEvent(addEventObj);
                        }
                    },
                    error: function () {
						console.log("실패")
                    }
                })
            },
            // 이벤트 삭제
            eventClick: function (arg) {
                if (arg.event.classNames == 'add') {
                    if (confirm(arg.event.start+ "해당 이벤트를 삭제하시겠습니까?")) {
                        arg.event.remove()
                        addMap.delete(Number(arg.event.id))
                        removeEventBtn(arg.event.id)
                        document.getElementById("totalListNum").innerHTML=addMap.size;
                    }
                } else {
                    alert("삭제가 불가능한 공연입니다.")
                }
            },
            // 이벤트 이동시
            eventDrop: function (arg) {
                addMap.set(Number(arg.event.id), trimDate(arg.event.start))
                
            },
            dateClick: function (info) {
                let yes = confirm(trimDate(info.date) + "에 추가하시겠습니까?")
                let dateEnd = new Date(info.date)
                dateEnd.setHours(dateEnd.getHours() + Number(hour))
                dateEnd.setMinutes(dateEnd.getMinutes() + Number(min))

                if (yes) {
                    overlap = calendar.getEvents().some(function (event) {
                        return (event.start < info.date && event.end > info.date) || (event.start < dateEnd && event.end > dateEnd)
                    });
                    if (!overlap) {
                        let addEventObj = {
                            id: index,
                            title: "추가",
                            start: info.date,
                            end: dateEnd,
                            classNames: 'add'
                        }
                        calendar.addEvent(addEventObj);
                        addMap.set(addEventObj.id, trimDate(addEventObj.start))
                        document.getElementById("totalListNum").innerHTML=addMap.size;
                        index++;
                    } else {
                        alert("선택한 시간과 다른 공연시간이 중복됩니다.");
                    }
                }
            },


        });
        var currentView = calendar.view;
        var currentViewType = currentView.type;
        
        calendar.render();
    };

    function trimDate(date) {
        let retDate = new Date(date);
        return retDate.getFullYear()+"-"+(retDate.getMonth()+1)+"-"+retDate.getDate()+" "+retDate.getHours()+":"+("0"+retDate.getMinutes()).slice(-2);    
    }
    function writeList() {
        let forSort = [];
        for (const [key, value] of addMap) {
            forSort.push({ key: key, value: new Date(value) });
        }

        // 배열을 value 값 기준으로 정렬
        forSort.sort(function (a, b) {
            return a.value - b.value;
        });
        // sorting 끝
        let appendFor = ""
        // 정렬된 배열 순회 및 출력
        for (let i = 0; i < forSort.length; i++) {
            appendFor += "<tr id='tr"+forSort[i].key+"'><td>" +
                forSort[i].value.toLocaleString().slice(0,-3) +
                "</td><td> <button type='button' onclick='removeEventBtn(" + forSort[i].key + ")'+>삭제</button></td></tr>"
            
        }
        document.getElementById("listTable").innerHTML=appendFor;
        document.getElementById("totalListNum").innerHTML=forSort.length;
    }
    // 삭제펑션

    function removeEventBtn(id){
        let event = calendar.getEventById(id)
        
        if(confirm(trimDate(event.start)+"에 해당하는 공연을 삭제하시겠습니까?")){
            event.remove();
            addMap.delete(id);
            document.getElementById("tr"+id).remove();
        }
        //addMap.delete(id);
        document.getElementById("totalListNum").innerHTML=addMap.size
    }

    function submitConcert(){
        let jsonArray=[];
        for (const [key, value] of addMap) {
            jsonArray.push(value);
        }
        if(jsonArray.length==0){
            alert("공연 스케줄을 등록해주세요") 
            return;
        }else if(!document.getElementById("concertName").value){
            alert("공연 이름을 입력해주세요");
            document.getElementById("concertName").focus()
            return;
        }else if(!document.getElementById("thumbnailRoot").value){
            alert("썸네일 이미지파일을 올려주세요");
            document.getElementById("thumbnailRoot").click()
            return;
        }else if(!document.getElementById("detailRoot").value){
            alert("공연설명 이미지파일을 올려주세요");
            document.getElementById("detailRoot").click()
            return;
        }
        jsonArray.sort(function (a, b) {
            return new Date(a) - new Date(b);
        });
        if(confirm("공연장:"+document.getElementById("hole").value+"\n"+jsonArray.join("\n")+"\n위 일정으로 추가하시겠습니까?")){
            document.getElementById("forJson").value=JSON.stringify(jsonArray);
            document.getElementById("insertConcertForm").submit();
        }else{
            writeList()
        }; 
    }
    </script>
</body>

</html>