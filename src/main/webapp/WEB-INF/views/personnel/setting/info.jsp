<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>

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
					<b>${voMP.profile_msg }</b>
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
		
		<script type="text/javascript">
			$(document).ready(function(){
				$('#tabMenu').tabs();
			});
		</script>
      
		<div id="tabMenu">
			<ul style="background-color: #f1f1f1!important;border-color:#f1f1f1!important ">
				<li><a href="#tabs-1" id="tab1">기본정보관리</a></li>
				<li><a href="#tabs-2" id="tab2">대문관리</a></li>
				<li><a href="#tabs-3" id="tab3">팬 목록</a></li>
				<li><a href="#tabs-4" id="tab4">블랙리스트</a></li>
			</ul>
			
			<div id="tabs-1" class="divTab">
				<form method="post" action="<c:url value='/${requestScope.id}/setting/baseinfo_update'/>" enctype="multipart/form-data">
					<table>
						<tr>
							<th>방송국이름</th><td><input type="text" name="profile_msg" value="${voMP.profile_msg }"></td>
						</tr>
						<tr>
							<th>로고</th><td><input type="file" name="profileImg"></td>
						</tr>
						<tr>
							<th>프로필</th><td><input type="text" name="profile_content" value="${voMP.profile_content }"></td>
						</tr>
						<tr>
							<th colspan="2"><input type="submit" value="확인"></th>
						</tr>
					</table>
				</form>
			</div>
			
			<div id="tabs-2" class="divTab">
					대문관리
			</div>
			
			<script type="text/javascript">
				$(function(){
					$("#pre a").click(function(){
						var pageNum = ${pu.startPageNum-1};
						$.ajax({
							url:"<c:url value='/${requestScope.id}/setting/page'/>",
							data:{"pageNum":pageNum},
							dataType:"xml",
							success:function(data){
								alert("asd");
							}
						});
					});
					$("#base a").click(function(){
						var pageNum = $(this).text();
						$.ajax({
							url:"<c:url value='/${requestScope.id}/setting/page'/>",
							data:{"pageNum":pageNum},
							dataType:"xml",
							success:function(data){
								$(data).find("list").each(function(){
									var ffan_num = $(this).find("fan_num").text();
									var fid = $(this).find("id").text();
									var fname = $(this).find("name").text();
									alert(ffan_num);
									$("#ffan_num").text(ffan_num);
									$("#fid").text(fid);
									$("#fname").text(fname);
								});
							}
						});
					});
					$("#next a").click(function(){
						var pageNum = ${pu.endPageNum+1};
						$.ajax({
							url:"<c:url value='/${requestScope.id}/setting/page'/>",
							data:{"pageNum":pageNum},
							dataType:"xml",
							success:function(data){
								alert("asd");
							}
						});
					});
				});		
			</script>
			
			<div id="tabs-3" class="divTab">
				<table border="1">
					<tr>
						<th>팬 번호</th><th>팬아이디</th><th>팬이름</th>
					</tr>
					<c:forEach var="voF" items="${listF }">
						<tr>
							<th id="ffan_num">${voF.fan_num }</th>
							<th id="fid">${voF.id }</th>
							<th id="fname">${voF.name }</th>
						</tr>
					</c:forEach>
				</table>
				
				<!-- 페이징 -->
					<div>
					<c:choose>
						<c:when test="${pu.startPageNum>5 }">
							<span id="pre"><a href="#">[이전]</a></span>
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
									<span id="base" style="color:#555"><a href="#">${i }</a></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					<c:choose>
						<c:when test="${pu.endPageNum<pu.totalPageCount }">
							<span id="next"><a href="#">[다음]</a></span>
						</c:when>
						<c:otherwise>
							[다음]
						</c:otherwise>
					</c:choose>
					</div>
				
				
			</div>
			
			<script type="text/javascript">
				$(function(){
					$("#blacklistI").click(function(){
						var opt = document.createElement("option");
						var optionV = $("#listA option:selected").val();
						var optionT = $("#listA option:selected").text();
						$("#listA option:selected").remove();
						$("#listB").append("<option value='" + optionV + "'>" + optionT + "</option>");
						
						$.ajax({
							url:"<c:url value='/${requestScope.id}/setting/blacklistI'/>",
							data:{"option":optionV},
							dataType:"xml"
						});
					});
					$("#blacklistD").click(function(){
						var opt = document.createElement("option");
						var optionV = $("#listB option:selected").val();
						var optionT = $("#listB option:selected").text();
						$("#listB option:selected").remove();
						$("#listA").append("<option value='" + optionV + "'>" + optionT + "</option>");
						
						$.ajax({
							url:"<c:url value='/${requestScope.id}/setting/blacklistD'/>",
							data:{"option":optionV},
							dataType:"xml"
						});
					});
				});				
			</script>
			
			<div id="tabs-4" class="divTab">
					
				<select id="listA" name="listA" size="10" style="width:300px;">
					<c:forEach var="voAll" items="${listM }">
						<option value="${voAll.m_num }">${voAll.id }</option>
					</c:forEach>
				</select>
				
				<input type="button" value="블랙리스트 추가" onclick="blackListInsert()" id="blacklistI" name="blacklistI">
				<input type="button" value="블랙리스트 삭제" onclick="blackListDelete()" id="blacklistD" name="blacklistD">
				
				<select id="listB" name="listB" size="10" style="width:300px;">
					<c:forEach var="voB" items="${listB }">
						<option value="${voB.m_num }">${voB.id }</option>
					</c:forEach>
				</select>
				
			</div>
			
		</div>

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