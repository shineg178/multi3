<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link
	href="${pageContext.request.contextPath}/resources/assets/css/find-password.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="inner">
			<div class="find-password">
				<div class="find-password-inner">
					<h1>비밀번호 찾기</h1>
					<form id="find_form" method="post">

						<input type="text" id="userId" name="userId" placeholder="아이디"
							class="signIn"> <input type="text" id="userEmail"
							name="userEmail" placeholder="이메일" class="signIn"> <input
							type="submit" id="btn" class="btn" value="비밀번호 찾기"><br>
					</form>
				</div>
				<div class="footer">
					<p>
						<a href="find-id">아이디 찾기</a> / <a href="login">로그인</a> / <a href="join">회원가입</a> / <a href="/project">돌아가기</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>