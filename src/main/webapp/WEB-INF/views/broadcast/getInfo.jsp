<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script>
	$(document).ready(function(){
		$("#vr_form").submit(function(event){
			event.preventDefault();//submit취소
			var vr_content=$("#vr_content").val();
			var sid=$("#sid").val();
			var v_num=$("#v_num").val();
			var params=$("#vr_form").serialize();
			//alert(params);
			$.ajax({
				url:'<c:url value="/${vvo.id }/videoreply/insert?params='+params+'"/>',
				dataType:"json",
				success:function(data){
					alert(data);
				}
			});
		})
	});
</script>
<div class="w3-main" style="margin-left: 300px; margin-top: 54px;">
	<h1>동영상 조회 페이지</h1>
	<p>제목 : ${vvo.v_title }</p>
	<video controls="controls" style="width: 1300px;height:735px; ">
		<source src="<c:url value='/resources/upload/${vvo.v_savefilename}'/>" type="video/mp4">
	</video>
	<!-- 동영상 정보 -->
	<br>
	<img src='<c:url value="/resources/upload/${vvo.profile_savefilename }"/>' style="width: 100px;height: 100px;">		
	${vvo.id }
	<!-- 댓글 부분 -->
	<!-- 댓글 작성 -->
	<form id="vr_form" action='<c:url value="/${vvo.id }/videoreply/insert"/>'>
		<input type="hidden" id="sid" name="sid" value="${sessionScope.id }">
		<input type="hidden" id="v_num" name="v_num" value="${vvo.v_num }">
		<div id="replyinsert">
			<textarea rows="4" cols="70" id="vr_content" name="vr_content" placeholder="다른 사람의 권리를 침해하는 내용은 제재 받을 수 있습니다" style="padding: 12px 20px;box-sizing: border-box;border: 2px solid #ccc;border-radius: 4px;background-color: #f8f8f8;resize: none;"></textarea>
		</div>
		<input type="submit" value="등록" id="vr_reg">
		<input type="reset" value="취소" id="vr_reg">
	</form>
	<!-- 댓글 리스트 -->
	
</div>