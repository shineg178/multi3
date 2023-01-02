<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입 - 기부앤테이크</title>
<link
	href="${pageContext.request.contextPath}/resources/assets/css/join.css"
	rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>

</head>
<body>
	<!-- index.jsp 생성 후 모든 페이지에 include할 menubar.jsp 생성 -->
	<%-- <%@ include file="/WEB-INF/views/join.jsp" %> --%>

	<div class="outer">
		<div id="joinInfoArea">
			<form id="joinForm" method="post" action="joinUser">
				<h1>회원 가입</h1>

				<h4>* 아이디</h4>
				<span class="input_area"><input type="text" maxlength="13"
					name="userId" required></span>
				<button id="idCheck" type="button">중복확인</button>

				<h4>* 비밀번호</h4>
				<span class="input_area"><input type="password"
					maxlength="15" name="userPassword" required></span>

				<h4>* 비밀번호 확인</h4>
				<span class="input_area"><input type="password"
					maxlength="15" name="userPassword2" required></span> <label
					id="pwdResult"></label>

				<h4>* 이름</h4>
				<span class="input_area"><input type="text" maxlength="5"
					name="userName" required></span>

				<h4>연락처</h4>
				<span class="input_area"><input type="tel" maxlength="11"
					name="userTel" placeholder="(-없이)01012345678"></span>

				<h4>이메일</h4>
				<span class="input_area"><input type="email" name="userEmail"></span>

				<h4>우편번호</h4>
				<span class="input_area"><input type="text" name="userAddr1"
					class="postcodify_postcode5"></span>
				<button type="button" id="postcodify_search_button">검색</button>
				<h4>도로명주소</h4>
				<span class="input_area"><input type="text" name="userAddr2"
					class="postcodify_address"></span>
				<h4>상세주소</h4>
				<span class="input_area"><input type="text" name="userAddr3"
					class="postcodify_details"></span>
				<div class="btnArea">
					<button id="joinBtn">가입하기</button>
				</div>
			</form>
		</div>
	</div>

	<!-- 주소 API 스크립트 -->
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

	<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
	<script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>


</body>
</html>