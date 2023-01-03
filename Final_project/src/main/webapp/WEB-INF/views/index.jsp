<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/top" />
<main id="main" class="main">
	<ul>
		<li>
			<a href="1">1 접속</a> <br>
			<a href="2">2 접속</a> <br>
			<a href="3">3 접속</a> <br>
		</li>
		<li>
			<a href="room1">1과 채팅방 생성</a><br> 
			<a href="room2">2과 채팅방 생성</a><br> 
			<a href="room3">3과 채팅방 생성</a><br>
		</li>
		<li>${id}로그인중</li>
	</ul>
</main>
<c:import url="/foot" />