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

            <img src="${path}/resources/assets/img//${user.userImage}" alt="Profile" class="rounded-circle">
            <h2>${user.userName }</h2>
            <h3>${user.userNick }</h3>
            <div class="social-links mt-2">
              <a href="https://twitter.com/${user.userTwitter }" class="twitter"><i class="bi bi-twitter"></i></a>
              <a href="https://facebook.com/${user.userFacebook }" class="facebook"><i class="bi bi-facebook"></i></a>
              <a href="https://instagram.com/${user.userInstagram }" class="instagram"><i class="bi bi-instagram"></i></a>
              <a href="https://linkedin.com/${user.userLinkedin }" class="linkedin"><i class="bi bi-linkedin"></i></a>
            </div>
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
                <h5 class="card-title">About</h5>
                <p class="middle fst-italic">
                  ${user.userInfo }
                </p>

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
                  <div class="col-lg-9 col-md-8">${user.userTel }</div>
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
                <form id="frm-point" enctype="multipart/form-data" action="">
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
                                <button type="button" id="donate-process" class="btn btn-primary"
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
                              <div class="modal-body">
	                              <button type="button" onclick=plus("10k","donate") class="btn btn-outline-primary btn-sm">+10000</button>
	                              <button type="button" onclick=plus("5k","donate") class="btn btn-outline-primary btn-sm">+5000</button>
	                              <button type="button" onclick=plus("1k","donate") class="btn btn-outline-primary btn-sm">+1000</button>
	                              <button type="button" onclick=plus("0.1k","donate") class="btn btn-outline-primary btn-sm">+100</button>
	                               <button type="button" onclick=plus("reset","donate") class="btn btn-outline-primary btn-sm">Reset</button>
                              </div> 
                              <div class="modal-body" style="width:70%;margin:auto"> 
                              	<input type="number" class="form-control" id="donate-point"  value=0>
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
                              <div class="modal-body">
                              </div> 
                              <div class="modal-footer">
                                <button type="button" id="donate-process" class="btn btn-primary"
                                 data-bs-toggle="modal" data-bs-target="#donate">기부하기</button>
                                <button type="button" class="close btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                              </div>
                            </div>
                          </div>
                        </div><!-- End 포인트 기부List Modal-->
                        
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
                <form id="frm-profile-change" enctype="multipart/form-data" action="">
                  <div class="row mb-3">
                    <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                    <div class="col-md-8 col-lg-9">
                      <img src="${path}/resources/assets/img//${user.userImage}" alt="Profile">
                      <div class="pt-2">
                        <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><input class="bi bi-upload"></a>
                        <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                      </div>
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="fullName" class="col-md-4 col-lg-3 col-form-label">이름</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="fullName" type="text" class="form-control" id="fullName" value="${user.userName }">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="about" class="col-md-4 col-lg-3 col-form-label">자기소개</label>
                    <div class="col-md-8 col-lg-9">
                      <textarea name="about" class="form-control" id="about" style="height: 100px">
                      	${user.userInfo }
                      </textarea>
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="company" class="col-md-4 col-lg-3 col-form-label">닉네임</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="Nickname" type="text" class="form-control" id="company" 
                      value="${user.userNick }">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="Address" class="col-md-4 col-lg-3 col-form-label">Address</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="address" type="text" class="form-control" id="Address" 
                      value="[${user.userAddr1}], ${user.userAddr2} ${user.userAddr3}">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="phone" type="text" class="form-control" id="Phone" 
                      value="${user.userTel }">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="email" type="email" class="form-control" id="Email" 
                      value="${user.userEmail }">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="Twitter" class="col-md-4 col-lg-3 col-form-label">Twitter Profile</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="twitter" type="text" class="form-control" id="Twitter" 
                      value="https://twitter.com/${user.userTwitter }">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="Facebook" class="col-md-4 col-lg-3 col-form-label">Facebook Profile</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="facebook" type="text" class="form-control" id="Facebook" 
                      value="https://facebook.com/${user.userFacebook }">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="Instagram" class="col-md-4 col-lg-3 col-form-label">Instagram Profile</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="instagram" type="text" class="form-control" id="Instagram" 
                      value="https://instagram.com/${user.userInstagram}">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="Linkedin" class="col-md-4 col-lg-3 col-form-label">Linkedin Profile</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="linkedin" type="text" class="form-control" id="Linkedin" 
                      value="https://linkedin.com/${user.userLinkedin}">
                    </div>
                  </div>

                  
                </form>

                <form>
        
                  <div class="row mb-3">
                    <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="password" type="password" class="form-control" id="currentPassword">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="newpassword" type="password" class="form-control" id="newPassword">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                    </div>
                  </div>
                  
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary">회원 정보 변경</button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete">회원 탈퇴</button>

                     <!-- Vertically centered Modal -->
                     <div class="modal fade" id="delete" tabindex="-1">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="text-center modal-header">
                            <h5 class="modal-title">회원탈퇴</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            정말 탈퇴하시겠습니까?
                          </div>
                          <div class="modal-footer">
                            <button type="button" id="check" class="btn btn-primary">예</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- End Vertically centered Modal-->
                    
                  </div>
                </form>

              </div>
              <!-- End profile-change Form -->

            </div><!-- End Bordered Tabs -->

          </div>
        </div>

      </div>
    </div>
  </section>

</main><!-- End #main -->
<!-- End #main -->

<c:import url="/foot" />
