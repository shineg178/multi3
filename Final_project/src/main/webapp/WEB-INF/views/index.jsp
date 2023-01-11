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
				</span>
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

	<div>
		<hr>
	</div>
	<!-- 카카오맵 지도 위치 -->
	<div id="map2" ></div>
	
	<script>
		var container = document.getElementById('map2');
		var options = {
			center : new kakao.maps.LatLng(37.5666805, 126.9784147),
			level : 8
		};

		var map = new kakao.maps.Map(container, options);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		//회원정보중 주소가 있다면
		if(${user ne null} && ${user.userAddr2 ne null}){
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${user.getUserAddr2()}', function(result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					
					var imageSrc = 'resources/assets/img/myLoc.png', // 마커이미지의 주소입니다    
				    imageSize = new kakao.maps.Size(40, 40), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(20,40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				    
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					
					
					// 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords,
			            image:markerImage
			        });
			        
			        //지도 중심 이동
					map.setCenter(coords);
				}
			});		
		}
		
		$(function(){
			$.ajax({
				url:'allProduct',
				type:'get',
				dataType:'json',
				async:false,
				cache:false,
				success:function(res){
					$.each(res,function(i,data){
						//주소 -> 좌표 변환
						geocoder.addressSearch(data.sellerAddr2, function(result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								// 마커 이미지의 이미지 주소입니다
								var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
									    
								// 마커 이미지의 이미지 크기 입니다
								var imageSize = new kakao.maps.Size(24, 35); 
									    
								// 마커 이미지를 생성합니다    
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
									    
								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
								        map: map, // 마커를 표시할 지도
								        position:new kakao.maps.LatLng(result[0].y, result[0].x),// 마커를 표시할 위치
								        title : data.prodName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
								        image : markerImage // 마커 이미지 
								});
								
								// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
								var iwContent = '<div style="width:150px;padding:5px; height:170px; text-align:center; font-size:0.5em; overflow: hidden;">';
									if(data.prodImage1==null && data.prodImage2==null){
										iwContent += '<img width="80" height="80" src="resources/assets/img/noImage.jpg">';
									}else if(data.prodImage1 != null){
										iwContent += '<img width="80" height="80" src="${pageContext.request.contextPath}/resources/Product_Image/'+data.prodImage1+'">';
									}else if(data.prodImage1==null && data.prodImage2 !=null ){
										iwContent += '<img width="80" height="80" src="${pageContext.request.contextPath}/resources/Product_Image/'+data.prodImage2+'">';
									}
									iwContent += '<br>'+data.prodName+'<br>';
									iwContent += "경매 시작가 : "+data.aucStartPrice+"<br> 상품 설명 : "+data.prodSpec+"<br>";
									if(${user ne null}){
										iwContent += "<a href='auction/auctionDetail?prodNum="+data.prodNum+"'>상세페이지</a>";
									}
									iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
								    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								    removable : iwRemoveable
								});

								// 마커에 클릭이벤트를 등록합니다
								kakao.maps.event.addListener(marker, 'click', function() {
								      // 마커 위에 인포윈도우를 표시합니다
								      infowindow.open(map, marker);  
								});

							}

						});			
					});
					
					
				
				},
				error:function(err){
					alert('error : '+err.status);
				}
			})
		})
	</script>
</main>


<c:import url="/foot" />