<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
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
	<div>
		<table class="w3-table w3-table-all w3-margin">
			<tr>
				<td width="30%">번호</td>
				<td width="70%">${nvo.n_num }</td>
			</tr>
			<tr>
				<td width="30%">제목</td>
				<td width="70%">${nvo.n_title }</td>
			</tr>
			<tr>
				<td width="30%">내용</td>
				<td width="70%">${nvo.n_content }</td>
			</tr>
		</table>
	</div>
	<div class="w3-bar-all w3-center w3-margin">
		<button class="w3-button w3-black w3-round-large" id="back">목록</button>
	</div>
</div>