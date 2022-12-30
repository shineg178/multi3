<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="/top" />

<SCRIPT type="text/javascript">
function remaindTime() {
    var now = new Date(); //현재시간을 구한다. 
  
    var nowTime = now.getTime(); // 현재의 시간만 가져온다
    var closeTime = ${closeTime.getTime() }; // 종료시간만 가져온다
  
   if(nowTime<closeTime){ //현재시간이 종료시간보다 이르면 종료시간까지의 남은 시간을 구한다.   
     sec = parseInt(closeTime - nowTime) / 1000;
     hour = parseInt(sec/60/60);
     sec = (sec - (hour*60*60));
     min = parseInt(sec/60);
     sec = parseInt(sec-(min*60));
  
     if(hour<10){hour="0"+hour;}
     if(min<10){min="0"+min;}
     if(sec<10){sec="0"+sec;}
      $("#d-day-hour").html(hour);
      $("#d-day-min").html(min);
      $("#d-day-sec").html(sec);
   } else{ //현재시간이 종료시간보다 크면
    $("#d-day-hour").html('00');
    $("#d-day-min").html('00');
    $("#d-day-sec").html('00');
   }
  }
  setInterval(remaindTime,1000); //1초마다 검사를 해주면 실시간으로 시간을 알 수 있다. 
  
	/* //websocket 생성
	  const websocket = new WebSocket("ws://localhost:8080/auction");
	  websocket.onmessage = onMessage;	// 소켓이 메세지를 받을 때
	  websocket.onopen = onOpen;		// 소켓이 생성될때(클라이언트 접속)
	  websocket.onclose = onClose;	// 소켓이 닫힐때(클라이언트 접속해제)
	
	  //on exit chat room
	  function onClose(evt) {
	  console.log("close event : " + evt);
	  }
	
	  //on entering chat room
	  function onOpen(evt) {
	  console.log("open event : " + evt);
	  }
	
	  // on message controller
	  function onMessage(msg) {
	  var data = JSON.parse(msg.data); // msg를 받으면 data 필드 안에 Json String으로 정보가 있음
	  // 필요한 정보를 Json data에서 추출
	   var senderId = data.senderId;
	   var message = data.message;
	   var time = data.time;
	   var newOne = data.newOne;
	   var outOne = data.outOne;
	  }
	  
	  // send a message
	  function send(){
	  var message = document.getElementById("msg").value;
	  
	  // don't send when content is empty
	  // 채팅 입력 칸이 비어있지 않을 경우만 정보를 Json형태로 전송
	  if(message != "") {			
		let msg = {
	 	'receiverId' : receiverId,
	  	'message' : message
	    	}
	
	  	if(message != null) {
	  	websocket.send(JSON.stringify(msg));	// websocket handler로 전송(서버로 전송)
	  	}
	  	document.getElementById("msg").value = '';
		}  */
</script>

<main id="main" class="main">
	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<div id="carouselExampleIndicators" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<!-- <button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="2" aria-label="Slide 3"></button> -->
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="card-img-top mb-5 mb-md-0"
									src="${path}/resources/assets/img//${prod.prodImage1}"
									alt="..." />
								<!-- 다른 이미지 "https://dummyimage.com/600x700/dee2e6/6c757d.jpg" -->
							</div>
							<div class="carousel-item ">
								<img src="${path}/resources/assets/img//${prod.prodImage2}"
									class="card-img-top mb-5 mb-md-0" alt="...">
							</div>
							<%-- <div class="carousel-item">
								<img src="${path}/resources/assets/img//slides-3.jpg"
									class="card-img-top mb-5 mb-md-0" alt="...">
							</div> --%>
						</div>

						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>

				</div>
				<div class="col-md-6">
					<br> <br>
					<h3 class="fw-bolder">${prod.prodName }</h3>
					<br>
					<div class="large mb-3">${user.userNick}  |  ( ${user.userId} )</div>
					<br>
					<div class="fs-5 mb-5">
						<table>
							<tr>
								<td>시작가</td>
								<td class="d-flex justify-content-end">${prod.aucStartPrice }원</td>
							</tr>
							<tr>
								<td>현재 입찰가</td>
								<td class="d-flex justify-content-end">${prod.aucStartPrice }원</td>
							</tr>
							<tr>
								<td>시작 시간</td>
								<td class="text-decoration-underline d-flex justify-content-end">
									<fmt:formatDate value="${prod.getPIndate() }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
							</tr>
							<tr>
								<td>종료 시간</td>
								<td class="text-decoration-underline d-flex justify-content-end">
									<fmt:formatDate value="${closeTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
							</tr>
							<tr>
								<td>남은 시간</td>
								<td class="text-decoration-underline d-flex justify-content-end">
									<div class="time">
										<span id="d-day-hour"></span> 
										<span class="col">시간</span> 
										<span id="d-day-min"></span> 
										<span class="col">분</span> 
										<span id="d-day-sec"></span>
										<span class="col">초</span>
									</div>
								</td>
							</tr>
							<tr>
								<td>입찰 참여 인원 현황</td>
								<td class="d-flex justify-content-end">XX명</td>
							</tr>
						</table>
						<br> <input class="form-control" id="inputQuantity"
							type="number" value="" style="max-width: 20rem" /> <br> <span
							class="text-start">
							<button class="btn btn-success btn-lg" type="button">
								입찰하기</button>
						</span> <span class="text-end col-3">
							<button class="btn btn-info btn-lg" type="button">판매자와
								채팅</button>
						</span>

					</div>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="text-center lead">
			<h2>물품 설명</h2>
		</div>
		<p class="lead" style="margin-left: 20%; margin-right: 20%;">${prod.prodSpec}</p>
	</section>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

</main>
<!-- End #main -->
<c:import url="/foot" />