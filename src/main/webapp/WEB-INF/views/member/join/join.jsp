<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
	</head>
</html>
<div class='login'>
  <h2>회원가입</h2>
  <form action="<c:url value='/member/join'/>" method="post">
	  <input name='id' placeholder='Id' type='text'>
	  <input id='pwd' name='pwd' placeholder='Password' type='password'>
	  <input name='name' placeholder='Username' type='text'>
	  <input type="text" id="datepicker" name="birth">
	  <input type="text"  placeholder='남1 여2' name="gender">
	  <div class='agree'>
	    <input id='agree' name='agree' type='checkbox'>
	    <label for='agree'></label>Accept rules and conditions
	  </div>
	  <input class='animated' type='submit' value='Register'>
	  <a class='forgot' href='#'>Already have an account?</a>
  </form>
</div>