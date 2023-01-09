<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd88de1b8477ef4c5df424305ccb757f&libraries=services"></script>
<style>
.card-wrap {
	overflow: hidden;
	width: 100%;
	background: #fff;
	border-radius: 8px;
}

.card-top {
	float: left;
	overflow: hidden;
	text-align: center;
	display: table;
	border: 1px solid #fff;
	width: 280px;
	height: 250px;
	margin: 10px;
	background: #fff;
	border-radius: 8px;
}

.card-photo {
	display: table-cell;
	vertical-align: middle;
	margin-bottom: 1rem;
}

.card-photo img {
	max-width: 180px;
	max-height: 180px;
	margin-top: 1rem;
}

.footer {
	clear: both;
}

#map {
	width: 100%;
	height: 400px;
	margin: 15px auto;
}
</style>

<c:import url="/top" />
<main id="main" class="main">
	<!-- 카카오맵 지도 위치 -->
	<div id="map"></div>
	<section class="cards-wrap">
		<article class="card-top">
			<a class="card-link" data-event-label="" href="">
				<div class="card-photo">
					<img alt="1번 상품" src="">
				</div>
				<div class="card-desc">
					<h2 class="card-title">캠핑용품 판매</h2>
					<div class="card-price">100,000원</div>
					<div class="card-region-name">서울 서초구 잠원동</div>
				</div>
			</a>
		</article>
	</section>

	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.5666805, 126.9784147),
			level : 5
		};

		var map = new kakao.maps.Map(container, options);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		//회원정보중 주소가 있다면
		if(${!user.getUserAddr2()}){
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${user.getUserAddr2()}', function(result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					// 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">현재 위치</div>'
			        });
			        infowindow.open(map, marker);
			        
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
					var positions=[];
					$.each(res,function(i,data){
						//주소 -> 좌표 변환
						geocoder.addressSearch(data.sellerAddr2, function(result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								var rs={};
								rs.title=data.prodName;
								rs.latlng=new kakao.maps.LatLng(result[0].y, result[0].x);
								positions.push(rs);
								
								// 마커 이미지의 이미지 주소입니다
								var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
								    

								    
								// 마커 이미지의 이미지 크기 입니다
								var imageSize = new kakao.maps.Size(24, 35); 
								    
								// 마커 이미지를 생성합니다    
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
								    
								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
								        map: map, // 마커를 표시할 지도
								        position: positions.latlng, // 마커를 표시할 위치
								        title : positions.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
								        image : markerImage // 마커 이미지 
								});
							}

						});			
					});
					
					
				
				},
				error:function(res){
					alert('error : '+err.status);
				}
			})
		})
		
		
		
		
	</script>

</main>


<c:import url="/foot" />