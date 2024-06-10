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
            background-color: rgb(150, 214, 177);
        }

        #accordionSidebar{
            background-color: rgb(150, 214, 177);
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
                <div class="sidebar-brand-text mx-3">SALAGO Admin</div>
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
                        <a class="collapse-item" href="<%= request.getContextPath() %>/memberList.ad">회원 전체 조회</a>
                    </div>
                </div>
            </li>
            
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                상품 관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="" data-toggle="collapse" data-target="#product"
                	aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-laugh-beam"></i>
                    <span>상품 관리</span>
                </a>
                <div id="product" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="<%= request.getContextPath() %>/selectProduct">상품 관리</a>
                    </div>
                </div>
            </li>
            
			<hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                구독 관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="" data-toggle="collapse" data-target="#Subscribe"
                	aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-laugh-beam"></i>
                    <span>구독 관리</span>
                </a>
                <div id="Subscribe" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="<%= request.getContextPath() %>/management.sub?pn=1">구독 상품 전체 조회</a>
                    </div>
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="<%= request.getContextPath() %>/adminSubForm.sub?pn=1">구독 조회</a>
                    </div>
                </div>
                
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">
			
            <!-- Heading -->
            <div class="sidebar-heading">
                블랙리스트
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="" data-toggle="collapse" data-target="#blacklist"
                	aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-laugh-beam"></i>
                    <span>블랙리스트 관리</span>
                </a>
                <div id="blacklist" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"></h6>
                        <a class="collapse-item" href="<%= request.getContextPath() %>/select.me">블랙리스트 등록/해지</a>
                        <a class="collapse-item" href="<%= request.getContextPath() %>/blacklist.ad">블랙리스트 조회</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">


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
                        <a class="collapse-item" href="<%= request.getContextPath() %>/orderList.ad">결제 내역 조회</a>
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
                        <a class="collapse-item" href="<%= request.getContextPath() %>/salesVolume.ad">상품별 판매량 조회</a>
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
                        <h6 class="collapse-header">통계 조회 :</h6>
                        <a class="collapse-item" href="">일일방문자 수 조회</a>
                    </div>
                </div>
            </li>
            <!-- Heading -->
            <div class="sidebar-heading">
                게시판
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
                        <a class="collapse-item" href="<%= request.getContextPath() %>/noticeList.ad">공지사항</a>
                        <a class="collapse-item" href="<%= request.getContextPath() %>/eventList.ad">이벤트</a>
                    </div>
                </div>
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