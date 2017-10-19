<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
<style>
	a{
		text-decoration: none;
	}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script>
	$(document).ready(function(){
		//checkall누르면 다 체크되기
		$("#checkallS").click(function(){
			var chk=$("#checkallS").prop("checked");
			if(chk==true){
				$('[name="checkS"]').prop("checked",true);
			}else{
				$('[name="checkS"]').prop("checked",false);
			}
		});
		//삭제하기
		$("#v_delete").click(function(){
			var flag=confirm("선택한 쪽지를 삭제하시겠습니까?");
			if(flag){
				var cnt=0;
				var arr=new Array();
				$("input:checkbox[name=checkS]").each(function(){
					if(this.checked==true){
						var id=$(this).attr("id");
						arr.push(id);
					}
				});
				if(arr.length>0){
					location.href="<c:url value='/message/send/deleteList?arr="+arr+"'/>";
				}else{
					alert("쪽지를 선택해주세요!");
				}
			}
		});
	});
</script>
<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;">
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">쪽지함</h3>
	</div>
	
	<div>
		<a href="<c:url value='/message/recv/list'/>" class="w3-bar-item w3-button" style="text-decoration: none;">받은 쪽지함</a>
		<a href="<c:url value='/message/send/list'/>" class="w3-bar-item w3-button" style="text-decoration: none;background-color: #cccccc;" >보낸 쪽지함</a>
		<a href='#' onclick="window.open('<%=request.getContextPath()%>/message/send','_blank','resizable=no,width=400 height=400');" class="w3-bar-item w3-button" style="text-decoration: none;" >쪽지보내기</a>
	</div>
	<hr>
	<div>
		<table class="w3-table w3-table-all">
			<tr>
				<th><input type="checkbox" id="checkallS"></th><th>받는 사람</th><th>제목</th><th>보낸 시각</th><th>상태</th>
			</tr>
			<c:forEach var="vo" items="${slist }">
				<tr>
					<td><input type="checkbox" id="${vo.msg_num }"  name="checkS" class="checkS"></td>
					<td>${vo.id }</td>
					<td><a href='#' onclick="window.open('<%=request.getContextPath()%>/message/send/getInfo?msg_num=${vo.msg_num }','_blank','resizable=no,width=400 height=400');" class="recvmsg">${vo.msg_title }</a></td>
					<td>${vo.msg_send_date }</td>
					<td>
						<c:choose>
							<c:when test="${vo.msg_view_date==0 }">
								읽지 않음
							</c:when>
							<c:otherwise>
								읽음
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<div>
		<button id="v_delete" class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-left: 882px;"><span style="color: #0072ff"><i class='fa fa-trash-o' aria-hidden='true'></i>삭제</span></button>
	</div>
	<br>
	<br>
	<!-- 페이징 -->
	<div class="w3-bar-all w3-center">
		<!-- 이전 -->
		<c:choose>
			<c:when test="${pus.startPageNum>5 }">
				<a href='<c:url value="/message/send/list?pageNumR=${pus.startPageNum-1 }"/>'class="w3-bar-item w3-button w3-hover-black">이전</a>
			</c:when>
			<c:otherwise>
				<a class="w3-bar-item w3-button w3-hover-black">이전</a>
			</c:otherwise>
		</c:choose>
		<!-- 페이지 -->
		<c:forEach var="i" begin="${pus.startPageNum }" end="${pus.endPageNum }">
			<c:choose>
				<c:when test="${i==pus.pageNum }">
					<a href='<c:url value="/message/send/list?pageNumS=${i }"/>'class="w3-bar-item w3-button w3-hover-black"><span style="color:red">${i }</span></a>
				</c:when>
				<c:otherwise>
					<a href='<c:url value="/message/send/list?pageNumS=${i }"/>'class="w3-bar-item w3-button w3-hover-black"><span>${i }</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<!-- 다음 -->
		<c:choose>
			<c:when test="${pus.endPageNum<pus.totalPageCount }">
				<a href='<c:url value="/message/send/list?pageNumS=${pus.endPageNum+1 }"/>'class="w3-bar-item w3-button w3-hover-black">다음</a>
			</c:when>
			<c:otherwise>
				<a class="w3-bar-item w3-button w3-hover-black">다음</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>