<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
@import url(https://fonts.googleapis.com/css?family=Open+Sans);

/*Page styles*/

.boxes {
  margin: auto;
  padding: 50px;
  background: #484848;
}

/*Checkboxes styles*/
input[type="checkbox"] {
  display: none;
}

input[type="checkbox"] + label {
  display: block;
  position: relative;
  padding-left: 35px;
  font: 14px/20px "Open Sans", Arial, sans-serif;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}

input[type="checkbox"] + label:last-child {
  margin-bottom: 0;
}

input[type="checkbox"] + label:before {
  content: "";
  display: block;
  width: 20px;
  height: 20px;
  border: 1px solid #212121;
  position: absolute;
  left: 0;
  top: 0;
  opacity: 0.6;
  -webkit-transition: all 0.12s, border-color 0.08s;
  transition: all 0.12s, border-color 0.08s;
}

input[type="checkbox"]:checked + label:before {
  width: 10px;
  top: -5px;
  left: 5px;
  border-radius: 0;
  opacity: 1;
  border-top-color: transparent;
  border-left-color: transparent;
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/sockjs.min.js'/>"></script>
<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;">
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">
			방송 설정</h3>
		<form action="<c:url value='/member/broadcast/update'/>" method="post" id="target">
			<div>
				<dl>
					<dt>서버 URL</dt>
					<dd>
						<p>rtmp://192.168.0.31:3535/myapp</p>
					</dd>
				</dl>
				<dl>
					<dt>스트림 이름</dt>
					<dd>
						<input type="text" class="w3-input w3-section"  value="${bvo.stream_key }" readonly="readonly" style="width: 600px;">
					</dd>
				</dl>
				<dl>
					<dt>방송 제목</dt>
					<dd>
						<input type="text" class="w3-input w3-section" name="broadcast_title" value="${bvo.broadcast_title }" style="width: 600px;">
					</dd>
				</dl>
				<dl>
					<dt>방송 장르</dt>
					<br>
					<c:forEach var="gvo" items="${glist }">
						<c:choose>
							<c:when test="${gvo.genre_num==bvo.genre_num}">
								<input type="radio" name="genre_num" checked="checked"
									value="${gvo.genre_num }">${gvo.genre_name }
							</c:when>
							<c:otherwise>
								<input type="radio" name="genre_num" value="${gvo.genre_num }">${gvo.genre_name }
								<c:if test="${gvo.genre_num%10==0}">
									<br>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</dl>
				<dl>
					<dt>방송 속성</dt>
					<dd>
						<br>
						<c:choose>
							<c:when test="${bvo.age_grade_num == 1 }">
								<input type="checkbox" name="frmAdult" id="check1" value="19">	
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="frmAdult" id="check1" value="19" checked="checked">
							</c:otherwise>
						</c:choose>
						
						
						
						<label
							for="check1"><span></span>성인방송 설정</label>
							<br>
						<div class="input_wrap off checkbox btn">
							<c:choose>
								<c:when test="${empty bvo.broadcast_pwd }">
									<input type="checkbox" name="frmAccess" id="check3" value="1">
									<label for="check3"><span></span>패스워드 설정</label> 
									<input type="password" id="content" class="w3-input w3-section" name="frmAccessCode" value="" disabled="disabled" style="width: 600px;">
									<span class="text_count" id="text_count"><em>0</em>/11</span>
								</c:when>
								<c:otherwise>
									<input type="checkbox" name="frmAccess" id="check3" value="1" checked="checked">
									<label for="check3"><span></span>패스워드 설정</label> 
									<input type="password" id="content" class="w3-input w3-section" name="frmAccessCode" value="${bvo.broadcast_pwd }" style="width: 600px;">
									<span class="text_count" id="text_count"><em>0</em>/11</span>
								</c:otherwise>
							</c:choose>
						</div>
					</dd>
				</dl>
			</div>
			<input type="submit" class="w3-button w3-black w3-round-large" value="업데이트">
		</form>
	</div>
</div>
<body>
<script type="text/javascript">
$(function() {
 	var val = $(':radio[name=genre_num]:checked').val();
    if(val == 16){
    	 $("input[name=frmAdult]").attr('checked', true) ;
    }else{
    	$("input[name=frmAdult]").attr('checked', false) ;
    }
	 $("#check3").change(function(){
	        if($("#check3").is(":checked")){
	            $("input[name=frmAccessCode]").attr("disabled",false);
	        }else{
	        	 $("input[name=frmAccessCode]").attr("disabled",true);
	        }
	    });
	 $("input[type=radio][name=genre_num]").change(function(){
		 	var val = $(':radio[name=genre_num]:checked').val();
	        if(val == 16){
	        	 $("input[name=frmAdult]").attr('checked', true) ;
	        }else{
	        	$("input[name=frmAdult]").attr('checked', false) ;
	        }
	    });
	 $('#content').keyup(function (e){
         var content = $(this).val();
         $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
         $('#text_count').html(content.length + '/20');
     });
	 $("form").submit(function(event) {
			if($("input[name='frmAccessCode']").val().length > 20){
				alert("글자수 초과되었습니다");
				$("input[name='frmAccessCode']").val('');
				$("input[name='frmAccessCode']").focus();
				event.preventDefault();
			}
	 });
});

var wsocket;
$(window).on("load", function(e) {
	wsocket = new SockJS("/app/echo.sockjs");
});

$('#target').submit(function() { 
	alert('방송정보 변경이 정상적으로 처리 되었습니다.');
	var title = $("input[name=broadcast_title]").val();
	var pwd = "";
	var adult = $("input[name=frmAdult]").prop('checked');
	var bj_num = ${bvo.m_num};
	var pwdcheck = $("input[name=frmAccess]").prop('checked');
	var sendmsg = {};
	
	if(pwdcheck){
		pwd = $("input[name=frmAccessCode]").val();
	}
	console.log(pwd);
	sendmsg.packet = 5;
	sendmsg.bj_num = bj_num;
	sendmsg.title = title;
	sendmsg.pwd = pwd;
	sendmsg.adult = adult;
	wsocket.send( JSON.stringify(sendmsg));
});

</script>

