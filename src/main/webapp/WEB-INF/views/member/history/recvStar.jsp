<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.stit {
    font-size: 12px;
    color: #777;
    font-family: dotum, 돋움;
    font-weight: normal;
    margin-left: 10px;
    background: url(//res.afreecatv.com/images/item/bar_gry.gif) 0 1px no-repeat;
    padding-left: 7px;
}
.cg {
    position: absolute;
    top:2px;
    right: 0;
}
.section1 {
    margin-bottom: 30px;
    position: relative;
}
em {
    font-style: normal;
    color: #f8003f;
}


</style>
<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;">
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">선물받은 별풍선내역</h3>
	</div>
	
	<div>
		<a href="<c:url value='/member/history/pay'/>" class="w3-bar-item w3-button" style="text-decoration: none;">결제내역</a>
		<a href="<c:url value='/member/history/buy'/>" class="w3-bar-item w3-button" style="text-decoration: none;" >구매내역</a>
		<a href="<c:url value='/member/history/useStar'/>" class="w3-bar-item w3-button" style="text-decoration: none;">선물한 별풍선내역</a>
		<a href="<c:url value='/member/history/recvStar'/>"class="w3-bar-item w3-button"  style="text-decoration: none;background-color: #cccccc;">선물받은 별풍선내역</a>
	</div>
	<hr>
	<div class="section1">
	<!-- 선물받은 별풍선내역 -->
	<h5><b>별풍선 내역</b></h5>
	<table class="w3-table w3-table-all">
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
		<c:if test="${err!=null }">
			<tr>
				<th colspan="3" style="text-align:center;vertical-align: middle;height:200px;">${err }</th>
			</tr>
		</c:if>
	</table>
	


	
	<!-- 선물받은 별풍선 페이징 -->
	<div class="w3-bar-all w3-center" id="pageR">
		<span id="preRecv"><a href="#" class="w3-bar-item w3-button w3-hover-black">이전</a></span>
		
		<span id="pagingRecv">
		
				<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
					<a href="#" class="pagingR w3-bar-item w3-button w3-hover-black"><span>${i }</span></a>
				</c:forEach>
			
		</span>
		
		<span id="nextRecv"><a href="#" class="w3-bar-item w3-button w3-hover-black">다음</a></span>
	</div>
	</div>
	
	<div class="section1">
	<h5><b>별풍선 환전하기</b><span class="stit">별풍선 보유현황 확인 및 별풍선 환전 신청을 하실 수 있습니다</span></h5>
	<div>
	<span style="color:#0089cf">${sessionScope.id }</span>님이 보유하신 환전 가능 별풍선은 <em><b>${mvo.star_candy }</b></em>개 입니다</div>
		
	<div>
	선물받은 누적 별풍선 : <b>${total_recv_ea }개</b>
	</div>
	<div><br><button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-left:420px;" id="exchange"><span style="color: #0072ff">환전신청하기</span></button></div>
	</div>
	<!-- 환전내역 리스트 -->
	<div class="section1">
	<div>
	<h5><b>별풍선 환전처리 결과</b></h5>
	<span class="cg">(누적 환전 총액 : <em>${total_ex_money }원</em>)</span>
	</div>
	<table class="w3-table w3-table-all">
	<thead>
	<tr>
		<th>환전수량</th><th>환전수수료</th><th>환전금액</th><th>환전날짜</th>
	</tr>
	</thead>
	<tbody id="exlistB">
	<c:forEach var="exvo" items="${exlist }">
		<tr>
			<th>${exvo.e_ea }</th>
			<th>${exvo.e_fee }%</th>
			<th>${exvo.e_money }원</th>
			<th>${exvo.e_regdate }</th>
		</tr>
	</c:forEach>
	</tbody>
	<c:if test="${errr!=null }">
		<tr>
			<th colspan="4" style="text-align:center;vertical-align: middle;height:200px;">${errr }</th>
		</tr>
	</c:if>
	</table>
	
	<div class="w3-bar-all w3-center" id="pageX">
		<span id="preEx"><a href="#" class="w3-bar-item w3-button w3-hover-black">이전</a></span>
		
		<span id="pagingEx">

		<c:forEach var="i" begin="${puEx.startPageNum }" end="${puEx.endPageNum }">
			<a href="#" class="pagingE w3-bar-item w3-button w3-hover-black">${i }</a>
		</c:forEach>
			
		</span>
		
		<span id="nextEx"><a href="#" class="w3-bar-item w3-button w3-hover-black">다음</a></span>
	</div>
	</div>
	
	<c:if test="${err!=null }">
		<script type="text/javascript">
			$(function(){
				$("#pageX").css("margin-left","400px");
			});
		</script>
	</c:if>

	<br>
		
</div>

<!-- 선물받은 별풍선 페이징 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$("#exchange").click(function(){
				var cnt = '${mvo.star_candy }';
				
				if(parseInt(cnt) < 500){
					alert("별풍선 500개 이상이어야 별풍선 환전 신청이 가능합니다.")
				}else{
					var ch = confirm('별풍선 ' +parseInt(cnt)+'개를 환전 신청하시겠습니까?');
					if(ch){
						location.href="<c:url value='/member/history/exchange'/>"
						alert("환전 신청이 정상적으로 이루어졌습니다.");
					}
				}
			});
			
			$(".pagingR").filter(':first').css('color','red');
			$("#preRecv a").on('click',function(){
				var pageNum = parseInt($(".pagingR").filter(':first').text()) - 5;
				if(pageNum<1){
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
							$("<a href='#' class='pagingR w3-bar-item w3-button w3-hover-black'>" + i + "</a>").appendTo("#pagingRecv").on('click',function(){
								var pageNum1 = $(this).text();
			
								$("#recvlistB").empty();
								$(".pagingR").removeAttr('style');
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
							$("<a href='#' class='pagingR w3-bar-item w3-button w3-hover-black'>" + i + "</a>&nbsp;").appendTo("#pagingRecv").on('click',function(){
								var pageNum1 = $(this).text();
					
								$("#recvlistB").empty();
								$(".pagingR").removeAttr('style');
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
				var pageNum = parseInt($(".pagingE").filter(':first').text()) - 5;
				if(pageNum<1){
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
							$("#exlistB").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "%</th><th>" + parseInt(sum) + "원</th><th>" + e_regdate + "</th></tr>");						
						});
					}
				});
				$("#pagingEx").empty();
				$.ajax({
					url:"<c:url value='/member/history/exStarPagingPre'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						for(var i=data-4;i<=data;i++){
							$("<a href='#' class='pagingE w3-bar-item w3-button w3-hover-black'>" + i + "</a>").appendTo("#pagingEx").on('click',function(){
								var pageNum1 = $(this).text();
								$("#exlistB").empty();
								$(".pagingE").removeAttr('style');
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
											$("#exlistB").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "%</th><th>" + parseInt(sum) + "원</th><th>" + e_regdate + "</th></tr>");						
										});
									}
								});
							});
						}
						$(".pagingE").filter(':first').css('color','red');
					}
				});
			});
			$(".pagingE").on('click',function(){
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
							$("#exlistB").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "%</th><th>" + parseInt(sum) + "원</th><th>" + e_regdate + "</th></tr>");						
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
							$("#exlistB").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "%</th><th>" + parseInt(sum) + "원</th><th>" + e_regdate + "</th></tr>");						
						});
					}
				});
				$("#pagingEx").empty();
				$.ajax({
					url:"<c:url value='/member/history/exStarPagingNext'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						for(var i=pageNum;i<=data;i++){
							$("<a href='#' class='pagingE w3-bar-item w3-button w3-hover-black'>" + i + "</a>&nbsp;").appendTo("#pagingEx").on('click',function(){
								var pageNum1 = $(this).text();
								$("#exlistB").empty();
								$(".pagingE").removeAttr('style');
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
											$("#exlistB").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "%</th><th>" + parseInt(sum) + "원</th><th>" + e_regdate + "</th></tr>");						
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