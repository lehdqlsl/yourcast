<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.title_list{
	width:350px;
	text-decoration: none;
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script>
	$(document).ready(function(){
		
	});
</script>
<!-- 메인페이지 -->
<!-- 전체 동영상 리스트 출력-->
<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">
	
	<div class="w3-container w3-padding-32" id="about">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">즐겨찾기</h3>
	</div>
	<!-- 동영상 목록 부분 -->
	<div class="w3-row-padding" id="videolist">
		<c:forEach var="vo" items="${vlist }">
			<div class="w3-col l3 m6 w3-margin-bottom videolist">
				<div>
					<a href='<c:url value="/videomain/getInfo?v_num=${vo.v_num }"/>'><img src='<c:url value="/resources/upload/${vo.v_savethumbnail }"/>' style="width:100%;height:250px;" class="w3-round-large w3-border w3-hover-opacity"></a>
				</div>
				<div>
					<a style="padding:0 10px 0 10px;font-size: 1.4em;font-weight: bold;" href='<c:url value="/videomain/getInfo?v_num=${vo.v_num }"/>' class="title_list">${vo.v_title }</a>
				</div>
				<div style="padding:0 10px 0 10px;">
					<p><span style="color: #328fde;"><a href='<c:url value="/${vo.id }"/>' style="text-decoration: none;">${vo.id }</a></span> 조회수&nbsp;${vo.v_hit }</p>
				</div>
			</div>
		</c:forEach>
	</div>
	<br>
</div>


