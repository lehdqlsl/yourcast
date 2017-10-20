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
				$("#imgfile").change(function () {
		            if (this.files && this.files[0]) {
		            	$("#br").empty();
		                var reader = new FileReader();
		                $("#br").append("<br>");
		                reader.onload = function (e) {
		                    $('#imgLogo').attr('src', e.target.result);
		                }
		                reader.readAsDataURL(this.files[0]);
		            }
		        });
				$("form").submit(function(event) {
					var imgname = document.getElementById('imgfile').value;
					imgname = imgname.slice(imgname.indexOf(".") + 1).toLowerCase(); 
					
					if($("input[name='profile_title']").val()==''){
						alert("방송국 이름을 입력하세요");
						$("input[name='profile_title']").focus();
						event.preventDefault();
					}else if(imgname != "jpg" && imgname != "png" &&  imgname != "gif" &&  imgname != "bmp"){
						alert('썸네일은 이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
						return false;
					}
				});
			});
		</script>
		 
		 <div>
			<a href="<c:url value='/${requestScope.id}/setting/info'/>" class="w3-bar-item w3-button" style="text-decoration: none;">
			<span style="color: #337AB7; font-weight: bold;">기본정보관리</span></a>
			<a href="<c:url value='/${requestScope.id}/setting/category'/>" class="w3-bar-item w3-button" style="text-decoration: none;" >게시판관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/main'/>" class="w3-bar-item w3-button" style="text-decoration: none;">대문관리</a>
			<a href="<c:url value='/${requestScope.id}/setting/fanlist'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">팬 목록</a>
			<a href="<c:url value='/${requestScope.id}/setting/blacklist'/>"class="w3-bar-item w3-button"  style="text-decoration: none;">블랙리스트</a>
		</div>
		
		<br>
		
		<h2 style="margin-left:30px;">방송국 기본정보</h2>
		<p style="margin-left:30px;margin-top:-10px;color:#9A9A9A">방송국의 기본정보의 수정이 가능합니다.</p>
		
		<br>
      
		<form method="post" action="<c:url value='/${requestScope.id}/setting/baseinfo_update'/>" enctype="multipart/form-data">
			<table style="width:1000px;height:100px;margin-bottom:10px;">
				<tr>
					<th>방송국이름</th><td><input type="text"  class="w3-input w3-section" name="profile_title" value="${voMP.profile_title }"></td>
				</tr>
				<tr>
					<th></th><td style="color:#9A9A9A;">방송국 웹페이지 상단에 들어가는 소개입니다.</td>
				</tr>
				<tr style="height:20px;"></tr>
				<tr>
					<th>로고</th><td><input type="file" name="profileImg" id="imgfile"><span id="br"></span><img src="#" height="100" id="imgLogo"></td>
				</tr>
				<tr>
					<th></th><td style="color:#9A9A9A">방송국 로고를 설정할 수 있습니다.</td>
				</tr>
				<tr style="height:20px;"></tr>
				<tr>
					<th>프로필</th><td><input type="text" class="w3-input w3-section" name="profile_msg" value="${voMP.profile_msg }"></td>
				</tr>
				<tr>
					<th></th><td style="color:#9A9A9A">방송국의 웹페이지의 좌측 프로필에 들어가는 자기소개입니다.</td>
				</tr>
				<tr>
					<th></th><td style="color:#9A9A9A">메인페이지의 내용을 수정할 수 있습니다.</td>
				</tr>
				<tr style="height:20px;"></tr>
				<tr>
					<th colspan="2"><button type="submit" style="margin-right:400px;background-color: #4C5870;" class="w3-button w3-border w3-round-large">
					<i class="fa fa-check" style="color: white;"></i><span style="color: #EBEDEC; font-weight: bold;">&nbsp;확인</span></button></th>
				</tr>
			</table>
		</form>
		
		<!-- 작성END -->

		<footer>
			<div class="w3-light-grey w3-center w3-padding-24"
				style="width: 1000px; font-size: 11px; border-top: 1px solid #CFCFCF; margin-top: 100px; margin-left: 30px;">
				All Contents Copyright ©Your Cast...Co.,Ltd. All Rights Reserved.</div>
		</footer>

	</div>
	</body>