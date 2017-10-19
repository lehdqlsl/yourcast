<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/home.css'/>?ver=3">
	
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
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<div class="w3-container">
				<h1>
					<a href="<c:url value='/${requestScope.id }'/>" class="home">
					<b>${voMP.profile_title }</b></a>
				</h1>
				<div class="w3-section w3-bottombar w3-padding-16"  style="width: 1000px;">
				</div>
			</div>
		</header>

		<!-- 여기작성 -->
		
		<div>
			<a href="<c:url value='/${requestScope.id}/setting/info'/>" class="w3-bar-item w3-button" style="text-decoration: none;">기본정보관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/category'/>" class="w3-bar-item w3-button" style="text-decoration: none;" >게시판관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/main'/>" class="w3-bar-item w3-button" style="text-decoration: none;">대문관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/fanlist'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">
      <span style="color: #337AB7; font-weight: bold;">팬 목록</span></a>
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

		<footer>
			<div class="w3-light-grey w3-center w3-padding-24"
				style="width: 1000px; font-size: 11px; border-top: 1px solid #CFCFCF; margin-top: 100px; margin-left: 30px;">
				All Contents Copyright ©Your Cast...Co.,Ltd. All Rights Reserved.</div>
		</footer>

	</div>
</body>