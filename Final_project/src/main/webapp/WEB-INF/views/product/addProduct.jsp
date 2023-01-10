<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 우편번호 api -->
<!DOCTYPE html>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<link href="resources/assets/css/addProduct.css" rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>

<c:import url="/top" />
<main id="main" class="main">
	<section class="prod-main-section-top">
		<div class="prod-main-top">
			<div class="prod-main-desc">
				<h1 class="prod-main-title">상품 등록</h1>

				<p class="text-m">상품을 등록하여 필요없는 물건을 중고거래 해보세요.</p>
			</div>
			<div class="home-main-image-top">
				<span> <img class="home-main-image-top"
					src="resources/assets/img/products.png">
			</div>
		</div>
	</section>


	<br>

	<div class="total-div"></div>
	<form id="prodfrm" class="form-control" enctype="multipart/form-data"
		method="post" action="addProd">
		<div class="prod-img-span">
			<span id="lb">상품이미지</span>
		</div>
		<div class="prod-img-input">
			<input type="file" name="image1" accept=".jpg, .png"> <br>
			<input type="file" name="image2" accept=".jpg, .png">
		</div>
		<hr style="color: gray;">
		<div class="prod-name-span">
			<span id="lb">물품이름</span>
		</div>
		<div class="prod-name-input">
			<input type="text" name="prodName" id="textInput" required>
		</div>
		<hr>
		<div class="prod-category-span">
			<span id="lb">카테고리</span>
		</div>
		<div class="prod-category-select">
			<select name="prodCategoryNum_fk">
				<option value=10>디지털/가전</option>
				<option value=20>가구/인테리어</option>
				<option value=30>생활/가공식품</option>
				<option value=40>의류</option>
				<option value=50>게임/취미</option>
				<option value=60>도서</option>
			</select>
		</div>
		<hr>
		<div id="d1">
			<div class="prod-auction-span">
				<span id="lb">경매 시작가</span>
			</div>
			<div class="prod-auction-input">
				<input type="number" id="textInput" name="aucStartPrice" min="0"
					value="0" required>
			</div>
		</div>
		<br>
		<div id="d2">
			<div class="prod-auction-span">
				<span id="lb">경매 기간</span>
			</div>
			<div class="prod-auction-input">
				<input type="radio" name="auctionTime" value=1>1일 <input
					type="radio" name="auctionTime" value=3 checked>3일 <input
					type="radio" name="auctionTime" value=7>7일 <input
					type="radio" name="auctionTime" value=14>14일
			</div>
		</div>
		<hr>
		<div id="wrap">
			<div class="prod-addr-span">
				<span>거래지역</span>
			</div>
			<div class="prod-addr-input">
				<input id="addr1" name="sellerAddr1" class="form-control"
					type="text" placeholder="우편번호" readonly required> <input
					id="addr2" name="sellerAddr2" class="form-control" type="text"
					placeholder="도로명주소" readonly required> <input id="addr3"
					name="sellerAddr3" class="form-control" type="text" id="addr3"
					placeholder="상세주소">
				<button class="btn btn-success" id="findPost" type="button">우편번호
					찾기</button>
			</div>
		</div>
		<br>
		<hr>
		<div id="d3">
			<div class="prod-percent-span">
				<span>기부비율</span>
			</div>
			<div class="prod-percent-input">
				<input name="donatePercent" id="donatePer" type="number" value=30
					step=5 min=30 max=100 class="form-control" required>
			</div>
		</div>
		<hr>
		<div class="prod-info-span">
		<span>상품정보</span>
		</div>
		<div class="prod-info-textarea">
		<textarea class="form-control" id="prodInfo" name="prodSpec"required></textarea>
		</div>
		<hr>
		<div class="btn-signup">
		<button id="btn" class="btn btn-primary">등록</button>
		</div>
	</form>

</main>
<script>
	$(function() {
		$('#findPost').on("click", function() {
			new daum.Postcode({
				oncomplete : function(data) {
					$('#addr1').attr("value", data.zonecode);
					$('#addr2').attr("value", data.address);
				}
			}).open();
		});
	})
</script>
<c:import url="/foot" />