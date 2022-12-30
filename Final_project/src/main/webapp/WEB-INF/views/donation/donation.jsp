<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="/top" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>


<script>

/* $(document).ready(function(){
	donationRanking();//경매 기부 전체 순위
}) */

$(function(){
	$('#btn').on('click', function(){
		searchId();
	})
	function searchId(){
		var userId= $("#userId").val();
		$.ajax({
			type:'get',
			url:'donationLevelSearch?userId='+userId,
			dataType:'json',
			cache:false,
			success: function(res){
				//alert(JSON.stringify(res));
				$('#searchMyDonLevel').html(res);
				/* 본인 순위 숫자 3이 여기로 넘어온다. 여기에서 str에서 html 코드만들어서 
				밑에 html 넣고싶은 부분에 ajax .html한다음에 str넣어주면 됨. */
			},
			error: function(err){
				alert('error '+err.status);
			}
			
		});
	}
})

	
</script>
<style>

.title {
	text-align: center;
	border: 3px solid black;
	border-radius: 50px;
}

.main {
	text-align: center;
	border: 1px solid black;
} 
</style>

<!-- http://localhost:9090/project/donation -->
<body>
	
</body>
<main id="main" class="main">

	<!-- 경매 완료된 거래의 건수와 총기부합계 가져와서 출력하기 -->
	<div id="title" class="title">
		<h3>${totalDonateCount}건의 경매로 ${totalDonation}원 기부금 달성</h3>
	</div>


	<table id="mainTable" class="mainTable" width="100%">

		<tr> 
			<td>
				<table id="firstTable" class="firstTable" border="1" 
					width="100%" height="400">
					<tr>
						<td colspan="3">
							<!-- 월 주차 구하기 -->
							<h3>12월 4주차 기부 순위</h3>
						</td>
					</tr> 
					<c:forEach items="${userListDonate}" var="userListDonate">
					<tr>
						<td>순위</td>
						<!-- 기부금 높은 순으로 1등의 기부액과 아이디 불러오기 -->
						<td><c:out value="${userListDonate}"/></td>
						<td>아이디</td>
					</tr>
					</c:forEach>
					<tr>
						<!-- 기부금 높은 순으로 2등의 기부액과 아이디 불러오기 -->
						<td>2등 뱃지</td>
						<td>기부액</td>
						<td>아이디</td>
					</tr>
					<tr>
						<!-- 기부금 높은 순으로 3등의 기부액과 아이디 불러오기 -->
						<td>3등 뱃지</td>
						<td>기부액</td>
						<td>아이디</td>
					</tr>
					<tr>
						<!-- 기부금 높은 순으로 4등의 기부액과 아이디 불러오기 -->
						<td>4등 뱃지</td>
						<td>기부액</td>
						<td>아이디</td>
					</tr>
					<tr>
						<!-- 기부금 높은 순으로 5등의 기부액과 아이디 불러오기 -->
						<td>5등 뱃지</td>
						<td>기부액</td>
						<td>아이디</td>
					</tr>
				</table>
			</td>
 
 
			<td> 
				<table id="secondTable" class="secondTable" border="1" 
					width="100%" height="400">
					
					<tr>
						<td>
							<h3>나의 순위는?</h3>
						</td>
					</tr>
					
					<tr>
						<td>이번주 나의 기부 순위를 검색해보세요</td>
					</tr>
					
					<tr>
						<td>
								<!-- 아이디값 넘어가서 일치하는 아이디의 등수 가져와 출력 -->
								ID 입력: <input type="text" id="userId" name="userId" placeholder="ID를 입력해주세요" >
								<button id="btn" class="btn btn-outline-primary mr-2">검색</button><br><br>
								<div><span id="searchMyDonLevel"></span></div>
						</td>
					</tr>
					
				</table>
			</td>
			
		</tr>


		<tr>

			<td colspan="2">
				<table id="thirdTable" class="thirdTable" border="1" width="100%"
					height="500">
					<tr>
						<!-- 정해진 단체의 db정보 가져와서 출력  -->
						<td>기부단체 설명<br>
						${donationOrgInfo}
						</td>
					</tr>
				</table>

			</td>
		</tr>
		
	</table>
	<!--전체 윤곽 테이블 끝-->

</main>
<c:import url="/foot" />