<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet' type='text/css'>
<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;">
<div class="w3-container w3-padding-32" id="projects">
  <h2>회원가입</h2>
  <input name='username' placeholder='Username' type='text'>
  <input id='pw' name='password' placeholder='Password' type='password'>
  <input name='email' placeholder='E-Mail Address' type='text'>
  <div class='agree'>
    <input id='agree' name='agree' type='checkbox'>
    <label for='agree'></label>Accept rules and conditions
  </div>
  <input class='animated' type='submit' value='Register'>
  <a class='forgot' href='#'>Already have an account?</a>
  </div>
</div>