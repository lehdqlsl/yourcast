<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/home.css'/>?ver=3">
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>

<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px">
	
		<!-- Header -->
		<header id="portfolio">
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<div class="w3-container">
				<div class="link-2">
				<h1>
					<a href="<c:url value='/${requestScope.id }'/>" class="maintitle">
					<b>${voMP.profile_title }</b></a>
				</h1>
			</div>
				<div class="w3-section w3-bottombar w3-padding-16"  style="width: 1000px;">
				</div>
			</div>
			
		</header>

		<!-- 여기작성 -->
			
		<script type="text/javascript">
			$(function(){
				$("#blacklistI").click(function(){
					var opt = document.createElement("option");
					var option = $("#black").val();
					if(option==null || option==""){
						return false;
					}
					$.ajax({
						url:"<c:url value='/${requestScope.id}/setting/blacklistI'/>",
						data:{"option":option},
						success:function(data){
							if(data==0){
								alert("이미 추가된 아이디입니다.");	
							}else{
								alert(option + "님을 블랙리스트에 추가하였습니다.");	
								$("#listB").append("<option value='" + data + "'>" + option + "</option>");
							}
						},
						error:function(data){
							alert("존재하지 않는 아이디입니다.");	
						}
					});
					$("#black").focus().val("");
				});
				$("#blacklistD").click(function(){
					var opt = document.createElement("option");
					var optionV = $("#listB option:selected").val();
					var optionT = $("#listB option:selected").text();
					if(optionV==null || optionV==""){
						return false;
					}
					$("#listB option:selected").remove();
					$.ajax({
						url:"<c:url value='/${requestScope.id}/setting/blacklistD'/>",
						data:{"option":optionV}
					});
					alert(optionT + "님을 블랙리스트에서 삭제하였습니다.");
					$("#black").focus().val("");
				});
			});				
		</script>
		
		<div>
			<a href="<c:url value='/${requestScope.id}/setting/info'/>" class="w3-bar-item w3-button" style="text-decoration: none;">기본정보관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/category'/>" class="w3-bar-item w3-button" style="text-decoration: none;" >게시판관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/main'/>" class="w3-bar-item w3-button" style="text-decoration: none;">대문관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/fanlist'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">팬 목록</a>
			<a href="<c:url value='/${requestScope.id}/setting/blacklist'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">
			<span style="color: #337AB7; font-weight: bold;">블랙리스트</span></a>
		</div>
		
		<br>
		
		<h2 style="margin-left:30px;">블랙리스트 관리</h2>
		<p style="margin-left:30px;margin-top:-10px;color:#9A9A9A">블랙리스트에 등록된 유저는 자신이 진행하는 방송의 시청이 불가능합니다.</p>
		
		<br>
					
		<div style="margin-left:30px;">
			<input type="text" id="black" class="w3-input w3-section" placeholder="아이디를 입력하세요" style="margin-bottom:15px; width: 400px;">
		</div>	
				
		<select id="listB" name="listB" size="10" style="width:400px;margin-left:30px;margin-bottom:10px;border: 1px solid #CFCFCF;">
			<c:forEach var="voB" items="${listB }">
				<option value="${voB.m_num }">${voB.id }</option>
			</c:forEach>
		</select>
			<div style="margin-bottom:5px;">
			<button type="button" onclick="blackListInsert()" id="blacklistI" name="blacklistI" class="w3-button w3-border w3-round-large" style="background-color: #4C5870;margin-left: 27px;">
			<i class="fa fa-check" style="color: #EBEDEC;"></i><span style="color: white;">&nbsp;추가</span></button>
			<button type="button" onclick="blackListDelete()" id="blacklistD" name="blacklistD" class="w3-button w3-border w3-round-large" style="background-color: #4C5870;">
			<i class="fa fa-trash-o" style="color: #EBEDEC;"></i><span style="color: white;">&nbsp;삭제</span></button>
			</div>

		<!-- 작성END -->

		<footer>
			<div class="w3-light-grey w3-center w3-padding-24"
				style="width: 1000px; font-size: 11px; border-top: 1px solid #CFCFCF; margin-top: 100px; margin-left: 30px;">
				All Contents Copyright ©Your Cast...Co.,Ltd. All Rights Reserved.</div>
		</footer>

	</div>
</body>