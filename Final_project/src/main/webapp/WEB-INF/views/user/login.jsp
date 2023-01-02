<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<form id="login_form" method="post" onsubmit="return validate();">
						<input type="text" id="userId" name="userId" placeholder="아이디"
							class="signIn"> <input type="password" id="userPassword"
							name="userPassword" placeholder="비밀번호" class="signIn"> <input
							type="submit" id="btn" value="로그인"><br>
						<p>
							<input type="checkbox">아이디 저장
						</p>
					</form>
					<span class="or-txt">또는</span> <a class="btn btn2" href="">네이버
						로그인</a> <a class="btn btn3" href="">카카오 로그인</a> <a class="btn btn4"
						href="">구글 로그인</a>
				</div>
				<div class="footer">
					<p>
						<a href="">아이디 찾기</a>
					</p>
					<p>
						<a href="">비밀번호 찾기</a>
					</p>
					<p>
						기부앤테이크가 처음이신가요? <a href="">회원가입</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<script>
		function validate() {
			let userId = document.getElementById('userId');
			let userPassword = document.getElementById('userPassword');

			if (userId.value.length <= 0) {
				alert("아이디를 입력해주세요!");
				userId.select();
				return false;
			}

			if (userPassword.value.length <= 0) {
				alert("비밀번호를 입력해주세요!");
				userPwd.select();
				return false;
			}

			return true;
		}
	</script>

</body>
</html>
