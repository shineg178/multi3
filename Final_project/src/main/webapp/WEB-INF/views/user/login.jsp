<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 - 기부앤테이크</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath}/resources/assets/css/login.css"
	rel="stylesheet" type="text/css">
</head>
<body>

	<div class="container">
		<div class="inner">
			<div class="login">
				<div class="login-type">
					<h1>로그인</h1>
					<form id="login_form" method="post">

						<input type="text" id="userId" name="userId" placeholder="아이디"
							class="signIn"> <input type="password" id="userPassword"
							name="userPassword" placeholder="비밀번호" class="signIn"> <input
							type="submit" id="btn" class="btn" value="로그인"><br>
						<c:if test="${result == 0 }">
							<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
						</c:if>
					</form>
					<span class="or-txt">또는</span> 
					<a class="btn btn2">네이버 로그인</a>
					<a class="btn btn3">카카오 로그인</a>
					<a id="google_login" class="btn btn4" onclick="init();"><i class="fa fa-google-plus fa-fw">구글 로그인</i></a>
				</div>
				<div class="footer">
					<p>
						<a href="find-id">아이디 찾기</a> / <a href="find-password">비밀번호 찾기</a> / <a href="/project">돌아가기</a>
					</p>
					<p>
						기부앤테이크가 처음이신가요? <a href="join">회원가입</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(".login_button").click(function() {

			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "login");
			$("#login_form").submit();
		});
	</script>

	<!-- google signin api -->
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
	<script>
// google signin API
var googleUser = {};
function init() {
	 gapi.load('auth2', function() {
	  console.log("init()시작");
	  auth2 = gapi.auth2.init({
	        client_id: '565772189866-4uoto6esdde4qhfhpe3m22d85ravclu7.apps.googleusercontent.com'
	        cookiepolicy: 'single_host_origin',
	      });
	      attachSignin(document.getElementById('google_login'));
	 });
}

//google signin API2
function attachSignin(element) {
    auth2.attachClickHandler(element, {},
        function(googleUser) {
    	var profile = googleUser.getBasicProfile();
    	var id_token = googleUser.getAuthResponse().id_token;
	  	  console.log('ID: ' + profile.getuserId()); // Do not send to your backend! Use an ID token instead.
	  	  console.log('Name: ' + profile.getUserName());
	  	  console.log('Email: ' + profile.getUserEmail()); // This is null if the 'email' scope is not present.
			$(function() {
				$.ajax({
				    url: '/user/loginGoogle',
				    type: 'post',
				    data: {
						"userId" : <!-- 필요한 데이터 담기 -->,
						"userPassword" : <!-- 필요한 데이터 담기 -->,
				        "userName": profile.getUserName(),
						"userEmail": profile.getUserEmail()
					    },
				    success: function (data) {
				            alert("구글아이디로 로그인 되었습니다");
				            location.href="/";
				        }
				});
			})
        }, function(error) {
          alert(JSON.stringify(error, undefined, 2));
        });
    console.log("구글API 끝");
  }
</script>
</body>
</html>
