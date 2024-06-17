<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DN Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="<%= request.getContextPath() %>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%= request.getContextPath() %>/resources/css/sb-admin-2.min.css" rel="stylesheet">
           	
    <!-- Bootstrap core JavaScript-->
    <script src="<%= request.getContextPath() %>/resources/vendor/jquery/jquery.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%= request.getContextPath() %>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%= request.getContextPath() %>/resources/js/sb-admin-2.min.js"></script>
   
    <style>
        #dd{
            background-color:#810000;
        }

        #accordionSidebar{
            background-color:#810000;
        }
    </style>
    

</head>
<body id="page-top">
	
	<div id="wrapper">
	
		<!-- Sidebar -->
        <ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>" id="dd">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">YOONSEUl Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/adminPage.ad">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                	회원 관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="" data-toggle="collapse" data-target="#member"
                	aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-laugh-beam"></i>
                    <span>회원 관리</span>
                </a>
                <div id="member" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="AdMemberList.me">회원 전체 조회</a>
                    </div>
                </div>
            </li>
            
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                	공연 관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="" data-toggle="collapse" data-target="#product"
                	aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-laugh-beam"></i>
                    <span>공연 관리</span>
                </a>
                <div id="product" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="">공연 추가</a>
                        <a class="collapse-item" href="AdConcertList.co">공연 목록조회</a>
                        <a class="collapse-item" href="">공연 일정(캘린더)</a>
                    </div>
                </div>
            </li>
            
            <hr class="sidebar-divider">
            
            <!-- Heading -->
            <div class="sidebar-heading">
                	게시판 및 후기
            </div>
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="" data-toggle="collapse" data-target="#board"
                	aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-laugh-beam"></i>
                    <span>게시판 관리</span>
                </a>
                <div id="board" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"></h6>
                        <a class="collapse-item" href="">공지사항</a>
                        <a class="collapse-item" href="">유실물</a>
                        <a class="collapse-item" href="">관람후기</a>
                        <a class="collapse-item" href="">Q&A</a>
                    </div>
                </div>
                </li>
            
			<hr class="sidebar-divider">
		

            <!-- Heading -->
            <div class="sidebar-heading">
                	예매 내역 관리
            </div>
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="" data-toggle="collapse" data-target="#Subscribe"
                	aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-laugh-beam"></i>
                    <span>예매 내역 관리</span>
                </a>
                <div id="Subscribe" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="">예매 내역 조회</a>
                        <a class="collapse-item" href="">티켓 상세 조회</a>
                        <a class="collapse-item" href="">환불</a>
                    </div>
                </div>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">
            </li>


            <!-- Heading -->
            <div class="sidebar-heading">
                                  결제 관리
            </div>

             <!-- Nav Item - Pages Collapse Menu -->
             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#parking-ad-menu"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-hashtag"></i>
                    
                    <span>결제 관리</span>
                </a>
                <div id="parking-ad-menu" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">결제 관리 기능 :</h6>
                        <a class="collapse-item" href="selectPaymentList.ad">결제 내역 조회</a>
                        <a class="collapse-item" href="adminRefund.ad">환불 관리</a>
                    </div>
                </div>
            </li>
			
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            
            <!-- Heading -->
            <div class="sidebar-heading">
               	 통계 조회
            </div>
            
            <!-- Nav Item - Pages Collapse Menu -->
             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#select-avg-menu"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-chart-bar"></i>
                    
                    <span>매출 통계</span>
                </a>
                <div id="select-avg-menu" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">통계 조회 :</h6>
                        <a class="collapse-item" href="">상품별 판매량 조회</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#select-visit-menu"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-chart-bar"></i>
                    
                    <span>방문자 통계</span>
                </a>
                <div id="select-visit-menu" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"> 방문 통계 :</h6>
                        <a class="collapse-item" href="">일일방문자 수 조회</a>
                    </div>
                </div>
            </li>
            
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            
            

        </ul>
        <!-- End of Sidebar -->
	
	</div>
	

    
    


</body>
</html>