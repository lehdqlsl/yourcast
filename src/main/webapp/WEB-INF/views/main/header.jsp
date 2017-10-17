<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<div class="w3-top">
	<div class="w3-bar w3-white w3-wide w3-padding w3-card-2">
		<a href="<c:url value='/'/>" class="w3-bar-item w3-button"><b>Your</b>
			BroadCast...</a>
		<!-- 오른쪽 메뉴 -->
		<div class="w3-right w3-hide-small">
			<c:choose>
				<c:when test="${empty sessionScope.id }">
					<a href="<c:url value='/member/login'/>"
						class="w3-bar-item w3-button">로그인</a>
				</c:when>
				<c:otherwise>
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
					<a href="<c:url value='/member/logout'/>"
						class="w3-bar-item w3-button">로그아웃</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

