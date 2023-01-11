<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>

<!-- 카카오맵 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd88de1b8477ef4c5df424305ccb757f"></script>
<c:import url="/top" />
<link href="resources/assets/css/index.css" rel="stylesheet">

<main id="main" class="main">
<section class="home-main-section-top">
		<div class="home-main-top">
			<div class="home-main-desc">
				<h1 class="home-main-title">
					기부앤테이크 <br> 위치기반 중고거래
				</h1>
				<p class="text-m">
					중고거래로 경매에서 기부까지, <br> 기부앤테이크에서 지금 당장 시작해보세요!
				</p>
			</div>
			<div class="home-main-image-top">
				<span> <img class="home-main-image-top"
					src="resources/assets/img/donation.png">
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
				<h1 class="banner1-title">2023 기부앤테이크 Ranking Start!!</h1>
				<p class="banner1-subtitle">현재 나의 순위는?</p>
			</div>

			<!-- 배너 2번 내용 -->
			<div class="carousel-item"
				onclick="location.href='${path}/project/aution';">
				<h1 class="banner2-title">
					새로 올라온 중고 물품 <br> <br>바로 확인하러 가기!
				</h1>
				<p class="banner2-subtitle"></p>
			</div>

			<!-- 배너 3번 내용 -->
			<div class="carousel-item">
				<h1 class="banner2-title"
					onclick="location.href='${path}/project/noticeList';">기부앤테이크
					기부 인증</h1>
				<p class="banner2-subtitle">
					여러분의 중고거래가 모여 이룬 기적, <br> 지금 확인해보세요!
				</p>
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
	<div class="product">
		<div class="product-1">
			<p class="product-main">기부앤테이크 경매</p>
			<p class="product-sub">지도에서 위치를 지정해보세요!</p>
		</div>
		<a class="product-more" href="${path}/project/aution">더보기 > </a>
	</div>
<hr>
<!-- 카카오맵 지도 위치 -->
	<div id="map"></div>
</main>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
</script>
<c:import url="/foot" />