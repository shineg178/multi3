<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
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
<script>


</script>
<main id="main" class="main">
<div id="wrap">
	<h3>공지사항 글쓰기</h3>
	<form id="frm" action="addNotice" method="POST" enctype="multipart/form-data">
		<input type="text" name="nTitle"  placeholder="제목" class="form-control" required="required">
		<textarea rows="20" cols="100"  class="form-control" name="nMessage" required="required"></textarea>
		<input type="file" class="form-control" name="filename">
		<input type="hidden" name="nUserNum_fk" value="${id}">
		
		<div id="btnWrap">
			<button class="btn btn-primary">글 작성</button><a href="${pageContext.request.contextPath}/noticeList" class="btn btn-warning">돌아가기</a>
		</div>
	</form>
	
</div>

</main>
<c:import url="/foot"/>