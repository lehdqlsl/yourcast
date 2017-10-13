<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#send").click(function(){
			location.href="<c:url value='/message/send'/>";
		});
		$("#back").click(function(){
			self.close();
		});
	});
</script>
<div class="w3-main">
	<p>존재하지 않는 아이디입니다</p>
	<p>쪽지를 다시 전송하시겠습니까?</p>
	<input type="button" id="send" value="쪽지보내기">
	<input type="button" id="back" value="취소">
</div>