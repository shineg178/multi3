<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style>
#wrap {
	width: 100%;
}

#mainOrg {
	width: 30%;
	text-align: center;
	margin: auto;
}

#donTable tr th, td {
	text-align: center;
	vertical-align: middle;
}

#donTable tr td:nth-child(4n+1) {
	width: 10%;
}

#donTable tr td:nth-child(4n+2) {
	width: 20%;
}

#donTable tr td:nth-child(4n+3) {
	width: 50%;
}

#donTable tr td:nth-child(4n+4) {
	width: 20%;
	text-align: center;
}

#exTable tr th {
	text-align: center;
}

#payTable tr th {
	text-align: center;
}

#userTable tr th {
	text-align: center;
}

#userTable tr td:nth-child(6n+1) {
	width: 5%;
}

#userTable tr td:nth-child(6n+2) {
	width: 10%;
}

#userTable tr td:nth-child(6n+3) {
	width: 20%;
}

#userTable tr td:nth-child(6n+4) {
	width: 30%;
	text-align: left;
}

#userTable tr td:nth-child(6n+5) {
	width: 10%;
}

#userTable tr td:nth-child(6n+6) {
	width: 15%;
}

#productTable tr th {
	text-align: center;
}

#productTable tr td:nth-child(6n+1) {
	width: 10%;
}

#productTable tr td:nth-child(6n+2) {
	width: 10%;
	over-flow: hidden;
}

#productTable tr td:nth-child(6n+3) {
	width: 30%;
	over-flow: hidden;
}

#productTable tr td:nth-child(6n+4) {
	width: 20%;
	over-flow: hidden;
}

#productTable tr td:nth-child(6n+5) {
	width: 20%;
}

#productTable tr td:nth-child(6n+6) {
	width: 10%;
}

#reTable tr th {
	text-align: center;
}

#reTable tr td:nth-child(5n+1) {
	width: 10%;
}

#reTable tr td:nth-child(5n+2) {
	width: 15%;
	over-flow: hidden;
}

#reTable tr td:nth-child(5n+3) {
	width: 15%;
	over-flow: hidden;
}

#reTable tr td:nth-child(5n+4) {
	width: 40%;
	over-flow: hidden;
}

#reTable tr td:nth-child(5n+5) {
	width: 20%;
}




</style>
<script>
	function dondelete(data){
		$.ajax({
			type:"post",
			url:"dondelete",
			data:"donOrgNum="+data,
			dataType:"json",
			cache:false,
			success:function(res){
				if(res>0){
					location.reload();
				}
			},
			error:function(err){
				alert('error : '+err.status);
			}
		})
	}
	
	function findUser(){
		let userId=$('#findUser').val();
		if(userId!=""){
			$.ajax({
				url:'adminfindUser',
				type:'post',
				data:'userId='+userId,
				dataType:'json',
				cache:false,
				success:function(res){
					str="<table class='table'>"
						str+="<tr>";
						str+="<th>번호</th>";
						str+="<th>이름</th>";
						str+="<th>아이디</th>";
						str+="<th>회원정보</th>";
						str+="<th>회원상태</th>";
						str+="<th>회원전환</th>";
						str+="</tr>";
						$.each(res,function(i,data){
							str+="<tr>";
							str+="<td>"+data.userNum+"</td>";
							str+="<td>"+data.userName+"</td>";
							str+="<td>"+data.userId+"</td>";
							str+="<td>";
							str+="연락처 : "+data.userTel+"<br>";
							str+="이메일 : "+data.userEmail+"<br>";
							if(data.userAddr2 !=null){
								str+="주소 : "+data.userAddr2+"("+data.userAddr1+")<br>";
								str+="상세 주소 : "+data.userAddr3+"<br>";
							}
							str+="포인트 : "+data.userPoint+"<br>";
							str+="</td>";
							str+="<td>";
							if(data.userStatus == 0){
							str+="<div class='badge bg-primary'>일반회원</div>";
							}else if(data.userStatus == 3){
							str+="<div class='badge bg-warning'>정지회원</div>";
							}else if(data.userStatus == 4){
							str+="<div class='badge bg-success'>소셜회원</div>";
							}
							str+="</td>";
							str+="<td>";
							str+="<a class='btn btn-primary' href='normalUser?userNum="+data.userNum+"'>일반</a> <a class='btn btn-warning' href='stopUser?userNum="+data.userNum+"'>정지</a>"
							str+="</td>";
							str+="</tr>";				
						})
						str+="</table>";
						$('#userTable').html(str);
				},
				error:function(err){
					alert('error : '+err.status);
				}
			})
		}else if(userId==""){
			userList();
		}
	
	}
	
	function userList(){
		$.ajax({
			url:'adminAllUser',
			type:'get',
			dataType:'json',
			cache:false,
			success:function(res){
				str="<table class='table'>"
				str+="<tr>";
				str+="<th>번호</th>";
				str+="<th>이름</th>";
				str+="<th>아이디</th>";
				str+="<th>회원정보</th>";
				str+="<th>회원상태</th>";
				str+="<th>회원전환</th>";
				str+="</tr>";
				$.each(res,function(i,data){
					str+="<tr>";
					str+="<td>"+data.userNum+"</td>";
					str+="<td>"+data.userName+"</td>";
					str+="<td>"+data.userId+"</td>";
					str+="<td>";
					str+="연락처 : "+data.userTel+"<br>";
					str+="이메일 : "+data.userEmail+"<br>";
					if(data.userAddr2 !=null){
						str+="주소 : "+data.userAddr2+"("+data.userAddr1+")<br>";
						str+="상세 주소 : "+data.userAddr3+"<br>";
					}
					str+="포인트 : "+data.userPoint+"<br>";
					str+="</td>";
					str+="<td>";
					if(data.userStatus == 0){
					str+="<div class='badge bg-primary'>일반회원</div>";
					}else if(data.userStatus == 3){
					str+="<div class='badge bg-warning'>정지회원</div>";
					}else if(data.userStatus == 4){
					str+="<div class='badge bg-success'>소셜회원</div>";
					}
					str+="</td>";
					str+="<td>";
					if(data.userId.indexOf("@")== -1){
						str+="<a class='btn btn-primary' href='normalUser?userNum="+data.userNum+"'>일반</a>";
					}else if(data.userId.indexOf("@")){
						str+="<a class='btn btn-success' href='socialUser?userNum="+data.userNum+"'>소셜</a>";
					}
					str+="<a class='btn btn-warning' href='stopUser?userNum="+data.userNum+"'>정지</a>";
					str+="</td>";
					str+="</tr>";				
				})
				str+="</table>";
				$('#userTable').html(str);
			},
			error:function(err){
				alert('error : '+err.status);
			}
		})
	}
	
	function prodList(){
		$.ajax({
			url:'adminProdList',
			type:'get',
			dataType:'json',
			cache:false,
			success:function(res){
				str="<table class='table' id='productTable'>";
				str+="<tr>";
				str+="<th>번호</th>";
				str+="<th>물품 이름</th>";
				str+="<th>물품 설명</th>";
				str+="<th>판매자 아이디</th>";
				str+="<th>경매기간</th>";
				str+="<th></th>";
				str+="</tr>";
				$.each(res,function(i,data){
					str+="<tr>";
					str+="<td>"+data.prodNum+"</td>";
					str+="<td>"+data.prodName+"</td>";
					str+="<td style='overflow:hidden;'>";
					if(data.prodImage1 !=null){
						str+="<img src='${pageContext.request.contextPath}/resources/Product_Image/"+data.prodImage1+"' style='width:100px; height:100px;'><br>";
					}else if(data.prodImage1==null && data.prodImage2 !=null){
						str+="<img src='${pageContext.request.contextPath}/resources/Product_Image/"+data.prodImage1+"' style='width:100px; height:100px;'><br>";
					}else{
						str+="<img src='../resources/assets/img/noImage.jpg' style='width:100px; height:100px;'><br>";
					}
					str+=data.prodSpec+"</td>";
					str+="<td>"+data.userId+"</td>";
					str+="<td>"+data.auctionTime+"일</td>";
					str+="<td><a class='btn btn-danger' href='prodDelete?prodNum="+data.prodNum+"'>삭제</></td>";
					str+="</tr>";
				})
				str+="</table>";
				$('#prodList').html(str);
			},
			error:function(err){
				alert("error : "+err.status);
			}
		})
	}
	
	function findProd(){
		let prodName=$('#findProd').val();
		$.ajax({
			url:"adminfindProd",
			type:'post',
			data:"prodName="+prodName,
			dataType:'json',
			cache:false,
			success:function(res){
				str="<table class='table' id='productTable'>";
				str+="<tr>";
				str+="<th>번호</th>";
				str+="<th>물품 이름</th>";
				str+="<th>물품 정보</th>";
				str+="<th>판매자 아이디</th>";
				str+="<th>경매기간</th>";
				str+="<th></th>";
				str+="</tr>";
				$.each(res,function(i,data){
					str+="<tr>";
					str+="<td>"+data.prodNum+"</td>";
					str+="<td>"+data.prodName+"</td>";
					str+="<td style='overflow:hidden;'>";
					if(data.prodImage1 !=null){
						str+="<img src='${pageContext.request.contextPath}/resources/Product_Image/"+data.prodImage1+"' style='width:100px; height:100px;'><br>";
					}else if(data.prodImage1==null && data.prodImage2 !=null){
						str+="<img src='${pageContext.request.contextPath}/resources/Product_Image/"+data.prodImage1+"' style='width:100px; height:100px;'><br>";
					}else{
						str+="<img src='../resources/assets/img/noImage.jpg' style='width:100px; height:100px;'><br>";
					}
					str+=data.prodSpec+"</td>";
					str+="<td>"+data.userId+"</td>";
					str+="<td>"+data.auctionTime+"일</td>";
					str+="<td><a class='btn btn-danger' href='prodDelete?prodNum="+data.prodNum+"'>삭제</></td>";
					str+="</tr>";
				})
				str+="</table>";
				$('#prodList').html(str);
			},
			error:function(err){
				alert('error : '+err.status);
			}
		})
	}
	
	$(function(){
		userList();
		prodList();
		
		
		 var ctx = document.getElementById('chart').getContext('2d');
	        var chart = new Chart(ctx, {
	            // type : 'bar' = 막대차트를 의미합니다.
	            type: 'bar', // 
	            data: {
	                labels: ['디지털/가전','가구/인테리어','생활/가공식품','의류','게임/취미','도서'],
	                datasets: [{
	                    label: '카테고리별 누적 경매 수',
	                    backgroundColor: 'rgb(65, 75, 232)',
	                    borderColor: 'rgb(255, 99, 132)',
	                    data: [
	                    	<c:forEach items="${cateList}" var="data">
	                    		${data.count},
	                    	</c:forEach>
	                    ]
	                }]
	            },
	        });
	})
	
	
	
	
	
</script>
<c:import url="/top" />
<main id="main" class="main">
	<div class="card">
		<div class="card-body">
			<h3 style="margin: 15px 0px;"><strong>관리자 페이지</strong></h3>

			<!-- Default Tabs -->
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="user home-tab"
						data-bs-toggle="tab" data-bs-target="#user" type="button"
						role="tab" aria-controls="user" aria-selected="true"><strong>회원관리</strong></button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="donationOrg profile-tab"
						data-bs-toggle="tab" data-bs-target="#donationOrg" type="button"
						role="tab" aria-controls="donationOrg" aria-selected="false"><strong>기부단체관리</strong></button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="donation profile-tab"
						data-bs-toggle="tab" data-bs-target="#donation" type="button"
						role="tab" aria-controls="donation" aria-selected="false"><strong>기부내역</strong></button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="auction contact-tab"
						data-bs-toggle="tab" data-bs-target="#auction" type="button"
						role="tab" aria-controls="auction" aria-selected="false"><strong>경매관리</strong></button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="exchange contact-tab"
						data-bs-toggle="tab" data-bs-target="#exchange" type="button"
						role="tab" aria-controls="exchange" aria-selected="false"><strong>환불요청</strong></button>
				</li>
				<li class="nav-item" role="presentation">
					<div id="paybtn">
						<button class="nav-link" id="payment contact-tab"
							data-bs-toggle="tab" data-bs-target="#payment" type="button"
							role="tab" aria-controls="payment" aria-selected="false"><strong>결재내역</strong></button>
					</div>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="exchange contact-tab"
						data-bs-toggle="tab" data-bs-target="#report" type="button"
						role="tab" aria-controls="report" aria-selected="false"><strong>신고내역</strong></button>
				</li>
				
			</ul>
			<div class="tab-content pt-2" id="myTabContent">

				<!-- 유저관리 -->
				<div class="tab-pane fade show active" id="user" role="tabpanel"
					aria-labelledby="user-tab">
					<input id="findUser" class="form-control" type="text"
						placeholder="검색할 아이디를 입력해주세요" onkeyup="findUser()">

					<!-- 유저 목록 넣을곳 -->
					<div id="userTable"></div>
				</div>

				<!-- 기부단체관리 -->
				<div class="tab-pane fade" id="donationOrg" role="tabpanel"
					aria-labelledby="donationOrg-tab">
					<table id="mainOrg" class="table table-bordered">
						<tr>
							<th style="background-color: #FFC107">현재 기부단체</th>
						</tr>
						<tr>
							<td><c:out value="${main.donName}" /></td>
						</tr>
					</table>
					<table id="donTable" class="table">
						<tr>
							<th>번호</th>
							<th>단체 이름</th>
							<th>단체 설명</th>
							<th><a class="btn btn-primary" href="addOrgForm">단체 추가하기</a></th>
						</tr>
						<c:forEach items="${Org}" var="don">
							<tr>
								<td><c:out value="${don.donOrgNum}" /></td>
								<td><c:out value="${don.donName}" /></td>
								<td><c:out value="${don.donOrgInfo}" /><br>
									<div class="badge bg-warning text-dark">
										<c:out value="${don.donBankName}" />
										:
										<c:out value="${don.donBankAccount}" />
									</div></td>
								<td><a class="btn btn-warning"
									href="changeDon?donOrgNum=${don.donOrgNum}">변경</a> <a
									class="btn btn-danger" onclick="dondelete(${don.donOrgNum})">삭제</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<!-- 기부 현황 -->
				<div class="tab-pane fade show fade" id="donation" role="tabpanel"
					aria-labelledby="donation-tab">
					<h3>기부 미완료</h3>
					<table class="table" id="donTable" style="width: 60%; margin: 10px">
						<tr>
							<th>번호</th>
							<th>기부단체명</th>
							<th>기부 금액</th>
							<th></th>
						</tr>
						<c:forEach items="${donate}" var="data" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${data.donOrgName}</td>
								<td>${data.donAmount}원</td>
								<td><a class="btn btn-success"
									href="donateEnd?orgName=${data.donOrgName}&amount=${data.donAmount}">처리완료</a></td>
							</tr>
						</c:forEach>
					</table>
					<h3>기부 완료</h3>
					<table class="table" id="donTable" style="width: 50%; margin: 10px">
						<tr>
							<th>번호</th>
							<th>기부단체명</th>
							<th>누적 기부 금액</th>
						</tr>
						<c:forEach items="${donEnd}" var="data" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${data.donOrgName}</td>
								<td>${data.donAmount}원</td>
							</tr>
						</c:forEach>
					</table>

				</div>
				<!-- 경매 관리 -->
				<div class="tab-pane fade" id="auction" role="tabpanel"
					aria-labelledby="auction-tab">
					
					<div style="width:600px;height:300px; margin:auto">
						<canvas id="chart"></canvas>
					</div>
					
					<input id="findProd" class="form-control" type="text"
						placeholder="검색할 물품 이름을 입력하세요" onkeyup="findProd()">
					<div id="prodList">
						<!-- 경매 물품 들어갈곳 -->
					</div>

				</div>

				<!-- 환불 요청 -->
				<div class="tab-pane fade" id="exchange" role="tabpanel"
					aria-labelledby="exchange-tab">
					<table class="table" id="exTable">
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>아이디
							<th>
							<th>내용</th>
							<th>요청 날짜</th>
							<th></th>
						</tr>
						<c:forEach items="${exchange}" var="data">
							<tr>
								<td><c:out value="${data.exchangeNum}" /></td>
								<td><c:out value="${data.userName}" /></td>
								<td><c:out value="${data.userId}" /></td>
								<td>요청 포인트 : <c:out value="${data.exchangePoint}" /><br>
									<div class="badge bg-warning text-dark">
										<c:out value="${data.bankName}" />
										:
										<c:out value="${data.bankAccountNum}" />
									</div>
								</td>
								<td><fmt:formatDate var="date" value="${data.exchangeTime}"
										type="DATE" pattern="yyyy-MM-dd" />${date}</td>
								<td><a class="btn btn-primary"
									href="successEmail?Email=${data.userEmail}&num=${data.exchangeNum}&point=${data.exchangePoint}">처리
										완료</a> <a class="btn btn-warning"
									href="deleteExchange?num=${data.exchangeNum}">취소</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<!-- 결재 내역 -->
				<div class="tab-pane fade" id="payment" role="tabpanel"
					aria-labelledby="payment-tab">
					<input id="search" class="form-control" type="text"
						placeholder="검색할 아이디를 입력해주세요">
					<table class="table" id="payTable">
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>결제 금액</th>
							<th>결제 날짜</th>
							<th></th>
						</tr>
						<c:forEach items="${pay}" var="data">
							<tr>
								<td><c:out value="${data.merchant_uid}" /></td>
								<td><c:out value="${data.buyer_id}" /></td>
								<td><c:out value="${data.paid_amount}" /></td>
								<td><fmt:formatDate var="date2" value="${data.payTime}"
										type="DATE" pattern="yyyy-MM-dd HH:mm:ss" />${date2}</td>
								<td><a class="btn btn-danger"
									href="cancelPay?num=${data.merchant_uid}">결제 취소</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
				<!-- 신고내역 -->
				<div class="tab-pane fade" id="report" role="tabpanel"
					aria-labelledby="report-tab">
					<table class="table" id="reTable">
						<tr>
							<th>번호</th>
							<th>신고자</th>
							<th>피신고자</th>
							<th>신고 내용</th>
							<th></th>
						</tr>
						<c:forEach items="${repoList}" var="data">
							<tr>
								<td><c:out value="${data.reportNum}" /></td>
								<td><c:out value="${data.userId}" /> <a href="toUserChat?toId=${data.userId}" class="btn btn-primary">채팅</a></td>
								<td><c:out value="${data.reportedUserId}" /> <a href="toUserChat?toId=${data.reportedUserId}" class="btn btn-primary">채팅</a></td>
								<td><c:out value="${data.reportContent}"/></td>
								<td><a class="btn btn-danger" href="cancelAuction?aucNum=${data.aucEndNum}">거래취소</a> <a class="btn btn-success"
									href="reportComplete?num=${data.reportNum}">처리 완료</a> 
									</td>
							</tr>
						</c:forEach>
					</table>
				</div>

			</div>
			<!-- End Default Tabs -->
		</div>
	</div>
</main>
<c:import url="/foot" />

