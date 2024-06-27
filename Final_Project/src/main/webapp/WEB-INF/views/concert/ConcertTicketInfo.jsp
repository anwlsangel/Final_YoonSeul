<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${concert.concertName} - Concert Information</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .concert-info {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            background-color: #fff;
        }
        .concert-info h3 {
            margin-bottom: 15px;
        }
        .concert-info img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 concert-info">
                <h3>${concert.concertName}</h3>                
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th scope="row">나이제한</th>
                            <td>${concert.ageLimit}</td>
                        </tr>
                        <tr>
                            <th scope="row">가격</th>
                            <td>${concert.price}</td>
                        </tr>
                        <tr>
                            <th scope="row">공연시간</th>
                            <td>${concert.playTime}</td>
                        </tr>
                        <tr>
                            <th scope="row">공연일시</th>
                            <td>${concert.fullDate}</td>
                        </tr>
                        <tr>
                            <th scope="row">장르</th>
                            <td>${concert.category}</td>
                        </tr>
                        <tr>
                            <th scope="row">공연장</th>
                            <td>${concert.holeName}</td>
                        </tr>
                    </tbody>
                </table>
                <img src="${concert.detailRoot}" alt="Thumbnail" class="img-fluid mb-3">
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
