<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 연령 현황</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- 구글차트 api 라이브러리 연동 (cdn) -->
<style>
#content {
	width : 90%;  
	margin-left : 60px;
}     

#member_age {
	height : 400px;
}
 
#member_enroll {
	height : 400px;
}
</style>
</head>
<body>
	
		<div id="wrapper">
	
	    <jsp:include page="../common/adminNav.jsp" />
		
		<div id="content-wrapper" class="d-flex flex-column">
		
	    	<!-- Main Content -->
	        <div id="content">
	        
	        <jsp:include page="../common/adminTop.jsp" />
	
			
			 <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">회원 통계</h1>
                    <p class="mb-4"></p>
                    
                    <!-- chart -->
                    <div class="charts" align="center">
                    	<div class="chart">
                            <div id="member_age"></div>
                            <div id="member_enroll"></div>
                        </div>
                    </div>
                    
                    
                    <script>
                        window.onload = function() {
                            // ---------- 회원 연령대 ----------
                            // ----- 파이그래프 그리기 -----
                            google.charts.load('current', {'packages':['corechart']});
                            google.charts.setOnLoadCallback(drawPie1);

                            function drawPie1() {
                                // 그래프 상에 표현할 데이터
                                var data = google.visualization.arrayToDataTable([
                                    ['연령대', '비율'],
                                    ['20대', ${age20}],
                                    ['30대', ${age30}],
                                    ['40대', ${age40}],
                                    ['기타', ${ageEtc}]
                                ]);

                                // 그래프 그리기 옵션
                                var options = {
                                    title: '회원 연령대 비율'
                                };

                                // 그래프를 그려넣을 요소 선택 후 데이터, 옵션을 매개변수로 넣어 그리기
                                var chart = new google.visualization.PieChart(document.getElementById('member_age'));
                                chart.draw(data, options);
                            }
                            
                            
                         // ----- 세로막대그래프 그리기 -----
                            google.charts.load('current', {'packages':['bar']});
                            google.charts.setOnLoadCallback(drawBar1);

                            function drawBar1() {
                            	
                                // 그래프 상에 표현할 데이터
                                var data = google.visualization.arrayToDataTable([
                                    ['월', '회원가입 수'],
                                    ['1', ${mlist[0].enrollCount}],
                                    ['2', ${mlist[1].enrollCount}],
                                    ['3', ${mlist[2].enrollCount}],
                                    ['4', ${mlist[3].enrollCount}],
                                    ['5', ${mlist[4].enrollCount}],
                                    ['6', ${mlist[5].enrollCount}],
                                    ['7', ${empty mlist[6].enrollCount ? 0 :mlist[6].enrollCount}],
                                    ['8', ${empty mlist[7].enrollCount ? 0 :mlist[7].enrollCount}],
                                    ['9', ${empty mlist[8].enrollCount ? 0 :mlist[8].enrollCount}],
                                    ['10',${empty mlist[9].enrollCount ? 0 :mlist[9].enrollCount}],
                                    ['11',${empty mlist[10].enrollCount ? 0 :mlist[10].enrollCount}],
                                    ['12',${empty mlist[11].enrollCount ? 0 :mlist[11].enrollCount}]
                                ]);
									
                                // 월별 회원 가입 수 
                                // 그래프 그리기 옵션
                                var options = {
                                    chart: {
                                        title: '월별 회원가입 수',
                                        subtitle: '2024년',
                                    },
                                    bars: 'vertical',
                                    vAxis: {format: 'decimal'},
                                    height: 300,
                                    colors: ['#1b9e77', '#d95f02']
                                };

                                // 그래프를 그려넣을 요소 선택 후 데이터, 옵션을 매개변수로 넣어 그리기
                                var chart = new google.charts.Bar(document.getElementById('member_enroll'));
                                chart.draw(data, google.charts.Bar.convertOptions(options));
                            }
                            
                            
                            
                        };
                    </script>
			
</body>
</html>