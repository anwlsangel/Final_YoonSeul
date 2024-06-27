<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>검수</title>
<script src="https://unpkg.com/@zxing/library@latest/umd/index.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
#video-container {
	position: relative;
}

#video, #canvas {
	position: absolute;
	top: 0;
	left: 0;
}

#checkButton {
	margin-top: 10px;
}

@media (max-width: 768px) {
	#video-container {
		width: 100%;
		height: auto;
		padding-top: 100%;
	}

	#video, #canvas {
		width: 100%;
		height: 100%;
	}
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12">
				<div id="video-container"
					class="bg-light rounded d-flex align-items-center justify-content-center"
					style="border: 2px solid gray; overflow: hidden;">
					<video id="video" style="object-fit: cover;"></video>
					<canvas id="canvas" style="object-fit: cover; display: none;"></canvas>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-12">
				<button id="switchButton" class="btn btn-primary m-2 w-100">화면전환</button>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-12">
				<div id="Info"></div>
				<div id="checkButton"></div>
			</div>
		</div>
	</div>

	<script>
        const switching = document.getElementById("switchButton");
        const video = document.getElementById("video");
        const canvas = document.getElementById("canvas");
        const info = document.getElementById("Info");
		const root = 'https://${pageContext.request.serverName}${pageContext.request.contextPath}'
        let i = 0;
        let lastResult = "";

        //카메라 관련 함수
        window.addEventListener('load', function () {
            let selectedDeviceId;
            const codeReader = new ZXing.BrowserMultiFormatReader()
            codeReader.listVideoInputDevices().then((videoInputDevices) => {
                let numOfCamera = videoInputDevices.length;
                if (numOfCamera < 1) {
                    alert("카메라가 있는 디바이스로 접속해주세요")
                    return;
                }
                selectedDeviceId = videoInputDevices[i].deviceId;
                function startDecoding() {
                    codeReader.decodeFromVideoDevice(selectedDeviceId, 'video', (result, err) => {
                        if (result) {
                            if (result.text != lastResult) {
                                lastResult = result.text;
                                let urlQr = root + "/ticketValidation";
                                $.ajax({
                                    url: urlQr,
                                    type: "post",
                                    data: { qr: result.text.split('qr=')[1] },
                                    success: function (data) {
                                        canvas.width = video.offsetWidth;
                                        canvas.height = video.offsetHeight;
                                        canvas.getContext('2d').drawImage(video, 0, 0, video.offsetWidth, video.offsetHeight, 0, 0, video.offsetWidth, video.offsetHeight);
                                        canvas.style.display = "block";
                                        info.style.display = "block";
                                        $("#video-container").css({ "border-color": "#26abff", "border-width": "5px" });
                                        setTimeout(() => $("#video-container").css({ "border-color": "gray", "border-width": "2px" }), 1000);
                                        setTimeout(() => canvas.style.display = "none", 1000);
                                        if (!data) {
                                            alert("비정상적인 티켓입니다.");
                                            return;
                                        }
                                        let enterStatus = (data.status > 3) ? "입장완료" : "미입장";
                                        let enterStatusText = (data.status > 3) ? "입장완료" : "미입장";
                                        document.getElementById("Info").innerHTML = `
                                            <h3>\${data.concertName}</h3>
                                            <p><strong>공연일시:</strong> \${data.date}</p>
                                            <p><strong>좌석:</strong> \${data.seat}</p>
                                            <p><strong>공연장:</strong> \${data.holeName}</p>
                                            <p><strong>QR 코드:</strong> \${data.qr}</p>
                                            <p id="enterP"><strong>확인:</strong> \${enterStatus}</p>
                                        `;
                                        if (enterStatus === "미입장") {
                                            let button = document.createElement("button");
                                            button.setAttribute("type", "button");
                                            button.textContent = "입장처리";
                                            button.onclick = function () {
                                                changeStatus(data.qr);
                                            };
                                            document.getElementById("checkButton").innerHTML = "";
                                            document.getElementById("checkButton").appendChild(button);
                                        }
                                    },
                                    error: function (xhr, status, error) {
                                        console.error("AJAX Error: ", status, error);
                                        alert("AJAX Error: " + status + ", " + error);
                                    }
                                });
                            }
                        }
                        if (err && !(err instanceof ZXing.NotFoundException)) {
                            console.error(err);
                        }
                    });
                }
                switching.addEventListener('click', () => {
                    i++;
                    codeReader.reset();
                    if (i === numOfCamera) {
                        i = 0;
                        selectedDeviceId = videoInputDevices[i].deviceId;
                    } else {
                        selectedDeviceId = videoInputDevices[i].deviceId;
                    }
                    startDecoding();
                });
                startDecoding();
            }).catch((err) => { console.error(err); });
        });

        function changeStatus(qr) {
            $.ajax({
                url: root+"/changeStatusTickt?qr=" + qr,
                type: "GET",
                success: function (data) {
                    if (data > 0) {
                        document.getElementById("enterP").innerHTML = "<strong>확인:</strong> 입장완료";
                        document.getElementById("checkButton").innerHTML = "";
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX Error: ", status, error);
                    alert("AJAX Error: " + status + ", " + error);
                }
            });
        }
    </script>
</body>
</html>
