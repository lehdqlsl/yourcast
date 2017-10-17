<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;">
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">구매내역</h3>
	</div>
	
	<div>
		<a href="<c:url value='/member/history/pay'/>" class="w3-bar-item w3-button" style="text-decoration: none;">결제내역</a>
		<a href="<c:url value='/member/history/buy'/>" class="w3-bar-item w3-button" style="text-decoration: none;" >구매내역</a>
		<a href="<c:url value='/member/history/useStar'/>" class="w3-bar-item w3-button" style="text-decoration: none;">선물한 별사탕내역</a>
		<a href="<c:url value='/member/history/recvStar'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">선물받은 별사탕내역</a>
	</div>
	
	<table class="w3-table w3-table-all">
		<tr>
			<th>구매한 별사탕</th>
			<th>가격</th>
			<th>구매일</th>
		</tr>
		<c:forEach var="bvo" items="${buylist }">
			<tr>
				<th>${bvo.buy_ea }</th>
				<th>${bvo.buy_ea*100 }</th>
				<th>${bvo.buy_regdate }</th>
			</tr>
		</c:forEach>
		<c:if test="${err!=null }">
			<tr>
				<th colspan="3" style="text-align:center;vertical-align: middle;height:200px;">${err }</th>
			</tr>
		</c:if>
	</table>

	<div>보유중인 별사탕 : ${mvo.star_candy }</div>
	<div>${mvo.id }님의 보유중인 금액은 ${mvo.money }원 입니다.</div>
	
	<br>
	
	<c:if test="${err!=null }">
		<script type="text/javascript">
			$(function(){
				$("#page").css("margin-left","350px");
			});
		</script>
	</c:if>
	
	<!-- 페이징 -->
		<div class="w3-bar" id="page" style="margin-left:270px;">
		<c:choose>
			<c:when test="${pu.pageNum>1 }">
				<a href="<c:url value='/member/history/buy?pageNum=${1 }'/>" class="w3-bar-item w3-button w3-hover-black">«</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/member/history/buy?pageNum=${pu.startPageNum-1 }'/>" class="w3-bar-item w3-button w3-hover-black">이전</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">이전</a>
			</c:otherwise>
		</c:choose>
		<c:if test="${err!=null }">
			<a href="#" class="w3-bar-item w3-black w3-button">1</a>
		</c:if>
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<a href="#" class="w3-bar-item w3-black w3-button">${i }</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/member/history/buy?pageNum=${i }'/>" class="w3-bar-item w3-button w3-hover-black">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<a href="<c:url value='/member/history/buy?pageNum=${pu.endPageNum+1 }'/>" class="w3-bar-item w3-button w3-hover-black">다음</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">다음</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pu.startPageNum<pu.totalPageCount }">
				<a href="<c:url value='/member/history/buy?pageNum=${pu.totalPageCount }'/>" class="w3-bar-item w3-button w3-hover-black">»</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
			</c:otherwise>
		</c:choose>
		</div>
		
		<br>
		
</div>

