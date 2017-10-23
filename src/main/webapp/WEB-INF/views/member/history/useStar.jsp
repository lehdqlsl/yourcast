<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;">
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">선물한 별풍선내역</h3>
	</div>
	
	<div>
		<a href="<c:url value='/member/history/pay'/>" class="w3-bar-item w3-button" style="text-decoration: none;">결제내역</a>
		<a href="<c:url value='/member/history/buy'/>" class="w3-bar-item w3-button" style="text-decoration: none;" >구매내역</a>
		<a href="<c:url value='/member/history/useStar'/>" class="w3-bar-item w3-button" style="text-decoration: none;background-color: #cccccc;">선물한 별풍선내역</a>
		<a href="<c:url value='/member/history/recvStar'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">선물받은 별풍선내역</a>
	</div>
		<hr>
	<table class="w3-table w3-table-all">
		<tr>
			<th>선물한 별풍선</th><th>BJ아이디</th><th>사용일</th>
		</tr>
		<c:forEach var="uvo" items="${uselist }">
			<tr>
				<th>${uvo.use_ea }개</th>
				<th>${uvo.id }</th>
				<th>${uvo.use_regdate }</th>
			</tr>
		</c:forEach>
		<c:if test="${err!=null }">
			<tr>
				<th colspan="3" style="text-align:center;vertical-align: middle;height:200px;">${err }</th>
			</tr>
		</c:if>
	</table>
	
	<script type="text/javascript">
		$(function(){
			function numberWithCommas(x) {
				return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			$("#sc").text(numberWithCommas("${mvo.star_candy }"));
			$("#t_ea").text(numberWithCommas("${total_send_ea }"));
		});
	</script>
	
	<div>보유중인 별풍선 : <b id="sc" style="color:red;"></b>개</div>
	<div>이미 사용한 별풍선 : <b id="t_ea"></b>개</div>
	
	<br>
	
	<!-- 페이징 -->
		<div class="w3-bar-all w3-center" id="page">
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/member/history/useStar?pageNum=${pu.startPageNum-1 }'/>" class="w3-bar-item w3-button w3-hover-black">이전</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">이전</a>
			</c:otherwise>
		</c:choose>
		<c:if test="${err!=null }">
			<a href="#" class="w3-bar-item w3-button w3-hover-black"><span style="color: red">1</span></a>
		</c:if>
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<a href="#" class="w3-bar-item w3-button w3-hover-black"><span style="color: red">${i }</span></a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/member/history/useStar?pageNum=${i }'/>" class="w3-bar-item w3-button w3-hover-black"><span>${i }</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<a href="<c:url value='/member/history/useStar?pageNum=${pu.endPageNum+1 }'/>" class="w3-bar-item w3-button w3-hover-black">다음</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">다음</a>
			</c:otherwise>
		</c:choose>
		</div>
		
		<br>
		
</div>

