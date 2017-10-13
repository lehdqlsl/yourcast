<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#ok").click(function(){
			self.close();
		});
	});
</script>
<div class="w3-main">
	<p>쪽지가 전송되었습니다.</p>
	<input type="button" id="ok" value="확인">
</div>