<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>
</head>
<!-- 메인페이지 레이아웃 -->
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content" style="margin-top:60px;">
			<div id="sidebar">
				<tiles:insertAttribute name="sidebar" />
			</div>
			<div id="main">
				<tiles:insertAttribute name="content" />
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$("#btn1").click(function(){
		if("${sessionScope.id}"){
			var id=$("#id").val();
			location.href = "<c:url value='/${id}/board/insert'/>";
		}else{
			var flag=confirm("먼저 로그인 하셔야 합니다. 로그인 페이지로 이동하시겠습니까?");
			location.href="<c:url value='/member/login'/>";
		}
		
	});
	
	function w3_open() {
	    document.getElementById("mySidebar").style.display = "block";
	    document.getElementById("myOverlay").style.display = "block";
	}
	 
	function w3_close() {
	    document.getElementById("mySidebar").style.display = "none";
	    document.getElementById("myOverlay").style.display = "none";
	}
</script>

</html>