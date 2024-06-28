<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>윤슬아트홀</title>
<style>
body {
        background-color: #F4F4F4;
        margin: 0;
        padding: 0;
    }

    /* div {
        border: 1px solid red;
    } */

    .outer {
        max-width: 1000px;
        margin: 20px auto;
        margin-top: 120px;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        min-height: calc(100vh - 160px);
        /* 화면 높이에서 헤더와 푸터를 제외한 높이 설정 */
        position: relative;
    }

    hr {
        border: 0;
        height: 6px;
        background-color: #810000;
        width: 80%;
    }


    /* .reservation-container{
        display: block; 
        margin: 0 auto;
        width: 1000px;
       background-color: white;

    } */

    #t-area {
        width: 850px;
        height: 400px;
        text-align: center;
        /* border: 1px solid gray; */
        border-collapse: collapse;
    }

    #t-area th,
    td {
        border-bottom: 1px gray solid;
        border-left: 1px gray solid;
        border-right: 1px gray solid;
        /* box-sizing: border-box; */
    }

    #t-area thead {
        background-color: #630000;
        color: white;
        font-size: 15px;
    }

    #cctv input {
        box-sizing: border-box;
        width: 400px;
        height: 40px;
        /*
        background-color: #EEEBDD;
        border-style: none;
        */
        /* border-style: solid;
        border-color: #810000; */
        /*border-radius: 5px;*/
        border: none;
        outline: none;
        border-bottom: 1px solid #EEEBDD;
        color: black;
    }

    #cctv>h1 {
        margin-left: 40px;
    }

    .cctv_1 a {
        text-decoration: none;
        color: #fff;
        background-color: #404040;
        font-size: 0.9em;
        line-height: 1.2em;
        padding: 4px 10px 4px 10px;
        margin: 0;
        margin-left: 550px;
    }

    .cctv_top {
        text-align: left;
        width: 850px;
        margin-left: 65px;
    }
</style>
</head>
<body>

<jsp:include page="../common/header.jsp" />
<!-- 영상정보 처리 기기 운영 -->

<div class="outer">
            <div id="cctv">

                <h1 align="left" style="color: #810000 ">
                   	 영상정보처리기기 운영/관리 방침
                </h1>

				<br><br>
                <div class="cctv_top" align="center">
                    <h3> ◼ 영상정보처리기기 운영/관리 방침</h3>
                    <p>
                        윤슬아트홀은 시설물의 안전관리, 화재예방 도난방지, 보안관리(방범,방호)등의 목적으로 CCTV를 아래와 같이 설치 운영하고 있습니다.
                    </p>
                </div>
                <br>

                <p>
                    <span class="cctv_1">
                        <a href="">윤슬아트홀 영상정보처리기기 운영관리 방침 다운로드</a>
                    </span>
                </p>

                <br>
                <!--   아이사랑방 수유실(유아휴게실) 휠체어보유 윤슬카페 물품보관소 -->
                <form action="" method="post">
                    <table id="t-area" align="center">
                        <thead>
                            <tr>
                                <th rowspan="2" colspan="2">구분</th>
                                <th rowspan="2">관리부서</th>
                                <th rowspan="2">담당</th>
                                <th rowspan="2">전화</th>
                                <th rowspan="2">설치 수량</th>
                                <th colspan="2">설치 목적</th>
                                <th rowspan="2">비고</th>
                            </tr>
                            <tr>
                                <th style="width: 100px;">1차분류</th>
                                <th>2차분류</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td rowspan="3">공연장</td>
                                <td>좌석홀</td>
                                <td>안전시설팀</td>
                                <td>소방담당</td>
                                <td>783-8125</td>
                                <td>40</td>
                                <td>안전관리</td>
                                <td>시설물관리</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>스탠딩홀</td>
                                <td>안전시설팀</td>
                                <td>소방담당</td>
                                <td>783-8125</td>
                                <td>30</td>
                                <td>안전관리</td>
                                <td>시설물관리</td>
                                <td></td>
                            </tr>
                            <tr style="background-color: #f1f0ea;">
                                <td></td>
                                <td>계</td>
                                <td></td>
                                <td></td>
                                <td>70</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td rowspan="6">편의 시설</td>
                                <td>아이사랑방</td>
                                <td>안전시설팀</td>
                                <td>소방담당</td>
                                <td>783-8125</td>
                                <td>5</td>
                                <td>안전관리</td>
                                <td>시설물관리</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>수유실(유아휴게실)</td>
                                <td>안전시설팀</td>
                                <td>소방담당</td>
                                <td>783-8125</td>
                                <td>20</td>
                                <td>안전관리</td>
                                <td>시설물관리</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>휠체어 보유</td>
                                <td>안전시설팀</td>
                                <td>소방담당</td>
                                <td>783-8125</td>
                                <td>10</td>
                                <td>안전관리</td>
                                <td>시설물관리</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>물품보관소</td>
                                <td>안전시설팀</td>
                                <td>소방담당</td>
                                <td>783-8125</td>
                                <td>40</td>
                                <td>안전관리</td>
                                <td>시설물관리</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>윤슬 카페</td>
                                <td>안전시설팀</td>
                                <td>소방담당</td>
                                <td>783-8125</td>
                                <td>30</td>
                                <td>안전관리</td>
                                <td>시설물관리</td>
                                <td></td>
                            </tr>
                            <tr style="background-color: #f1f0ea;">
                                <td></td>
                                <td>계</td>
                                <td></td>
                                <td></td>
                                <td>105</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td rowspan="3">기타 시설</td>
                                <td>지하주차장</td>
                                <td>안전시설팀</td>
                                <td>소방담당</td>
                                <td>783-8125</td>
                                <td>50</td>
                                <td>안전관리</td>
                                <td>시설물관리</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>사무동</td>
                                <td>안전시설팀</td>
                                <td>소방담당</td>
                                <td>783-8125</td>
                                <td>10</td>
                                <td>안전관리</td>
                                <td>시설물관리</td>
                                <td></td>
                            </tr>
                            <tr style="background-color: #f1f0ea;">
                                <td></td>
                                <td>계</td>
                                <td></td>
                                <td></td>
                                <td>60</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                        </tbody>
                    </table>
                    <br>
                </form>

                <br><br>

            </div>
</div>
<jsp:include page="../common/footer.jsp" />

</body>
</html>