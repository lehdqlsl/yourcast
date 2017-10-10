<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="<c:url value='/resources/admin/img/favicon.ico'/>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Insert title here</title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />

<!-- Bootstrap core CSS     -->
<link href="<c:url value='/resources/admin/css/bootstrap.min.css'/>" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="<c:url value='/resources/admin/css/animate.min.css'/>" rel="stylesheet"/>

<!--  Light Bootstrap Table core CSS    -->
<link href="<c:url value='/resources/admin/css/light-bootstrap-dashboard.css'/>" rel="stylesheet"/>

<!--     Fonts and icons     -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/admin/css/pe-icon-7-stroke.css'/>" rel="stylesheet" />

<!--   Core JS Files   -->
<script src="<c:url value='/resources/admin/js/jquery-1.10.2.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/admin/js/bootstrap.min.js'/>" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="<c:url value='/resources/admin/js/bootstrap-checkbox-radio-switch.js'/>"></script>

<!--  Charts Plugin -->
<script src="<c:url value='/resources/admin/js/chartist.min.js'/>"></script>

<!--  Notifications Plugin    -->
<script src="<c:url value='/resources/admin/js/bootstrap-notify.js'/>"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="<c:url value='/resources/admin/js/light-bootstrap-dashboard.js'/>"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="<c:url value='/resources/admin/js/demo.js'/>"></script>
    
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
</head>

<!-- 메인페이지 레이아웃 -->
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<div id="sidebar">
				<tiles:insertAttribute name="sidebar" />
			</div>
			<div id="main">
				<tiles:insertAttribute name="content" />
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>

</html>