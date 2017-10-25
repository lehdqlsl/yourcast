<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/login.css'/>?ver=3">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;height: 500px;">
<div class="w3-container w3-padding-32" id="projects">
<script type="text/javascript">
$(document).ready(function() {
	$("#name").keyup(function(event){
		var name=$("#name").val();
		$.getJSON("<c:url value='/usingname/json'/>",{"name":name},function(data){
			if(data.user){
				$("#nickcheck").html("<font color=red>사용중인 닉네임입니다</font>");
			}else{
				$("#nickcheck").html("<font color=blue>사용가능한 닉네임입니다</font>");
			}
		});
	});
	$("form").submit(function(event) {
		if($("input[name='pwd']").val() != $("input[name='pwd1']").val()) {
			alert("비밀번호가 같지 않습니다");
			$("input[name='pwd']").focus();
			event.preventDefault();
		}
		else if($("#nickcheck").text()=='사용중인 닉네임입니다') {
			alert("중복확인을 해주세요");
			event.preventDefault();
		}
	});
});
</script>
<div class="login">
<h2>Information</h2>
<form method="post" action="<c:url value='/member/join/update'/>">
	<input name='id' placeholder='아이디' type='text' value="${vo.id }"  readonly="readonly" autocomplete=off><br>
	<input id='pw' name='pwd' placeholder='비밀번호' type='password' ><br>
	<input id='pwd1' name='pwd1' placeholder='비밀번호 확인' type='password'><br>
	<div id="errMsg" style="font-size: small;color: red;"></div>
	<input id="name" name="name" placeholder='닉네임' type="text" value="${vo.name }" autocomplete=off>
	<span id="nickcheck" style="color: red; font-size: 12px"></span><br>
	<input class='animated' type='submit' value='수정' style="margin-top: 20px;">
</form>
</div>
</div>
</div>
