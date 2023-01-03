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
					<span class="or-txt">또는</span> <a class="btn btn2" href="">네이버로그인</a>
					<a class="btn btn3" href="">카카오 로그인</a> <a class="btn btn4" href="">구글
						로그인</a>
				</div>
				<div class="footer">
					<p>
						<a href="find-id">아이디 찾기</a> / <a href="find-password">비밀번호 찾기</a>
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

</body>
</html>
