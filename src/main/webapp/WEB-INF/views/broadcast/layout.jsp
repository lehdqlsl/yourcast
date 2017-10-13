<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
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
<body>
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
		width: "100%",
		height: "100%",
		aspectratio: "16:9",
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
			if(vo != ''){
				join.id = '${requestScope.vo.id}';
				join.name = '${requestScope.vo.name}';
				join.gender = '${requestScope.vo.gender_num}';
				
				// bj:bj
				// 열혈팬:hot
				// 일반팬:fan
				// 일반:user
				join.grade = '${requestScope.grade}';
			}else{
				join.packet=2;
			}
			wsocket.send( JSON.stringify(join));
		}
	});


	$("#actionbox").click(function(){
		var vo = '${requestScope.vo}';
		if(vo == ''){
			var result = confirm('채팅에 참여하시려면 로그인이 필요합니다. 로그인페이지로 이동하시겠습니까?'); 
			if(result) { 
				location.replace('http://192.168.0.4:8082/app/member/login'); 
			} else {
				
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
		var packet = list.packet;
		if(packet == '1'){
			var msg = list.msg;
			var gender = list.gender;
			var grade = list.grade;
			var name = list.name;
			var id = list.id;
			
			if(gender == '1'){
				if(grade == 'bj'){
					$("#chat_area").append('<dl class="bj"><dt class="man"><img src="http://www.afreecatv.com/images/new_app/chat/ic_bj.gif" alt="BJ" title="BJ"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="bj">'+name+'<em>('+id+')</em></a> :</dt><dd id="377">'+msg+'</dd></dl>');
				}else if(grade == 'hot'){
					$("#chat_area").append('<dl class=""><dt class="hot_m"><img src="http://www.afreecatv.com/images/new_app/chat/ic_hot.gif" alt="열혈팬" title="열혈팬"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan">'+name+'<em>('+id+')</em></a> :</dt><dd id="377">'+msg+'</dd></dl>');
				}else if(grade == 'fan'){
					$("#chat_area").append('<dl class=""><dt class="fan_m"><img src="http://www.afreecatv.com/images/new_app/chat/ic_fanclub.gif" alt="팬클럽" title="팬클럽"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan">'+name+'<em>('+id+')</em></a> :</dt><dd id="377">'+msg+'</dd></dl>');	
				}else{
					$("#chat_area").append('<dl class=""><dt class="user_m"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan">'+name+'<em>('+id+')</em></a> :</dt><dd id="377">'+msg+'</dd></dl>');
				}
			}else{
				if(grade == 'bj'){
					$("#chat_area").append('<dl class="bj"><dt class="woman"><img src="http://www.afreecatv.com/images/new_app/chat/ic_bj.gif" alt="BJ" title="BJ"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="bj">'+name+'<em>('+id+')</em></a> :</dt><dd id="377">'+msg+'</dd></dl>');
				}else if(grade == 'hot'){
					$("#chat_area").append('<dl class=""><dt class="hot_w"><img src="http://www.afreecatv.com/images/new_app/chat/ic_hot.gif" alt="열혈팬" title="열혈팬"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan">'+name+'<em>('+id+')</em></a> :</dt><dd id="377">'+msg+'</dd></dl>');
				}else if(grade == 'fan'){
					$("#chat_area").append('<dl class=""><dt class="fan_w"><img src="http://www.afreecatv.com/images/new_app/chat/ic_fanclub.gif" alt="팬클럽" title="팬클럽"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan">'+name+'<em>('+id+')</em></a> :</dt><dd id="377">'+msg+'</dd></dl>');	
				}else{
					$("#chat_area").append('<dl class=""><dt class="user_w"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan">'+name+'<em>('+id+')</em></a> :</dt><dd id="377">'+msg+'</dd></dl>');
				}
			}
			
			var objDiv = document.getElementById("chat_area");
			objDiv.scrollTop = objDiv.scrollHeight;
		}else if(packet == '3'){
			var cnt = list.cnt;
			$("#nAllViewer").html(cnt);
		}else if(packet == '4'){
			var name = list.name;
			var id = list.id;
			var cnt = list.cnt;
			var fancnt = list.fancnt;
			$("#chat_area").append('<div class="balloon_area"><p class="ea" style="color:#ED1C24">'+cnt+'</p><p class="img_balloon"><img src="http://www.afreecatv.com/new_player/items/ba_step3.png" alt="별풍선"></p><div class="text"><strong><a href="javascript:;" user_id="esime" user_nick="">'+name+'('+id+')'+'</a></strong><br><span class="bal_txt">별풍선 <span class="num">'+cnt+'</span>개 선물!</span></div></div>');
			if(fancnt != null){
				$("#chat_area").append('<p class="notice fanclub"><a href="javascript:;" user_id="'+id+'" user_nick="'+name+'">'+name+'('+id+')</a> 님이 '+fancnt+'번째로 팬클럽이 되셨습니다.</p>');
			}
			var objDiv = document.getElementById("chat_area");
			objDiv.scrollTop = objDiv.scrollHeight;
		}else if(packet == '0'){
			var name = list.name;
			var id = list.id;
			$("#chat_area").append('<p class="notice in hotfan"><a href="javascript:;" user_id="'+id+'" user_nick="'+name+'">열혈팬 '+name+'<em>('+id+')</em></a>님이 대화방에 참여했습니다.</p>');
			var objDiv = document.getElementById("chat_area");
			objDiv.scrollTop = objDiv.scrollHeight;
		}
	}
	
	function onClose(evt){
		console.log('종료호출');
	}
	function onError(evt){
		console.log('에러호출');
	}
	
	$("#btn_emo").click(function(){
		$("#emoticonArea").toggle();
	});
	
	$(".btn_close").click(function(){
		$("#emoticonArea").toggle();
	});
	
	$("#emoticonArea img").click(function(){
		$("#write_area").append($(this).clone());
	});
	
	setInterval(function(){ 
		var sendmsg = {};
		sendmsg.packet = 3;
		sendmsg.bj_num = ${requestScope.bj_num};
		wsocket.send( JSON.stringify(sendmsg));
	}, 3000);
	
</script> 

</html>