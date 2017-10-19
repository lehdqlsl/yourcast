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
		
		<div>
			<a href="<c:url value='/${requestScope.id}/setting/info'/>" class="w3-bar-item w3-button" style="text-decoration: none;">기본정보관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/category'/>" class="w3-bar-item w3-button" style="text-decoration: none;" >게시판관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/main'/>" class="w3-bar-item w3-button" style="text-decoration: none;">대문관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/fanlist'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">팬 목록</a>
			<a href="<c:url value='/${requestScope.id}/setting/blacklist'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">블랙리스트</a>
		</div>
		
		<br>
		
		<h2 style="margin-left:30px;">블랙리스트 관리</h2>
		<p style="margin-left:30px;margin-top:-10px;color:#9A9A9A">블랙리스트에 등록된 유저는 자신이 진행하는 방송의 시청이 불가능합니다.</p>
		
		<br>
					
		<div style="margin-left:30px;">
			<div style="margin-bottom:5px;">
			<button type="button" onclick="blackListInsert()" id="blacklistI" name="blacklistI" class="w3-button w3-black w3-round-large"><i class="fa fa-check"></i>블랙리스트 추가</button>
			<button type="button" onclick="blackListDelete()" id="blacklistD" name="blacklistD" class="w3-button w3-black w3-round-large"><i class="fa fa-trash-o"></i>블랙리스트 삭제</button>
			</div>
			<input type="text" id="black" placeholder="아이디를 입력하세요." size="30" style="margin-bottom:5px;"><br>
		</div>	
				
		<select id="listB" name="listB" size="10" style="width:350px;margin-left:30px;margin-bottom:10px;">
			<c:forEach var="voB" items="${listB }">
				<option value="${voB.m_num }">${voB.id }</option>
			</c:forEach>
		</select>

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