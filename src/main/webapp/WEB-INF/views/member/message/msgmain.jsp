<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script>
	$(document).ready(function(){
		//탭 주기
		$("#tabMenu").tabs();
		
		//쪽지 전송 눌렀을 때 쪽지 전송 팝업창 띄우기
		$(".btn").on("click",function(){
			window.open("<c:url value='/message/send'/>","_blank","width=450px,height=450px");
		});
		
		//checkall누르면 다 체크되기
		$("#checkallR").click(function(){
			var chk=$("#checkallR").prop("checked");
			if(chk==true){
				$('[name="checkR"]').prop("checked",true);
			}else{
				$('[name="checkR"]').prop("checked",false);
			}
		});
		$("#checkallS").click(function(){
			var chk=$("#checkallS").prop("checked");
			if(chk==true){
				$('[name="checkS"]').prop("checked",true);
			}else{
				$('[name="checkS"]').prop("checked",false);
		
			}
		});
		
	});
</script>
<div class="w3-main" style="margin: 60px auto 0 auto;width: 960px;">
	<c:choose>
		<c:when test="${cate==1 }">
			<script type="text/javascript">
				$(function(){
					$("#tab1").click();
				});
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				$(function(){
					$("#tab2").click();
				});
			</script>
		</c:otherwise>
	</c:choose>
	<div id="tabMenu">
		<ul>
			<li><a href="#tabs-1" id="tab1">받은 쪽지함</a></li>
			<li><a href="#tabs-2" id="tab2">보낸 쪽지함</a></li>
		</ul>
		<div id="tabs-1" class="divTab">
			<button class="w3-button w3-black w3-round-large btn"><i class="fa fa-paper-plane"></i>&nbsp;쪽지보내기</button>
			<!-- 목록 -->
			<div id="recvlist">
				<table border="1" width="100%">
					<tr>
						<th><input type="checkbox" id="checkallR"></th><th>보낸 사람</th><th>제목</th><th>보낸 시각</th>
					</tr>
					<c:forEach var="vo" items="${rlist }">
						<tr>
							<td><input type="checkbox" id="${vo.msg_num }" name="checkR" class="checkR"></td>
							<td>${vo.id }</td>
							<td><a href='#' onclick="window.open('<%=request.getContextPath()%>/message/recv/getInfo?msg_num=${vo.msg_num }','_blank','resizable=no,width=450 height=450');" class="recvmsg">${vo.msg_title }</a></td>
							<td>${vo.msg_send_date}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- 페이징 -->
			<div>
			<!-- 이전 -->
			<c:choose>
				<c:when test="${pur.startPageNum>5 }">
					<a href='<c:url value="/message/main?pageNumR=${pur.startPageNum-1 }&cate=1"/>'>[이전]</a>
				</c:when>
				<c:otherwise>
					[이전]
				</c:otherwise>
			</c:choose>
			<!-- 페이지 -->
			<c:forEach var="i" begin="${pur.startPageNum }" end="${pur.endPageNum }">
				<c:choose>
					<c:when test="${i==pur.pageNum }">
						<a href='<c:url value="/message/main?pageNumR=${i }&cate=1"/>'><span style="color:red">[${i }]</span></a>
					</c:when>
					<c:otherwise>
						<a href='<c:url value="/message/main?pageNumR=${i }&cate=1"/>'><span style="color:black">[${i }]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 다음 -->
			<c:choose>
				<c:when test="${pur.endPageNum<pur.totalPageCount }">
					<a href='<c:url value="/message/main?pageNumR=${pur.endPageNum+1 }&cate=1"/>'>[다음]</a>
				</c:when>
				<c:otherwise>
					[다음]
				</c:otherwise>
			</c:choose>
			</div>
		</div>
		<div id="tabs-2" class="divTab">
			<button class="w3-button w3-black w3-round-large btn"><i class="fa fa-paper-plane"></i>&nbsp;쪽지보내기</button>
			<!-- 목록 -->
			<div id="sendlist">
				<table border="1" width="100%">
					<tr>
						<th><input type="checkbox" id="checkallS"></th><th>받는 사람</th><th>제목</th><th>보낸 시각</th><th>상태</th>
					</tr>
					<c:forEach var="vo" items="${slist }">
						<tr>
							<td><input type="checkbox" id="${vo.msg_num }"  name="checkS" class="checkS"></td>
							<td>${vo.id }</td>
							<td><a href='#' onclick="window.open('<%=request.getContextPath()%>/message/send/getInfo?msg_num=${vo.msg_num }','_blank','resizable=no,width=450 height=450');" class="recvmsg">${vo.msg_title }</a></td>
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
			<!-- 페이징 -->
			<div>
			<!-- 이전 -->
			<c:choose>
				<c:when test="${pus.startPageNum>5 }">
					<a href='<c:url value="/message/main?pageNumR=${pus.startPageNum-1 }&cate=2"/>'>[이전]</a>
				</c:when>
				<c:otherwise>
					[이전]
				</c:otherwise>
			</c:choose>
			<!-- 페이지 -->
			<c:forEach var="i" begin="${pus.startPageNum }" end="${pus.endPageNum }">
				<c:choose>
					<c:when test="${i==pus.pageNum }">
						<a href='<c:url value="/message/main?pageNumS=${i }&cate=2"/>'><span style="color:red">[${i }]</span></a>
					</c:when>
					<c:otherwise>
						<a href='<c:url value="/message/main?pageNumS=${i }&cate=2"/>'><span style="color:black">[${i }]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 다음 -->
			<c:choose>
				<c:when test="${pus.endPageNum<pus.totalPageCount }">
					<a href='<c:url value="/message/main?pageNumS=${pus.endPageNum+1 }&cate=2"/>'>[다음]</a>
				</c:when>
				<c:otherwise>
					[다음]
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</div>