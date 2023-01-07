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
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js">
	
</script>
<style>
	.id_ok{
		display: none;
	}
	.id_already{
		display: none;
	}
</style>
</head>
<body>
	<div class="outer">
		<div id="joinInfoArea">
			<form id="joinForm" name="joinForm" method="post" action="joinUser"
				onsubmit="return join();">
				<h1>회원 가입</h1>

				<h4>* 아이디</h4>
				<span class="input_area">
				<input type="text" maxlength="13"
					name="userId" class="userId" onchange="checkId()" required></span>
				<!-- oninput="checkId()"  -->
				
				<br>
				<span class="id_ok" style="padding:10px 0px 0px 0px;">사용 가능한 아이디입니다.</span>
				<span class="id_already"  style="padding:10px 0px 0px 0px;">이미 사용중인 아이디입니다.</span>
				
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
	<script>
	<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
</body>
<script type="text/javascript">
	
	const joinForm=document.joinForm;
	const userId=joinForm.userId;
	
	//아이디 중복체크
	function checkId(){
			var userId = $('.userId').val();
			
			$.ajax({
				url : "./IdCheckService",
				type : 'POST',
				data : {userId: userId},
				dataType : 'json',
				success : function(cnt){
					if(cnt == 0){//0일 경우 사용 가능한 아이디
						$('.id_ok').css("display","inline-block"); 
	                    $('.id_already').css("display", "none");
	              
					} else{//cnt 1일 경우 이미 존재하는 아이디
						$('.id_already').css("display","inline-block");
	                    $('.id_ok').css("display", "none");
	                   
	                    $('.userId').val('');
					} 
				},
				error : function(err) {
					alert('error ' + err.status);
				
				//	alert("서버요청실패");
					 $('.userId').val('');
				}
			});

	}
	
	
	function join(){
		
		const userPassword=joinForm.userPassword;
		const userPassword2=joinForm.userPassword2;

		const userName=joinForm.userName;

		if(userId.value.length < 2 || userId.value.length > 13){
			alert("아이디는 2자 이상 13자 이하로 작성해주세요!");
			userId.focus();
			return false;
		}

		if(userPassword.value.length < 8 || userPassword.value.length > 15){
			alert("비밀번호는 8자 이상, 15자 미만으로 작성해주세요");
			userPassword.focus();
			return false;
		}
		
		if(userPassword.value != userPassword2.value){
			alert("비밀번호가 일치하지 않습니다");
			userPassword.focus();
			return false;
		}
		if(userPassword.value.search(" ") != -1){
			alert("비밀번호는 공백을 포함할 수 없습니다.");
			userPassword.focus();
			return false;
		}
		
		// A-Z, a-z, 0-9, 특수문자가 포함되어 있는지, 8자 이상
		const reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,15}$/;
	    if(!reg.test(userPassword.value)){
		    alert("비밀번호는 8자리 이상 15자리 미만, 대문자/소문자/숫자/특수문자 모두 포함해야 합니다.");
		    userPassword.focus();
		    return false;
		}

	    //비밀번호 같은 문자 연속 4번
	    const reg2 = /(\w)\1\1\1/;
	    if(reg2.test(userPassword.value)){
	    	alert("같은 문자를 4번 이상 연속해서 사용할 수 없습니다.");
	    	userPassword.focus();
	    	return false;
	    }
	    //아이디 같은 문자 연속 4번
	    if(reg2.test(userId.value)){
	    	alert("같은 문자를 4번 이상 연속해서 사용할 수 없습니다.");
	    	userId.focus();
	    	return false;
	    }
	    const regKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	    //아이디에 한글 사용 방지
	    if(regKorean.test(userId.value)){
	    	alert("아이디에 한글을 사용할 수 없습니다.");
	    	userId.focus();
	    	return false;
	    }
	    //비밀번호에 한글 사용 방지
	    if(regKorean.test(userPassword.value)){
	    	alert("비밀번호에 한글을 사용할 수 없습니다.");
	    	userPassword.focus();
	    	return false;
	    }
	  	//비밀번호 안에 아이디가 있을 때
		if(userPassword.value.search(userId.value) > -1){
			alert("비밀번호에 아이디를 포함할 수 없습니다.");
			userPassword.focus();
			return false;
		}
		//이름에 한글 외 사용 불가
	    const regName = /|가-힣]/;
	    if(!regKorean.test(userName.value)){
	    	alert("한글만 입력하세요");
	    	userName.focus();
	    	return false;
	    }
	}
</script>
</html>