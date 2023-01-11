<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="/top" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<SCRIPT type="text/javascript">
//var now=new Date();
//var closeTime = new Date(2023,00,07,17,27,30);
//alert(nowTime);

	var nowTime = ${nowTime.getTime()}; // 현재의 시간만 가져온다
	var closeTime = ${closeTime.getTime() }; // 종료시간만 가져온다
	function remaindTime() {
	   nowTime=nowTime+1000;
	   if(nowTime<closeTime){ //현재시간이 종료시간보다 이르면 종료시간까지의 남은 시간을 구한다.   
	     var sec = parseInt(closeTime - nowTime) / 1000;
	   
	     var hour = parseInt(sec/60/60);
	     
	     sec = (sec - (hour*60*60));
	     
	     var min = parseInt(sec/60);
	     
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
	
	
/*   function checkTime(){
	  if(nowTime>=closeTime){
		  closeBid();
	  };
  }
  function closeBid(){
	  alert('끝1');
	  $('#btnBid').prop('disabled',"false");
	  $('#10kBtn').prop('disabled',"false");
	  $('#5kBtn').prop('disabled',"false");
	  $('#1kBtn').prop('disabled',"false");
	  $('#01kBtn').prop('disabled',"false");
	  $('#resetBtn').prop('disabled',"false");
  } */
  
  
let number=$('#inputPrice').val();
function plus(amount){
	if(number==null){
		number=0;
	}
	if(amount === '10k'){
		number = number+10000;
	}else if(amount === '5k'){
		number = number+5000;
	}else if(amount === '1k'){
		number = number+1000;
	}else if(amount === '0.1k'){
		number = number+100;
	}else if(amount === 'reset'){
		number = 0;
	}
	$('#inputPrice').val(number);
}
</script>
<script>
//전역변수 설정
var socket  = null;
var url = "http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/auction";
sock = new SockJS(url);
socket = sock;

$(document).ready(function(){
	// 웹소켓 연결
	connect();
	$('#btnBid').click(function(){
		bid();
		sock.onmessage();
	});
});

function connect(){
	// 데이터를 전달 받았을때 
	//sock.onmessage = onMessage;
	//sock.onclose = onClose;
	sock.onopen = function() {
		console.log('info: connection opened.');
		let str = '<div id="aucPrice">';
		str += "${auction.aucPrice}원";
		str += '</div>';
		$('#tableAuc').html(str);
	};
}//connect---

function bid(){
	let prodNum=${prod.prodNum};
	let userNum=${user.userNum};
	let aucPrice=$('#inputPrice').val();
	//전송정보 db에 저장
	var dataObj={
			"prodNum":prodNum,
	        "userNum":userNum,
	        "aucPrice":aucPrice
	}
	if(aucPrice==0){
		alert('입찰가를 적어주세요');
		$('#inputPrice').focus();
		return;
	}
	if(aucPrice<=${auction.aucPrice}){
		alert('현재입찰가보다 높은금액으로 입찰해야합니다')
		$('#inputPrice').val('');
		$('#inputPrice').focus();
		return;
	}
	
	$.ajax({
	       type: 'post',
	       url: 'auctionDetail/bid',
	       contentType:'application/json',
	       dataType: 'json',
	       data: JSON.stringify(dataObj),
	       success: function(){   
	           // 소켓에 전달되는 메시지
	        socket.send("${prod.prodName},"+aucPrice);
	       	alert('입찰완료되었습니다')
	       }
	   });
	$('#inputPrice').val('');
}//----

sock.onmessage=function(evt){
	if(evt!=null){
		var data = evt.data;
		console.log(evt);
		console.log(data);
		var prodName = data.split(":")[0];
		var aucPrice = data.split(":")[1];
	}
	if (evt==null) {
		var aucPrice = "${auction.aucPrice}";
	}
	let str = '<div id="aucPrice">';
	str += aucPrice+"원";
	str += '</div>';
	$('#tableAuc').html(str);
	
}//------
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
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<c:if test="${prod.prodImage1 ne null}">
									<img class="card-img-top mb-5 mb-md-0" src="${path}\resources\Product_Image/${prod.prodImage1}">
								</c:if>
								<c:if test="${prod.prodImage1 eq null}">
									<img src="resources/assets/img/noImage.jpg">
								</c:if>
							</div>
							<c:if test="${prod.prodImage2 ne null }">							
								<div class="carousel-item ">
									<c:if test="${prod.prodImage2 ne null}">
										<img src="${path}\resources\Product_Image/${prod.prodImage2}" class="card-img-top mb-5 mb-md-0">
									</c:if>
									<c:if test="${prod.prodImage2 eq null}">
										<img src="resources/assets/img/noImage.jpg">
									</c:if>
								</div>
							</c:if>
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
					<div class="large mb-3">${seller.userNick}  |  ( ${seller.userId} )</div>
					<br>
					<div class="fs-5 mb-5">
						<table>
							<tr>
								<td>시작가</td>
								<td class="d-flex justify-content-end">${prod.aucStartPrice }원</td>
							</tr>
							<tr>
								<td>현재 입찰가</td>
								<td id="tableAuc" class="d-flex justify-content-end"></td>
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
								<td colspan="2" class="text-center">
									<input class="form-control text-end" 
										id="inputPrice" type="number" 
										placeholder="입찰포인트를 정해주세요" style="width:95%; letter-spacing: 3px"
									>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="text-center">
		                              <button type="button" id="10kBtn" onclick=plus("10k") class="btn btn-outline-primary btn-sm">+10000</button>
		                              <button type="button" id="5kBtn" onclick=plus("5k") class="btn btn-outline-primary btn-sm">+5000</button>
		                              <button type="button" id="1kBtn" onclick=plus("1k") class="btn btn-outline-primary btn-sm">+1000</button>
		                              <button type="button" id="01kBtn" onclick=plus("0.1k") class="btn btn-outline-primary btn-sm">+100</button>
		                              <button type="button" id="resetBtn" onclick=plus("reset") class="btn btn-outline-primary btn-sm">Reset</button>
	                             	</div>
								</td>
							</tr>
						</table>
						<br> 
						<!-- data-bs-toggle="modal" data-bs-target="#bid" -->
						<span class="text-start">
							<button class="btn btn-success btn-lg" type="button" id="btnBid">입찰하기</button>
						</span> 
						<c:if test="${user.userNum ne prod.userNum_fk}"> 
							<span class="text-end col-3">
								<a class="btn btn-info btn-lg" id="btnChat" type="button" href="${path}/addChatRoom?sellerNum=${prod.userNum_fk}">판매자와 채팅</a>
							</span>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="text-center lead">
			<h2>물품 설명</h2>
		</div>
		<div class="">
		<p class="lead" style="margin-left: 20%; margin-right: 20%;">${prod.prodSpec}</p>
		</div>
	</section>
	<!-- <script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
</main>
<!-- End #main -->
<c:import url="/foot" />