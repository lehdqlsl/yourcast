<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/popup.css'/>?ver=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/default.css'/>?ver=1">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#delete").click(function(event){
			event.preventDefault();
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
<div class="popup" style="width:388px;">
	<!-- title -->
	<div class="pop_tit_bg"><div class="pop_tit_l"><div class="pop_tit_r">
		<h3 class="pop_tit">보낸 쪽지 읽기</h3>
	</div></div>
	
	</div>
	<!-- title -->

	<div class="memoread">
		<dl class="memo_type1">
		<dt>받는 사람</dt>
		<dd id="recv_nick">${msgvo.name }<span id="recv_id" class="old">(${msgvo.id})</span></dd>
		</dl>
		<dl class="memo_type2">
		<dt>보낸 시각</dt>
		<dd><span id="send_date" class="old">${msgvo.msg_send_date }</span></dd>
		</dl>

		<div id="content" class="memo_cnt_area">${msgvo.msg_content }</div>
		<br>
		<ul id="manageBtn" class="btn_buttom1"><li><a href="javascript:;" onclick="delNoteView('70528677');" id="delete"><img src="http://www.afreecatv.com/images/popup/button/btn_del.gif" alt="삭제"></a></li></ul>
	</div>
</div>
	
