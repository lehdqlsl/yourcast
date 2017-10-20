<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/home.css'/>?ver=3">

<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px">
	
		<!-- Header -->
		<header id="portfolio">
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<div class="w3-container">
				<div class="link-2">
				<h1>
					<a href="<c:url value='/${requestScope.id }'/>" class="maintitle">
					<b>${voMP.profile_title }</b></a>
				</h1>
			</div>
				<div class="w3-section w3-bottombar w3-padding-16"  style="width: 1000px;">
				</div>
			</div>
			
		</header>

		<!-- 여기작성 -->

		<script type="text/javascript">
			$(function(){
				String.prototype.byteLength = function() {
					var l = 0;
					for (var idx = 0; idx < this.length; idx++) {
						var c = escape(this.charAt(idx));
						if (c.length == 1)
							l++;
						else if (c.indexOf("%u") != -1)
							l += 3;
						else if (c.indexOf("%") != -1)
							l += c.length / 3;
					}
					return l;
				};
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
						alert("게시판명을 입력해주세요.");
						return false;
					}
					if ($("#c_keyword").val().byteLength()>30) {
						alert("게시판 제목이 너무 깁니다. (한글 10글자이하, 영문 30자 이하의 제목만 입력가능합니다.)");
						return false;
					}
					$.ajax({
						url:"<c:url value='/${requestScope.id}/setting/category_insert'/>",
						data:{"keyword":c_keyword},
						success:function(data){
							if(data==0){
								alert("동일한 이름의 게시판이 존재합니다.");
							}else{
								$("#menulist").append("<option value='" + data + "'>" + c_keyword + "</option>");
								$("#c_keyword").focus().val("");
								alert(c_keyword + " 게시판이 추가되었습니다.");
							}
						}
					});
				});
			});
		</script>
		
		<div>
			<a href="<c:url value='/${requestScope.id}/setting/info'/>" class="w3-bar-item w3-button" style="text-decoration: none;">기본정보관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/category'/>" class="w3-bar-item w3-button" style="text-decoration: none;" ><span style="color: #337AB7; font-weight: bold;">게시판관리</span></a>
			<a href="<c:url value='/${requestScope.id}/setting/main'/>" class="w3-bar-item w3-button" style="text-decoration: none;">대문관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/fanlist'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">팬 목록</a>
			<a href="<c:url value='/${requestScope.id}/setting/blacklist'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">블랙리스트</a>
		</div>
		
		<br>
		
		<h2 style="margin-left:30px;">게시판 관리</h2>
		<p style="margin-left:30px;margin-top:-10px;color:#9A9A9A">게시판의 추가 및 삭제가 가능합니다.</p>
		
		<br>
		
		<div style="margin-left:30px;">
		<input type="text" id="c_keyword" class="w3-input w3-section" placeholder="게시판 이름을 입력하세요." style="margin-bottom: 15px; width: 400px;">
		</div>
		<select id="menulist" name="menulist" size="10" style="width:400px;margin-left:30px;margin-bottom:10px;border: 1px solid #CFCFCF;">
			<c:forEach var="cvo" items="${clist }">
				<option value="${cvo.category_num }">${cvo.category_name }</option>
			</c:forEach>
		</select>
		<div>		
			<button type="button" id="c_insert" class="w3-button w3-border w3-round-large" style="background-color: #4C5870; margin-left: 27px;"><i class="fa fa-check" style="color: white;"></i>
			<span style="color: #EBEDEC; font-weight: bold;">&nbsp;추가</span></button>
			<button type="button" id="c_delete" class="w3-button w3-border w3-round-large" style="background-color: #4C5870;"><i class="fa fa-trash-o" style="color: white;"></i>
			<span style="color: #EBEDEC; font-weight: bold;">&nbsp;삭제</span></button>
		</div>
		<!-- 작성END -->

		<footer>
			<div class="w3-light-grey w3-center w3-padding-24"
				style="width: 1000px; font-size: 11px; border-top: 1px solid #CFCFCF; margin-top: 100px; margin-left: 30px;">
				All Contents Copyright ©Your Cast...Co.,Ltd. All Rights Reserved.</div>
		</footer>

	</div>
</body>