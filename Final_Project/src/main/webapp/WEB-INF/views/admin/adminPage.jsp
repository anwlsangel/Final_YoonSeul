<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<!--google chart-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>윤슬아트홀</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- 구글차트 api 라이브러리 연동 (cdn) -->
<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
   <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<style>
    #sb-btn{
        display: flex;
        justify-content: end;
    }
    #hh {
        color: rgb(150, 214, 177) !important;
    }

    .chart {
        display: inline-block;
        width: 90%;
        margin: 30px;
        vertical-align: top;
    }
    
    #sales_volume,
    #sales,
    #member_age,
    #member_gender {
        height: 500px;
    }
</style>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
        
        <jsp:include page="../common/adminNav.jsp" />
       
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            
            <!-- Main Content -->
            <div id="content">
            
             
            <jsp:include page="../common/adminTop.jsp" />
            

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800"></h1>
                    <p class="mb-4"></p>
                    
                    <div class="charts" align="center">
                        <div class="chart">
                            <h1>판매량 통계</h1>
                            <div id="concert_sales"></div>
                            <br><br>
    
                        </div>
                        <div class="chart">
                            <h1>회원 통계</h1>
                            <div id="member_age"></div>
                            <br><br>
                            <div id="member_enroll"></div>
                            <br><br>
                        </div>
                    </div>
                    
                    <script>
                        $(function() {
                            console.log(${mlist});
                            console.log(${slist});
                        });

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
                                    title: '회원 연령대 비율',
                                    colors: ['#3366CC', '#DC3912', '#FF9900', '#109618']
                                };

                                // 그래프를 그려넣을 요소 선택 후 데이터, 옵션을 매개변수로 넣어 그리기
                                var chart = new google.visualization.PieChart(document.getElementById('member_age'));
                                chart.draw(data, options);
                            }
                            
                            
                         // ----- 세로막대그래프 그리기 -----
                            google.charts.load('current', {'packages':['corechart']});
                            google.charts.setOnLoadCallback(drawBar1);

                            function drawBar1() {
                                // 그래프 상에 표현할 데이터
                                var data = google.visualization.arrayToDataTable([
                                    ['월', '회원가입 수', { role: 'style' }],
                                    ['1', ${empty mlist[0].enrollCount ? 0 :mlist[0].enrollCount}, '#3366CC'],
                                    ['2', ${empty mlist[1].enrollCount ? 0 :mlist[1].enrollCount}, '#DC3912'],
                                    ['3', ${empty mlist[2].enrollCount ? 0 :mlist[2].enrollCount}, '#FF9900'],
                                    ['4', ${empty mlist[3].enrollCount ? 0 :mlist[3].enrollCount}, '#109618'],
                                    ['5', ${empty mlist[4].enrollCount ? 0 :mlist[4].enrollCount}, '#990099'],
                                    ['6', ${empty mlist[5].enrollCount ? 0 :mlist[5].enrollCount}, '#0099C6'],
                                    ['7', ${empty mlist[6].enrollCount ? 0 :mlist[6].enrollCount}, '#DD4477'],
                                    ['8', ${empty mlist[7].enrollCount ? 0 :mlist[7].enrollCount}, '#66AA00'],
                                    ['9', ${empty mlist[8].enrollCount ? 0 :mlist[8].enrollCount}, '#B82E2E'],
                                    ['10',${empty mlist[9].enrollCount ? 0 :mlist[9].enrollCount}, '#316395'],
                                    ['11',${empty mlist[10].enrollCount ? 0 :mlist[10].enrollCount}, '#994499'],
                                    ['12',${empty mlist[11].enrollCount ? 0 :mlist[11].enrollCount}, '#22AA99']
                                ]);

                                var view = new google.visualization.DataView(data);
                                view.setColumns([0, 1,
                                                 { calc: "stringify",
                                                   sourceColumn: 1,
                                                   type: "string",
                                                   role: "annotation" },
                                                 2]);

                                // 월별 회원 가입 수 
                                // 그래프 그리기 옵션
                                var options = {
                                    title: '월별 회원가입 수',
                                    subtitle: '2024년',
                                    height: 300,
                                    bar: { groupWidth: "95%" },
                                    legend: { position: "none" },
                                };

                                // 그래프를 그려넣을 요소 선택 후 데이터, 옵션을 매개변수로 넣어 그리기
                                var chart = new google.visualization.ColumnChart(document.getElementById('member_enroll'));
                                chart.draw(view, options);
                            }
                            
                         // ----- 세로막대그래프 그리기 -----
                            google.charts.load('current', {'packages':['corechart']});
                            google.charts.setOnLoadCallback(drawBar2);

                            function drawBar2() {
                                // 그래프 상에 표현할 데이터
                                var data = google.visualization.arrayToDataTable([
                                    ['월', '매출(원)', { role: 'style' }],
                                    ['1', ${empty slist[0].enrollCount ? 0 :slist[0].enrollCount}, '#3366CC'],
                                    ['2', ${empty slist[1].enrollCount ? 0 :slist[1].enrollCount}, '#DC3912'],
                                    ['3', ${empty slist[2].enrollCount ? 0 :slist[2].enrollCount}, '#FF9900'],
                                    ['4', ${empty slist[3].enrollCount ? 0 :slist[3].enrollCount}, '#109618'],
                                    ['5', ${empty slist[4].enrollCount ? 0 :slist[4].enrollCount}, '#990099'],
                                    ['6', ${empty slist[5].enrollCount ? 0 :slist[5].enrollCount}, '#0099C6'],
                                    ['7', ${empty slist[6].enrollCount ? 0 :slist[6].enrollCount}, '#DD4477'],
                                    ['8', ${empty slist[7].enrollCount ? 0 :slist[7].enrollCount}, '#66AA00'],
                                    ['9', ${empty slist[8].enrollCount ? 0 :slist[8].enrollCount}, '#B82E2E'],
                                    ['10',${empty slist[9].enrollCount ? 0 :slist[9].enrollCount}, '#316395'],
                                    ['11',${empty slist[10].enrollCount ? 0 :slist[10].enrollCount}, '#994499'],
                                    ['12',${empty slist[11].enrollCount ? 0 :slist[11].enrollCount}, '#22AA99']
                                ]);

                                var view = new google.visualization.DataView(data);
                                view.setColumns([0, 1,
                                                 { calc: "stringify",
                                                   sourceColumn: 1,
                                                   type: "string",
                                                   role: "annotation" },
                                                 2]);

                                // 그래프 그리기 옵션
                                var options = {
                                    title: '월별 매출 현황',
                                    subtitle: '2024년',
                                    height: 300,
                                    bar: { groupWidth: "95%" },
                                    legend: { position: "none" },
                                };

                                // 그래프를 그려넣을 요소 선택 후 데이터, 옵션을 매개변수로 넣어 그리기
                                var chart = new google.visualization.ColumnChart(document.getElementById('concert_sales'));
                                chart.draw(view, options);
                            } 
                        };
                    </script>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>
</html>
