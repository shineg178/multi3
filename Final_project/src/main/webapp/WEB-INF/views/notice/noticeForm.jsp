<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/top"/>
<style>
	#wrap{
		padding:10px;
	}
	#frm *{
		margin:8px auto;
	}
	#btnWrap{
		text-align:center;
	}
	#btnWrap *{
		margin:0px 5px;
	}
</style>
<main id="main" class="main">
<div id="wrap">
	<h3>공지사항 글쓰기</h3>
	<form id="frm" enctype="multipart/form-data" action="#">
		<input type="text" id="ntitle" placeholder="제목" class="form-control">
		<textarea rows="20" cols="100"  class="form-control" id="nMsg"></textarea>
		<input type="file" class="form-control" id="nfilename">
	</form>
	<div id="btnWrap">
		<button class="btn btn-primary">글 작성</button><a href="noticeList" class="btn btn-warning">돌아가기</a>
	</div>
</div>

</main>
<c:import url="/foot"/>