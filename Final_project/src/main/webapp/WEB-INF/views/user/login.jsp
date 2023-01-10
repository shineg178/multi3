<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 - 기부앤테이크</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- 구글 라이브러리 -->

<meta name="google-client_id"
	content="564844281319-rhk3r281rcukserl0bp008ofbsl596pd.apps.googleusercontent.com">

<link
	href="${pageContext.request.contextPath}/resources/assets/css/login.css"
	rel="stylesheet" type="text/css">
<script>
function onSignIn(){
	var auth2 = gapi.auth2.getAuthInstance()
	if(auth2.isSignedIn.get()){
	 var profile = auth2.currentUser.get().getBasicProfile();
	 googleLoginPro(profile)
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
}
</script>
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
							<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨거나 정지된
								계정입니다.</div>
						</c:if>
					</form>
					<span class="or-txt">또는</span>
					
					<div class="social">
						
						<a class="btn btn-naver"><img class="naver"
							src="resources/assets/img/naverLogo.png">네이버 로그인</a> 
						
						<a class="btn btn-kakao"><img class="kakao"
							src="resources/assets/img/kakaoLogin.png"></a> 
						
						<a class="btn btn-google" id="googleBtn"><img class="google"
							src="resources/assets/img/googleLogo.png">구글 로그인</a>
					</div>
				</div>
				<div class="footer">
					<p>
						<a href="find-id">아이디 찾기</a> / <a href="find-password">비밀번호 찾기</a>
						/ <a href="/project">돌아가기</a>
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
		
		const onClickGoogleLogin = (e) => {
			window.location.replace("https://accounts.google.com/o/oauth2/v2/auth?client_id=564844281319-rhk3r281rcukserl0bp008ofbsl596pd.apps.googleusercontent.com&redirect_uri=http://localhost:9090/project/login/google/auth&response_type=code&scope=email%20profile%20openid&access_type=offline")
		}
		
		const googleBtn = document.getElementById("googleBtn");
		googleBtn.addEventListener("click",onClickGoogleLogin);
	</script>

</body>
</html>
