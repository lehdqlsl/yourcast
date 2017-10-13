<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#back").click(function(){
			opener.document.location.href="<c:url value='/message/main'/>";
			self.close();
		});
	});
</script>
<div class="w3-main">
	<p>쪽지가 삭제되었습니다.</p>
	<p>목록으로 돌아가시겠습니까?</p>
	<input type="button" id="back" value="목록가기">
</div>