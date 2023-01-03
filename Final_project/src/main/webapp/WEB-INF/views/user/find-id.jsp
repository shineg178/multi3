<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link
	href="${pageContext.request.contextPath}/resources/assets/css/find-id.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="inner">
			<div class="find-id">
				<div class="find-id-inner">
					<h1>아이디 찾기</h1>
					<form id="find_form" method="post">

						<input type="text" id="userName" name="userName" placeholder="이름"
							class="signIn"> <input type="text" id="userEmail"
							name="userEmail" placeholder="이메일" class="signIn"> <input
							type="submit" id="btn" class="btn" value="아이디 찾기"><br>
					</form>
				</div>
				<div class="footer">
					<p>
						<a href="find-password">비밀번호 찾기</a> / <a href="login">로그인</a> / <a href="join">회원가입</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
