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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<script>
	$(function(){
		$('#subBtn').click(function(){
			let userId=$('#userId').val();
			let userEmail=$('#userEmail').val();
			$.ajax({
				type:'post',
				url:'findPwdAction',
				data:"userId="+userId+"&userEmail="+userEmail,
				dataType:'text',
				cache:false,
				success:function(res){
					alert(res);
					$('#userId').val('');
					$('#userEmail').val('');
				},
				error:function(err){
					alert('error : '+err.status);
				}
			})
		})
	})
</script>
<body>
	<div class="container">
		<div class="inner">
			<div class="find-password">
				<div class="find-password-inner">
					<h1>비밀번호 찾기</h1>
					<input type="text" id="userId" name="userId" placeholder="아이디" class="signIn"> 
					<input type="text" id="userEmail" name="userEmail" placeholder="이메일" class="signIn"> 
					<button id="subBtn" class="btn btn-primary">비밀번호 찾기</button>
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