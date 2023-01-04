<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>로그인 - 기부앤테이크</title>
	<link href="${pageContext.request.contextPath}/resources/assets/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="container">
		<div class="inner">
			<div class="login">
				<div class="login-type">
					<h1>로그인</h1>
					<form action="">
						<input type="text" placeholder="아이디" class="signIn">
						<input type="password" placeholder="비밀번호" class="signIn">
						<input type="submit" id="btn" value="로그인"><br>
						<p>
							<input type="checkbox">아이디 저장
						</p>
					</form>
					<span class="or-txt">또는</span>
					<a class="btn btn2" href="">네이버 로그인</a>
					<a class="btn btn3" href="">카카오 로그인</a>
					<a class="btn btn4" href="">구글 로그인</a>
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
</body>
</html>
