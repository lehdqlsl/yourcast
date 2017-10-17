<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/popup.css'/>?ver=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/default.css'/>?ver=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#ok").click(function(event){
			event.preventDefault();
			opener.document.location.href="<c:url value='/message/recv/list'/>";
			self.close();
		});
		$("#reset").click(function(event){
			event.preventDefault();
			self.close();
		});
	});
</script>
<div class="popup" style="width:388px;">
	<!-- title -->
	<div class="pop_tit_bg"><div class="pop_tit_l"><div class="pop_tit_r">
		<h3 class="pop_tit">받은 쪽지 삭제</h3>
	</div></div>
		<table class="tbl_memo_msg" cellpadding="0" cellspacing="0" border="0">
			<tbody>
			<tr>
				<td class="memo_msg">
					<p>쪽지를 삭제했습니다.</p>
					<p>목록으로 돌아가시겠습니까?</p>
				</td>
			</tr>
			</tbody>
		</table>
		<ul class="btn_buttom1">
			<li><a href="#" id="ok"><img src="http://www.afreecatv.com/images/popup/button/btn_confirm5.gif" alt="확인"></a></li>
			<li><a href="#" id="reset"><img src="http://res.afreecatv.com/images/popup/button/btn_close4.gif" alt="닫기"></a></li>
		</ul>
	</div>
</div>