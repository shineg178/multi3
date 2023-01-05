<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
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
	table tr td:nth-child(3n+1){
		width:70%;
	}
	table tr td:nth-child(3n+2){
		width:10%;
	}
	table tr td:nth-child(3n+3){
		width:20%;
	}
</style>
<c:import url="/top"/>
<main id="main" class="main">
	<div id="wrap">
		<table class="table">
			<tr>
				<td><h4>${notice.getNTitle()}</h4></td>
				<td style="font-weight:bold">${notice.getNUserNum_fk()}</td>
				<td>${notice.getNDate()}</td>
			</tr>
			<tr>
				<td colspan="3">
				<!-- 업로드파일이 있을 경우 -->
				<c:if test="${notice.getNImage() ne null}">
					<img alt="" src="${pageContext.request.contextPath}/resources/Notice_Image/${notice.getNImage()}">
				</c:if>
				
					<br>
					<br>
					<span style="font-size:1.5em;">${notice.getNMessage()}</span>
				</td>
			</tr>
		</table>
		<!-- 관리자일 경우 -->
		<c:if test="${id eq 3}">
			<a href="admin/editNoticeForm?nIdx=${notice.getNIdx()}" class="btn btn-outline-warning">수정</a> 
			<a onclick="deleteNotice(${notice.getNIdx()})" class="btn btn-outline-danger">삭제</a>
		</c:if>
	</div>
</main>
<c:import url="/foot"/>