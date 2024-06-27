<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>검수</title>
<script src="https://unpkg.com/@zxing/library@latest/umd/index.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<style>
#video-container {
	position: relative;
}

#video, #canvas {
	position: absolute;
	top: 0;
	left: 0;
}
</style>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
</head>
<body>
	<!-- 스캐너박스 -->
	<div class="container-fluid pt-4 px-4" style="width: 100%; height: 40%">
		<div class="row g-4" style="height: 100%">
			<div class="col-sm-12 col-xl-12" style="height: 100%">
				<div id="video-container"
					class="bg-light rounded d-md-flex align-items-center p-4"
					style="height: 100%; border: 2px solid gray; overflow: hidden;">
					<video id="video" style="object-fit: cover;"></video>
					<canvas id="canvas" style="object-fit: cover; display: none;"></canvas>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid pt-4 px-4">
		<div class="row g-4">
			<div class="col-sm-12 col-xl-12">
				<button id="switchButton" class="btn btn-primary m-2 w-100"
					style="margin: 0 !important; margin-top: 0.4em !important">화면전환</button>
			</div>
			<!-- 확인 결과 -->
			<div id="Info" class="col-12" style="display: none"></div>
		</div>
	</div>



	<script>
            const switching = document.getElementById("switchButton");
            const video = document.getElementById("video");
            const canvas = document.getElementById("canvas");
            const info = document.getElementById("Info");

            let i = 0;
            let lastResult = "";

            //카메라 관련 함수
            window.addEventListener('load', function () {
                let selectedDeviceId;
                const codeReader = new ZXing.BrowserMultiFormatReader()
                codeReader.listVideoInputDevices().then((videoInputDevices) => {
                    let numOfCamera = videoInputDevices.length;
                    if (numOfCamera > 1) {
                        alert("카메라가 있는 디바이스로 접속해주세요")
                        window.history.back();
                    }
                    selectedDeviceId = videoInputDevices[i].deviceId
                    switching.addEventListener('click', () => {
                        i++;
                        codeReader.reset();
                        if (i == numOfCamera) {
                            i = 0;
                            selectedDeviceId = videoInputDevices[i].deviceId;
                        } else {
                            selectedDeviceId = videoInputDevices[i].deviceId;
                        }
                        codeReader.decodeFromVideoDevice(selectedDeviceId, 'video', (result, err) => {
                            if (result) {
                                if (result.text != lastResult) {
                                    lastResult = result.text;
                                    let urlId = "ticketValidation?qr=" + result.text.split('qr=')[1]
                                    $.ajax({
                                        url: urlId,
                                        type: "GET",
                                        success: function (data) {
                                            canvas.width = video.offsetWidth;
                                            canvas.height = video.offsetHeight;
                                            canvas.getContext('2d').drawImage(video, 0, 0, video.offsetWidth, video.offsetHeight, 0, 0, video.offsetWidth, video.offsetHeight);
                                            canvas.style.display = "block";
                                            info.style.display = "block";
                                            $("#video-container").css({ "border-color": "#26abff", "border-width": "5px" });
                                            setTimeout(() => $("#video-container").css({ "border-color": "gray", "border-width": "2px" }), 1000);
                                            setTimeout(() => canvas.style.display = "none", 1000);


                                        }                                      
                                    });

                                }
                            }
                            if (err && !(err instanceof ZXing.NotFoundException)) {
                                console.error(err);
                            }
                        })
                    })
                    switching.click();
                }).catch((err) => { console.error(err) })
            })
        </script>
</body>

</html>