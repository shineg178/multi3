<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="/top" />

 <!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<main id="main" class="main">

 <div class="pagetitle">
    <h1>Profile</h1>
    <nav>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
        <li class="breadcrumb-item">Users</li>
        <li class="breadcrumb-item active">Profile</li>
      </ol>
    </nav>
  </div><!-- End Page Title -->

  <section class="section profile">
    <div class="row">
    
      <div class="col-xl-2">
        <div class="card">
          <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

            <img 
            src="${path}\resources\User_Image/${user.userImage}" 
            alt="Profile" class="rounded-circle">
            <h2>${user.userName }</h2>
            <h3>${user.userNick }</h3>
            <h3>${user.userEmail }</h3>
          </div>
        </div>
      </div>

      <div class="col-xl-9">
        <div class="card">
          <div class="card-body pt-3">
            <!-- Bordered Tabs -->
            <ul class="nav nav-tabs nav-tabs-bordered">

              <li class="nav-item">
                <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile">프로필</button>
              </li>

              <li class="nav-item">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#badge">뱃지 현황</button>
              </li>

              <li class="nav-item">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#point">포인트</button>
              </li>

              <li class="nav-item">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#trade-status">거래내역</button>
              </li>

              <li class="nav-item">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change">개인정보변경</button>
              </li>

            </ul>
            
            
            <div class="tab-content pt-2">
              <!-- profile start -->
              <div class="tab-pane fade show active profile" id="profile">
                <h5 class="card-title">Introduction</h5>
                <div class="row text-center">
                  <div class="col-lg-3 col-md-4 label "></div>
                  <div class="col-lg-9 col-md-8">
                  <p class="middle fst-italic">
                  ${user.userInfo }
                </p>
                  </div>
                </div>
                

                <h5 class="card-title">Profile Details</h5>

                <div class="row text-center">
                  <div class="col-lg-3 col-md-4 label ">Name</div>
                  <div class="col-lg-9 col-md-8">${user.userName }</div>
                </div>

                <div class="row text-center">
                  <div class="col-lg-3 col-md-4 label">닉네임</div>
                  <div class="col-lg-9 col-md-8 text-center">${user.userNick }</div>
                </div>

                <div class="row text-center" >
                  <div class="col-lg-3 col-md-4 label">E-Mail</div>
                  <div class="col-lg-9 col-md-8">${user.userEmail }</div>
                </div>

                <div class="row text-center">
                  <div class="col-lg-3 col-md-4 label">Phone</div>
                  <div class="col-lg-9 col-md-8">${user.userTel.substring(0,3)}-${user.userTel.substring(3,7)}-${user.userTel.substring(7)}</div>
                </div>
				
				<div class="row text-center">
                  <div class="col-lg-3 col-md-4 label">Postcode</div>
                  <div class="col-lg-9 col-md-8">${user.userAddr1}</div>
                </div>
				
                <div class="row text-center">
                  <div class="col-lg-3 col-md-4 label">Address</div>
                  <div class="col-lg-9 col-md-8">${user.userAddr2 } / ${user.userAddr3 }</div>
                </div>

                <div class="row text-center">
                  <div class="col-lg-3 col-md-4 label">Point</div>
                  <div class="col-lg-9 col-md-8">${user.userPoint } 포인트</div>
                </div>
              </div>
              <!-- End profile start -->
              
              <!-- badge  Form -->
              <div class="tab-pane fade badge" id="badge">

                <form>
                  <div class="mx-auto">
                    <img src="${path}/resources/assets/img//gold.jpg" class="rounded" alt="Gold">
                     <input type="text" class="gold text-center" style="border:none;font-size:xx-large;max-width:5rem" 
                     value="${user.userGoldBadge } 개" readonly>
                  </div>
                  <div class="mx-auto">
                    <img src="${path}/resources/assets/img//silver.jpg" class="rounded" alt="Silver">
                   	<input type="text" class="silver text-center" style="border:none;font-size:xx-large;max-width:5rem" 
                   	value="${user.userSilverBadge } 개" readonly>
                  </div>
                  <div class="mx-auto">
                    <img src="${path}/resources/assets/img//bronze.jpg" class="rounded" alt="Bronze">
                   	<input type="text" class="bronze text-center" style="border:none;font-size:xx-large;max-width:5rem" 
                   	value="${user.userBronzeBadge } 개" readonly>
                  </div>
                </form>

              </div>
              <!-- end badge  Form  -->

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
                          <div class="modal-dialog modal-dialog-centered">
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
                          <div class="modal-dialog modal-dialog-centered">
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
 				//history.go(0);
 				
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
				str += '</tr>'; 
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
                          <div class="modal-dialog modal-dialog-centered">
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
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">
                      사진
                    </th>
                    <th scope="col">
                      판매자
                    </th>
                    <th scope="col">
                      구매자
                    </th>
                    <th scope="col">
                      입찰 가격
                    </th>
                    <th scope="col">
                      입찰 날짜
                    </th>
                    <th scope="col">
                      진행상태
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td><img src="${path}/resources/assets/img//${user.userImage}" alt="ProductImg" class="bx-square-rounded"></td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td><a class="" data-bs-toggle="modal" data-bs-target="#verticalycentered">진행</a></td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td><img src="assets/img/profile-img.jpg" alt="ProductImg" class="bx-square-rounded"></td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td><a class="" data-bs-toggle="modal" data-bs-target="#verticalycentered">진행</a></td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td><img src="assets/img/profile-img.jpg" alt="ProductImg" class="bx-square-rounded"></td>
                    <td>Larry the Bird</td>
                    <td>@twitter</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td><a class="" data-bs-toggle="modal" data-bs-target="#verticalycentered">진행</a></td> 
                    
                    <!-- Vertically centered Modal -->
                    <div class="modal fade" id="verticalycentered" tabindex="-1">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="text-center modal-header">
                            <h5 class="modal-title">거래 세부 내역</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                           거래가 완료 되었습니까?
                          </div>
                          <div class="modal-footer">
                            <button type="button" id="trade check" class="btn btn-primary">예</button>
                            <button type="button" id="chatting" class="btn btn-info">채팅</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
                          </div>
                        </div>
                      </div>
                    </div><!-- End Vertically centered Modal-->
                    </tr>
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
                      	<img id=profileImg class="rounded-circle" src="${path}\resources\User_Image/${user.userImage}" 
                      	alt="Profile" style="width:20%;height:auto;">
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
                            <h5 class="modal-title">회원정보수정-비밀번호 확인</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body text-center" style="width:70%;margin:auto"> 
                            	<h5>비밀번호를 입력하세요</h5>
                              	<input type="password" class="form-control" id="updatePasswordCheck" >
                              </div>
                          <div class="modal-footer">
                            <button type="button" id="updateProfile" class="btn btn-primary">회원정보변경</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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
	   passwordCheck($('#updatePasswordCheck').val(),'profile');
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
	//비밀번호에 한글 사용 방지
	 const regKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	if(regKorean.test(newPassword)){
		alert("비밀번호에 한글을 사용할 수 없습니다.");
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
	if(newPassword.search('') != -1){
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
		 history(0);
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
	if(password == null || password == ''){
		alert('비밀번호를 입력하세요');
		$('#updatePasswordCheck').focus();
		return;
	}
	
	$.ajax({
		type:'post',
		url:'users-profile/updateProfile/loginCheck',
		data:{
			"userNum":userNum,
			"password":password
		},
		dataType:"text",
		success: function(res){
			//alert(res);
			if(res=='fail'){
				alert('비밀번호가 틀립니다');
				$('#updatePasswordCheck').val('');
				return;
			}else{
				if(type=='profile'){
					updateProfile();
				}else if(type=='password'){
					updatePassword()
				}
					
			}
			
		},
		error: function(err){
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
