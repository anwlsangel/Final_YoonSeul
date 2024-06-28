<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>윤슬아트홀</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- 구글차트 api 라이브러리 연동 (cdn) -->
<style>
#content {
	width : 90%;  
	margin-left : 60px;
}     

#concert_sales {
	height : 1000px;
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
                    <h1 class="h3 mb-2 text-gray-800">매출 통계</h1>
                    <p class="mb-4"></p>
                    
                    <!-- chart -->
                    <div class="charts" align="center">
                    	<div class="chart">
                            <div id="concert_sales"></div>
                        </div>
                    </div>
                    
       <script>
        window.onload = function() {
            // ----- 세로막대그래프 그리기 -----
            google.charts.load('current', {'packages':['bar']});
            google.charts.setOnLoadCallback(drawBar2);

            function drawBar2() {
                // 그래프 상에 표현할 데이터
                var data = google.visualization.arrayToDataTable([
                    ['월', '매출(원)'],
                    ['1', ${empty list[0].enrollCount ? 0 :list[0].enrollCount}],
                    ['2', ${empty list[1].enrollCount ? 0 :list[1].enrollCount}],
                    ['3', ${empty list[2].enrollCount ? 0 :list[2].enrollCount}],
                    ['4', ${empty list[3].enrollCount ? 0 :list[3].enrollCount}],
                    ['5', ${empty list[4].enrollCount ? 0 :list[4].enrollCount}],
                    ['6', ${empty list[5].enrollCount ? 0 :list[5].enrollCount}],
                    ['7', ${empty list[6].enrollCount ? 0 :list[6].enrollCount}],
                    ['8', ${empty list[7].enrollCount ? 0 :list[7].enrollCount}],
                    ['9', ${empty list[8].enrollCount ? 0 :list[8].enrollCount}],
                    ['10', ${empty list[9].enrollCount ? 0 :list[9].enrollCount}],
                    ['11', ${empty list[10].enrollCount ? 0 :list[10].enrollCount}],
                    ['12', ${empty list[11].enrollCount ? 0 :list[11].enrollCount}]
                ]);

                // 그래프 그리기 옵션
                var options = {
                    chart: {
                        title: '월별 매출 현황',
                        subtitle: '2024년',
                    },
                    bars: 'vertical',
                    vAxis: {format: 'decimal'},
                    height: 300,
                    colors: ['#1b9e77', '#d95f02']
                };

                // 그래프를 그려넣을 요소 선택 후 데이터, 옵션을 매개변수로 넣어 그리기
                var chart = new google.charts.Bar(document.getElementById('concert_sales'));
                chart.draw(data, google.charts.Bar.convertOptions(options));
            }
        };
    </script>


</body>
</html>