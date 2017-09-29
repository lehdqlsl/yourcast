<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">선물한 별풍선내역</h3>
	</div>
	
	<div>
		<button><a href="<c:url value='/main/history/pay'/>" style="text-decoration: none;">결제내역</a></button>
		<button><a href="<c:url value='/main/history/buy'/>" style="text-decoration: none;">구매내역</a></button>
		<button style="background-color: red;"><a href="<c:url value='/main/history/useStar'/>" style="text-decoration: none;">선물한 별풍선내역</a></button>
		<button><a href="<c:url value='/main/history/recvStar'/>" style="text-decoration: none;">선물받은 별풍선내역</a></button>
	</div>
	
	<table border="1">
		<tr>
			<th>선물한 별풍선</th><th>BJ아이디</th><th>사용일</th>
		</tr>
		<c:forEach var="uvo" items="${uselist }">
			<tr>
				<th>${uvo.use_ea }</th>
				<th>${uvo.id }</th>
				<th>${uvo.use_regdate }</th>
			</tr>
		</c:forEach>
	</table>
	
	<div>이미 사용한 별풍선 : ${total_send_ea }</div>
	<div>보유중인 별풍선 : ${mvo.star_candy }</div>
	
	<!-- 페이징 -->
		<div>
		<c:choose>
			<c:when test="${pu.pageNum>1 }">
				<a href="<c:url value='/main/history/useStar?pageNum=${1 }'/>">[처음으로]</a>
			</c:when>
			<c:otherwise>
				[처음으로]
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/main/history/useStar?pageNum=${pu.startPageNum-1 }'/>">[이전]</a>
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
						<a href="<c:url value='/main/history/useStar?pageNum=${i }'/>"><span style="color:#555">[${i }]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<a href="<c:url value='/main/history/useStar?pageNum=${pu.endPageNum+1 }'/>">[다음]</a>
			</c:when>
			<c:otherwise>
				[다음]
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pu.startPageNum<pu.totalPageCount }">
				<a href="<c:url value='/main/history/useStar?pageNum=${pu.totalPageCount }'/>">[끝으로]</a>
			</c:when>
			<c:otherwise>
				[끝으로]
			</c:otherwise>
		</c:choose>
		</div>
		
</div>

