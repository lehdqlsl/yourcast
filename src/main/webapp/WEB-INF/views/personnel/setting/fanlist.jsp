<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
	
<!-- 
	<script type="text/javascript">
			$(function(){
				$(".base").filter(':first').css('color','red');
				$("#pre a").on('click',function(){
					var pageNum = parseInt($(".base").filter(':first').text()) - 1;
					if(pageNum<6){
						return false;
					}
					$("tbody").empty();
					$.ajax({
						url:"<c:url value='/${requestScope.id}/setting/page'/>",
						data:{"pageNum":pageNum},
						success:function(data){
							$(data).find("list").each(function(){
								var fan_num = $(this).find("fan_num").text();
								var id = $(this).find("id").text();
								var name = $(this).find("name").text();
								var cnt = $(this).find("cnt").text();
								$("#fanlist").append("<tr class='fantr'><th>" + fan_num + "</th><th>" + id + "</th><th>" + name + "</th><th>" + cnt + "</th></tr>");						
							});
						}
					});
					$("#baseB").empty();
					$.ajax({
						url:"<c:url value='/${requestScope.id}/setting/pagePre'/>",
						data:{"pageNum":pageNum},
						success:function(data){
							for(var i=data-4;i<=data;i++){
								$("<a href='#' class='base'>" + i + "</a>").appendTo("#baseB").css('margin','4px').on('click',function(){
									var pageNum1 = $(this).text();
									$("tbody").empty();
									$(".base").removeAttr('style');
									$(".base").css('margin','5px')
									$(this).css('color','red');
									$.ajax({
										url:"<c:url value='/${requestScope.id}/setting/page'/>",
										data:{"pageNum":pageNum1},
										success:function(data){
											$(data).find("list").each(function(){
												var fan_num = $(this).find("fan_num").text();
												var id = $(this).find("id").text();
												var name = $(this).find("name").text();
												var cnt = $(this).find("cnt").text();
												$("#fanlist").append("<tr class='fantr'><th>" + fan_num + "</th><th>" + id + "</th><th>" + name + "</th><th>" + cnt + "</th></tr>");						
											});
										}
									});
								});
							}
							$(".base").filter(':first').css('color','red');
						}
					});
				});
				$(".base").on('click',function move(){
					var pageNum = $(this).text();
					$("tbody").empty();
					$(".base").removeAttr('style');
					$(this).css('color','red');
					$.ajax({
						url:"<c:url value='/${requestScope.id}/setting/page'/>",
						data:{"pageNum":pageNum},
						success:function(data){
							$(data).find("list").each(function(){
								var fan_num = $(this).find("fan_num").text();
								var id = $(this).find("id").text();
								var name = $(this).find("name").text();
								var cnt = $(this).find("cnt").text();
								$("#fanlist").append("<tr class='fantr'><th>" + fan_num + "</th><th>" + id + "</th><th>" + name + "</th><th>" + cnt + "</th></tr>");						
							});
						}
					});
				});
				$("#next a").on('click',function(){
					var pageNum = parseInt($(".base").filter(':last').text()) + 1;
					if((pageNum-1)%5!=0){
						return false;
					}
					$("tbody").empty();
					$.ajax({
						url:"<c:url value='/${requestScope.id}/setting/page'/>",
						data:{"pageNum":pageNum},
						success:function(data){
							$(data).find("list").each(function(){
								var fan_num = $(this).find("fan_num").text();
								var id = $(this).find("id").text();
								var name = $(this).find("name").text();
								var cnt = $(this).find("cnt").text();
								$("#fanlist").append("<tr class='fantr'><th>" + fan_num + "</th><th>" + id + "</th><th>" + name + "</th><th>" + cnt + "</th></tr>");						
							});
						}
					});
					$("#baseB").empty();
					$.ajax({
						url:"<c:url value='/${requestScope.id}/setting/pageNext'/>",
						data:{"pageNum":pageNum},
						success:function(data){
							for(var i=pageNum;i<=data;i++){
								$("<a href='#' class='base'>" + i + "</a>&nbsp;").appendTo("#baseB").css('margin','4px').on('click',function(){
									var pageNum1 = $(this).text();
									$("tbody").empty();
									$(".base").removeAttr('style');
									$(".base").css('margin','5px')
									$(this).css('color','red');
									$.ajax({
										url:"<c:url value='/${requestScope.id}/setting/page'/>",
										data:{"pageNum":pageNum1},
										success:function(data){
											$(data).find("list").each(function(){
												var fan_num = $(this).find("fan_num").text();
												var id = $(this).find("id").text();
												var name = $(this).find("name").text();
												var cnt = $(this).find("cnt").text();
												$("#fanlist").append("<tr class='fantr'><th>" + fan_num + "</th><th>" + id + "</th><th>" + name + "</th><th>" + cnt + "</th></tr>");						
											});
										}
									});
								});
							}
							$(".base").filter(':first').css('color','red');
						}
					});
				});
			});		
		</script>
 -->

<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px">
	
		<!-- Header -->
		<header id="portfolio">
			<a href="#"><img src="/w3images/avatar_g2.jpg"
				style="width: 65px;"
				class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<div class="w3-container">
				<h1>
					<b>${voMP.profile_title }</b>
				</h1>
				<div class="w3-section w3-bottombar w3-padding-16">
					<span class="w3-margin-right">Filter:</span>
					<button class="w3-button w3-black">ALL</button>
					<button class="w3-button w3-white">
						<i class="fa fa-diamond w3-margin-right"></i>Design
					</button>
					<button class="w3-button w3-white w3-hide-small">
						<i class="fa fa-photo w3-margin-right"></i>Photos
					</button>
					<button class="w3-button w3-white w3-hide-small">
						<i class="fa fa-map-pin w3-margin-right"></i>Art
					</button>
				</div>
			</div>
		</header>

		<!-- 여기작성 -->
		
		<div>
			<a href="<c:url value='/${requestScope.id}/setting/info'/>" class="w3-bar-item w3-button" style="text-decoration: none;">기본정보관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/category'/>" class="w3-bar-item w3-button" style="text-decoration: none;" >게시판관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/main'/>" class="w3-bar-item w3-button" style="text-decoration: none;">대문관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/fanlist'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">팬 목록</a>
			<a href="<c:url value='/${requestScope.id}/setting/blacklist'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">블랙리스트</a>
		</div>
		
		<br>
		
		<h2 style="margin-left:30px;">팬 목록</h2>
		<p style="margin-left:30px;margin-top:-10px;color:#9A9A9A">팬 목록을 확인할 수 있습니다.</p>
		
		<br>
		
		<div style="margin-left:30px;">
		
		<table id="fanlist" class="w3-table w3-table-all">
			<thead>
			<tr>
				<th>팬 순위</th><th>팬아이디</th><th>팬이름</th><th>사용량</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="voF" items="${listF }">
				<tr class="fantr">
					<th>${voF.rnum }</th>
					<th>${voF.id }</th>
					<th>${voF.name }</th>
					<th>${voF.cnt }</th>
				</tr>
			</c:forEach>
			<c:if test="${err!=null }">
				<tr>
					<th colspan="4" style="text-align:center;vertical-align: middle;height:200px;">${err }</th>
				</tr>
			</c:if>
			</tbody>
		</table>
		</div>
		
		<br>
		
		<c:if test="${err!=null }">
		<script type="text/javascript">
				$(function(){
					$("#paging").css("margin-left","550px");
				});
			</script>
		</c:if>
				
		<!-- 
		<div>
			<span id="pre"><a href="#">[이전]</a></span>
			
			<span id="baseB">
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<a href="#" class="base">${i }</a>
			</c:forEach>
			</span>
			
			<span id="next"><a href="#">[다음]</a></span>
		</div>
		 -->

		<!-- 페이징 -->
		<div class="w3-bar" >
		<div id="paging" style="margin-left:480px;">
		<c:choose>
			<c:when test="${pu.pageNum>1 }">
				<a href="<c:url value='/${requestScope.id}/setting/fanlist?pageNum=${1 }'/>" class="w3-bar-item w3-button w3-hover-black">«</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/${requestScope.id}/setting/fanlist?pageNum=${pu.startPageNum-1 }'/>" class="w3-bar-item w3-button w3-hover-black">이전</a>
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
						<a href="<c:url value='/${requestScope.id}/setting/fanlist?pageNum=${i }'/>" class="w3-bar-item w3-button w3-hover-black">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<a href="<c:url value='/${requestScope.id}/setting/fanlist?pageNum=${pu.endPageNum+1 }'/>" class="w3-bar-item w3-button w3-hover-black">다음</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">다음</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pu.startPageNum<pu.totalPageCount }">
				<a href="<c:url value='/${requestScope.id}/setting/fanlist?pageNum=${pu.totalPageCount }'/>" class="w3-bar-item w3-button w3-hover-black">»</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
			</c:otherwise>
		</c:choose>
		</div>
		</div>
		<br>

		<!-- 작성END -->

		<footer class="w3-container w3-padding-32 w3-dark-grey">
			<div class="w3-row-padding">
				<div class="w3-third">
					<h3>FOOTER</h3>
					<p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo
						condimentum, porta lectus vitae, ultricies congue gravida diam non
						fringilla.</p>
					<p>
						Powered by <a href="https://www.w3schools.com/w3css/default.asp"
							target="_blank">w3.css</a>
					</p>
				</div>

				<div class="w3-third">
					<h3>BLOG POSTS</h3>
					<ul class="w3-ul w3-hoverable">
						<li class="w3-padding-16"><img src="/w3images/workshop.jpg"
							class="w3-left w3-margin-right" style="width: 50px"> <span
							class="w3-large">Lorem</span><br> <span>Sed mattis
								nunc</span></li>
						<li class="w3-padding-16"><img src="/w3images/gondol.jpg"
							class="w3-left w3-margin-right" style="width: 50px"> <span
							class="w3-large">Ipsum</span><br> <span>Praes tinci
								sed</span></li>
					</ul>
				</div>

				<div class="w3-third">
					<h3>POPULAR TAGS</h3>
					<p>
						<span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span
							class="w3-tag w3-grey w3-small w3-margin-bottom">New York</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">London</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">IKEA</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">NORWAY</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">DIY</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Ideas</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Baby</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Family</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">News</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Clothing</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Shopping</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Sports</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Games</span>
					</p>
				</div>

			</div>
		</footer>

		<div class="w3-black w3-center w3-padding-24">
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a>
		</div>

		


	</div>
</body>