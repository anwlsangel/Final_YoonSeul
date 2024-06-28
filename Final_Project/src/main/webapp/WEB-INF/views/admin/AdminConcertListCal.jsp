<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/locales-all.min.js'></script>
<script
	src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.14/index.global.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@6.1.14/index.global.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.14/index.global.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@6.1.14/index.global.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
#modal {
	padding: 20px;
	border: 1px solid #ccc;
	background-color: #f9f9f9;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1000
}
</style>
</head>
<body>

	<div id="wrapper">

		<jsp:include page="../common/adminNav.jsp" />

		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<c:forEach var="hole" items="${holeList}">
					<input type="radio" id="${hole}" name="hole" value="${hole}">
					<label for="${hole}">${hole}</label>
				</c:forEach>
				<div id='calendar' style="width: 50%;"></div>
				<div id="hiddenBtn" style="display:none">
					선택한 공연명:<span id="concertName">없음</span><br>추가 공연 수: <span
						id="totalListNum"></span><br>
						<button type="button" onclick="addBtn()">등록</button><button onclick="totalReset()">취소</button>
				</div>
			</div>
		</div>
	</div>
	<div id="modal" style="display: none"
		onclick="document.getElementById('modal').style.display='none'"></div>
	<script>
	$('input[type=radio][name=hole]').change(function() {        
		drawScheduleCalendarEI(this.value)
    });
	let playTime;
	let selectId;
	let addMap=new Map();
	let index=0;
	let concertName="";
	let calendar;
	let title;
	let canAdd = true;
	function drawScheduleCalendarEI(holeName) {
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
		                    holeName:holeName
		                },
		                success: function (response) {
		                    let eventArray = JSON.parse(response)
		                    console.log(eventArray)
		                    if(calendar.getEvents().length>0){
		                        calendar.getEvents().forEach(function (event) {	                        	
		                            if (event.classNames.includes("remove")) {
		                                event.remove();
		                            }
		                        });                 
		                    }
		                    
		                    for(let i=0;eventArray.length>i;i++){
		                        let addEventObj = {                                    
		                                title: eventArray[i].concertName,
		                                id: eventArray[i].concertId,
		                                start: new Date(eventArray[i].startDate),
		                                end: new Date(eventArray[i].endDate),
		                                classNames: 'remove',
		                                color: 'black'                                    
		                            }
		                        calendar.addEvent(addEventObj);
		                        calendar.refetchEvents()
		                    }
		                },
		                error: function () {
		                    console.log("실패")
		                }
		            })
		        },
		        // 이벤트 삭제 ,모달
		        eventClick: function (arg) {
		        	console.log(arg.event.classNames)
		        	if (arg.event.classNames[0] == 'add') {
	                    if (confirm(arg.event.start+ "해당 이벤트를 삭제하시겠습니까?")) {
	                        arg.event.remove()
	                        addMap.delete(Number(arg.event.id))
	                        document.getElementById("totalListNum").innerHTML=addMap.size;
	                    }
	                } else {
	                	openModal(arg.event.id);
	                }          
		        },
		        // 이벤트 이동시
		        eventDrop: function (arg) {
		            addMap.set(Number(arg.event.id), trimDate(arg.event.start))
		            
		        },
		        dateClick: function (info) {
		        	
		        	if(canAdd){return;}
		        	console.log(selectId)
		        	
		            let yes = confirm(trimDate(info.date) + "에 추가하시겠습니까?")
		            let dateEnd = new Date(info.date)
		            let timeSplit = playTime.split(":");
		            
		            
		            dateEnd.setHours(dateEnd.getHours() + Number(timeSplit[0]))
		            dateEnd.setMinutes(dateEnd.getMinutes() + Number(timeSplit[1]))
					
		            if (yes) {
		                overlap = calendar.getEvents().some(function (event) {
		                    return (event.start < info.date && event.end > info.date) || (event.start < dateEnd && event.end > dateEnd)
		                });
		                let nowTime = new Date();
		                let check = nowTime < info.date; 
		                if (!check){
		                	alert("오늘보다 빠른 날은 선택이 불가능합니다.")
		                	return ;
		                }
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
		                }  else {
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
		
		
		function openModal(id){
			
			$.ajax({
				url:"getConcertInfoAjax",
				data: {id:id},
				success:function(data){
					console.log(data)
					selectId = data.concertId;
					playTime = data.playTime;
					title = data.concertName;
					concertName = data.concertName
					document.getElementById("modal").style.display="block"
					console.log(data)
					 document.getElementById("modal").innerHTML=`
			                    <h2>\${data.concertName}</h2>
			                    <img src="\${data.thumbnailRoot}" alt="Thumbnail" class="thumbnail">
			                    <p><strong>시작 날짜:</strong> \${data.startDate}</p>
			                    <p><strong>종료 날짜:</strong> \${data.endDate}</p>
			                    <button onclick="adds('\${id}')">일정추가</button>`
				}
			})
		}
		
		function adds(id){
			if(confirm("선택한 공연의 일정을 추가하시겠습니까?")){
				totalReset()
				canAdd = false;
				document.getElementById("concertName").innerHTML=concertName
				document.getElementById("hiddenBtn").style.display="block";
			}
		}
		function addBtn(){
			
			let jsonArray=[];
	        for (const [key, value] of addMap) {
	            jsonArray.push(value);
	        }
	        if(jsonArray.length==0){
	            alert("공연 스케줄을 등록해주세요") 
	            return;
	        }
	        jsonArray.sort(function (a, b) {
	            return new Date(a) - new Date(b);
	        });
			
	        if(confirm(title+"의 공연을\n"+jsonArray.join("\n")+"\n위 일정으로 추가하시겠습니까?"))
			
			$.ajax({
				url:"addEvents",
				type:"post",
				data:{adds:JSON.stringify(jsonArray),id:selectId},
				success:function(x){
					if(x>0){
						calendar.getEvents().forEach(function (event) {
							if (event.classNames.includes("add")) {
						        // 옵션 1: 이벤트를 삭제하고 다시 추가하는 방법
						        // 이벤트 정보를 저장합니다.
						        let newEvent = {
						            id: selectId,
						            title: title,
						            start: event.start,
						            end: event.end,
						            color: 'black',
						            classNames: ['remove']
						        };
	
						        event.remove();
	
						        calendar.addEvent(newEvent);
						    }
						})
						alert("공연이 등록되었습니다.");
						totalReset();
					}
				}
			})
		}
		function totalReset(){
			document.getElementById("concertName").innerHTML=""
			document.getElementById("totalListNum").innerHTML=""
			document.getElementById("hiddenBtn").style.display="none"
			canAdd=true
			addMap=new Map();
			calendar.getEvents().forEach(function (event) {
				if (event.classNames.includes("add")) {			    
			        event.remove();
			    }
			})
		}
	</script>
</body>
</html>