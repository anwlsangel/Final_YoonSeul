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
<title>윤슬아트홀</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- 구글차트 api 라이브러리 연동 (cdn) -->
<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
                    				<th width="15%">결제일</th>
                    				<th>주문번호</th>
                    				<th>공연</th>
                    				<th>총 결제금액</th>
                    				<th>주문자</th>
                    				<th width="12%">관리</th>
                    			</tr>
                    		</thead>
                    		<tbody>
                    		<c:choose>
                    			<c:when test="${empty requestScope.list}">
                    				<tr>
                    					<td colspan="7">환불 요청된 주문이 없습니다.</td>
                    				</tr>
                    			</c:when>
                    			<c:otherwise>
                    				<c:forEach var="item" items="${requestScope.list}">
		                    			<tr>
		                    				<td>${item.reservePayment}</td>
		                    				<td>${item.buyListId}</td>
		                    				<td>${item.reserveConcertId}</td>
		                    				<td>${item.reserveSum}</td>
		                    				<td>${item.userId}</td>
		                    				<td>
		                    					<button class="btn btn-primary" onclick="accept('${item.buyListId}');">승인</button>
		                    					<button class="btn btn-danger" onclick="reject('${item.buyListId}');">거부</button>
		                    				</td>
		                    			</tr>
		                    		</c:forEach>
                    			</c:otherwise>
                    		</c:choose>
                    		</tbody>
                    	</table>
                    	
                    	<script>
	                    	//환불
	                    	const apiKey = "5866740403361550";
					    	const apiSecret = "to3dw2Xf52rRV7SYFFwqjbf4KLDbn3j9XAmfB8cmwmchALntKB6aj7rbQ9Buy6cFuwSB48lnRSlFFWfp";
					    	//let buyListId = "${requestScope.bl.buyListId}";
					    	let buyListId = "";
					    	let token = "";
					    	
					    	//좌석 상태 변경 (구매가능)
					    	function deleteTicket(id) {
					    		$.ajax({
					    			url: "deleteTicket.pa",
					    			type: "post",
					    			data: { buyListId: id },
					    			success: function() { console.log("ticket 삭제 성공"); },
					    			error: function() { console.log("ticket 삭제 실패"); }
					    		});
					    	}
					    	
	    			    	function refund() {
	    			    		console.log("환불 요청...");
	    			    		$.ajax({
	    			    			url: "refund.pa",
	    			    			type: "post",
	    			    			data: {
	    			    				access_token: token,
	    			    				merchant_uid: buyListId, //BUYLIST_ID
	    			    				reason: "환불사유" //환불사유
	    			    			},
	    			    			success: function(result) {
	    			    				//좌석 상태 변경 (구매가능)
	    			    				deleteTicket(buyListId);
	    			    				console.log("환불 성공");
	    			    				alert("환불되었습니다.");
	    			    				location.reload(true);
	    			    			},
	    			    			error: function() {
	    			    				console.log("환불 ajax 통신 실패");
	    			    			}
	    			    		});
	    			    	}
	    			    	
	    			    	//access token 발급
	    			    	function getToken() {
	    			    		console.log("access token 발급 요청...");
	    			    		$.ajax({
	    			    			url: "getToken.pa",
	    			    			type: "post",
	    			    			data: {
	    			    				apiKey: apiKey,
	    			    				apiSecret: apiSecret
	    			    			},
	    			    			success: function(response) {
	    			    				//console.log(response);
	    			    				token = response;
	    			    				console.log("access token 발급 성공");
	    			    				refund();
	    			    			},
	    			    			error: function() {
	    			    				console.log("access token 발급 ajax 통신 실패")
	    			    			}
	    			    		});
	    			    	}
	    			    	
	    			    	//환불 승인
                    		function accept(id) {
                    			if(confirm("환불 승인하시겠습니까?")) {
                    				buyListId = id;
                    				getToken();
                    			}
                    		}
	    			    	
	    			    	//환불 거부
	    			    	function reject(id) {
	    			    		if(confirm("환불 거부하시겠습니까?")) {
	    			    			buyListId = id;
	    			    			$.ajax({
	    			    				url: "rejectRefund.pa",
	    			    				type: "post",
	    			    				data: {buyListId: buyListId},
	    			    				success: function(result) {
	    			    					if(result > 0) {
	    			    						alert("환불 거부되었습니다.");
	    			    						location.reload(true);
	    			    					} else {
	    			    						console.log("환불 거부 실패");
	    			    					}
	    			    				},
	    			    				error: function() { console.log("환불 거부 ajax 통신 실패"); }
	    			    			});
	    			    		}
	    			    	}
                    	</script>
                    	
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

</body>
</html>