<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<c:import url="/top"/>
<style>
	h2{
		text-align:center;
	}
	#nList tr td:nth-child(3n+1){
		width:60%;
	}
	#nList tr td:nth-child(3n+2){
		width:20%;
	}
	#nList tr td:nth-child(3n+3){
		width:20%;
	}
	
</style>
<main id="main" class="main">
	<div id="wrap">
	<h2>공지사항</h2>
		<table id="nList" class="table">
		 <thead>
		   <tr>
		      <th>제목</th>
		      <th>작성자</th>
		      <th>작성일</th>
		   </tr>
		 </thead>
		 <tbody>
		   <tr>
		      <td>공지사항1</td>
		      <td>관리자3</td>
		      <td>2022-12-24</td>
		   </tr>
		   <tr>
		      <td>공지사항2</td>
		      <td>관리자2</td>
		      <td>2022-12-24</td>
		   </tr>
		   <tr>
		      <td>공지사항3</td>
		      <td>관리자1</td>
		      <td>2022-12-24</td>
		   </tr>
		 </tbody> 
		</table>
	</div>
	<button class="btn btn-danger">공지 글쓰기</button>

</main>
<c:import url="/foot"/>