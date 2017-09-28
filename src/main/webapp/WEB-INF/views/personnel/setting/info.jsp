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
		
		<script type="text/javascript">
			$(document).ready(function(){
				$('#tabMenu').tabs();
			});
		</script>
		
		<script type="text/javascript">
			$(function(){
				$("#tab1").on('click',function(){
					window.location.href="<c:url value='/${requestScope.id }/setting/info'/>";
				});
			});
		</script>
      
		<div id="tabMenu">
			<ul style="background-color: #f1f1f1!important;border-color:#f1f1f1!important ">
				<li><a href="#tabs-1" id="tab1">기본정보관리</a></li>
				<li><a href="#tabs-2" id="tab2">게시판관리</a></li>
				<li><a href="#tabs-3" id="tab3">대문관리</a></li>
				<li><a href="#tabs-4" id="tab4">팬 목록</a></li>
				<li><a href="#tabs-5" id="tab5">블랙리스트</a></li>
			</ul>
			
			<div id="tabs-1" class="divTab">
				<form method="post" action="<c:url value='/${requestScope.id}/setting/baseinfo_update'/>" enctype="multipart/form-data">
					<table>
						<tr>
							<th>방송국이름</th><td><input type="text" name="profile_title" value="${voMP.profile_title }"></td>
						</tr>
						<tr>
							<th>로고</th><td><input type="file" name="profileImg"></td>
						</tr>
						<tr>
							<th>프로필</th><td><input type="text" name="profile_msg" value="${voMP.profile_msg }"></td>
						</tr>
						<tr>
							<th>내용</th><td><input type="text" name="profile_content" value="${voMP.profile_content }"></td>
						</tr>
						<tr>
							<th colspan="2"><input type="submit" value="확인"></th>
						</tr>
					</table>
				</form>
			</div>
			
			<script type="text/javascript">
				$(function(){
					$("#c_delete").click(function(){
						var opt = document.createElement("option");
						var optionV = $("#menulist option:selected").val();
						if(optionV==null || optionV==""){
							return false;
						}
						$("#menulist option:selected").remove();						
						$.ajax({
							url:"<c:url value='/${requestScope.id}/setting/category_delete'/>",
							data:{"option":optionV},
							success:function(data){
								$("#c_keyword").focus().val("");
							}
						});
					});
					$("#c_insert").click(function(){
						var opt = document.createElement("option");
						var c_keyword = $("#c_keyword").val();
						if(c_keyword==null || c_keyword==""){
							return false;
						}
						$.ajax({
							url:"<c:url value='/${requestScope.id}/setting/category_insert'/>",
							data:{"keyword":c_keyword},
							success:function(data){
								$("#menulist").append("<option value='" + data + "'>" + c_keyword + "</option>");
								$("#c_keyword").focus().val("");
							}
						});
					});
				});				
			</script>
			
			<div id="tabs-2" class="divTab">
				<div>
				<input type="text" id="c_keyword">
					<input type="button" value="추가" id="c_insert">
					<input type="button" value="삭제" id="c_delete">
				</div>				
			
				<select id="menulist" name="menulist" size="10" style="width:200px;">
					<c:forEach var="cvo" items="${clist }">
						<option value="${cvo.category_num }">${cvo.category_name }</option>
					</c:forEach>
				</select>
				
			</div>
			
			<div id="tabs-3" class="divTab">
				대문관리
			</div>
			
			<script type="text/javascript">
				$(function(){
					$(".base").filter(':first').css('color','red');
					$("#pre a").on('click',function(){
						var pageNum = parseInt($(".base").filter(':first').text()) - 1;
						if(pageNum<5){
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
						if(pageNum%5!=0){
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
			
			<div id="tabs-4" class="divTab">
				<table border="1" id="fanlist">
					<thead>
					<tr>
						<th>팬 번호</th><th>팬아이디</th><th>팬이름</th><th>사용량</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="voF" items="${listF }">
						<tr class="fantr">
							<th>${voF.fan_num }</th>
							<th>${voF.id }</th>
							<th>${voF.name }</th>
							<th>${voF.cnt }</th>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				
				<!-- 페이징 -->
					<div>
						<span id="pre"><a href="#">[이전]</a></span>
						
						<span id="baseB">
						<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
							<a href="#" class="base">${i }</a>
						</c:forEach>
						</span>
						
						<span id="next"><a href="#">[다음]</a></span>
					</div>
				
				
			</div>
			
			<script type="text/javascript">
				$(function(){
					$("#blacklistI").click(function(){
						var opt = document.createElement("option");
						var option = $("#black").val();
						if(option==null || option==""){
							return false;
						}
						$.ajax({
							url:"<c:url value='/${requestScope.id}/setting/blacklistI'/>",
							data:{"option":option},
							success:function(data){
								if(data==0){
									alert("이미 추가된 아이디입니다.");	
								}else{
									alert(option + "님을 블랙리스트에 추가하였습니다.");	
									$("#listB").append("<option value='" + data + "'>" + option + "</option>");
								}
							},
							error:function(data){
								alert("존재하지 않는 아이디입니다.");	
							}
						});
						$("#black").focus().val("");
					});
					$("#blacklistD").click(function(){
						var opt = document.createElement("option");
						var optionV = $("#listB option:selected").val();
						var optionT = $("#listB option:selected").text();
						if(optionV==null || optionV==""){
							return false;
						}
						$("#listB option:selected").remove();
						$.ajax({
							url:"<c:url value='/${requestScope.id}/setting/blacklistD'/>",
							data:{"option":optionV}
						});
						alert(optionT + "님을 블랙리스트에서 삭제하였습니다.");
						$("#black").focus().val("");
					});
				});				
			</script>
			
			<div id="tabs-5" class="divTab">
					
				<div>
				<input type="text" id="black">
					<input type="button" value="블랙리스트 추가" onclick="blackListInsert()" id="blacklistI" name="blacklistI">
					<input type="button" value="블랙리스트 삭제" onclick="blackListDelete()" id="blacklistD" name="blacklistD">
				</div>	
				
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