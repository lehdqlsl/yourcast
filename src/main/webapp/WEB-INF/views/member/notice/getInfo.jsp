<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/help_fix.css'/>?ver=1">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

* {
	font-family: 'Hanna', serif;
}
</style>
<script>
	$(document).ready(function(){
		$("#back").click(function(){
			location.href="<c:url value='/member/notice/list?pageNum=${pageNum}'/>";
		});
	});
</script>
<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;">
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">공지사항</h3>
	</div>
	<div class="w3-panel" style="border: 1px solid #A2A9AF">
		<div class="w3-panel w3-border w3-round-large" style="background-color: #9BAEC8;color: #282C37">
 			<h3><i class="fa fa-search" aria-hidden="true">&nbsp;</i>${nvo.n_title }</h3>
		</div>
		<div class="w3-panel w3-border">
			<div class="w3-panel w3-border-none" style="float: right">
				<span>${nvo.n_regdate }</span>&nbsp;&nbsp;<span>조회수 : ${nvo.n_hit }</span>
			</div>
			<div class="w3-panel w3-border-none">
				${nvo.n_content }
			</div>
		</div>
	</div>
	<div class="w3-bar-all w3-center w3-margin">
		<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large" id="back"><span style="color: #0072ff">목록</span></button>
	</div>
</div>