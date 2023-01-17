<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<link href="resources/assets/css/join.css" rel="stylesheet" type="text/css">

<title>회원가입 - 기부앤테이크</title>
<style>

</style>
<c:import url="/top" />
<main id="main" class="main">
	<div class="outer">
		<div id="joinInfoArea">
			<form id="joinForm" name="joinForm" method="post" action="${path}/project/joinUser"
				onsubmit="return join();"> 
				<br>
				<h1><strong>회원가입</strong></h1>

		<hr>
				<!-- 아이디 -->
				
					<div class="item">
					<h6>* 아이디</h6>
					
					
					<span class="input_area"> <input type="text" maxlength="13"
						name="userId" class="userId" onchange="checkId()"
						placeholder="2~13자리 / 영문, 숫자 사용가능" required>
					</span>
					
					<div class="errorCheck">
						<span class="idCheckMsg1" id="idFocusMsg">2~13자리 / 영문, 숫자만
							사용해주세요.</span>
						<!-- 오류 시 텍스트 -->
						<span class="idKorCheck" >한글은
							사용할 수 없습니다.</span> <span class="idValueCheck">2자 이상 13자 이하로 입력해주세요.</span> <span
							class="idReg2Check" >같은
							문자를 4번 이상 연속해서 사용할 수 없습니다.</span> <span class="idReg3Check"
							style="padding: 10px 0px 0px 0px;">특수문자를 사용할 수 없습니다.</span> <span
							class="idReg4Check" >공백을
							사용할 수 없습니다.</span>
						<!-- 아이디 중복체크 -->
						<span class="id_ok" style="color:black;" >사용 가능한 아이디입니다.</span> 
						<span class="id_already"
							style="padding: 10px 0px 0px 0px;">이미 사용중인 아이디입니다.</span>
					</div>
				</div>
				<div class="item">
					<!--비밀번호 -->
					<h6>* 비밀번호</h6>
					
					<span class="input_area"><input type="password" class="userPassword"
						maxlength="16" name="userPassword" onchange="checkPassword()"
						placeholder="8~16자리/영문 대소문자,숫자,특수문자 조합" required></span>
					<div class="errorCheck">
							<span class="pwdValueCheck" style="padding: 10px 0px 0px 0px;">8자 이상 16자 이하로 입력해주세요.</span> 
							<span class="pwdIdCheck" >비밀번호에 아이디를 포함할 수 없습니다.</span> 
							<span class="pwdReg2Check" style="padding: 10px 0px 0px 0px;">같은 문자를 4번 이상 연속해서 사용할 수
							없습니다.</span> 
							
							<span class="pwdReg4Check" style="padding: 10px 0px 0px 0px;">공백을 사용할 수 없습니다.</span> 
							<span class="pwdRegCheck" >영문 대소문자, 특수문자를 모두 포함하여야 합니다.</span>
					</div>
				</div>
				<div class="item">
				<h6>* 비밀번호 확인</h6>
				
				<span class="input_area"><input type="password"
					onchange="checkPassword2()" maxlength="15" name="userPassword2"
					required></span> <label id="pwdResult"></label>
				<div class="errorCheck">
				<span class="pwd2Check" >비밀번호가 일치하지 않습니다.</span>
				</div>
				</div>
				<div class="item">
				<h6>* 이름</h6>
				
				<span class="input_area"><input type="text" maxlength="5"
					onchange="checkName()" name="userName" placeholder="한글만 입력 가능" required></span>
				<div class="errorCheck">
				<span class="nameCheck" >한글만 입력해주세요.</span>
				</div>
				</div>
				<div class="item">
				<h6>연락처</h6>
				
				<span class="input_area"><input type="tel" maxlength="11"
					onchange="checkNumber()" name="userTel"
					placeholder="(-없이)01012345678" required></span>
	    	   	<div class="errorCheck">
				<span class="regNumCheck" >연락처에는 숫자만 입력 가능합니다.</span>
				<span class="regPhoneCheck" >연락처 형식에 맞게 입력해주세요.</span>
				</div>
				</div>
				<div class="item">
				<h6>이메일</h6>
				
				<span class="input_area"><input type="email" name="userEmail"
					placeholder="email@givuntake.co.kr" required></span>
				</div>
				<div class="addDiv1">
				<h6>우편번호</h6>
				<span class="input_area"><input type="text" name="userAddr1"
					class="postcodify_postcode5" placeholder="검색 버튼을 클릭해보세요" required></span>
				<button type="button" id="postcodify_search_button" class="btn btn-warning">검색</button>
				</div>
				<div class="addDiv2">
				<h6>도로명주소</h6>
				
				<span class="input_area"><input type="text" name="userAddr2"
					class="postcodify_address" required></span>
					</div>
					<div class="addDiv2">
				<h6>상세주소</h6>
				<span class="input_area"><input type="text" name="userAddr3"
					class="postcodify_details" placeholder="상세주소 입력" required></span>
					</div>
					<hr>
				<div class="btnArea">
					<button id="joinBtn" class="btn btn-success" >가입하기</button>
					<button type="button" class="btn btn-secondary"
					 onClick="location.href='/project'">돌아가기</button>
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
	
	
<script>

const userPassword=joinForm.userPassword;
const userPassword2=joinForm.userPassword2;
const userId=joinForm.userId;

function returnPwd(){
	userPassword.focus();
    userPassword.value="";
}
function returnId(){
	userId.focus();
	userId.value="";
}




	//아이디 유효성 검사
	function checkId(){
		
		$('.errorCheck span').css("display", "none");
		const regKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		const reg2 = /(\w)\1\1\1/;
		const reg3 = /[~!@#$%^&*()_+|<>?:{}]/;
		
	    //아이디에 한글 사용 방지
	    if(regKorean.test(userId.value)){
	    	$('.idKorCheck').css("display","block"); 
	    	returnId();
	    }else if(userId.value.length < 2 || userId.value.length > 13){
            $(".idValueCheck").css("display","block");
            returnId();
         }else if(reg2.test(userId.value)){
        	 $(".idReg2Check").css("display","block");
            returnId();
        }else if(reg3.test(userId.value)){
        	$(".idReg3Check").css("display","block");
        	returnId();
        }else if(userId.value.search(" ") != -1){
        	$(".idReg4Check").css("display","block");
        	returnId();
        }else{
        	IdCheck();
        	
        }
	}
	
	//아이디 중복체크
	function IdCheck(){
			var userId = $('.userId').val();
			$.ajax({
				url : "./IdCheckService",
				type : 'POST',
				data : {userId: userId},
				dataType : 'json',
				success : function(cnt){
					if(cnt == 0){//0일 경우 사용 가능한 아이디
						/* status.ID = true; */
						$('.id_ok').css("display","inline-block");
					} else{//cnt 1일 경우 이미 존재하는 아이디
						$('.id_already').css("display","inline-block");
	                    returnId();
					}
				},
				error : function(err) {
					alert('error ' + err.status);
				
				//	alert("서버요청실패");
					 $('.userId').val('');
				}
			});
			
	}
	

	
	 function checkPassword(){
		  $('.errorCheck span').css("display", "none");
		 
	      const reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,16}$/;
	      const reg2 = /(\w)\1\1\1/;
	      
	      if(userPassword.value.length < 8 || userPassword.value.length > 16){
	    	  $(".pwdValueCheck").css("display","block");
	    	  returnPwd();
	      }else if(reg2.test(userPassword.value)){
	    	  $(".pwdReg2Check").css("display","block");
	    	  returnPwd();
	      }else if(userPassword.value.search(" ") != -1){
	    	  $(".pwdReg4Check").css("display","block");
	    	  returnPwd();
	      }else if(!reg.test(userPassword.value)){
	    	  $(".pwdRegCheck").css("display","block");
	    	  returnPwd();
	      }else if(userPassword.value.search(userId.value) > -1){
	    	  $(".pwdIdCheck").css("display","block");
	    	  returnPwd();
	      }else{
	    	  userPassword2.focus();
	      }
	 } 
	 
	   function checkPassword2(){
		   $('.errorCheck span').css("display", "none");
	      //비밀번호와 비밀번호확인 일치여부 체크
		   if(userPassword.value != userPassword2.value){
		      $(".pwd2Check").css("display","block");
		      userPassword2.focus();
		      userPassword2.value="";
	      }
	   }
	   
	   function checkNumber(){
		   $('.errorCheck span').css("display", "none");
		   const userTel=joinForm.userTel;
		   var regNum = /^[0-9]+$/;
		   var regPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})[0-9]{3,4}[0-9]{4}$/;
		   
		   if(!regNum.test(userTel.value)){
			   $(".regNumCheck").css("display","block");
	    	   userTel.focus();
	    	   userTel.value="";
	       }else if(!regPhone.test(userTel.value)){
	    	   $(".regPhoneCheck").css("display","block");
	    	   userTel.focus();
	    	   userTel.value="";
	       }
		   
	   }
	   
	   function checkName(){
		   $('.errorCheck span').css("display", "none");
	      const userName=joinForm.userName;
	      //이름에 한글 외 사용 불가
	       const regName = /[가-힣]/;
	       if(!regName.test(userName.value)){
	    	   $(".nameCheck").css("display","block");
	    	   userName.focus();
	    	   userName.value="";
	       }
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
	    	alert("비밀번호에 같은 문자를 4번 이상 연속해서 사용할 수 없습니다.");
	    	userPassword.focus();
	    	return false;
	    }
	    //아이디 같은 문자 연속 4번
	    if(reg2.test(userId.value)){
	    	alert("아이디에 같은 문자를 4번 이상 연속해서 사용할 수 없습니다.");
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

	  	//비밀번호 안에 아이디가 있을 때
		if(userPassword.value.search(userId.value) > -1){
			alert("비밀번호에 아이디를 포함할 수 없습니다.");
			userPassword.focus();
			return false;
		}
		//이름에 한글 외 사용 불가
	    const regName = /|가-힣]/;
	    if(!regKorean.test(userName.value)){
	    	alert("이름에는 한글만 입력 가능합니다.");
	    	userName.focus();
	    	return false;
	    }
	    
	    alert(userId.value+"님 회원가입을 환영합니다!");
	    
	}
</script>
</main>
<c:import url="/foot" />