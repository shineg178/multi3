<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<style>
	#addOrg{
		width:70%;
		margin:auto;
	}
	#addOrg>*{
		margin-bottom:10px;
	}
	#btnWrap{
		text-align: center;
	}
	#btnWrap>*{
		margin:10px;
	}
	#bankName{
		width:30%;
	}


</style>
<c:import url="/top"/>
<main id="main" class="main">
	<form id="addOrg" action="addOrg" method="post">
		<h5>단체명</h5>
		<input class="form-control" type="text" name="donName" id="" placeholder="단체명을 입력하세요" required>
		<h5>단체 설명</h5>
		<textarea class="form-control" cols="" rows="10" name="donOrgInfo" id="donOrgInfo" placeholder="단체 설명을 입력하세요"></textarea>
		<h5>계좌정보</h5>
		<select name="donBankName" class="form-select" id="bankName">
			<option>국민은행</option>
			<option>신한은행</option>
			<option>우리은행</option>
			<option>하나은행</option>
		</select>
		<input class="form-control" type="number" name="donBankAccount" placeholder="(-)를 제외하고 계좌번호를 입력하세요" required>
		<div id="btnWrap">
			<button class="btn btn-primary">추가</button><a class="btn btn-warning" href="javascript:window.history.back();">취소</a>
		</div>
	</form>
</main>
<c:import url="/foot"/>