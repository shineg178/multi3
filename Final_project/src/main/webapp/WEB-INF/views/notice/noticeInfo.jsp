<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
  <link href="resources/assets/css/noticeInfo.css" rel="stylesheet">
<script>
	function deleteNotice(nidx){
		$.ajax({
			type:'post',
			url:'admin/deleteNotice',
			data:{
				nIdx:nidx
			},
			dataType:'json',
			cache:false,
			success:function(res){
				if(res>0){
					location.href="${pageContext.request.contextPath}/noticeList";
				}
			},
			error:function(err){
				alert('error : '+err.status);
			}
		})
	}
</script>
<style>
#nImg{
	width:70%;
}
</style>
<c:import url="/top"/>
<main id="main" class="main">

<section class="notice-main-section-top">
		<div class="notice-main-top">
			<div class="notice-main-desc">
				<h1 class="notice-main-title">
					공지사항
				</h1>

				<p class="text-m">
					기부앤테이크의 
					업데이트 정보, 
					<br>기부금 전달 등 다양한 소식을 알려드립니다.
				</p>
			</div>
			<div class="notice-main-image-top">
				<span> <img class="notice-main-image-top"
					src="resources/assets/img/notice.png">
			</div>
		</div>
	</section>
	<br><br>
	<div id="wrap">
		<table class="table">
			<tr class="table-tr1">
				<td><h4>${notice.getNTitle()}</h4></td>
				<td style="font-weight:bold">${notice.getNUserId()}</td>
				<td>${notice.getNDate()}</td>
			</tr>
			<tr class="table-tr2">
				<td colspan="3">
				<!-- 업로드파일이 있을 경우 -->
				<c:if test="${notice.getNImage() ne null}">
					<img id="nImg" alt="" src="${pageContext.request.contextPath}/resources/Notice_Image/${notice.getNImage()}">
				</c:if>
				
					<br>
					<br>
					<span style="font-size:1.5em;">${notice.getNMessage()}</span>
				</td>
			</tr>
		</table>
		<!-- 관리자일 경우 -->
		<c:if test="${user.userStatus eq 1}">
			<a href="admin/editNoticeForm?nIdx=${notice.getNIdx()}" class="btn btn-outline-warning">수정</a> 
			<a onclick="deleteNotice(${notice.getNIdx()})" class="btn btn-outline-danger">삭제</a>
		</c:if>
	</div>
</main>
<c:import url="/foot"/>