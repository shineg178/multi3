<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>

<!-- 카카오맵 api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd88de1b8477ef4c5df424305ccb757f&libraries=services"></script>

<c:import url="/top" />
<link href="resources/assets/css/index.css" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
	#wrap{
		width:27%;
		height:350px;
		margin:40px 25px;
		border-radius: 15px;
		background-color:white;
		text-align:center;
	}
	#t1{
		font-weight: bold;
	}
	
	#t1,#t2{
		margin:20px 25px;
		text-align:left;
	}
	#wr{
		display:flex;
		margin:auto;
		justify-content:center;
	}
	#title{
		width:100%;
		margin:45px 45px 0px 50px;
		font-weight:bold;
		font-size:2.0rem;
	}
	
	#sec{
		height:450px;
		margin:15px;

	}
</style>

<main id="main" class="main">


	<section class="home-main-section-top">
		<div class="home-main-top">
			<div class="home-main-desc">
				<h1 class="home-main-title" style="font-family: 'Jua', sans-serif;">
					기부앤테이크 <br> 위치기반 중고거래
				</h1>
				<p class="text-m" >
					중고거래로 경매에서 기부까지, <br> 기부앤테이크에서 지금 당장 시작해보세요!
				</p>
			</div>
			<div class="home-main-image-top">
				<span> <img class="home-main-image-top"
					src="resources/assets/img/donation.png">
				</span>
			</div>
		</div>
	</section>
	<section id="sec">
		<h3 id="title">구매 or 판매에서 기부까지 되는 과정은?</h3>
		
		<div id="wr">
			<div id="wrap">
					<br><br>
					<img  src="resources/assets/img/1.jpg" style="width:120px">
					<br><br>
					<h2 id="t1">위치</h2>
					<div id="t2">위치기반 서비스로<br>구매하고 싶은 물건을 찾을 수 있습니다.</div>
			</div>
			<div id="wrap">
					<br><br>
					<img  src="resources/assets/img/3.jpg" style="width:120px">
					<br><br>
					<h2 id="t1">경매</h2>
					<div id="t2">실시간 경매를 통해<br>원하는 가격에 구매할 수 있습니다.</div>
			</div>
			<div id="wrap">
					<br><br>
					<img  src="resources/assets/img/2.jpg" style="width:120px">
					<br><br>
					<h2 id="t1">기부</h2>
					<div id="t2">안쓰는 물건을 팔아<br>일정 비율의 금액을 기부할 수 있습니다.</div>
			</div>
		</div>
	</section>
<br>

		<!-- 배너 전체 div 시작----------------->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">

		<!-- 배너 중앙하단 1, 2, 3 배너 이동 버튼 시작 -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<!-- 배너 중앙하단 1, 2, 3 배너 이동 버튼 끝 -->

		<!-- 배너 내용 시작 -->
		<div class="carousel-inner">

			<!-- 배너 1번 내용 -->
			<div class="carousel-item active"
				onclick="location.href='${path}/project/donation';">
				<a class="banner1-title">
					<img class="banner1-img" src="resources/assets/img/banner01.png">
				</a>
			</div>

			<!-- 배너 2번 내용 -->
			<div class="carousel-item"
				onclick="location.href='${path}/project/productList';">
				<a class="banner2-title">
					<img class="banner2-img" src="resources/assets/img/banner02.png">
				</a>
			</div>

			<!-- 배너 3번 내용 -->
			<div class="carousel-item"
				onclick="location.href='${path}/project/noticeList';">
				<a class="banner3-title">
					<img class="banner3-img" src="resources/assets/img/banner03.png">
				</a>
			</div>

		</div>
		<!-- 배너 내용 끝 -->


		<!-- 배너 좌우 이동 버튼 시작-->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
		<!-- 배너 좌우 이동 버튼 끝 -->
	</div>
	<!-- 배너 전체 div 끝----------------->
	<br>
	
</main>


<c:import url="/foot" />