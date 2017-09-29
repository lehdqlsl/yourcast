<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html style="overflow-y: hidden;">
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Sofia'
	rel='stylesheet' type='text/css'>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/sockjs.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/jwplayer/jwplayer.js?ver=1.1'/>"></script>
</head>
<!-- 메인페이지 레이아웃 -->
<body id="body">
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>

		<div id="main">
			<tiles:insertAttribute name="content" />
		</div>
	</div>
</body>
<script type="text/javascript">
/*
 * 패킷 정보
 * 0 : 채팅 입장
 * 1 : 채팅 보내기
 * 2 : 퇴장
 */

	jwplayer("container").setup({
		sources : [ {
			file : '${requestScope.url}'
		} ],
		autostart : true,
		width : 1300,
		height : 735,
		primary : "flash"
	});
	var wsocket;
	
	$(window).on("unload", function(e) {
	  	if(wsocket != null){
			var sendmsg = {};
			sendmsg.packet = 2;
			sendmsg.bj_num =  ${requestScope.bj_num};
			wsocket.send( JSON.stringify(sendmsg));
	  	}else{
	  		console.log('널');
	  	}
	});

	$(window).on("load", function(e) {
		var vo = '${requestScope.vo}';
		if(vo == ''){
			alert("로그인하세요.");
		}else{
			//등급처리
			//블랙리스트처리
			wsocket = new SockJS("/app/echo.sockjs");
			wsocket.onmessage = onMessage;
			wsocket.onclose = onClose;
			wsocket.onerror = onError;
			wsocket.onopen = function(){
				var join = {};
				join.packet = 0;
				join.bj_num = ${requestScope.bj_num};
				join.id = '${requestScope.vo.id}';
				join.name = '${requestScope.vo.name}';
				join.gender = '${requestScope.vo.gender_num}';
				join.grade = 0;
				wsocket.send( JSON.stringify(join));
			}
		}
	});

	 $("#write_area").keydown(function (event) {
         if (event.which === 13) {  
        	var msg = $("#write_area").html();
        	if(msg.length > 0){
	        	var bj_num = ${requestScope.bj_num};
	        	var sendmsg = {};
	        	sendmsg.packet = 1;
	        	sendmsg.msg = msg;
	        	sendmsg.bj_num = bj_num;
	        	wsocket.send( JSON.stringify(sendmsg));
	        	$("#write_area").html("");
        	}
			return false;
         }
     });

	$("#btn_send").click(function(){
		var msg = $("#write_area").html();
		if(msg.length > 0){
			var bj_num = ${requestScope.bj_num};
			var sendmsg = {};
			sendmsg.packet = 1;
			sendmsg.msg = msg;
			sendmsg.bj_num = bj_num;
			wsocket.send( JSON.stringify(sendmsg));
			$("#write_area").html("");
		}
	});
	
	function onMessage(evt){
		var list = $.parseJSON(evt.data);
		var msg = list.msg;
		var gender = list.gender;
		var grade = list.grade;
		var name = list.name;
		var id = list.id;
		$("#chat_area").append('<dl class=""><dt class="fan_m"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan">'+name+'<em>('+id+')</em></a> :</dt><dd id="377">'+msg+'</dd></dl>');
		var objDiv = document.getElementById("chat_area");
		objDiv.scrollTop = objDiv.scrollHeight;
	}
	
	function onClose(evt){
		console.log('종료호출');
	}
	function onError(evt){
		console.log('에러호출');
	}
</script>

</html>