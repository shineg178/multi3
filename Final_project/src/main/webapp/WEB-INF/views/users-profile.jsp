<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                  <div class="col-lg-3 col-md-4 label">Address</div>
                  <div class="col-lg-9 col-md-8">${user.userAddr}  /  ${user.userDetailAddr }</div>
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
	                      <input name="pointAmount" type="text" class="form-control" id="pointAmount" value="${user.userPoint } 포인트">
	                    </div>
                  	</div>

                  <div class="text-center">
                    <button type="button" class="btn btn-primary px-md-5" data-bs-toggle="modal" data-bs-target="#recharge" >
                     충전
                    </button>
                    <button type="button" class="btn btn-primary px-md-5" data-bs-toggle="modal" data-bs-target="#exchange" >
                      환급
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
                                <input type="number" class="form-control" id="recharge-point">
                              </div>
                              <div class="modal-footer">
                                <button type="button" id="tradecheck" class="btn btn-primary">충전하기</button>      
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                              </div>
                            </div>
                          </div>
                        </div><!-- End 포인트 충전 Modal-->
				
<script>
$(document).ready(function(){
	$('#tradecheck').click(function(){
		requestPay();
	})
});
	
var IMP = window.IMP;   // 생략 가능
  IMP.init("imp07481554"); // 예: imp00000000 
	 function requestPay() {
	    IMP.request_pay({
	      pg: "html5_inicis.INIpayTest",
	      pay_method: "card",
	      merchant_uid: "iamport_test_id2",   // 주문번호
	      name: "기부앤테이크포인트",
	      amount: $('#recharge-point').val(),   // 숫자 타입
	      buyer_email: "${user.userEmail}",
	      buyer_name: "${user.userName}",
	      buyer_tel: "${user.userTel}",
	      buyer_addr: "${user.userAddr} ${user.userDetailAddr}",
	    }, function (rsp) { // callback
	    	if(rsp.success){
	    		alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderkey) : "+rsp.merchant_uid);
	    		/* //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	        	jQuery.ajax({
	        		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {
	    	    		imp_uid : rsp.imp_uid,
	    	    		merchant_uid : rsp.merchant_uid,
	    	    		amount : rsp.amout,
	    	    		//기타 필요한 데이터가 있으면 추가 전달
	        		}
	        	}).done(function(data) {
	        		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	        		if ( everythings_fine ) {
	        			var msg = '결제가 완료되었습니다.';
	        			msg += '\n고유ID : ' + rsp.imp_uid;
	        			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	        			msg += '\결제 금액 : ' + rsp.paid_amount;
	        			msg += '카드 승인번호 : ' + rsp.apply_num;
	        			
	        			alert(msg);
	        		} else {
	        			//[3] 아직 제대로 결제가 되지 않았습니다.
	        			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	        		}
	        	}); */
	    	}else {
	    		alert("실패 : 코드("+rsp.error_code+") / 메세지("+rsp.error_msg+")");
	    	}
	    });
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
                                환급받을 포인트를 적으세요.
                                <input type="number" class="form-control" id="exchange-point">
                              </div>
                              <div class="modal-footer">
                                <button type="button" id="trade check" class="btn btn-primary">환급받기</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                              </div>
                            </div>
                          </div>
                        </div><!-- End 포인트 환급 Modal-->

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
                              <input type="number" class="form-control" id="exchange-point">
                              </div>
                              <div class="modal-footer">
                                <button type="button" id="trade check" class="btn btn-primary">기부하기</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                              </div>
                            </div>
                          </div>
                        </div><!-- End 포인트 기부 Modal-->
                </div>
                </form>
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
                      value="${user.userAddr},${user.userDetailAddr}">
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
                            <button type="button" id="trade check" class="btn btn-primary">예</button>
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
</main>
<!-- End #main -->

<c:import url="/foot" />
