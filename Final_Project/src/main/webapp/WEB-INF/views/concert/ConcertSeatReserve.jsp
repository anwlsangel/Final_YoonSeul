<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seat Reservation</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style>

    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
    }
    select, input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    button {
        width: 100%;
        padding: 10px;
        background-color: #810000;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }
    button:hover {
        background-color: #630000;
    }
</style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
	<div class="seat" style="width: 100%; height: 800px">
		여긴 아마 좌석이 들어갈 예정
	</div>
    <h2>티켓 예약</h2>
    
    <form action="payment.co" method="post">
        <div class="form-group">
            <label for="ticketQuantity">티켓 수량:</label>
            <select id="ticketQuantity" name="ticketQuantity">
                <option value="1">1장</option>
                <option value="2">2장</option>
                <option value="3">3장</option>
                <option value="4">4장</option>
                <option value="5">5장</option>
            </select>
        </div>

        <div class="form-group">
            <label for="totalPrice">총 가격:</label>
            <input type="number" id="totalPrice" name="totalPrice" value="20000" readonly>
        </div>
        <button type="submit">결제하기</button>
    </form>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>