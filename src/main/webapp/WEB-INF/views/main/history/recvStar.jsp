<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">선물받은 별풍선내역</h3>
	</div>
	
	<div>
		<button><a href="<c:url value='/main/history/pay'/>" style="text-decoration: none;">결제내역</a></button>
		<button><a href="<c:url value='/main/history/buy'/>" style="text-decoration: none;">구매내역</a></button>
		<button><a href="<c:url value='/main/history/useStar'/>" style="text-decoration: none;">선물한 별풍선내역</a></button>
		<button style="background-color: red;"><a href="<c:url value='/main/history/recvStar'/>" style="text-decoration: none;">선물받은 별풍선내역</a></button>
	</div>
	
	<!-- 선물받은 별풍선내역 -->
	<table border="1" id="recvlistT">
		<thead>
		<tr>
			<th>선물받은 별풍선</th><th>회원아이디</th><th>받은 날짜</th>
		</tr>
		</thead>
		<tbody id="recvlistB">
		<c:forEach var="rvo" items="${recvlist }">
			<tr>
				<th>${rvo.use_ea }</th>
				<th>${rvo.id }</th>
				<th>${rvo.use_regdate }</th>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div>보유중인 별풍선 : ${mvo.star_candy }</div>
	<div>선물받은 별풍선 : ${total_recv_ea }</div>
	
	<!-- 선물받은 별풍선 페이징 -->
	<div>
		<span id="preRecv"><a href="#">[이전]</a></span>
		
		<span id="pagingRecv">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<a href="#" class="pagingR">${i }</a>
		</c:forEach>
		</span>
		
		<span id="nextRecv"><a href="#">[다음]</a></span>
	</div>
	
	<div><input type="button" value="환전하기"></div>
		
	<!-- 환전내역 리스트 -->
	<table border="1" id="exlistT">
	<thead>
	<tr>
		<th>환전수량</th><th>환전수수료</th><th>환전금액</th><th>환전날짜</th>
	</tr>
	</thead>
	<tbody id="exlistB">
	<c:forEach var="exvo" items="${exlist }">
		<tr>
			<th>${exvo.e_ea }</th>
			<th>${exvo.e_fee }</th>
			<th>${exvo.e_money }</th>
			<th>${exvo.e_regdate }</th>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	
	<div>환전수량 : ${total_ex_ea }</div>
	<div>환전금액 : ${total_ex_money }</div>
	
	<!-- 환전내역 페이징 -->
	<div>
		<span id="preEx"><a href="#">[이전]</a></span>
		
		<span id="pagingEx">
		<c:forEach var="i" begin="${puEx.startPageNum }" end="${puEx.endPageNum }">
			<a href="#" class="pagingE">${i }</a>
		</c:forEach>
		</span>
		
		<span id="nextEx"><a href="#">[다음]</a></span>
	</div>
		
</div>

</body>