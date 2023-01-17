<%@page import="three.profile.service.ProfileService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://webfontworld.github.io/kopus/KoPubWorldDotum.css" rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="/top" />

 <!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  <!-- css -->
  <link href="resources/assets/css/users-profile.css" rel="stylesheet" type="text/css">
<main id="main" class="main">

 <div class="pagetitle">
    <h1>Profile</h1>
    <nav>
      <ol class="breadcrumb" >
        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
        <li class="breadcrumb-item">Users</li>
        <li class="breadcrumb-item active">Profile</li>
      </ol>
    </nav>
  </div><!-- End Page Title -->

  <section class="section profile">
    <div class="row">
    
      <div class="col-xl-3">
        <div class="card">
          <div class="card-body profile-card pt-4 d-flex flex-column align-items-center" style="font-family:KoPubWorldDotum;">

            <img 
            src="${path}\resources\User_Image/${user.userImage}" 
            alt="Profile" class="rounded-circle" >
            <h2>${user.userName }</h2>
            <h3>${user.userNick }</h3>
            <h4>${user.userEmail }</h4>
            
            <div class="mx-auto text-center">
              <img src="${path}/resources/assets/img//gold.jpg" class="rounded" alt="Gold" style="width:15%;">
            <input type="text" class="gold text-center" 
            style="border:none;font-size:large;max-width:5rem" value="${user.userGoldBadge } 개" readonly>
             </div>
             <div class="mx-auto text-center">
               <img src="${path}/resources/assets/img//silver.jpg" class="rounded" alt="Silver" style="width:15%;">
               	<input type="text" class="silver text-center" 
               	style="border:none;font-size:large;max-width:5rem" value="${user.userSilverBadge } 개" readonly>
             </div>
             <div class="mx-auto text-center">
               <img src="${path}/resources/assets/img//bronze.jpg" class="rounded" alt="Bronze" style="width:15%;">
                 	<input type="text" class="bronze text-center" 
                 	style="border:none;font-size:large;max-width:5rem" value="${user.userBronzeBadge } 개" readonly>
             </div>
            
            <div class="mx-auto text-center">
                  
            </div>
          </div>
        </div>
      </div>

      <div class="col-xl-8">
        <div class="card">
          <div class="card-body pt-3">
            <!-- Bordered Tabs -->
            <ul class="nav nav-tabs nav-tabs-bordered">

              <li class="nav-item">
                <button id="pofileTab" class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile"><strong>프로필</strong></button>
              </li>

              <li class="nav-item">
                <button id="pointTab" class="nav-link" data-bs-toggle="tab" data-bs-target="#point"><strong>포인트</strong></button>
              </li>

              <li class="nav-item">
                <button id="trade-statusTab" class="nav-link" data-bs-toggle="tab" data-bs-target="#trade-status"><strong>거래내역</strong></button>
              </li>

              <li class="nav-item">
                <button id="profile-changeTab" class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change"><strong>개인정보변경</strong></button>
              </li>

            </ul>
            
            
            <div class="tab-content pt-2">
              <!-- profile start -->
              <div class="tab-pane fade show active profile" id="profile">
                <p class="card-title" style="margin-left:100px;">Introduction</p>
                <div class="row">
                  <div class="col-lg-9 col-md-8" style="margin-left:100px;">
                  <p class="middle fst-italic">
                  <strong>${user.userInfo }</strong>
                </p>
                </div>
              </div>
				
                <p class="card-title" style="margin-left:100px;">Profile Details</p>
                
                <div class="row" style="margin-left:100px;">
                  <div class="col-lg-3 col-md-4 label "><h5>이름 : </h5></div>
                  <div class="col-lg-9 col-md-8 text-center"><strong>${user.userName }</strong></div>
                </div>

                <div class="row" style="margin-left:100px;">
                  <div class="col-lg-3 col-md-4 label"><h5>닉네임 : </h5></div>
                  <div class="col-lg-9 col-md-8 text-center"><strong>${user.userNick }</strong></div>
                </div>
                
                <div class="row" style="margin-left:100px;">
                  <div class="col-lg-3 col-md-4 label" style="margin-top:5px"><h5>메달 : </h5></div>
                  <div class="col-lg-9 col-md-8 text-center">
                  	<img src="${path}/resources/assets/img//gold.jpg" class="rounded" alt="Gold" style="width:5%;">
                 	<input type="text" class="gold text-center" 
                 	style="border:none;font-size:12px;width:10%" value="${user.userGoldBadge } 개" readonly>
                	<img src="${path}/resources/assets/img//silver.jpg" class="rounded" alt="Silver" style="width:5%;">
               		<input type="text" class="silver text-center" 
               		style="border:none;font-size:12px;width:10%" value="${user.userSilverBadge } 개" readonly>
                  	<img src="${path}/resources/assets/img//bronze.jpg" class="rounded" alt="Bronze" style="width:5%;">
                 	<input type="text" class="bronze text-center" 
                 	style="border:none;font-size:12px;width:10%" value="${user.userBronzeBadge } 개" readonly>
                  </div>
                </div>
				
				<div class="row" style="margin-left:100px;">
                  <div class="col-lg-3 col-md-4 label"><h5>포인트 : </h5></div>
                  <div class="col-lg-9 col-md-8 text-center"><strong>${user.userPoint } 포인트</strong></div>
                </div>
                
                <div class="row" style="margin-left:100px;">
                  <div class="col-lg-3 col-md-4 label"><h5>평점 : </h5></div>
                  <div class="col-lg-9 col-md-8 text-center"><strong>${average}/5점</strong></div>
                </div>
				
                <div class="row" style="margin-left:100px;">
                  <div class="col-lg-3 col-md-4 label"><h5>이메일 : </h5></div>
                  <div class="col-lg-9 col-md-8 text-center"><strong>${user.userEmail }</strong></div>
                </div>

                <div class="row" style="margin-left:100px;">
                  <div class="col-lg-3 col-md-4 label"><h5>연락처 : </h5></div>
                  <div class="col-lg-9 col-md-8 text-center"><strong>${user.userTel.substring(0,3)}-${user.userTel.substring(3,7)}-${user.userTel.substring(7)}</strong></div>
                </div>
				
                <div class="row" style="margin-left:100px;">
                  <div class="col-lg-3 col-md-4 label"><h5>주소 : </h5></div>
                  <div class="col-lg-9 col-md-8 text-center"><strong>[${user.userAddr1}] ${user.userAddr2 } / ${user.userAddr3 }</strong></div>
                </div>
                
              </div>
              <!-- End profile start -->
              
              <!-- Point Form -->
              <div class="tab-pane fade point pt-3" id="point">
			      <div class="row mb-3">
                  <label for="pointAmount" class="col-md-4 col-lg-3 col-form-label">포인트 잔액</label>
                  <div class="col-md-8 col-lg-9">
                      <input name="pointAmount" type="text" class="form-control" id="pointAmount" value="${user.userPoint } 포인트" readonly>
                  </div>
              </div>

                  <div class="text-center">
                    <button type="button" class="btn btn-primary px-md-5" data-bs-toggle="modal" data-bs-target="#recharge" >
                     충전
                    </button>
                    <button type="button" class="btn btn-primary px-md-5" data-bs-toggle="modal" data-bs-target="#exchange" >
                      환전
                     </button>
                     <button type="button" class="btn btn-primary px-md-5" data-bs-toggle="modal" data-bs-target="#donate" >
                      기부
                     </button>
	
	
                        <!-- 포인트 충전 Modal -->
                        <div class="modal fade" id="recharge" tabindex="-1">
                          <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                              <div class="text-center modal-header">
                                <h5 class="modal-title">포인트 충전하기</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                충전할 포인트를 적으세요.
                              </div>
                              <div class="modal-body" style="width:70%;margin:auto">
                                <input type="number" class="form-control" id="recharge-point" value=0>
                              </div>  
                              <div class="modal-body">
	                              <button type="button" onclick=plus("10k","recharge") class="btn btn-outline-primary btn-sm">+10000</button>
	                              <button type="button" onclick=plus("5k","recharge") class="btn btn-outline-primary btn-sm">+5000</button>
	                              <button type="button" onclick=plus("1k","recharge") class="btn btn-outline-primary btn-sm">+1000</button>
	                              <button type="button" onclick=plus("0.1k","recharge") class="btn btn-outline-primary btn-sm">+100</button>
	                              <button type="button" onclick=plus("reset","recharge") class="btn btn-outline-primary btn-sm">Reset</button>
                              </div>  
                              <div class="modal-footer">
                                <button type="button" id="recharge-process" class="btn btn-primary">충전하기</button>      
                                <button type="button" id="recharge-list" class="btn btn-primary"
                                data-bs-toggle="modal" data-bs-target="#rechargeList">충전내역</button>      
                                <button type="button" class="close btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                              </div>
                            </div>
                          </div>
                        </div><!-- End 포인트 충전 Modal-->
                        
                        <!-- 포인트 충전 List Modal -->
                        <div class="modal fade" id="rechargeList" tabindex="-1">
                          <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                              <div class="text-center modal-header">
                                <h5 class="modal-title">포인트 충전내역</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div id="re-list" class="modal-body"> 
                              </div>  
                              <div class="modal-footer">
                                <button type="button" id="recharge-process" class="btn btn-primary" 
                                data-bs-toggle="modal" data-bs-target="#recharge">충전하기</button>      
                                <button type="button" class="close btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                              </div>
                            </div>
                          </div>
                        </div><!-- 포인트 충전 List Modal-->
				
<script>
function plus(amount,type){
	let number = $('#'+type+'-point').val();
	if(amount === '10k'){
		number = parseInt(number)+10000;
	}else if(amount === '5k'){
		number = parseInt(number)+5000;
	}else if(amount === '1k'){
		number = parseInt(number)+1000;
	}else if(amount === '0.1k'){
		number = parseInt(number)+100;
	}else if(amount === 'reset'){
		number = 0;
	}
	$('#'+type+'-point').attr("value",number);
}


$(document).ready(function(){
	$('#recharge-process').click(function(){
		requestPay();
	})
	$('#recharge-list').click(function(){
		rechargeList();
	})
});
	var IMP = window.IMP;  
  	IMP.init("imp07481554"); 
	 function requestPay() {
		 if($('#recharge-point').val()<100){
			 alert('100원부터 결제 가능합니다')
			 return;
		 }
	    IMP.request_pay({
	      pg: "html5_inicis.INIpayTest",
	      pay_method: "card",
	      merchant_uid: "${user.userNum}"+new Date().getTime(),   // 주문번호(회원번호+현재시간)
	      name: "기부앤테이크포인트",
	      amount: $('#recharge-point').val(),   // 숫자 타입
	      buyer_email: "${user.userEmail}",
	      buyer_name: "${user.userName}",
	      buyer_tel: "${user.userTel}",
	      buyer_postcode : "${user.userAddr1}",
	      buyer_addr: "${user.userAddr2} ${user.userAddr3}"
	    }, function(rsp) {
			//console.log(rsp);
		    if ( rsp.success ) {
		    	var paymentData={
	    			"imp_uid":rsp.imp_uid,
	        		"merchant_uid":rsp.merchant_uid,
	        		"buyer_email":rsp.buyer_email,
	        		"buyer_id":"${user.userId}",
	        		"paid_amount":rsp.paid_amount
		    	}
		        $.ajax({
		        	type:'post',
		        	url:'users-profile/payment',
		        	dataType:'json',
		        	contentType:'application/json',
		        	data:JSON.stringify(paymentData)
		        }).done(function(data){
		        	//alert(data);
				    	var msg = '결제가 완료되었습니다.\n';
				        msg += '상점 거래ID : ' + rsp.merchant_uid+'\n';
				        msg += '결제 금액 : ' + rsp.paid_amount;
					    alert(msg);
					    history.go(0);
		        });
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
				    alert(msg);
		    }
	    });
	}
	function rechargeList(){
			$('#recharge-point').attr("value",0);
			let userId="${user.userId}";
			$.ajax({
				type:'get',
				url:'users-profile/rechargeList',
				data:'userId='+userId,
				dataType:'json',
				success:function(res){
					let str = '<table class="table table-striped">';
					str += '<thead>';
					str += '<tr>';
					str += '<th>결제번호</th>';
					str += '<th>ID</th>';
					str += '<th>결제 포인트</th>';
					str += '<th>날짜</th>';
					str += '</tr>';
					str += '</thead>';
					str += '<tbody>';
					$.each(res,function(i,rvo){
					let fdate=new Date(rvo.payTime);
					let date=fdate.getFullYear()+"-"+(fdate.getMonth()+1)+"-"+fdate.getDate();
						str += '<tr>'; 
						str += '<td>'+rvo.merchant_uid+'</td>'; 
						str += '<td>'+rvo.buyer_id+'</td>'; 
						str += '<td>'+rvo.paid_amount+'포인트</td>'; 
						str += '<td>'+date+'</td>'; 
						str += '</tr>'; 
					})
						str += '</tbody>';
						$('#re-list').html(str);
				},
				error:function(err){
					var msg = "목록 불러오기에 실패했습니다";
					mag += "err: "+err.status;
					alert(msg)
				}
			})
		}
	
  </script>
             
                         <!-- 포인트 환급 Modal -->       
                         <div class="modal fade" id="exchange" tabindex="-1">
                          <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                              <div class="text-center modal-header">
                                <h5 class="modal-title">포인트 환급 받기</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                              <table class="modal-body">
                              	<tr>
                              		<td style="width:30%">은행명 :</td>
                              		<td>
                              			<input id="bankName" class="form-control text-center" type="text" placeholder="OO은행">
                              		</td>
                              	</tr>
                              	<tr>
                              		<td>계좌번호 :</td>
                              		<td>
                                		<input type="text" id="bankAccountNum" class="form-control text-center" placeholder="숫자만 써주세요">
                              		</td>
                              	</tr>
                              	<tr>
                              		<td>이름 :</td>
                              		<td>
                                		<input id="userName" class="form-control text-center" type="text" value="${user.userName }" required>
                              		</td>
                              	</tr>
                              	<tr>
                              		<td>환급받을 포인트 :</td>
                              		<td>
                              			<input type="number" class="form-control" id="exchange-point" value=0 >
                              		</td>
                              	</tr>
                              </table>
                              </div>
                              <div class="modal-body" >
	                              <button type="button" onclick=plus("10k","exchange") class="btn btn-outline-primary btn-sm">+10000</button>
	                              <button type="button" onclick=plus("5k","exchange") class="btn btn-outline-primary btn-sm">+5000</button>
	                              <button type="button" onclick=plus("1k","exchange") class="btn btn-outline-primary btn-sm">+1000</button>
	                              <button type="button" onclick=plus("0.1k","exchange") class="btn btn-outline-primary btn-sm">+100</button>
	                               <button type="button" onclick=plus("reset","exchange") class="btn btn-outline-primary btn-sm">Reset</button>
                              </div>  
                              <div class="modal-footer">
                                <button type="button" id="exchange-process" class="btn btn-primary">환전하기</button>
                                <button type="button" id="exchange-list" class="btn btn-primary"
                                data-bs-toggle="modal" data-bs-target="#exchangeList">환전내역</button>
                                <button type="button" class="close btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                              </div>
                            </div>
                          </div>
                        </div><!-- End 포인트 환급 Modal-->
                        
                        <!-- 포인트 환전 List Modal -->
                         <div class="modal fade" id="exchangeList" tabindex="-1">
                          <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                              <div class="text-center modal-header">
                                <h5 class="modal-title">포인트 환전내역</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div id="ex-list" class="modal-body">
                              </div> 
                              <div class="modal-footer">
                                <button type="button" class="btn btn-primary"
                                data-bs-toggle="modal" data-bs-target="#exchange">환전하기</button>
                                <button type="button" class="close btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                              </div>
                            </div>
                          </div>
                        </div><!-- 포인트 환전 List Modal-->
            
<script>
$(document).ready(function(){
	$('#exchange-process').click(function(){
		exchangePoint();
	})
	$('#exchange-list').click(function(){
		exchangeList();
	})
});
function isBank(input){
	let val=input;
	let pattern=/^[가-힣a-zA-Z]+$/;
	let b=pattern.test(val); //정규식 패턴에 맞으면 true를 반환하고, 틀리면 false를 반환한다
	return b;
}
function isNum(input){
	let val=input;
	let pattern=/^[0-9]+$/;
	let b=pattern.test(val); //정규식 패턴에 맞으면 true를 반환하고, 틀리면 false를 반환한다
	return b;
}
function isName(input){
	let val=input;
	let pattern=/^[가-힣]+$/;
	let b=pattern.test(val); //정규식 패턴에 맞으면 true를 반환하고, 틀리면 false를 반환한다
	return b;
}
function exchangePoint(){
	if(!isBank($('#bankName').val())){
		alert('은행명을 정확히 입력하세요');
		$('#bankName').val('');
		$('#bankName').focus();
		return;
	}
	if(!isNum($('#bankAccountNum').val())){
		alert('계좌번호를 숫자로만 입력하세요');
		$('#bankAccountNum').val('');
		$('#bankAccountNum').focus();
		return;
	}
	if(!isName($('#userName').val())){
		alert('이름을 정확히 입력하세요');
		$('#bankAccountNum').focus();
		return;
	}
	if($('#exchange-point').val() < 1000){
		alert('환전은 1000포인트 이상부터 가능합니다');
		return;
	}
	if($('#exchange-point').val()>${user.userPoint}){
		alert("보유하신 포인트가 부족합니다");
		$('#exchange-point').attr("value",0);
		$('#exchange-point').focus();
		return;
	}
	var dataObj={
		    "bankName":$('#bankName').val(), 
		    "bankAccountNum":$('#bankAccountNum').val(), 
		    "userName":$('#userName').val(),
		    "userEmail":"${user.userEmail}",
		    "userId":"${user.userId}",
		    "exchangePoint":$('#exchange-point').val()
	}
	$.ajax({
		type:'post',
       	url:'users-profile/exchange',
       	dataType:'json',
       	contentType:'application/json',
       	data:JSON.stringify(dataObj),
 			success:function(res){
 				var msg = "환전요청이 완료되었습니다\n";
 				msg += "은행명"+res["bankName"]+"\n";
 				msg += "계좌번호"+res["bankAccountNum"];
 				alert(msg);
 				history.go(0);
 				
 			},
 			error:function(err){
 				alert('환전요청이 실패하였습니다');
 				alert('err: '+err.status);
 			}	
 		})
 		$('#bankName').val('');
	$('#bankAccountNum').val('');
	$('#exchange-point').attr("value",0);
	$('#exchange-point').focus();
}
function exchangeList(){
	$('#bankName').val('');
	$('#bankAccountNum').val('');
	$('#exchange-point').val('0');
	let userId="${user.userId}";
	$.ajax({
		type:'get',
		url:'users-profile/exchangeList',
		data:'userId='+userId,
		dataType:'json',
		success:function(res){
			let str = '<table class="table table-striped">';
			str += '<thead>';
			str += '<tr>';
			str += '<th>은행명</th>';
			str += '<th>계좌번호</th>';
			str += '<th>ID</th>';
			str += '<th>환전 포인트</th>';
			str += '<th>날짜</th>';
			str += '<th>진행상황</th>';
			str += '</tr>';
			str += '</thead>';
			str += '<tbody>';
			$.each(res,function(i,rvo){
			let fdate=new Date(rvo.exchangeTime);
			let date=fdate.getFullYear()+"-"+(fdate.getMonth()+1)+"-"+fdate.getDate();
				str += '<tr>'; 
				str += '<td>'+rvo.bankName+'</td>'; 
				str += '<td>'+rvo.bankAccountNum+'</td>'; 
				str += '<td>'+rvo.userId+'</td>'; 
				str += '<td>'+rvo.exchangePoint+'포인트</td>'; 
				str += '<td>'+date+'</td>';
				if(rvo.exchangeStatus==0){
					str += '<td>요청 중</td>'; 
					str += '</tr>'; 
				}else if(rvo.exchangeStatus==1){
					str += '<td>환전완료</td>';
					str += '</tr>'; 
				}else if(rvo.exchangeStatus==2){
					str += '<td>요청취소</td>';
					str += '</tr>';
				}
			})
				str += '</tbody>';
				$('#ex-list').html(str);
		},
		error:function(err){
			var msg = "목록 불러오기에 실패했습니다";
			mag += "err: "+err.status;
			alert(msg)
		}
	})
}
	
</script>
                         <!-- 포인트 기부 Modal -->
                         <div class="modal fade" id="donate" tabindex="-1">
                          <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                              <div class="text-center modal-header">
                                <h5 class="modal-title">포인트 기부하기</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                              기부할 포인트를 적으세요.
                              </div>
                              <div class="modal-body" style="width:70%;margin:auto"> 
                              	<input type="number" class="form-control" id="donate-point"  value=0>
                              </div>
                              <div class="modal-body">
	                              <button type="button" onclick=plus("10k","donate") class="btn btn-outline-primary btn-sm">+10000</button>
	                              <button type="button" onclick=plus("5k","donate") class="btn btn-outline-primary btn-sm">+5000</button>
	                              <button type="button" onclick=plus("1k","donate") class="btn btn-outline-primary btn-sm">+1000</button>
	                              <button type="button" onclick=plus("0.1k","donate") class="btn btn-outline-primary btn-sm">+100</button>
	                               <button type="button" onclick=plus("reset","donate") class="btn btn-outline-primary btn-sm">Reset</button>
                              </div> 
                              <div class="modal-footer">
                                <button type="button" id="donate-process" class="btn btn-primary">기부하기</button>
                                <button type="button" id="donate-list" class="btn btn-primary"
                                 data-bs-toggle="modal" data-bs-target="#donateList">기부내역</button>
                                <button type="button" class="close btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                              </div>
                            </div>
                          </div>
                        </div><!-- End 포인트 기부 Modal-->
                        
                        <!-- 포인트 기부 List Modal -->
                         <div class="modal fade" id="donateList" tabindex="-1">
                          <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                              <div class="text-center modal-header">
                                <h5 class="modal-title">포인트 기부내역</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div id="do-list" class="modal-body">
                              </div> 
                              <div class="modal-footer">
                                <button type="button" class="btn btn-primary"
                                 data-bs-toggle="modal" data-bs-target="#donate">기부하기</button>
                                <button type="button" class="close btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                              </div>
                            </div>
                          </div>
                        </div><!-- End 포인트 기부List Modal-->
<script>
$(document).ready(function(){
	$('#donate-process').click(function(){
		//alert('기부');
		donatePoint();
	})
	$('#donate-list').click(function(){
		//alert('기부리스트');
		donateList();
	})
});

function donatePoint(){
	var donAmount=$('#donate-point').val();
	if(donAmount > ${user.userPoint}){
		alert("보유하신 포인트가 부족합니다");
		$('#donate-point').attr("value",0);
		$('#donate-point').focus();
		return;
	}
	if(donAmount < 100){
		alert('100포인트이상부터 기부가 가능합니다');
		$('#donate-point').attr("value",0);
    	$('#donate-point').focus();
    	return;
	}
	var dataObj={
			"donAmount":donAmount,
			"userId":"${user.userId}",
	}
	$.ajax({
		type:'post',
       	url:'users-profile/donate',
       	dataType:'json',
       	contentType:'application/json',
       	data:JSON.stringify(dataObj),
       	success:function(res){
       		alert('포인트로 기부하기가 완료되었습니다')
       		$('#donate-point').attr("value",0);
    		$('#donate-point').focus();
    		$('#pointAmount').val('${user.userPoint}원');
    		history.go(0);
       	},
       	error:function(err){
       		alert(err.status)
       		alert('포인트로 기부하기가 실패하였습니다')
       		$('#donate-point').attr("value",0);
    		$('#donate-point').focus();
       		return;
       	}
	})
}//----------------

function donateList(){
	$('#donate-point').val('0');
	let userId="${user.userId}";
	$.ajax({
		type:'get',
		url:'users-profile/donateList',
		data:'userId='+userId,
		dataType:'json',
		success:function(res){
			let str = '<table class="table table-striped">';
			str += '<thead>';
			str += '<tr>';
			str += '<th>회원 ID</th>';
			str += '<th>기부 단체</th>';
			str += '<th>기부 금액</th>';
			str += '<th>기부 형태</th>';
			str += '<th>날짜</th>';
			str += '</tr>';
			str += '</thead>';
			str += '<tbody>';
			$.each(res,function(i,rvo){
			let fdate=new Date(rvo.donationTime);
			let date=fdate.getFullYear()+"-"+(fdate.getMonth()+1)+"-"+fdate.getDate();
				str += '<tr>'; 
				str += '<td>'+rvo.userId_fk+'</td>'; 
				str += '<td>'+rvo.donOrgName+'</td>'; 
				str += '<td>'+rvo.donAmount+'포인트</td>';
				if(rvo.donationType == "1"){
					str += '<td>경매</td>'; 
				}else if(rvo.donationType == "2"){
					str += '<td>포인트</td>'; 
				}
				str += '<td>'+date+'</td>'; 
				str += '</tr>'; 
			})
				str += '</tbody>';
				$('#do-list').html(str);
		},
		error:function(err){
			var msg = "목록 불러오기에 실패했습니다";
			mag += "err: "+err.status;
			alert(msg)
		}
	})
}//---------
</script>     
                </div>
              </div>
              <!-- End settings Form -->

              <!-- trade-status Form -->
              <div class="tab-pane trade-status fade pt-3" id="trade-status">
              <table class="table">
                <thead style="text-align:center;">
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">
                      물품명
                    </th>
                    <th scope="col">
                      판매자
                    </th>
                    <th scope="col">
                      구매자
                    </th>
                    <th scope="col">
                      낙찰 가격
                    </th>
                    <th scope="col">
                      입찰 날짜
                    </th>
                    <th scope="col">
                      진행상태
                    </th>
                  </tr>
                </thead>
                <tbody style="text-align:center;vertical-align:middle;">
                <c:forEach items="${myList}" var="data" varStatus="i">
                  <tr>
                    <th scope="row">${i.count}</th>
                    <td>${data.prodName}</td>
                    <td>${data.sellId}</td>
                    <td>${data.buyId}</td>
                    <td>${data.endPrice}</td>
                    <td><fmt:formatDate value="${data.endDate}" pattern="YYYY-MM-DD HH:mm:ss"/> </td>
                    <c:if test="${data.aucStatus eq 0}">
                    	<td><a class="badge bg-warning text-dark" style="width:80%;margin-top:2px;"  data-bs-toggle="modal" data-bs-target="#verticalycentered${i.count}">거래중</a></td>
                 	</c:if>
                 	<c:if test="${data.aucStatus eq 1}">
                    	<td>
                    		<a class="badge bg-success" style="width:80%;margin-top:2px;">거래완료</a>
                    		<a class="badge bg-warning text-dark" style="width:80%;margin-top:2px;" data-bs-toggle="modal" data-bs-target="#survey${data.auctionEndNum}">평가하기</a>
                    	</td>
                 	</c:if>
                 	<c:if test="${data.aucStatus eq 2}">
                    	<td>
                    		<a class="badge bg-success" style="width:80%;margin-top:2px;">거래완료</a>
                    		<c:if test="${data.sellId eq user.userId}">
                    			<a class="badge bg-warning text-dark" style="width:80%;margin-top:2px;" data-bs-toggle="modal" data-bs-target="#survey${data.auctionEndNum}">평가하기</a>
                    		</c:if>
                    		<c:if test="${data.buyId eq user.userId}">
                    			<a class="badge bg-success" style="width:80%;margin-top:2px;">평가완료</a>
                    		</c:if>
                    	</td>
                 	</c:if>
                 	<c:if test="${data.aucStatus eq 3}">
                    	<td>
                    		<a class="badge bg-success" style="width:80%;margin-top:2px;" >거래완료</a>
                    		<c:if test="${data.buyId eq user.userId}">
                    			<a class="badge bg-warning text-dark" style="width:80%;margin-top:2px;" data-bs-toggle="modal" data-bs-target="#survey${data.auctionEndNum}">평가하기</a>
                    		</c:if>
                    		<c:if test="${data.sellId eq user.userId}">
                    			<a class="badge bg-success" style="width:80%;margin-top:2px;">평가완료</a>
                    		</c:if>
                    	</td>
                 	</c:if>
                 	<c:if test="${data.aucStatus eq 4}">
                 		<td>
                    		<a class="badge bg-success" style="width:80%;margin-top:2px;">거래완료</a>
                    		<a class="badge bg-success" style="width:80%;margin-top:2px;">평가완료</a>
                 		</td>
                 	</c:if>
                 	<c:if test="${data.aucStatus eq 5}">
                 		<td><a class="badge bg-danger" style="width:80%;margin-top:2px;">경매실패</a></td>
                 	</c:if>
                  </tr>    
                  <!--tradeCheck Vertically centered Modal -->
                    <div class="modal fade" id="verticalycentered${i.count}" tabindex="-1">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="text-center modal-header">
                            <h5 class="modal-title">거래 세부 내역</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <c:if test="${data.buyId eq user.userId}">
	                          <div class="modal-body">
	                           거래가 완료 되었습니까?<br>
	                           물품을 전달 받은 뒤 거래완료 버튼을 눌러주세요
	                          </div>
                          </c:if>
                           <c:if test="${data.buyId ne user.userId}">
	                          <div class="modal-body">
	                           구매자와 채팅을 통해 거래방식, 거래확인 해주세요
	                          </div>
                          </c:if>
                          <div class="modal-footer">
                          	<c:if test="${data.buyId eq user.userId}">
                            	<a type="button" id="trade check" class="btn btn-primary" href="tradeOK?aucEndNum=${data.auctionEndNum}">거래완료</a>
                           		<a type="button" id="chatting" class="btn btn-info" href="createChatRoom?toId=${data.sellId}">채팅</a>
                            </c:if>
                            <c:if test="${data.buyId ne user.userId}">
                            	<a type="button" id="chatting" class="btn btn-info" href="createChatRoom?toId=${data.buyId}">채팅</a>
                            </c:if>
                           		<a type="button" id="report" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#reportUser${data.auctionEndNum}">신고하기</a>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
                          </div>
                        </div>
                      </div>
                    </div><!-- End Vertically centered Modal-->
                    
                    <!--Survey Vertically centered Modal -->
                    <div class="modal fade" id="survey${data.auctionEndNum}" tabindex="-1">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="text-center modal-header">
                            <h5 class="modal-title">거래 평가</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
	                          <div id="heartRating${data.auctionEndNum}" class="heartScore modal-body text-center">
                          	  	<h4>거래가 어떠셨습니까?</h4>
                          	  	<h6>아래 하트와 간단한 평가를 남겨주세요~</h6>    
                          	  	<form class="mb-3" action="${path }/users-profile/insertReview" name="myform${data.auctionEndNum}" id="myform${data.auctionEndNum}" method="post">
									<fieldset>
										<input type="radio" name="score" value="5" id="rate5${data.auctionEndNum}"><label
											for="rate5${data.auctionEndNum}">♥</label>
										<input type="radio" name="score" value="4" id="rate4${data.auctionEndNum}"><label
											for="rate4${data.auctionEndNum}">♥</label>
										<input type="radio" name="score" value="3" id="rate3${data.auctionEndNum}"><label
											for="rate3${data.auctionEndNum}">♥</label>
										<input type="radio" name="score" value="2" id="rate2${data.auctionEndNum}"><label
											for="rate2${data.auctionEndNum}">♥</label>
										<input type="radio" name="score" value="1" id="rate1${data.auctionEndNum}"><label
											for="rate1${data.auctionEndNum}">♥</label>
									</fieldset>
									<div>
										<textarea class="reviewContents col-auto form-control" name="review" id="reviewContents${data.auctionEndNum}"
												  placeholder="거래한 상대방에 대한 평가를 남겨주세요" required
												  style="width: 100%;height: 150px;padding: 10px;box-sizing: border-box;
												  border: solid 1.5px #D3D3D3;border-radius: 5px;font-size: 16px;resize: none;"></textarea>
									</div>
									<input type="hidden" name="doUserId" value="${user.userId }">
									<input type="hidden" name="aucEndNum" value="${data.auctionEndNum }">
									<c:if test="${data.sellId eq user.userId }">
										<input type="hidden" name="takeUserId" value="${data.buyId }">
									</c:if>
									<c:if test="${data.buyId eq user.userId }">
										<input type="hidden" name="takeUserId" value="${data.sellId }">
									</c:if>
                            	</form>
	                          </div>
                          <div class="modal-footer">
                            <button type="submit" id="surveySubmit${data.auctionEndNum }" class="btn btn-primary" form="myform${data.auctionEndNum}">평가하기</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                          </div>
                        </div>
                      </div>
                    </div><!-- End Vertically centered Modal-->
                    
                    <!--Report Vertically centered Modal -->
                    <div class="modal fade" id="reportUser${data.auctionEndNum}" tabindex="-1">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="text-center modal-header">
                            <h3 class="modal-title" style="color:red;">신고</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
	                          <div id="reportForm${data.auctionEndNum}" class="modal-body text-center">
                          	  	<h4>어떤 점 때문에 신고하려고 하시나요?</h4>    
                          	  	<form class="mb-3" action="${path }/users-profile/reportUser" name="reportUserForm${data.auctionEndNum}" id="reportUserForm${data.auctionEndNum}" method="post">
									<div>
										<textarea class="reviewContents col-auto form-control" name="reportContent" id="reportArea${data.auctionEndNum}"
												  placeholder="신고사유를 남겨주세요"
												  style="width: 100%;height: 150px;padding: 10px;box-sizing: border-box;
												  border: solid 1.5px #D3D3D3;border-radius: 5px;font-size: 16px;resize: none;"></textarea>
										<c:if test="${data.sellId eq user.userId }">
											<h6 style="text-align:right">신고대상 : ${data.buyId }</h6>
										</c:if>
										<c:if test="${data.buyId eq user.userId }">
											<h6 style="text-align:right">신고대상 : ${data.sellId }</h6>
										</c:if>
									</div>
									<input type="hidden" name="aucEndNum" value="${data.auctionEndNum }">
									<input type="hidden" name="userId" value="${user.userId }">
									<c:if test="${data.sellId eq user.userId }">
										<input type="hidden" name="reportedUserId" value="${data.buyId }">
									</c:if>
									<c:if test="${data.buyId eq user.userId }">
										<input type="hidden" name="reportedUserId" value="${data.sellId }">
									</c:if>
                            	</form>
	                          </div>
                          <div class="modal-footer">
                            <button type="submit" id="reportSubmit${data.auctionEndNum }" class="btn btn-primary" form="reportUserForm${data.auctionEndNum}">신고하기</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                          </div>
                        </div>
                      </div>
                    </div><!-- End Vertically centered Modal-->
                    
                    
                 </c:forEach>
   
                </tbody>
              </table>
              </div>
              <!-- End trade-status Form -->
              
             <!-- profile-change Form -->
              <div class="tab-pane profile-change fade pt-3" id="profile-change">
              <!-- 프로필 변경 -->
              <div id="profileWrap">
                  <div class="row mb-3">
                    <label class="col-md-4 col-lg-3 col-form-label text-center" style="margin:auto"><div>Profile Image</div></label>
                    <div class="col-md-8 col-lg-9">
                      <div id=image_container class="pt-2 text-center">
                      </div> 
                      <div id=image class="pt-2 text-center">
                     <c:if test="${user.userImage ne null}">
                      	<img id=profileImg class="rounded-circle" src="${path}\resources\User_Image/${user.userImage}" 
                      	alt="Profile" style="width:20%;height:auto;">
                     </c:if>
                     <c:if test="${user.userImage eq null}">
                     	<img id=profileImg class="rounded-circle" src="${path}/resources/assets/img/noProfileImage.jpg" 
                      	alt="Profile" style="width:20%;height:auto;">
                     </c:if>
                      </div>
                      <br>
                      <div class="input-group">
						  <input type="file" class="form-control" id="userImage" name="userImage"
						   accept="image/*" onchange="setThumbnail(event)" aria-describedby="changeImg" aria-label="Upload">
						  <button class="btn btn-outline-success" type="button" id="changeImg">프로필 이미지 수정</button>
					  </div>
					<br>
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="userName" class="col-md-4 col-lg-3 col-form-label text-center">이름</label>
                    <div class="col-md-8 col-lg-9">
                    <span id="userName">${user.userName }</span>
                    </div>
                  </div>
                  
                  <div class="row mb-3">
                    <label for="userId" class="col-md-4 col-lg-3 col-form-label text-center">회원아이디</label>
                    <div class="col-md-8 col-lg-9">
                    <span id="userId">${user.userId }</span>
                     
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="userInfo" class="col-md-4 col-lg-3 col-form-label text-center">자기소개</label>
                    <div class="col-md-8 col-lg-9">
                      <textarea name="userInfo" class="form-control" id="userInfo" style="height: 100px">${user.userInfo}</textarea>
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="userNick" class="col-md-4 col-lg-3 col-form-label text-center">닉네임</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="userNick" type="text" class="form-control" id="userNick" 
                      value="${user.userNick }">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="userAddr1" class="col-md-4 col-lg-3 col-form-label text-center">우편번호</label>
                    <div class="col-md-8 col-lg-9">
                      	<input style="width:50%;display:inline" name="userAddr1" type="text"
                      class="postcodify_postcode5 form-control" id="userAddr1" value="${user.userAddr1}">
	                  	<button style="display:inline;margin-bottom:3px" id="searchAddr" type="button" class="btn btn-outline-success">주소 검색</button>
                    </div>
                    <label for="userAddr2" class="col-md-4 col-lg-3 col-form-label text-center">주소</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="userAddr2" type="text" class="postcodify_address form-control" id="userAddr2" value="${user.userAddr2}">
                    </div>
                    <label for="userAddr3" class="col-md-4 col-lg-3 col-form-label text-center">상세주소
                    </label>
                    <div class="col-md-8 col-lg-9">
                      <input name="userAddr3" type="text" class="postcodify_details form-control" id="userAddr3" value="${user.userAddr3}">
                    </div>
                    <br><br>
                  </div>

                  <div class="row mb-3">
                    <label for="userTel" class="col-md-4 col-lg-3 col-form-label text-center">연락처</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="userTel" type="number" class="form-control" id="userTel" 
                      value="${user.userTel}">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="userEmail" class="col-md-4 col-lg-3 col-form-label text-center">이메일</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="userEmail" type="email" class="form-control" id="userEmail" 
                      value="${user.userEmail }">
                    </div>
                  </div>
                  <br>
					<div class="text-center">
	                    <button type="submit" id="checkBeforUpdate" class="btn btn-primary">회원정보수정</button>
	                    <button type="button" id="updatePasswordForm" class="btn btn-success">비밀번호변경</button>
	                     <button type="button" id="deleteUser2" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete">회원 탈퇴</button>
					</div>
					
					 <!-- 비밀번호 확인 Modal -->
                     <div class="modal fade" id="checkPassword" tabindex="-1">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="text-center modal-header">
                            <h5 class="modal-title">회원정보수정</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body text-center" style="width:70%;margin:auto"> 
                            	<h5>회원정보를 수정하시겠습니까?</h5>
                          </div>
                          <div class="modal-footer">
                            <button type="button" id="updateProfile" class="btn btn-primary">예</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  <!-- 비밀번호확인 Modal 끝-->
                </div>
				<!-- 프로필 변경 end -->
				
				<!-- 패스워드 변경 -->
				<div id="passwordWrap" style="display:none">
                  <div class="row mb-3">
                    <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="password" type="password" class="form-control" id="currentPassword">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새로운 비밀번호</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="newpassword" type="password" class="form-control" id="newPassword">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">새로운 비밀번호 확인</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                    </div>
                  </div>
                  
                  <div class="text-center">
                    <button type="button" id="updatePassword" class="btn btn-primary">비밀번호변경</button>
                    <button type="button" id="updateProfileForm" class="btn btn-success">회원정보변경</button>
                    <button type="button" id="deleteUser1" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete">회원 탈퇴</button>
				  </div>
				  
                  </div>  
                  <!-- 패스워드 변경 end -->
                     <!-- Vertically centered Modal -->
                     <div class="modal fade" id="delete" tabindex="-1">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="text-center modal-header">
                            <h5 class="modal-title">회원탈퇴</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            ${user.userId }님, 정말 탈퇴하시겠습니까?
                          </div>
                          <div class="modal-footer">
                            <button type="button" id="deleteUser" class="btn btn-primary">예</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  <!-- End Vertically centered Modal-->

              </div>
              </div>
              <!-- End profile-change Form -->
              
              
              
            </div><!-- End Bordered Tabs -->
          </div>
        </div>
      </div>
  </section>

</main><!-- End #main -->
<!-- End #main -->
   <!-- 주소 API 스크립트 -->
<!-- jQuery와 Postcodify를 로딩한다 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
//JQUERY CODE
const drawStar = (target) => {
  $('.star span').css({ width: '${target.value * 10}%' });
}

/* 개인정보변경 */
$(function() {
	$("#searchAddr").postcodifyPopUp();
	$("#searchAddr").click(function(){
		$('#Address2').val('');
	});
	$("#changeImg").click(function(){
	   submitImg();
   })
   $("#checkBeforUpdate").click(function(){
	   profileUpdateCheck();
   })
   $("#updateProfile").click(function(){
	   updateProfile();
   })
   $("#updatePasswordForm").click(function(){
	   document.querySelector('#passwordWrap').style.display = 'block';
	   document.querySelector('#profileWrap').style.display = 'none';
   })
   $("#updateProfileForm").click(function(){
	   document.querySelector('#profileWrap').style.display = 'block';
	   document.querySelector('#passwordWrap').style.display = 'none';
   })
    $("#updatePassword").click(function(){
    	passwordCheck($('#currentPassword').val(),'password');
   })
   $('#deleteUser').click(function(){
	 	deleteUser();  
   })
   
});

function deleteUser(){
	$.ajax({
		type:'post',
		url:'users-profile/deleteUser',
		data:{"userNum":${user.userNum}},
		dataType:'json',
		success:function(res){
			alert('회원탈퇴가 성공적으로 완료되었습니다\n 지금까지 이용해 주셔서 감사합니다');
			history.back(0);
		},
		error:function(err){
			alert('실패');
		}
	})
}

function updatePassword(){
	var newPassword=$('#newPassword').val();
	var renewPassword=$('#renewPassword').val();
	if(renewPassword==''){
		alert("비밀번호 확인을 입력해주세요");
		$('#renewPassword').focus();
		return false;
	}
	if(newPassword.length < 8 || newPassword.length > 15){
		alert("비밀번호는 8자 이상, 15자 미만으로 작성해주세요");
		$('#newPassword').focus();
		return false;
	}
	if(newPassword != renewPassword){
		alert("비밀번호가 일치하지 않습니다");
		$('#renewPassword').focus();
		return false;
	}
	// A-Z, a-z, 0-9, 특수문자가 포함되어 있는지, 8자 이상
	const reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,15}$/;
    if(!reg.test(newPassword)){
	    alert("비밀번호는 8자리 이상 15자리 미만, 대문자/소문자/숫자/특수문자 모두 포함해야 합니다.");
	    $('#newPassword').focus();
	    return false;
	}
		//비밀번호 안에 아이디가 있을 때
	if(newPassword.search('${user.userId}') > -1){
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$('#newPassword').focus();
		return false;
	}
	//비밀번호 같은 문자 연속 4번
	const reg2 = /(\w)\1\1\1/;
	if(reg2.test(newPassword)){
		alert("같은 문자를 4번 이상 연속해서 사용할 수 없습니다.");
		$('#newPassword').focus();
		return false;
	}
	if(newPassword.search(' ') != -1){
		alert("비밀번호는 공백을 포함할 수 없습니다.");
		$('#newPassword').focus();
		return false;
	}
	
	$.ajax({
	 type:'post',
	 url:'users-profile/updatePassword',
	 data:{"newPassword":newPassword},
	 dataType:'json',
	 success:function(res){
		 alert('비밀번호 변경이 완료되었습니다');
		 history.go(0);
	 },
	 error:function(err){
		 alert('비밀번호 변경이 실패하였습니다')
	 }
	})
}

function isEmail(input){
	let val=input;
	let pattern=/^[\w-_]+(\.[\w]+)*@([a-zA-Z]+\.)+[a-z]{2,3}$/;
	let b=pattern.test(val);
	return b;
};
function profileUpdateCheck(){
	document.querySelector('#checkBeforUpdate').removeAttribute("data-bs-toggle");
	document.querySelector('#checkBeforUpdate').removeAttribute("data-bs-target");
	var userInfo=$('#userInfo').val();
	var userNick=$('#userNick').val();
	var userAddr1=$('#userAddr1').val();
	var userAddr2=$('#userAddr2').val();
	var userAddr3=$('#userAddr3').val();
	var userTel=$('#userTel').val();
	var userEmail=$('#userEmail').val();
	
	if(userInfo == null || userInfo == ''){
		alert('자기소개를 입력하세요');
		return;
	}else if(userNick == null || userNick == ''){
		alert('닉네임을 입력하세요');
		return;
	}else if(userAddr1 == null || userAddr1 == '' || userAddr2 == null || userAddr2 == '' || userAddr3 == null || userAddr3 == ''){
		alert('주소를 입력하세요');
		return;
	}else if(userNick == null || userNick == '' || userNick.length < 10 && userNick.length >11){
		alert('연락처를 정확히 10~11자리의 숫자만 입력하세요');
		return;
	}else if(!isEmail(userEmail)){
		alert('이메일을 제대로 입력하세요');
		return;
	}else{
		document.querySelector('#checkBeforUpdate').setAttribute("data-bs-toggle","modal");
		document.querySelector('#checkBeforUpdate').setAttribute("data-bs-target","#checkPassword");
		buttonClick();
	}
	
}//-----------------------------

function buttonClick(){
	document.getElementById("checkBeforUpdate").click();
}
function passwordCheck(input,type){
	var password=input;
	var userNum=${user.userNum};
	$.ajax({
		type:'post',
		url:'users-profile/updateProfile/loginCheck',
		data:{
			"userNum":userNum,
			"password":password
		},
		dataType:"text",
		success: function(res){
			if(res=='fail'){
				alert('비밀번호가 틀립니다');
				$('#updatePasswordCheck').val('');
				$('#currentPassword').val('');
				$('#currentPassword').focus();
				return;
			}else{
				if(type=='password'){
					updatePassword()
				}
			}
		},
		error: function(err){
			alert('비밀번호 확인에 실패하였습니다');
			alert('err'+err.status);
		}
	})
}

function updateProfile(){
	var userNum=${user.userNum}
	var userInfo=$('#userInfo').val();
	var userNick=$('#userNick').val();
	var userAddr1=$('#userAddr1').val();
	var userAddr2=$('#userAddr2').val();
	var userAddr3=$('#userAddr3').val();
	var userTel=$('#userTel').val();
	var userEmail=$('#userEmail').val();
	
	dataObj={
			"userNum":userNum,
			"userInfo":userInfo,
			"userNick":userNick,
			"userAddr1":userAddr1,
			"userAddr2":userAddr2,
			"userAddr3":userAddr3,
			"userTel":userTel,
			"userEmail":userEmail
	}
	$.ajax({
		type:'post',
		url:'users-profile/updateProfile',
		data:JSON.stringify(dataObj),
		dataType:'json',
		contentType:'application/json',
		success:function(res){
			alert('회원정보 수정이 완료되었습니다.')
			history.go(0);
		},
		error:function(err){
			alert('회원정보 수정이 실패하였습니다.');
			alert('err'+err.status)
		}
	})
}

//이미지 미리보기
function setThumbnail(event) {
   
	var file = event.target.files[0];
	var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
	
    if (!file.type.match(reg)) {
        alert("확장자는 이미지 확장자만 가능합니다.");
        return;
    }
	
	document.querySelector('#image_container').innerHTML="";
	var reader = new FileReader();
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("style", "width:20%;height:auto;");
		img.setAttribute("class","rounded-circle");
		document.querySelector('#image_container').appendChild(img);
		document.querySelector('#profileImg').style.display = 'none';
	};
	reader.readAsDataURL(event.target.files[0]);
}//-------

//프로필 이미지 수정
function submitImg(){
	var image=$('#userImage').val();
    if(image == null || image == ''){
   	 alert('이미지가 선택되어있지않습니다');
   	 return;
    }
    var form = new FormData();
    form.append( "userImage", $("#userImage")[0].files[0] );
    form.append("userNum",${user.userNum});
    $.ajax({
		url : "users-profile/updateImg", 
		type : "POST",
		processData : false,
		contentType : false,
		data : form,
		success:function(response) {
		    alert("프로필 이미지를 수정 하였습니다.");
		    history.go(0);
		},
		error: function (err) 
		{ 
			alert("프로필 이미지 수정을 실패하였습니다")
			alert(err.status()); 
		}
   });
}//-----------------------


</script>

<c:import url="/foot" />
