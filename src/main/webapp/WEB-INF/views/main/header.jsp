<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="w3-top">
	<div class="w3-bar w3-white w3-wide w3-padding w3-card-2" style="overflow:visible;">
		<a href="<c:url value='/'/>" class="w3-bar-item w3-button"><b>Your</b>
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
						
					<div class="dropdown" >
						<a href="#" class="dropdown-toggle w3-bar-item w3-button" data-toggle="dropdown" style="text-decoration: none;">${sessionScope.id }</a>
						<ul class="dropdown-menu" style="margin-top:30px;margin-left:20px;">
							<li style="margin-bottom:5px;"><a href="<c:url value='/${sessionScope.id }'/>"><i class="fa fa-home"></i>&nbsp;Home</a></li>
							<li style="border-top:1px solid #ccc!important;margin-top:5px;"><a href="<c:url value='/message/recv/list'/>"><i class="fa fa-envelope"></i>&nbsp;쪽지보관함</a></li>
							<li><a href="<c:url value='/member/charge/star'/>"><i class="fa fa-krw"></i>&nbsp;별사탕 구매</a></li>
							<li><a href="<c:url value='/member/history/pay'/>"><i class="fa fa-database "></i>&nbsp;내역 및 환전</a></li>
							<li><a href="<c:url value='/member/broadcast'/>"><i class="fa fa-video-camera"></i>&nbsp;방송 설정</a></li>
							<li style="border-top:1px solid #ccc!important;"><a href="<c:url value='/member/logout'/>"><i class="fa fa-times"></i>&nbsp;로그아웃</a></li>
						</ul>
						<a href="<c:url value='/member/notice/list'/>" class="w3-bar-item w3-button" style="text-decoration: none;">공지사항</a>
					</div> 
					
					<!-- 
					<a href="<c:url value='/${sessionScope.id }'/>"
						class="w3-bar-item w3-button">${sessionScope.id }</a>
						<a href="<c:url value='/message/recv/list'/>"
						class="w3-bar-item w3-button">쪽지</a>
					<a href="<c:url value='/member/charge/star'/>"
						class="w3-bar-item w3-button">별풍선 구매</a>
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

