<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="resources/assets/css/notice.css" rel="stylesheet">
<c:import url="/top" />
<style>
h2 {
	text-align: center;
}

#nList tr td:nth-child(4n+1) {
	text-align:left;
	width: 50%;
}

#nList tr td,th:nth-child(4n+2) {
	text-align:center;
	width: 20%;
}

#nList tr td,th:nth-child(4n+3) {
	text-align:center;
	width: 15%;
}
#nList tr td:nth-child(4n+4) {
	width: 15%;
}

#wrap2{
	height:38px;
	display:flex;
	flex-direction:row;
	flex-wrap: nowrap;
	justify-content:center;
	align-items: stretch;
}


#addNotice{
	float:left;
}

</style>
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
					location.reload();
				}
			},
			error:function(err){
				alert('error : '+err.status);
			}
		})
	}
</script>
<main id="main" class="main">
<section class="notice-main-section-top">
		<div class="notice-main-top">
			<div class="notice-main-desc" style="margin-left:5%">
				<h1 class="notice-main-title"> 
					공지사항
				</h1>

				<p class="text-m" >
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
	
	<br>
	<br>
	<div id="wrap1" class="wrap1">
		
		<table id="nList" class="table">
			<thead>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${nList}" var="data">
					<tr>			
						<td><a href="noticeInfo?nidx=${data.getNIdx()}"><c:out value="${data.getNTitle()}"/></a></td>
						<td><c:out value="${data.getNUserId()}"/></td>
						<td><c:out value="${data.getNDate()}"/></td>
						<td>
						<c:if test="${user.userStatus eq 1}">
							<a href="admin/editNoticeForm?nIdx=${data.getNIdx()}" class="btn btn-outline-warning">수정</a> 
							<a onclick="deleteNotice(${data.getNIdx()})" class="btn btn-outline-danger">삭제</a>
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<c:if test="${user.userStatus eq 1}">
		<a class="btn btn-warning" id="addNotice" href="admin/addNoticeForm">공지 글쓰기</a>
	</c:if>
	<div id="wrap2">
		<ul id="paging" class="pagination">
			<li class="page-item"><a class="page-link" href="noticeList?cpage=${cpage-1}">«</a></li>
			<c:forEach var="i" begin="1" end="${pageCount}">
				<li class="page-item">
					<a style="<c:if test="${i eq cpage}">background-color:gainsboro;</c:if>" class="page-link" href="noticeList?cpage=${i}">${i}</a>
				</li>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="noticeList?cpage=${cpage+1}">»</a></li>
		</ul>
		<div>
		</div>
	</div>
</main>
<c:import url="/foot" />