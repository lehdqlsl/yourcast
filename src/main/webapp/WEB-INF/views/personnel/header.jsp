<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>

<style>
	a{text-decoration: none;}
	#dropdown-menu{
		margin-top: 30px;
		margin-left: 30px;
		border-radius: 10px 25px 10px 25px;
	}
	#dropdown-menu a{
		padding:10px;
		border-radius: 10px 25px 10px 25px;
		color:black;
		width:160px;
		height:43px;
	}
</style>

<div class="w3-top">
	<div class="w3-bar w3-white w3-wide w3-padding w3-card-2" style="overflow:visible;width:1585px;">
		<a href="<c:url value='/'/>" class="w3-bar-item w3-button" style="text-decoration: none;"><b>Your</b>
			BroadCast...</a>
		<!-- 오른쪽 메뉴 -->
		<div class="w3-right w3-hide-small">
			<c:choose>
				<c:when test="${empty sessionScope.id }">
					<a href="<c:url value='/member/login'/>" class="w3-bar-item w3-button" style="text-decoration: none;">로그인</a>
					<a href="<c:url value='/member/notice/list'/>" class="w3-bar-item w3-button" style="text-decoration: none;">공지사항</a>
				</c:when>
				<c:otherwise>
					<!-- 
					<div class="dropdown">

						<button class="dropdown-toggle" type="button" data-toggle="dropdown">${sessionScope.id }
						<span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/message/recv/list'/>">쪽지</a></li>
							<li><a href="<c:url value='/member/charge/star'/>">별사탕 구매</a></li>
							<li><a href="<c:url value='/member/history/pay'/>">내역 및 환전</a></li>
							<li><a href="<c:url value='/member/broadcast'/>">방송 설정</a></li>
							<li><a href="<c:url value='/member/logout'/>">로그아웃</a></li>
						</ul>
						 
					</div>
					-->
						
					<div class="w3-dropdown-click" >
						<a href="#" class="z w3-bar-item w3-button" onclick="myFunction()" style="text-decoration: none;">${sessionScope.id }</a>
						<div id="dropdown-menu" class="w3-dropdown-content w3-card-4">
							<a href="<c:url value='/${sessionScope.id }'/>" target="_blank" class="h w3-bar-item w3-button"><i class="fa fa-home"></i>&nbsp;Home</a><br>
							<a href="<c:url value='/message/recv/list'/>" style="border-top:1px solid #ccc!important;" class="h w3-bar-item w3-button"><i class="fa fa-envelope"></i>&nbsp;쪽지보관함</a><br>
							<a href="<c:url value='/member/charge/star'/>" class="h w3-bar-item w3-button"><i class="fa fa-krw"></i>&nbsp;별사탕 구매</a><br>
							<a href="<c:url value='/member/history/pay'/>" class="h w3-bar-item w3-button"><i class="fa fa-database "></i>&nbsp;내역 및 환전</a><br>
							<a href="<c:url value='/member/broadcast'/>" class="h w3-bar-item w3-button"><i class="fa fa-video-camera"></i>&nbsp;방송 설정</a><br>
							<a href="<c:url value='/member/join/update'/>" class="h w3-bar-item w3-button"><i class="fa fa-id-card-o" aria-hidden="true"></i>&nbsp;회원 정보</a><br>
							<a href="<c:url value='/member/logout'/>" style="border-top:1px solid #ccc!important;" class="h w3-bar-item w3-button"><i class="fa fa-times"></i>&nbsp;로그아웃</a>
						</div>
					</div> 
					<a href="<c:url value='/member/notice/list'/>" class="w3-bar-item w3-button" style="text-decoration: none;">공지사항</a>

					<script>
						$(function(){
							$(".z").click(function(event){
								event.stopPropagation();
								$("#dropdown-menu").toggleClass(" w3-show");
							});
						});
						 
						$(document).click(function(){
						    $('#dropdown-menu').removeClass(" w3-show");
						});
					</script>
					
					<!-- 
					<a href="<c:url value='/${sessionScope.id }'/>"
						class="w3-bar-item w3-button">${sessionScope.id }</a>
						<a href="<c:url value='/message/recv/list'/>"
						class="w3-bar-item w3-button">쪽지</a>
					<a href="<c:url value='/member/charge/star'/>"
						class="w3-bar-item w3-button">별사탕 구매</a>
					<a href="<c:url value='/member/history/pay'/>"
						class="w3-bar-item w3-button">내역 및 환전</a>
					<a href="<c:url value='/member/broadcast'/>"
						class="w3-bar-item w3-button">방송 설정</a>
					<a href="<c:url value='/member/notice/list'/>"
						class="w3-bar-item w3-button">공지사항</a>
					<a href="<c:url value='/member/logout'/>"
						class="w3-bar-item w3-button">로그아웃</a>
					 -->
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

