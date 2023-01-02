<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
  />
  	
<style>
#wrap {
	margin: 15 15 auto;
}

#chatLog {
	height: 80%;
	background-color: skyblue;
	border: 1px;
	border-radius: 10px;
}

#sendBox {
	height: 13%;
	width: 100%;
	border: 1px;
}

#msg {
	margin: 15 auto;
	width: 80%;
	height:80px;
	border-radius: 10px;
	border: 5px solid skyblue;
	float: left;
	resize: none;
}

#chatLog{
	overflow: auto;
	list-style: none;
}
div#left{
	text-align:left;
	margin:25px 5px;
}
div#right{
	text-align:right;
	margin:25px 5px;
}
span#left{
	padding:5px;
	background-color:white;
	border-radius: 10px;
}

span#right{
	padding:5px;
	background-color:yellow;
	border-radius: 10px;
}

.fa{
	margin:15px 0px 0px 25px;
}

#sendBtn{
	margin:0px 0px 0px 10px;
}

img{
	width:80%;
	margin-bottom:10px;
}

</style>
<script>
//글 입력후 엔터 쳤을때 메시지 전송
function sendMsg(e){
	if(e.keyCode == 13){
		$('#sendBtn').click();
	}
}

	$(function(){	
		//스크롤바 아래고정 메서드
		function scrollBottom(){
			$('#chatLog').scrollTop($('#chatLog').prop('scrollHeight'));	
		}
		
		//처음 들어왔을때 스크롤 아래 이동
		
		
		//받는이 지정 
		var toUser;
		if(${Room.userNum1}==${id}){
			toUser=${Room.userNum2};
			$('#rNum').val(toUser);
		}else if(${Room.userNum2}==${id}){
			toUser=${Room.userNum1};
			$('#rNum').val(toUser);
		}
		
		
		//전송 버튼 누를때 데이터 전송 
		$("#sendBtn").click(function() {
			var imgCheck=$('#img').val();
			//첨부파일을 넣었을때
			if(imgCheck){
				var fileName=$('#img')[0].files[0].name;
				var form = $('#imgfrm')[0];
				var formData = new FormData(form);
				formData.append("img", $('#img')[0].files[0]);
				
				$.ajax({
					type:'post',
					url:'sendImg',
					processData: false,
                    contentType: false,
					data:formData,
					cache:false,
					success:function(res){
					},
					error:function(err){
						alert('error : '+err.status);
					}	
				})
				sendMessage(${Room.roomid}+":"+${id}+":"+toUser+":"+fileName+":img");
			}
			
			//첨부파일을 넣지 않았을때
			if(!imgCheck){
				if($('#msg').val()!=""){
					//"방번호:로그인유저:메시지:타입" 형태
					sendMessage(${Room.roomid}+":"+${id}+":"+toUser+":"+$("#msg").val()+":msg");
				}
			}
			$('#msg').val('');
			
		});
		
		// 웹소켓 연결
		var url = "http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chat";
		let sock = new SockJS(url);
		sock.onmessage = onMessage;
		sock.onopen = onOpen;
		
		//방에 입장 했을때 
		function onOpen(){
			//"방번호:로그인유저:방입장" 형태
			sock.send(${Room.roomid}+":"+${id}+"::"+":Enter");
		}
		
		//메시지를 전송 했을때
		function sendMessage(msg) {
			sock.send(msg);
			scrollBottom();
		}
		
		//메시지를 받았을때
		function onMessage(msg) {
			var data = msg.data;
			var userid = data.split(":")[0];
			var type= data.split(":")[2];
			var position;
			if(userid == ${id} ){
				position="right";
			}else{
				position="left";
			}
			//메시지만 전송 받았을때
			if(type=="msg"){
				$('#chatLog').append("<div id="+position+"><span id="+position+">" + data.split(":")[1] + "</span></div>");
				scrollBottom();
			}
			//이미지를 전송 받았을때
			if(type="img"){
				location.reload();
				scrollBottom();
			}
			$('#msg').focus();
		}
		
		scrollBottom();
	})
</script>
<div id="wrap">
	<div id="chatLog">
		<!-- 지난 채팅 내역 -->
		<c:forEach var="data" items="${cList}">
			<!-- 이미지가 첨부 되지않았을때 -->
			<c:if test="${data.getCImg() eq null}">
				<c:if test="${data.getSNum() eq id}">
					<div id="right">
						<span id="right">${data.getSendMsg()}</span>
					</div>
				</c:if>
				<c:if test="${data.getSNum() ne id}">
					<div id="left">
						<span id="left">${data.getSendMsg()}</span>
					</div>
				</c:if>
			</c:if>
			
			<!-- 이미지가 첨부 되었을때 -->
			<c:if test="${data.getCImg() ne null}">
				<c:if test="${data.getSNum() eq id}">
					<div id="right">
						<img id="right" src="${pageContext.request.contextPath}/resources/Chat_Image/${data.getCImg()}"/>
						<br>
						<%-- <span id="right">${data.getSendMsg()}</span> --%>
					</div>
				</c:if>
				<c:if test="${data.getSNum() ne id}">
					<div id="left">
						<img id="left" src="${pageContext.request.contextPath}/resources/Chat_Image/${data.getCImg()}"/>
						<br>
						<%-- <span id="left">${data.getSendMsg()}</span> --%>
					</div>
				</c:if>
			</c:if>
		</c:forEach>
		<!-- 채팅 목록이 들어올 장소 -->
	</div>
	<div id="sendBox">
		<form id="imgfrm" method="post" enctype="multipart/form-data">
			<input id="img" type="file" style="display:none;" accept=".jpg, .png">
			<input type="hidden" name="roomid" value="${Room.roomid}">
			<input type="hidden" name="rNum" id="rNum">
		</form>
		<input id="msg" onkeypress="sendMsg(event)"/>
		<label for="img">
			<i id="imgbtn" class="fa fa-plus-square-o fa-2x" aria-hidden="true"></i>
		</label>
		<button id="sendBtn" class="btn btn-primary rounded-pill">전송</button>
	</div>
</div>
