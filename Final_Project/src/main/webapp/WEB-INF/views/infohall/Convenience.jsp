<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>윤슬아트홀</title>
    <style>
    .outer {
        width: 1000px;
        /*border: 1px solid red;*/
        margin: auto;
        margin-top: 90px;
    }
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

    /*-----------------------*/

    .guide-title {
        height: 50px;
        text-align: left;
        font-size: 20px;
        color: #810000;
    }

    .guide-text {
        padding: 15px;
    }

    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <div class="outer">
        <div class="container" align="center">
            <br><br>
            <div style="width: 500px; height: 50px; background-color: #810000; margin: auto; border-radius: 15px;">
                <p align="center" style="padding-top: 12px; font-size: 17px; color: white;">편의 시설 안내</p>
            </div>
            <br><br>

            <table class="guide-area" border="0">
                <tr class="guide-title">
                    <th colspan="2">◼ 아이사랑방 (구 어린이 놀이방)</th>
                </tr>
                <tr>
                    <td style="width: 60%;">
                        <div class="guide-text">
                            &nbsp; 윤슬아트홀 1층에 마련된 아이사랑방은 공연 관람객의 편의를 위해 당일 공연 관람객에 한하여 사전 예약제로 운영하고 있습니다.
                            43.5㎡ 규모의 아이사랑방은 유아 및 어린이를 동반한 관객들을 위해 무료로 운영되며, 유아 전문교사들이 함께 하면서 놀이와 학습 등 다양한 프로그램을 통해 편안하고 안전하게 여러분의 자녀를 돌봐드립니다.
                            <br>
                            <ul>
                                <li><b>위치</b> : 윤슬아트홀 1층 매표소 맞은편</li>
                                <li><b>운영시간</b> : 공연 시작 1시간 전부터 공연 종료 후 30분까지</li>
                                <li><b>이용대상</b> : 당일 공연관람객 자녀 중 만 3세(36개월)~ 7세(미취학아동)</li>
                                <li><b>이용방법</b> : 사전예약(031-783-8000)</li>
                                <li><b>면적</b> : 43.5㎡</li>
                            </ul>
                        </div>
                    </td>
                    <td style="width: 40%;"><img src="https://www.snart.or.kr/web/images/sub/img_G060700_02.jpg" alt=""></td>
                </tr>
                <tr class="guide-title">
                    <th colspan="2"><br><hr><br>◼ 수유실 (유아휴게실)</th>
                </tr>
                <tr>
                    <td>
                        <div class="guide-text">
                            &nbsp; 윤슬아트홀 수유가 필요한 아기와 엄마를 위하여 수유실(유아휴게실)을 운영하고 있습니다.
                            <ul>
                                <li><b>위치</b> : 윤슬아트홀 1층 어린이 놀이방 맞은편</li>
                                <li><b>운영시간</b> : 오전 10:00 ~ 공연 종료 후</li>
                                <li><b>이용대상</b> : 공연, 전시 관람객 및 아카데미 수강생 중 영아를 동반한 어머니</li>
                                <li><b>면적</b> : 약 13㎡</li>
                                <li><b>수용인원</b> : 2~3명 동시 이용가능</li>
                                <li><b>주요시설</b> : 수유공간, 기저귀 교환대 등</li>
                            </ul>
                        </div>
                    </td>
                    <td><img src="https://www.snart.or.kr/web/images/sub/img_G060700_03.jpg" alt=""></td>
                </tr>
                <tr class="guide-title">
                    <th colspan="2"><br><hr><br>◼ 휠체어 보유</th>
                </tr>
                <tr>
                    <td>
                        <div class="guide-text">
                            &nbsp; 윤슬아트홀은 물품보관소에 휠체어 4개를 보유하고 있습니다.
                            <ul>
                                <li><b>위치</b> : 윤슬아트홀 1층 물품보관소</li>
                            </ul>
                        </div>
                    </td>
                    <td><img src="https://www.snart.or.kr/web/images/sub/img_gogo0508.gif" alt=""></td>
                </tr>
                <tr class="guide-title">
                    <th colspan="2"><br><hr><br>◼ 물품보관소</th>
                </tr>
                <tr>
                    <td>
                        <div class="guide-text">
                            &nbsp; 객석 내 가지고 들어 갈 수 없는 물품이나 꽃다발 등을 맡아드립니다. (귀중품 및 가방 제외)
                            <ul>
                                <li><b>운영시간</b> : 공연시작 40분 전 ~ 공연 종료 후 10분간</li>
                                <li><b>위치</b> : B1F 달빛홀 로비, 2F 별빛홀(1층 객석) 부출입구 옆</li>
                                <li><b>유의사항</b> : 물품보관소 운영시간 이후에도 찾아가지 않는 물품은 아트서비스존 (031-580-7900)에 이관되어 유실물로 처리됩니다. (단, 3개월 이상 된 유실물은 폐기처리 됩니다.)</li>
                            </ul>
                        </div>
                    </td>
                    <td><img src="https://www.guriart.or.kr/upload/ckeditor/1572235539484/20191028010539484.JPG" style="width: 370px;"></td>
                </tr>
                <tr class="guide-title">
                    <th colspan="2"><br><hr><br>◼ 카페 브람스 큐브</th>
                </tr>
                <tr>
                    <td>
                        <div class="guide-text">
                            &nbsp; 프리미엄 원두와 수제로 만들어 더욱 깊은 맛을 가진 전통차가 있는 카페 브람스 큐브입니다.
                            아이스크림이 올라가는 크로플과 간단한 식사대용의 머핀, 베이글, 프렛즐 등을 준비하였습니다.
                            윤슬아트홀의 즐겁고 소중한 추억을 카페 브람스 큐브가 함께하겠습니다.
                            <ul>
                                <li><b>위치</b> : 윤슬아트홀 1층</li>
                                <li><b>운영시간</b> : 08:30~22:00(공연 일정에 따라 변동 될 수 있음)</li>
                                <li><b>메뉴</b> : 하겐다즈, 커피, 프라프치노, 샌드위치, 케이크, 하겐다즈가 올라가는 와플, 허니버터브레드, 베이글 등등</li>
                                <li><b>규모</b> : 약 54석</li>
                                <li><b>예약 및 문의</b> : (031) 707-4391  </li>
                            </ul>
                        </div>
                    </td>
                    <td><img src="https://www.snart.or.kr/upload/smartEditor/2021_01_20_093710.jpg" alt=""></td>
                </tr>
            </table>

    </div>

</body>
</html>