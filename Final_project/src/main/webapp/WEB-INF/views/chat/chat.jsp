<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body{
		he
	}
	#wrap{
		margin:15 15 auto;
	}
	#chatLog{
		height:80%;
		background-color:skyblue;
		border:1px;
		border-radius:10px;
	}
	#sendBox{
		height:13%;
		width:100%;
		border:1px;
	}
	#msg{
		margin:15 auto;
		width:80%;
		border-radius:10px;
		border:5px solid skyblue;
		float:left;
		resize:none;
	}
	button{
    	margin:27 0 0 10;
	}
</style>
<div id="wrap">
	<div id="chatLog" >
		<ul>
			<li></li>
		</ul>
	</div>
	<form id="sendBox">
		<textarea id="msg" rows="2" cols="30"></textarea>
		<button class="btn btn-primary rounded-pill">전송</button>
	</form>
</div>