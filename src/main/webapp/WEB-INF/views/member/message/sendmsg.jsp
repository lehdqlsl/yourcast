<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#delete").click(function(){
			var msg_num="${msgvo.msg_num}";
			//alert(msg_num);
			var flag=confirm("해당 쪽지를 삭제하시겠습니까?");
			if(flag){
				alert("쪽지가 삭제되었습니다!");
				location.href="<c:url value='/message/send/deleteOne?msg_num="+msg_num+"'/>";
			}
		});
	});
</script>
<div class="w3-main">
	<div>
		<h4>보낸 쪽지 조회</h4>
	</div>
	<table>
		<tr>
			<td>받는 사람</td>
			<td><input type="text" id="r_id" name="r_id" readonly="readonly" value="${msgvo.id }"></td>
		</tr>
		<tr>
			<td>보낸 날짜</td>
			<td><input type="text" id="msg_send_date" name="msg_send_date" readonly="readonly" value="${msgvo.msg_send_date }"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" id="msg_title" name="msg_title" readonly="readonly" value="${msgvo.msg_title }"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="15" cols="40" id="msg_content" name="msg_content" readonly="readonly">${msgvo.msg_content }</textarea></td>
		</tr>
	</table>
	<input type="button" value="삭제" id="delete">
</div>