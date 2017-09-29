<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">결제내역</h3>
	</div>
	
	<div>
		<button style="background-color: red;"><a href="<c:url value='/main/history/pay'/>" style="text-decoration: none;">결제내역</a></button>
		<button><a href="<c:url value='/main/history/buy'/>" style="text-decoration: none;">구매내역</a></button>
		<button><a href="<c:url value='/main/history/useStar'/>" style="text-decoration: none;">선물한 별풍선내역</a></button>
		<button><a href="<c:url value='/main/history/recvStar'/>" style="text-decoration: none;">선물받은 별풍선내역</a></button>
	</div>
	
	<table border="1">
		<tr>
			<th>결제수단</th><th>금액</th><th>결재일</th>
		</tr>
		<c:forEach var="pvo" items="${plist }">
			<tr>
				<th>${pvo.p_name }</th>
				<th>${pvo.pay_money }</th>
				<th>${pvo.pay_regdate }</th>
			</tr>
		</c:forEach>
	</table>
	
	<div>${mvo.id }님의 보유중인 금액은 ${mvo.money }원 입니다.</div>
	
	<!-- 페이징 -->
		<div>
		<c:choose>
			<c:when test="${pu.pageNum>1 }">
				<a href="<c:url value='/main/history/pay?pageNum=${1 }'/>">[처음으로]</a>
			</c:when>
			<c:otherwise>
				[처음으로]
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/main/history/pay?pageNum=${pu.startPageNum-1 }'/>">[이전]</a>
			</c:when>
			<c:otherwise>
				[이전]
			</c:otherwise>
		</c:choose>
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<span style="color:blue">[${i }]</span>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/main/history/pay?pageNum=${i }'/>"><span style="color:#555">[${i }]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<a href="<c:url value='/main/history/pay?pageNum=${pu.endPageNum+1 }'/>">[다음]</a>
			</c:when>
			<c:otherwise>
				[다음]
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pu.startPageNum<pu.totalPageCount }">
				<a href="<c:url value='/main/history/pay?pageNum=${pu.totalPageCount }'/>">[끝으로]</a>
			</c:when>
			<c:otherwise>
				[끝으로]
			</c:otherwise>
		</c:choose>
		</div>
	
	
</div>

