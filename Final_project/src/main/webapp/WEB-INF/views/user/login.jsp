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

<meta name="google-client_id" content="564844281319-rhk3r281rcukserl0bp008ofbsl596pd.apps.googleusercontent.com">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
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
<c:if test="${Msg ne null}">
	<script type="text/javascript">
		alert('${Msg}');
	</script>
</c:if>
	<div class="container" >
		<div class="inner">
			<div class="login">
				<div class="login-type">
					<h1><strong>로그인</strong></strong></h1>
					<form id="login_form" method="post">

						<input type="text" id="userId" name="userId" placeholder="아이디"
							class="signIn"> <input type="password" id="userPassword"
							name="userPassword" placeholder="비밀번호" class="signIn"> <input
							type="submit" id="btn" class="btn" value="로그인" style="font-weight:bold;font-size:18px;"><br>
						<c:if test="${result == 0 }">
							<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨거나<br>정지된 계정입니다.</div>
						</c:if>
					</form>
					<span class="or-txt">또는</span> 

				<div class="social">
                  <a class="btn btn-naver" id="naverBtn"><img style="width:190px" class="naver" src="${pageContext.request.contextPath}/resources/assets/img/naverLogin.png"></a> 
                  

                  <a class="btn btn-kakao" id="kakaoBtn"><img style="width:190px" class="kakao" src="${pageContext.request.contextPath}/resources/assets/img/kakaoLogin.png"></a> 

                  
                  <a class="btn btn-google" id="googleBtn"><img style="width:190px" class="google" src="${pageContext.request.contextPath}/resources/assets/img/googleLogin.png"></a>
               </div> 

				</div>
				<div class="footer">
					<p>
						<a href="find-id">아이디 찾기</a> / <a href="find-password">비밀번호 찾기</a> / <a href="/project">돌아가기</a>
					</p>
					<p>
						기부앤테이크가 처음이신가요? <a href="joinrules">회원가입</a>
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
		
		const onClickNaverLogin = (e) => {
			window.location.replace("https://nid.naver.com/oauth2.0/authorize?client_id=GF2vmLo7gThkjpDqkTMs&redirect_uri=http://localhost:9090/project/login/naver/auth&response_type=code&state=9kgsGTfH4j7IyAkg&scope=email%20profile%20openid&access_type=offline")
		}
		
		const naverBtn = document.getElementById("naverBtn");
		naverBtn.addEventListener("click",onClickNaverLogin);
		
		const onClickKakaoLogin = (e) => {
			window.location.replace("https://kauth.kakao.com/oauth/authorize?client_id=c2d7dca68a4ebec26ef05bbb1502fd2d&redirect_uri=http://localhost:9090/project/login/kakao/auth&response_type=code")
		}
		
		const kakaoBtn = document.getElementById("kakaoBtn");
		kakaoBtn.addEventListener("click",onClickKakaoLogin);

	</script>

</body>
</html>
