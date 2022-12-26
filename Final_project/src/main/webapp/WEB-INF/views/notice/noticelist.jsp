<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<c:import url="/top" />
<style>
h2 {
	text-align: center;
}

#nList tr td:nth-child(4n+1) {
	width: 50%;
}

#nList tr td:nth-child(4n+2) {
	width: 20%;
}

#nList tr td:nth-child(4n+3) {
	width: 15%;
}
#nList tr td:nth-child(4n+4) {
	width: 15%;
}
#wrap2{
	height:38px;
	flex-direction:row;
	display:flex;
	flex-wrap: nowrap;
	justify-content:space-between;
	align-items: stretch;
}

</style>
<main id="main" class="main">
	<div id="wrap1">
		<h2>공지사항</h2>
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
				<tr>			
					<td><a href="#">공지사항1</a></td>
					<td>관리자3</td>
					<td>2022-12-24</td>
					<td>
						<a href="editNoticeForm?noticeNum=${noticeNum}" class="btn btn-outline-warning">수정</a> 
						<a href="#" class="btn btn-outline-danger">삭제</a>
					</td>
				</tr>
				<tr>
					<td><a href="#">공지사항2</a></td>
					<td>관리자2</td>
					<td>2022-12-24</td>
					<td>
						<a href="editNoticeForm?noticeNum=${noticeNum}" class="btn btn-outline-warning">수정</a> 
						<a href="#" class="btn btn-outline-danger">삭제</a>
					</td>
				</tr>
				<tr>
					<td><a href="#">공지사항3</a></td>
					<td>관리자1</td>
					<td>2022-12-24</td>
					<td>
						<a href="editNoticeForm?noticeNum=${noticeNum}" class="btn btn-outline-warning">수정</a>  
						<a href="#" class="btn btn-outline-danger">삭제</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="wrap2">
		<a class="btn btn-danger" id="addNotice" href="addNoticeForm">공지 글쓰기</a>
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#">«</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">»</a></li>
		</ul>
		<div>
		</div>
	</div>
</main>
<c:import url="/foot" />