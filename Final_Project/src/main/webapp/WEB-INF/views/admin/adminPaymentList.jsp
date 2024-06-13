<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<!--google chart-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
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
        width: 40%;
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
                    
                    <div>
                    	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    		<thead>
                    			<tr>
                    				<th>주문번호</th>
                    				<th>공연</th>
                    				<th>총 결제금액</th>
                    				<th>결제일</th>
                    				<th>환불일</th>
                    				<th>주문자</th>
                    				<th>상태</th>
                    			</tr>
                    		</thead>
                    		<tbody>
                    		<c:forEach var="item" items="${requestScope.list}">
                    			<tr>
                    				<td>${item.buyListId}</td>
                    				<td>${item.reserveConcertId}</td>
                    				<td>${item.reserveSum}</td>
                    				<td>${item.reservePayment}</td>
                    				<c:choose>
                    					<c:when test="${empty item.reserveRefund}">
                    						<td>X</td>
                    					</c:when>
                    					<c:otherwise>
                    						<td>${item.reserveRefund}</td>
                    					</c:otherwise>
                    				</c:choose>
                    				<td>${item.userId}</td>
                    				<c:choose>
                    					<c:when test="${item.status eq 0}">
                    						<td style="color: red;">환불 완료</td>
                    					</c:when>
                    					<c:when test="${item.status eq 1}">
                    						<td style="color: green;">결제 완료</td>
                    					</c:when>
                    					<c:otherwise>
                    						<td style="color: blue;">환불 요청</td>
                    					</c:otherwise>
                    				</c:choose>
                    			</tr>
                    		</c:forEach>
                    		</tbody>
                    	</table>
                    </div>
                    

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
    
    <script>
    	$(function(){
    		$(".delete-parking").click(function () {
    			let carNo = $(this).parent().prev().prev().children().text().trim();
    			$(".modal-body>.carNo").attr("value", carNo);
				
			});
    		
    	});
    </script>

</body>
</html>