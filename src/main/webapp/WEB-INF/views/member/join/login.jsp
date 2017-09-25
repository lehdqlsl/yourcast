<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<br>
	<br>
	<br>
	<br>
	<form method="post" action="<c:url value='/member/login'/>">
		아이디 <input type="text" name="id"><br> 비밀번호 <input
			type="password" name="pwd"><br><br> <input type="submit"
			value="로그인">
	</form>
