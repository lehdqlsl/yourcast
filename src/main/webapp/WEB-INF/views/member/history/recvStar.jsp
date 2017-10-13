<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;">
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">선물받은 별사탕내역</h3>
	</div>
	
	<div>
		<a href="<c:url value='/member/history/pay'/>" class="w3-bar-item w3-button" style="text-decoration: none;">결제내역</a>
		<a href="<c:url value='/member/history/buy'/>" class="w3-bar-item w3-button" style="text-decoration: none;" >구매내역</a>
		<a href="<c:url value='/member/history/useStar'/>" class="w3-bar-item w3-button" style="text-decoration: none;">선물한 별사탕내역</a>
		<a href="<c:url value='/member/history/recvStar'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">선물받은 별사탕내역</a>
	</div>
	
	<!-- 선물받은 별풍선내역 -->
	<table class="w3-table w3-table-all">
		<thead>
		<tr>
			<th>선물받은 별사탕</th><th>회원아이디</th><th>받은 날짜</th>
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
	
	<div>보유중인 별사탕 : ${mvo.star_candy }</div>
	<div>선물받은 별사탕 : ${total_recv_ea }</div>
	
	<!-- 선물받은 별사탕 페이징 -->
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

<!-- 선물받은 별풍선 페이징 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$(".pagingR").filter(':first').css('color','red');
			$("#preRecv a").on('click',function(){
				var pageNum = parseInt($(".pagingR").filter(':first').text()) - 1;
				if(pageNum<5){
					return false;
				}
				$("#recvlistB").empty();
				$.ajax({
					url:"<c:url value='/member/history/recvStarPaging'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						$(data).find("recvlist").each(function(){
							var use_ea = $(this).find("use_ea").text();
							var id = $(this).find("id").text();
							var use_regdate = $(this).find("use_regdate").text();
							$("#recvlistB").append("<tr><th>" + use_ea + "</th><th>" + id + "</th><th>" + use_regdate + "</th></tr>");						
						});
					}
				});
				$("#pagingRecv").empty();
				$.ajax({
					url:"<c:url value='/member/history/recvStarPagingPre'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						for(var i=data-4;i<=data;i++){
							$("<a href='#' class='pagingR'>" + i + "</a>").appendTo("#pagingRecv").css('margin','4px').on('click',function(){
								var pageNum1 = $(this).text();
								$("#recvlistB").empty();
								$(".pagingR").removeAttr('style');
								$(".pagingR").css('margin','5px')
								$(this).css('color','red');
								$.ajax({
									url:"<c:url value='/member/history/recvStarPaging'/>",
									data:{"pageNum":pageNum},
									success:function(data){
										$(data).find("recvlist").each(function(){
											var use_ea = $(this).find("use_ea").text();
											var id = $(this).find("id").text();
											var use_regdate = $(this).find("use_regdate").text();
											$("#recvlistB").append("<tr><th>" + use_ea + "</th><th>" + id + "</th><th>" + use_regdate + "</th></tr>");						
										});
									}
								});
							});
						}
						$(".pagingR").filter(':first').css('color','red');
					}
				});
			});
			$(".pagingR").on('click',function move(){
				var pageNum = $(this).text();
				$("#recvlistB").empty();
				$(".pagingR").removeAttr('style');
				$(this).css('color','red');
				$.ajax({
					url:"<c:url value='/member/history/recvStarPaging'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						$(data).find("recvlist").each(function(){
							var use_ea = $(this).find("use_ea").text();
							var id = $(this).find("id").text();
							var use_regdate = $(this).find("use_regdate").text();		
							$("#recvlistB").append("<tr><th>" + use_ea + "</th><th>" + id + "</th><th>" + use_regdate + "</th></tr>");						
						});
					}
				});
			});
			$("#nextRecv a").on('click',function(){
				var pageNum = parseInt($(".pagingR").filter(':last').text()) + 1;
				if((pageNum-1)%5!=0){
					return false;
				}
				$("#recvlistB").empty();
				$.ajax({
					url:"<c:url value='/member/history/recvStarPaging'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						$(data).find("recvlist").each(function(){
							var use_ea = $(this).find("use_ea").text();
							var id = $(this).find("id").text();
							var use_regdate = $(this).find("use_regdate").text();
							$("#recvlistB").append("<tr><th>" + use_ea + "</th><th>" + id + "</th><th>" + use_regdate + "</th></tr>");						
						});
					}
				});
				$("#pagingRecv").empty();
				$.ajax({
					url:"<c:url value='/member/history/recvStarPagingNext'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						for(var i=pageNum;i<=data;i++){
							$("<a href='#' class='pagingR'>" + i + "</a>&nbsp;").appendTo("#pagingRecv").css('margin','4px').on('click',function(){
								var pageNum1 = $(this).text();
								$("#recvlistB").empty();
								$(".pagingR").removeAttr('style');
								$(".pagingR").css('margin','5px')
								$(this).css('color','red');
								$.ajax({
									url:"<c:url value='/member/history/recvStarPaging'/>",
									data:{"pageNum":pageNum1},
									success:function(data){
										$(data).find("recvlist").each(function(){
											var use_ea = $(this).find("use_ea").text();
											var id = $(this).find("id").text();
											var use_regdate = $(this).find("use_regdate").text();
											$("#recvlistB").append("<tr><th>" + use_ea + "</th><th>" + id + "</th><th>" + use_regdate + "</th></tr>");						
										});
									}
								});
							});
						}
						$(".pagingR").filter(':first').css('color','red');
					}
				});
			});
		});		
	</script>
	
	<!-- 환전내역 페이징 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$(".pagingE").filter(':first').css('color','red');
			$("#preEx a").on('click',function(){
				var pageNum = parseInt($(".pagingE").filter(':first').text()) - 1;
				if(pageNum<5){
					return false;
				}
				$("#exlistB").empty();
				$.ajax({
					url:"<c:url value='/member/history/exStarPaging'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						$(data).find("exlist").each(function(){
							var e_ea = $(this).find("e_ea").text();
							var e_fee = $(this).find("e_fee").text();
							var sum = parseFloat(e_ea)*parseFloat(e_fee);
							var e_regdate = $(this).find("e_regdate").text();
							$("#exlistT").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "</th><th>" + parseInt(sum) + "</th><th>" + e_regdate + "</th></tr>");						
						});
					}
				});
				$("#pagingEx").empty();
				$.ajax({
					url:"<c:url value='/member/history/exStarPagingPre'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						for(var i=data-4;i<=data;i++){
							$("<a href='#' class='pagingE'>" + i + "</a>").appendTo("#pagingEx").css('margin','4px').on('click',function(){
								var pageNum1 = $(this).text();
								$("#exlistB").empty();
								$(".pagingE").removeAttr('style');
								$(".pagingE").css('margin','5px')
								$(this).css('color','red');
								$.ajax({
									url:"<c:url value='/member/history/exStarPaging'/>",
									data:{"pageNum":pageNum},
									success:function(data){
										$(data).find("exlist").each(function(){
											var e_ea = $(this).find("e_ea").text();
											var e_fee = $(this).find("e_fee").text();
											var sum = parseFloat(e_ea)*parseFloat(e_fee);
											var e_regdate = $(this).find("e_regdate").text();
											$("#exlistT").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "</th><th>" + parseInt(sum) + "</th><th>" + e_regdate + "</th></tr>");						
										});
									}
								});
							});
						}
						$(".pagingE").filter(':first').css('color','red');
					}
				});
			});
			$(".pagingE").on('click',function move(){
				var pageNum = $(this).text();
				$("#exlistB").empty();
				$(".pagingE").removeAttr('style');
				$(this).css('color','red');
				$.ajax({
					url:"<c:url value='/member/history/exStarPaging'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						$(data).find("exlist").each(function(){
							var e_ea = $(this).find("e_ea").text();
							var e_fee = $(this).find("e_fee").text();
							var sum = parseFloat(e_ea)*parseFloat(e_fee);
							var e_regdate = $(this).find("e_regdate").text();
							$("#exlistT").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "</th><th>" + parseInt(sum) + "</th><th>" + e_regdate + "</th></tr>");						
						});
					}
				});
			});
			$("#nextEx a").on('click',function(){
				var pageNum = parseInt($(".pagingE").filter(':last').text()) + 1;
				if((pageNum-1)%5!=0){
					return false;
				}
				$("#exlistB").empty();
				$.ajax({
					url:"<c:url value='/member/history/exStarPaging'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						$(data).find("exlist").each(function(){
							var e_ea = $(this).find("e_ea").text();
							var e_fee = $(this).find("e_fee").text();
							var sum = parseFloat(e_ea)*parseFloat(e_fee);
							var e_regdate = $(this).find("e_regdate").text();
							$("#exlistT").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "</th><th>" + parseInt(sum) + "</th><th>" + e_regdate + "</th></tr>");						
						});
					}
				});
				$("#pagingEx").empty();
				$.ajax({
					url:"<c:url value='/member/history/exStarPagingNext'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						for(var i=pageNum;i<=data;i++){
							$("<a href='#' class='pagingE'>" + i + "</a>&nbsp;").appendTo("#pagingEx").css('margin','4px').on('click',function(){
								var pageNum1 = $(this).text();
								$("#exlistB").empty();
								$(".pagingE").removeAttr('style');
								$(".pagingE").css('margin','5px')
								$(this).css('color','red');
								$.ajax({
									url:"<c:url value='/member/history/exStarPaging'/>",
									data:{"pageNum":pageNum1},
									success:function(data){
										$(data).find("exlist").each(function(){
											var e_ea = $(this).find("e_ea").text();
											var e_fee = $(this).find("e_fee").text();
											var sum = parseFloat(e_ea)*parseFloat(e_fee);
											var e_regdate = $(this).find("e_regdate").text();
											$("#exlistT").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "</th><th>" + parseInt(sum) + "</th><th>" + e_regdate + "</th></tr>");						
										});
									}
								});
							});
						}
						$(".pagingE").filter(':first').css('color','red');
					}
				});
			});
		});		
	</script>