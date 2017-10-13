<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="w3-main">
	<div>
		<h4>쪽지보내기</h4>
	</div>
	<form method="post" action='<c:url value="/message/send"/>'>
		<input type="hidden" value="${sessionScope.id }" id="s_id" name="s_id">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="r_id" name="r_id"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" id="msg_title" name="msg_title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="15" cols="40" id="msg_content" name="msg_content"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="전송">
		<input type="reset" value="취소">
	</form>
</div>