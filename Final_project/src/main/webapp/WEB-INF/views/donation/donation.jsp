<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="/top" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>


<script>

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
					<c:forEach items="${userListDonate}" var="userListDonate" begin="0" end="4">
					<tr>
						<td><c:out value="${userListDonate.RN}"/>등</td>
						<!-- 기부금 높은 순으로 1~5등의 기부액과 아이디 불러오기 (아이디 참조를 안해서 우선 회원번호로 받음)-->
						<td><c:out value="${userListDonate.TOTALAMOUNT}"/>원</td>
						<td><c:out value="${userListDonate.USERNUM_FK}"/>님</td>
					</tr>
					</c:forEach>
					
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
								<!-- ************************* 기부 순위 해야함 !!!!  -->
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
						<!-- 정해진 단체의 db정보 가져와서 출력  
							어떤 기준으로 단체를 정할지+그에 맞는 출력 방식 **********
						-->
						
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