<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">

	<script type="text/javascript">
		function result(){
			var result = document.getElementsByName("result")[0].value;
			alert(result);
			window.location.href="<c:url value='/member/charge/star'/>";	
		}
	</script>

	<input type="hidden" value="${result}" name="result">
	
	
		
</div>

