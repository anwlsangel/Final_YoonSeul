<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>윤슬아트홀</title>
    <!-- Google Fonts 링크 추가 -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <!-- jQuery library -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <!-- 온라인 방식 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <style>

        body{
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        .pageWrapper {
            min-width: 1000px;
            overflow-y: visible;
            width: 100%;
            height: 100%;
        }

        .container {
            max-width: 1000px;
            margin: 20px auto;
            margin-top: 100px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            min-height: calc(100vh - 160px); /* 화면 높이에서 헤더와 푸터를 제외한 높이 설정 */
        }
        #content {
            float: left;
            width: 960px;
            padding-top: 40px;
            min-height: 70vh;
        }
        #content ul.ttlar {
            margin-bottom: 25px;
        }

        #content ul.ttlar > li {
            float: left;
            padding-right: 10px;
            font-size: 0.9em;
        }
        #content ul.ttlar > li h3 {
            color: #222;
            font-size: 3.5em;
            line-height: 1.0em;
            font-weight: bold;
            letter-spacing: -2.0px;
            margin: 0;
        }
        ul {
            list-style-type: none;
        }
        .pdT10 {
            padding-top: 10px;
        }
        .clearfix {
            display: block;
        }
        .clearfix:after {
            visibility: hidden;
            display: block;
            font-size: 0;
            content: ".";
            clear: both;
            height: 0;
        }
        .hallinfo .hicon {
            float: left;
            width: 470px;
            margin-right: 30px;
        }

        .ttlst1 {
            font-size: 2.0em;
            font-weight: bold;
            color: #610f04;
            line-height: 1.4em;
        }
        ul.ulst1 li {
            line-height: 1.6em;
            padding: 2px 0 2px 13px;
        }
        .infost1.type2 {
            font-size: 2em;
            padding:  0 5px 25px 0;
        }
        .fw_bold {
            font-weight: bold;
        }
        .infost1 {
            background: url(../images/styleguide/icon/ico_info.png) 0 8px no-repeat;
            color: #630000;
            padding: 5px 0 5px 19px;
            line-height: 1.5em;
        }
        h4.hbul {
            background: url(../images/styleguide/bullet/blt_depth4.gif) 0 0 no-repeat;
            font-size: 1.6em;
            font-weight: bold;
            color: #630000;
            padding-left: 25px;
            margin: 30px 0 15px 0;
        }
        .dt_st01 {
            width: 99%;
            border: #630000;
            padding: 0;
            margin: 0;
            border-spacing: 0;
            border-collapse: collapse;
        }
        .mgT10 {
            margin-top: 10px;
        }
        .hallinfo .hiimg {
            float: left;
            width: 420px;
        }

    </style>
</head>
<jsp:include page="../common/header.jsp" />
        <body>
            <div class="pageWrapper clearfix">
            <div class="container clearfix">
            <div class="clearfix" id="content">
                <ul class="ttlar clearfix">
				    <li><h3>윤슬아트홀</h3></li>
				    <li class="pdT10"><span>윤슬아트홀 주차장 시설을 소개합니다.</span>
                                    <br>윤슬아트홀은 최고의 문화시설로 여러분을 기다립니다.<br>
                    </li>
			    </ul>
			    <br> <br>
                <div class="hallinfo clearfix">
                    <div class="hicon">
                        <p class="ttlst1">주차난 교통난 해소와<br>
                        에너지 절약을 위해<br>
                        대중교통을 이용합시다</p>
                    
                        <p class="fw_bold">저희 윤슬아트홀은 공연, 일반 내방객을 위하여 주차면 400면(장애인전용 20면 포함) 규모의 주차장 시설을 갖추고 있습니다.</p>
                    
                    
                        <p>공연장 객석 규모를 고려할 때 주차 면적이 협소합니다. 가급적이면 지하철이나 대중교통을 이용해 주시기 바랍니다.</p>
                    
                            <li><span class="fw_bold">야외주차장</span>: 200면</li>
                            <li><span class="fw_bold">지하주차장</span>: 200면</li>
                    </div>
                    
                    <ul class="hiimg">
                        <li><img alt="주차장 전경 사진" src="https://www.snart.or.kr/web/images/sub/img_G060600_01.jpg"></li>
                        <li class="mgT10"><img alt="주차장 내부 사진" src="https://www.snart.or.kr/web/images/sub/img_G060600_02.jpg"></li>
                    </ul>
                </div>
                <div class="hallinfo clearfix">
                    <div class="hicon">
                        <br>
                        <span class="infost1 type2 fw_bold">* 신속하고 편리한 출차를 위해 각 공간에 비치된 무인정산기를 이용하여 미리 주차요금을 정산하여 주시기 바랍니다.</span>
                    </div>
                    <ul class="hiimg">
                        <li class="mgT10"><img alt="무인정산기 사진" src="https://www.snart.or.kr/upload/smartEditor/2017_04_17_181339.jpg"></li>
                    </ul>
                </div>
                <h4 class="hbul">#주차요금 안내</h4>
                <p>윤슬아트홀에서는 2015년 11월 3일부터 부설주차장 이용에 대하여 아래와 같이 요금을 징수하오니 양지하여 주시기 바랍니다.</p>
                <table class="dt_st01" border="1">
                    <colgroup>
                        <col width="14%">
                        <col width="25%">
                        <col width="25%">
                        <col width="*">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">구분</th>
                            <th scope="col">소형(5톤미만, 35인승 이하)</th>
                            <th scope="col">대형(5톤이상, 36인승 이상)</th>
                            <th scope="col">비고</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                        <tr>
                            <td class="textC" scope="row">기본 요금<br>
                            (최초 40분)</td>
                            <td class="textC">400원</td>
                            <td class="textC">800원</td>
                            <td class="textC">단, 39분까지 무료</td>
                        </tr>
                        <tr>
                            <td class="textC" scope="row">초과 요금</td>
                            <td class="textC">10분당 300원</td>
                            <td class="textC">10분당 600원</td>
                            <td class="textC">40분 초과 : 기본요금 + 초과요금</td>
                        </tr>
                        <tr>
                            <td class="textC" scope="row">일일 요금</td>
                            <td class="textC">6,000원</td>
                            <td class="textC">12,000원</td>
                            <td class="textC">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="textC" scope="row">월정 요금</td>
                            <td class="textC">50,000원</td>
                            <td class="textC">해당사항 없음</td>
                            <td class="textC">외부 월 정기주차 차량</td>
                        </tr>
                        <tr>
                            <td class="textC" scope="row">공연 관람객</td>
                            <td class="textC">2,000원</td>
                            <td class="textC">4,000원</td>
                            <td class="textC">공연티켓 제시할 시 공연시간 포함 5시간 이내</td>
                        </tr>
                    </tbody>
                </table>
                <br>
                    <li><span class="fw_bold">무료개방일</span> : 어린이날(5월 5일), 시민의 날(10월 8일)</li>
                    <li><span class="fw_bold">주차요금 50% 감면 (중복할인 불가)</span><br>
                    - 장애인, 국가유공자(증명소지자), 경자동차(1000CC이하), 저공해차량(하이브리드, 전기차)</li>
                    <li>외부 월 정기주차 차량의 경우 주차장운영 사정에 따라 신청이 제한 될 수 있습니다.</li>
                <h4 class="hbul">#주차요금 사전정산 안내</h4>
                <p>주차요금 사전정산은 공연 종류 후 내방객들의 차량이 일시에 출차되어 귀가가 지체되는 불편을 해소하기 위해 공연관람을 기다리는 시간을 이용하여 주차요금을 미리 정산하는 제도를 실시하고 있습니다.
                </p>
                <li><span class="fw_bold">사전정산 방법</span> : 차량을 주차하신 후 해당 공연장 무인정산기에서 공연 관람전, 인터미션 시간대에 주차요금을 정산하시면 됩니다.</li>
                <li><span class="fw_bold">무인정산기 위치</span> : 1층 로비, 지하 1층 주차장
                </li>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    
    <script>
 
    </script>
</body>
</html>
