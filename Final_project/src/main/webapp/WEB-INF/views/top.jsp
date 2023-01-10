<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   


<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>기부앤테이크 중고경매거래 기부 플랫폼</title>
<meta content="" name="description">
<meta content="" name="keywords">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
	

<!-- Favicons -->
<link href="${path}/resources/assets/img/favicon.png" rel="icon">
<link href="${path}/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${path}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${path}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${path}/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="${path}/resources/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link href="${path}/resources/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link href="${path}/resources/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="${path}/resources/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${path}/resources/assets/css/style.css" rel="stylesheet">
<!-- =======================================================
  * Template Name: NiceAdmin - v2.5.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>
#chatExit {
	float: right;
	line-height: 1;
}

#chatLink {
	padding: 5px 0px;
	width: 160px;
	float: left;
}

.message-item {
	height: 65px;
}
</style>

<script>
	//채팅창 띄우기 화면 브라우저 위치에 따른 위치 조정
	function openChat(roomid){
		var target = document.getElementById("chatList");
		var targetTop = window.screenTop+target.getBoundingClientRect().top+50;
		var targetLeft = window.screenLeft+target.getBoundingClientRect().left-450;
		window.open('${path}/chat?roomid='+roomid,'roomid','top='+targetTop+', left='+targetLeft+', width=400, height=710, menubar=0 ,resizable=0')
	}
	
	

	//내 채팅 목록 가져오기
	function myChatList(){
		$.ajax({
			type:'get',
	 		url:'${path}/openChatList',
			dataType:'json',
			cache:false,
			success:function(res){
				str="";
				if(res!=null){
					$.each(res,function(i,data){
						str+="<li class='message-item'>";
						str+="<img src='' alt='' class='rounded-circle'>";
						if(data.userId1=='${user.userId}'){
							str+="<a id='chatLink' onclick='openChat("+data.roomid+")'>"+data.userId2+"</a>";
						}
						if(data.userId2=='${user.userId}'){
							str+="<a class='"+data.roomid+"' id='chatLink' onclick='openChat("+data.roomid+")'>"+data.userId1+"</a>";
						}		
						str+="<button id='chatExit' onclick='deleteChat("+data.roomid+")' class='btn btn-outline-warning'>나가기</button>";
						str+="</li>";
					})
				}
				$('#chatList').html(str);
			},	
			error:function(err){
				alert('error : '+err.status);
			}
		})
	}
	if(${user ne null}){
		myChatList();
	}

	

	
	//채팅방 나가기
	function deleteChat(rid){
		$.ajax({
			type:'post',
			url:'${path}/deleteChat',
			data:'rid='+rid,
			dataType:'json',
			cache:false,
			success:function(res){
				if(res>0){
					myChatList();
				}
			},
			error:function(err){
				alert('error : '+err.status);
			}
		})

	} 

	
$(function(){
	
	//2초마다 주기적으로 읽지않은 메시지 수 가져오기
	let interval = setInterval(chatAlert,2000);


	//읽지않은 메시지 가져오는 메서드

	function chatAlert(){
		$.ajax({
			type:'get',
			url:'${path}/AllnoRead',
			dataType:'json',
			cache:false,
			success:function(res){
				if(res==0) $('#noRead').text('');
				if(res>0){
					$('#noRead').text(res);
				}
			},				
			error:function(err){
				alert('error : '+err.status);
			}
		})
	}
		
		
});
</script>
<body>
  

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="${path}" class="logo d-flex align-items-center">
        <img src="${path}/resources/assets/img//logo.png" alt="">

        <span class="d-none d-lg-block" id="title">기부앤테이크</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

		<!-- 로그인 하지 않은 상태 -->
                <c:if test = "${user eq null }">
                    <div class="login_button"><a class="login_button_login" href="${path}/login">로그인</a> | 
                    <a class="login_button_join" href="${path}/join">회원가입</a></div>               
                </c:if>
        <!-- 로그인한 상태 -->
                <c:if test="${ user ne null }">

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-chat-left-text" id="openChat" onclick="myChatList()"></i>
            <span id="noRead"class="badge bg-warning badge-number"><!-- 읽지않은 메시지 수 들어갈 곳 --></span>
            
          </a><!-- End Messages Icon -->

		  <!-- 메시지 목록창  -->
          <ul id="chatList"  class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages" style="width:300px; height:500px;">
      		 
          </ul>
          <!-- 메시지 목록창 끝 -->

        </li><!-- End Messages Nav -->

        <li class="nav-item dropdown pe-3">                    
                
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="${path}\resources\User_Image/${user.userImage}" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">${user.userName}</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">

              <h6>${user.userNick}</h6>
              <span>포인트 : <fmt:formatNumber value="${user.userPoint}" pattern="###,###,###" /></span>

            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="${path}/users-profile">
                <i class="bi bi-person"></i>
                <span>마이페이지</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="${path}/users-profile">
                <i class="bi bi-gear"></i>
                <span>개인정보 변경</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="${path}/logout.do">
                <i class="bi bi-box-arrow-right"></i>
                <span>로그아웃</span>
              </a>
            </li>
          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->
		</c:if>
     </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="${path}">
          <i class="bi bi-grid"></i>
          <span>홈</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed"  href="${path}/noticeList">
          <i class="bi bi-journal-text"></i><span>공지사항</span>
        </a>
      </li><!-- End Forms Nav --> 

      <li class="nav-item">

        <a class="nav-link collapsed" href="${path}/productList">
          <i class="bi bi-layout-text-window-reverse"></i><span>상품 조회</span>
        </a>
      </li><!-- End Tables Nav -->

      <li class="nav-item">

        <a class="nav-link collapsed"  href="${path}/addProductForm">
          <i class="bi bi-layout-text-window-reverse"></i><span>상품 등록</span>
        </a>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="${path}/donation">
          <i class="bi bi-gem"></i><span>기부 현황</span>
        </a>

      <li class="nav-item">
        <a class="nav-link collapsed" href="${path}/users-profile">
          <i class="bi bi-person"></i>
          <span>마이페이지</span>
        </a>
        
      <!-- 관리자 전용 페이지 -->
			<c:if test="${user.userStatus eq 1}">
				<li class="nav-item"><a class="nav-link collapsed"
					href="${path}/admin/adminPage"> <i class="bi bi-person"></i> <span>관리자전용</span>
				</a></li>
			</c:if>
      </li><!-- End Profile Page Nav -->
    </ul>
  </aside><!-- End Sidebar-->




