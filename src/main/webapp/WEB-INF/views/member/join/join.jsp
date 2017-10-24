<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/join.css'/>?ver=3">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
		$(document).ready(function(){
			$("#id").keyup(function(event){
				var id=$("#id").val();
				$.getJSON("<c:url value='/usingid/json'/>",{"id":id},function(data){
					if(data.using){
						$("#idcheck").html("<font color=red>사용중인 아이디입니다</font>");
					}else{
						$("#idcheck").html("<font color=blue>사용가능한 아이디입니다</font>");
					}
				});
			});
			//var chk=$("input[name='gender']").prop("checked");
			$("form").submit(function(event) {
				if($("input[name='id']").val()==''){
					alert("아이디를 입력하세요");
					$("input[name='id']").focus();
					event.preventDefault();
				}
				else if($("#idcheck").text()=='사용중인 아이디입니다') {
					alert("중복확인을 해주세요");
					event.preventDefault();
				}
				//비밀번호가 5자이상일때 submit되도록 하기
				else if($("input[name='pwd']").val().length < 5) {
					alert("비밀번호를 5자이상 입력하세요!");
					$("input[name='pwd']").focus();
					event.preventDefault();
				}
				//비밀번호와 비밀번호 확인이 같을때 submit 되도록하기
				else if($("input[name='pwd']").val() != $("input[name='pwd1']").val()) {
					alert("비밀번호가 같지않습니다");
					$("input[name='pwd1']").focus();
					event.preventDefault();
				}			
				else if($("input[name='name']").val()=='') {
					alert("이름을 입력하세요");
					$("input[name='name']").focus();
					event.preventDefault();
				}
				else if($("input[name='birth']").val()=='') {
					alert("생년월일을 입력하세요");
					event.preventDefault();
				}
				else if(!($('input[name="gender"]').is(':checked')) ) {
					alert("성별을 입력하세요");
					event.preventDefault();
				}
				else if(!($('input[name="agree"]').is(':checked')) ) {
					alert("이용약관에 동의를 해주세요");
					event.preventDefault();
				}
			});

			$("#datepicker").datepicker({
				showMonthAfterYear: true,
				dateFormat:"yy/mm/dd", //날짜포맷형식
		        prevText: '이전 달',
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				changeMonth:true,
				changeYear:true,
				yearSuffix:" ",
				yearRange: "-100:+0",
				showAnim:"slide"
			});
		});

</script>
<div class="w3-main" style="margin: 60px auto 100px auto; width: 960px;height: 600px;">
<div class="w3-container w3-padding-32" id="projects">

<div class="login">
	<h2>Register</h2>
	<form action="<c:url value='/member/join'/>" method="post" style="margin: auto;">
		<input name='id' placeholder='Id' type='text' id="id" autocomplete=off>
		<span id="idcheck" style="color: red; font-size: 12px"></span><br>
		<input id='pwd' name='pwd' placeholder='Password' type='password'><br>
		<input id='pwd1' name='pwd1' placeholder='Password Confirm'
			type='password'><br> <input name='name' placeholder='Nickname'
			type='text' id="name" autocomplete=off><br> <input type="text"
			id="datepicker" name="birth" placeholder='birth'><br> <br>
		<!-- <input type="text"  placeholder='남1 여2' name="gender"> -->
		<input name="gender" value="1" type="radio" class="gender">남자
		&nbsp;&nbsp; <input name="gender" value="2" type="radio"
			class="gender">여자
		<div class='agree'>
			<input id='agree' name='agree' type='checkbox'> <label
				for='agree'></label><a href="<c:url value='/member/service'/>"
				style="text-decoration: underline;">이용약관</a>에 동의 합니다.
		</div>
		<input class='animated' type='submit' value='Register'> <a
			class='forgot' href="<c:url value='/member/login'/>">Already have
			an account?</a>
	</form>
	</div>
	</div>
</div>