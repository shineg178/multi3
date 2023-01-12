<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="/top" />

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<link href="${path}/resources/assets/css/donation.css" rel="stylesheet">

<script>
	$(function() {

		$('#btn').on('click', function() {
			searchId();
		})
		function searchId() {
			var userId = $("#userId").val();
			$.ajax({
				type : 'get',
				url : 'donationRankingSearch?userId=' + userId,
				dataType : 'json',
				cache : false,
				success : function(res) {
					if (res == 0) {
						$("#searchText").hide();
						$("#nothingId").show();
					} else if (res > 0) {
						$("#nothingId").hide();
						$("#searchText").show();
						$('#searchMyDonRanking').html(res);
					}
				},
				error : function(err) {
					alert('error ' + err.status);
				}

			});
		}

	})
</script>


<!-- http://localhost:9090/project/donation -->

<body>

</body>
<main id="main" class="main">
	<section class="donation-main-section">
		<div class="donation-main-div">
			<div>
				<h1 class="donation-main-title">${totalDonateCount}건의
					경매로
					<!--  -->
					<br> ${totalDonation}원 기부금 달성
					<!--  -->
				</h1>
				<br>
				<div class="donation-main-image">
					<span> <img src="${path}/resources/assets/img/donate.png">
					</span>
				</div>
				<p class="donation-main-subtitle">기부 순위를 확인 후, 기부앤테이크로 경매거래에
					참여해보세요.</p>
			</div>

		</div>
	</section>
	<br>
	<section class="donation-ranking-section">
		<div class="row">
			<div class="card col-lg-6" style="overflow:scroll;">
				<div>
					<br>
					<h1 class="donation-ranking-title">실시간 기부 순위</h1>

				</div>
				<table class="donation-ranking-table">
	<tr>
						<td class="donation-ranking-number">순위
						</td>
						<td class="donation-ranking-totalamount">기부금
						</td>
						<td class="donation-ranking-user">ID
						</td>
						</tr>
						
					<c:forEach items="${userListDonate}" var="userListDonate" begin="0"
						end="${donationUserCount}">
					<tr class="donation-ranking-list">
							<td class="donation-ranking-number"><c:out
									value="${userListDonate.RANKINGNUMBER}" />등</td>
							<!-- 기부금 높은 순으로 1~5등의 기부액과 아이디 불러오기 (아이디 참조를 안해서 우선 회원번호로 받음)-->
							<td class="donation-ranking-totalamount"><c:out
									value="${userListDonate.TOTALAMOUNT}" />원</td>
							<td class="donation-ranking-user"><c:out
									value="${userListDonate.USERID_FK}" />님</td>
						</tr>
					</c:forEach> 
				</table>

			</div>

			<div class="card col-lg-5 offset-lg-1">
				<br>
				<h3 class="donation-ranking-title">기부 단체 설명</h3>
				<p class="donation-main-subtitle">현재 진행중인 기부 단체에 대해 알려드립니다.</p>
				<table id="donation-ranking-table" height="600" >
					<tr>
						<td>${donationOrgInfo}
						</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
</main>
<c:import url="/foot" />
