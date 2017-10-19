<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/login.css'/>?ver=2">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감
    var userInputId = getCookie("userInputId");
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면
        $("#agree").attr("checked", true); // ID 저장하기를 체크 상태로 두기
    }
     
    $("#agree").change(function(){ // 체크박스에 변화가 있다면
        if($("#agree").is(":checked")){ // ID 저장하기 체크했을 때
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때
        if($("#agree").is(":checked")){ // ID 저장하기를 체크한 상태라면
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 //쿠키 관련 함수 정의 부분
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>
<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;height: 500px;">
<div class="w3-container w3-padding-32" id="projects">

<div class="login">
<h2>LOGIN</h2>
<form method="post" action="<c:url value='/member/login'/>">
	<input name='id' placeholder='Id' type='text' autocomplete=off><br>
	<input id='pw' placeholder='Password' type='password' name='pwd'>
	<div id="errMsg" style="font-size: small;color: red;">${requestScope.errMsg}</div>
	<div class='agree'>
		<input id='agree' name='agree' type='checkbox'>
		<label for='agree'></label> ID저장
	</div> 
	<input class='animated' type='submit' value='login'>
	<a class='forgot' href="<c:url value='/member/join'/>">회원가입</a>
</form>
</div>
</div>
</div>
