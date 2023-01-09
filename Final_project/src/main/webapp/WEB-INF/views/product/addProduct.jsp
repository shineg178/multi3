<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!-- 우편번호 api -->
<!DOCTYPE html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>

<style>
	#textInput{
		padding: 0.375rem 0.75rem;
		font-size:1rem;
		font-weight:400;
		line-height:1.5;
		border:1px solid #ced4da;
		appearance:none;
		border-radius:0.375rem;
	}
	#prodInfo{
		height:150px;
		margin:10px 0px;
	}
	
	#addr1{
		width:20%;
	}
	
	#addr2{
		width:50%;
	}
	
	#addr3{
		width:30%;
	}
	
	#donatePer{
		width:10%;
	}
	#wrap >*{
		margin:5px 0px;
		
	}
	
	
</style>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>

<c:import url="/top"/>
<main id="main" class="main">
<h3>물품 등록</h3>
<form id="prodfrm" class="form-control" enctype="multipart/form-data" method="post" action="addProd">
	<span id="lb">상품이미지</span>
	<input type="file" name="image1" accept=".jpg, .png">
	<input type="file" name="image2" accept=".jpg, .png">
	<hr style="color:gray;">
	<span id="lb">물품이름</span>
	<input type="text" name="prodName" id="textInput" required>
	<hr>
	<span id="lb">카테고리</span>
	<select name="prodCategoryNum_fk" >
		<option value=10>디지털/가전</option>
		<option value=20>가구/인테리어</option>
		<option value=30>생활/가공식품</option>
		<option value=40>의류</option>
		<option value=50>게임/취미</option>
		<option value=60>도서</option>
	</select>
	<hr>
	<div id="d1">
		<span id="lb">경매 시작가</span>
		<input type="number" id="textInput" name="aucStartPrice" min="0" value="0" required>
	</div>
	<br>
	<div id="d2">
		<span id="lb">경매 기간</span>
		<input type="radio" name="auctionTime" value=1>1일 
		<input type="radio" name="auctionTime" value=3 checked>3일
		<input type="radio" name="auctionTime" value=7>7일
		<input type="radio" name="auctionTime" value=14>14일
	</div>
	<hr>
	<div id="wrap">
		<span>거래지역</span>
		<input id="addr1" name="sellerAddr1" class="form-control" type="text" placeholder="우편번호" readonly required>
		<input id="addr2" name="sellerAddr2" class="form-control" type="text" placeholder="도로명주소" readonly required>
		<input id="addr3" name="sellerAddr3" class="form-control" type="text"  id="addr3" placeholder="상세주소" >
		<button class="btn btn-success" id="findPost" type="button">우편번호 찾기</button>
	</div>
	<br>
	<div id="d3">
		<span>기부비율</span>
		<input name="donatePercent" id="donatePer" type="number" value=30 step=5 min=30  max=100 class="form-control" required>
	</div>
	<hr>
	<span>상품정보</span>
	<textarea class="form-control" id="prodInfo" name="prodSpec" required></textarea>
	<button id="btn" class="btn btn-primary">등록</button>
	 
</form>

</main>
<script>
$(function(){
    $('#findPost').on("click", function(){
        new daum.Postcode({
            oncomplete: function(data) {
            	$('#addr1').attr("value",data.zonecode);
            	$('#addr2').attr("value",data.address);
            }
        }).open();
    });
})
</script>
<c:import url="/foot"/>