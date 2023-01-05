<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<style>
	#wrap{
		width:100%;
	}
	#mainOrg{
		width:30%;
		text-align:center; 
		margin:auto;
	}
	#donTable tr th,td{
		text-align:center;
		vertical-align:middle; 
	}
	#donTable tr td:nth-child(4n+1){
		width:10%;
		
	}
	#donTable tr td:nth-child(4n+2){
		width:20%;
	}
	#donTable tr td:nth-child(4n+3){
		width:50%;
	}
	#donTable tr td:nth-child(4n+4){
		width:20%;
		text-align:center;
	}
	
	#exTable tr th{
		text-align:center; 
	}
	
	#payTable tr th{
		text-align:center; 
	}
	
	#userTable tr th{
		text-align:center;
	}
	
	#userTable tr td:nth-child(6n+4){
		text-align:left;
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
		$.ajax({
			url:'adminfindUser',
			type:'post',
			data:'userId='+userId,
			dataType:'json',
			cache:false,
			success:function(res){
				
			},
			error:function(err){
				alert('error : '+err.status);
			}
		})
	
	}
</script>
<c:import url="/top" />
<main id="main" class="main">
	<div class="card">
            <div class="card-body">
              <h3 style="margin:15px 0px;">관리자 페이지</h3>

              <!-- Default Tabs -->
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="user home-tab" data-bs-toggle="tab" data-bs-target="#user" type="button" role="tab" aria-controls="user" aria-selected="true">회원관리</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="donation profile-tab" data-bs-toggle="tab" data-bs-target="#donation" type="button" role="tab" aria-controls="donation" aria-selected="false">기부단체관리</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="auction contact-tab" data-bs-toggle="tab" data-bs-target="#auction" type="button" role="tab" aria-controls="auction" aria-selected="false">경매관리</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="exchange contact-tab" data-bs-toggle="tab" data-bs-target="#exchange" type="button" role="tab" aria-controls="exchange" aria-selected="false">환불요청</button>
                </li>
                <li class="nav-item" role="presentation">
                  <div id="paybtn"><button class="nav-link" id="payment contact-tab" data-bs-toggle="tab" data-bs-target="#payment" type="button" role="tab" aria-controls="payment" aria-selected="false">결재내역</button></div>
                </li>
              </ul>
              <div class="tab-content pt-2" id="myTabContent">
              
              	<!-- 유저관리 -->
                <div class="tab-pane fade show active" id="user" role="tabpanel" aria-labelledby="user-tab">
                	<input id="findUser"class="form-control" type="text" placeholder="검색할 아이디를 입력해주세요" onkeyup="findUser()">
               		<table class="table" id="userTable">
               			<tr id="userResult">
               				<th>번호</th>
               				<th>이름</th>
               				<th>아이디</th>
               				<th>회원 정보</th>
               				<th>회원상태</th>
               				<th>회원 전환</th>
               			</tr>
               			<c:forEach items="${userList}" var="data">
	               			<tr>
	               				<td><c:out value="${data.userNum}"/></td>
	               				<td><c:out value="${data.userName}"/></td>
	               				<td><c:out value="${data.userId}"/></td>
	               				<td>
	               					연락처 : <c:out value="${data.userTel}"/><br>
	               					이메일 : <c:out value="${data.userEmail}"/><br>
	               					주 소 : <c:out value="${data.userAddr2}"/>(<c:out value="${data.userAddr1}"/>)<br>
	               					상세 주소	: <c:out value="${data.userAddr3}"/><br>
	               					포인트 : <c:out value="${data.userPoint}"/>
	               				</td>
	               				<td>
	               					<c:if test="${data.userStatus eq 0}">
	               						<div class="badge bg-primary">일반회원</div>
	               					</c:if>
	               					<c:if test="${data.userStatus eq 3}">
	               						<div class="badge bg-warning">정지회원</div>
	               					</c:if>
	               				</td>
	               				<td>
	               					<a class="btn btn-primary" href="normalUser?userNum=${data.userNum}">일반</a> <a class="btn btn-warning" href="stopUser?userNum=${data.userNum}">정지</a>
	               				</td>
	               			</tr>
               			</c:forEach>
               		</table>
                </div>
                
                <!-- 기부관리 -->
                <div class="tab-pane fade" id="donation" role="tabpanel" aria-labelledby="donation-tab">
					<table id="mainOrg" class="table table-bordered">
						<tr>
							<th style="background-color:#FFC107">현재 기부단체</th>
						</tr>
						<tr>
							<td><c:out value="${main.donName}"/></td>
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
							<td><c:out value="${don.donOrgNum}"/></td>
							<td><c:out value="${don.donName}"/></td>
							<td>
								<c:out value="${don.donOrgInfo}"/><br>
								<div class="badge bg-warning text-dark"><c:out value="${don.donBankName}"/> : <c:out value="${don.donBankAccount}"/> </div> 
							</td>
							<td>
								<a class="btn btn-warning" href="changeDon?donOrgNum=${don.donOrgNum}">변경</a> <a class="btn btn-danger" onclick="dondelete(${don.donOrgNum})">삭제</a>
							</td>
						</tr>
						</c:forEach>
					</table>
                </div>
                
                <!-- 경매 관리 -->
                <div class="tab-pane fade" id="auction" role="tabpanel" aria-labelledby="auction-tab">
                	<input class="form-control" type="text" placeholder="검색할 물품 이름을 입력하세요">
                
                </div>
                
                <!-- 환불 요청 -->
                <div class="tab-pane fade" id="exchange" role="tabpanel" aria-labelledby="exchange-tab">
                	<table class="table" id="exTable">
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>내용</th>
							<th>요청 날짜</th>
							<th></th>
						</tr>
						<c:forEach items="${exchange}" var="data">
							<tr>
								<td><c:out value="${data.exchangeNum}"/></td>
								<td><c:out value="${data.userName}"/></td>
								<td>
									요청 포인트 : <c:out value="${data.exchangePoint}"/><br>
									<div class="badge bg-warning text-dark">
										<c:out value="${data.bankName}"/> : <c:out value="${data.bankAccountNum}"/>
									</div>
								</td>
								<td>
									<fmt:formatDate  var="date" value="${data.exchangeTime}" type="DATE" pattern="yyyy-MM-dd"/>${date}
								</td>
								<td>
									<a class="btn btn-primary" href="successEmail?Email=${data.userEmail}&num=${data.exchangeNum}&point=${data.exchangePoint}">처리 완료</a> 
									<a class="btn btn-warning" href="deleteExchange?num=${data.exchangeNum}">취소</a>
								</td>
							</tr>
						</c:forEach>
                	</table>
                </div>
                
                <!-- 결재 내역 -->
                <div class="tab-pane fade" id="payment" role="tabpanel" aria-labelledby="payment-tab">
                	<input id="search"class="form-control" type="text" placeholder="검색할 아이디를 입력해주세요">
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
                				<td><c:out value="${data.merchant_uid}"/></td>
                				<td><c:out value="${data.buyer_id}"/></td>
                				<td><c:out value="${data.paid_amount}"/></td>
                				<td>
                					<fmt:formatDate  var="date2" value="${data.payTime}" type="DATE" pattern="yyyy-MM-dd HH:mm:ss"/>${date2}
                				</td>
                				<td>
                					<a class="btn btn-danger" href="cancelPay?num=${data.merchant_uid}">결제 취소</a>
                				</td>
                			</tr>
                		</c:forEach>
                	</table>
                </div>
                
              </div><!-- End Default Tabs -->
            </div>
          </div>
</main>
<c:import url="/foot" />

