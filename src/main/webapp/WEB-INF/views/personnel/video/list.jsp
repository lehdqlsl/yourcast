<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/vlist.css'/>">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->
		<header id="portfolio">
			<a href="#"><img src="/w3images/avatar_g2.jpg"
				style="width: 65px;"
				class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<div class="w3-container">
				<div class="link-1">
				<h1>
					<a href="<c:url value='/${requestScope.id }'/>" class="maintitle">
					<b>${voMP.profile_title }</b></a>
				</h1>
			</div>
				<div class="w3-section w3-bottombar w3-padding-16" style="width: 1000px;"></div>
			</div>
		</header>

		<!-- 여기작성 -->
		
		<script type="text/javascript">
			function All(){
				var chk = document.getElementsByName("chk");
				var chkAll = document.getElementById("chkAll");
				for(var i=0; i<chk.length; i++){
					if(document.getElementById("chkAll").checked){
						chk[i].checked = true;
					}else{
						chk[i].checked = false;
					}
				}
			}
			function deleteV(){
				var chk = document.getElementsByName("chk");
				var cnt = 0;
				for(var i=0;i<chk.length;i++){
					if(chk[i].checked){
						v_num.value = chk[i].value;
						cnt++;
					}
				}
				if(cnt==0){
					alert("항목을 선택해주세요.");
					return false;
				}else{
					return true;
				}
			}
		</script>
		
		<script type="text/javascript">
			$(function(){
				$("#update").on("click",function(){
					var cnt = $("input[name=chk]:checkbox:checked").length;
					if(cnt>1){
						alert("하나의 항목만 선택해주세요.");
					}else if(cnt==0){
						alert("항목을 선택해주세요.");
					}else{
						var v_num = $("input[name=chk]:checkbox:checked").val();
						location.href="<c:url value='/${requestScope.id}/video/update?v_num=" + v_num + "'/>";
					}
				});
				$(".insert").on("click",function(){
					location.href="<c:url value='/${requestScope.id}/video/insert'/>"
				});
			});
		</script>

		<h2 style="margin-left:30px;">동영상 리스트</h2>
		<p style="margin-left:30px;margin-top:-10px;color:#9A9A9A">Video List</p>
		

		
		<br>
		
		
		<form method="post" action="<c:url value='/${requestScope.id}/video/delete'/>" onsubmit="return deleteV()">
		<!-- 
		<table class="w3-table w3-table-all" style="margin-bottom: 5px;">
			<tr>
				<th><input type="checkbox" id="chkAll" onclick="All()"></th><th>글번호</th><th>장르</th><th>관람등급</th><th>썸네일</th><th>제목</th><th>내용</th>
				<th>등록일</th><th>조회수</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<th colspan="9" style="text-align:center;vertical-align: middle;height:200px;">동영상이 존재하지 않습니다.</th>
				</tr>
			</c:if>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td style="vertical-align: middle;"><input type="checkbox" value="${vo.v_num }" name="chk"></td>
					<td style="vertical-align: middle;">${vo.v_num }</td>
					<td style="vertical-align: middle;">${vo.genre_name }</td>
					<td style="vertical-align: middle;">${vo.age_grade_name }</td>
					<td style="vertical-align: middle;"><a href="<c:url value="/videomain/getInfo?v_num=${vo.v_num }"/>">
							<img src="<c:url value='/resources/upload/${vo.v_savethumbnail }'/>" style="height:100px;">
							</a></td>
					<td style="vertical-align: middle;">${vo.v_title }</td>
					<td style="vertical-align: middle;">${vo.v_content }</td>
					<td style="vertical-align: middle;">${vo.v_regdate }</td>				
					<td style="vertical-align: middle;">${vo.v_hit }</td>
				</tr>
			</c:forEach>
		</table>
		 -->
		 <!-- 
		 <c:if test="${err==null || err eq null}">	 
			 <div style="float: left;margin-left:50px;"><input type="checkbox" id="chkAll" onclick="All()"></div>
			 <br>
		 </c:if>
		  --> 
		
		<c:choose>
			<c:when test="${empty list }">
			<div class="wrap_view">
				<h5 style="font-weight: bold;text-align: center;">해당 게시판에 영상이 존재하지 않습니다.</h5>
			</div>
			</c:when>
			<c:otherwise>
			 <c:forEach var="vo" items="${list }">	
				<div class="wrap_view">
				<div class="img_profile">
					<img src="<c:url value='/resources/upload/${voMP.profile_savefilename }'/>" style="width: 50px;height: 50px;border-radius: 25px;">
				</div>
				<div class="img_thumbnail">
					<a href="<c:url value='/videomain/getInfo?v_num=${vo.v_num }'/>" style="text-decoration:none;">
						<img src="<c:url value='/resources/upload/${vo.v_savethumbnail }'/>" style="height:130px;" class="w3-round">
					</a>
				</div>
				<div class="v_article">
					<div><span style="color: #1559ff;font-weight: bold;">${vo.name}</span>&nbsp;<span style="color: #4B4B4B;">(${id })&nbsp;&nbsp;&nbsp;${vo.v_regdate }</span></div>
					<div class="v_title">
						<a href="<c:url value='/videomain/getInfo?v_num=${vo.v_num }'/>">${vo.v_title }</a>
					</div>
					<div class="view">${vo.v_content }</div>
				</div>	
				<div class="watch_area">
					<span class="w3-button w3-light-grey w3-border w3-round-large"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>&nbsp;&nbsp;<b>${vo.vucnt }</b></span>
					<span class="w3-button w3-light-grey w3-border w3-round-large"><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;&nbsp;<b>${vo.vrcnt}</b></span>
				</div>	
				<!-- 
				<span class="chk"><input type="checkbox" value="${vo.v_num }" name="chk"></span>
				 -->	
			</div>
			</c:forEach>
			</c:otherwise>
		</c:choose>
		
		
		<script type="text/javascript">
			$(function(){
				$("p").css({"text-overflow":"ellipsis","white-space":"nowrap","overflow":"hidden"});
			});
		</script>
		
		<div style="padding-top:10px;">
		<c:if test="${sessionScope.id==requestScope.id }">
		<!-- 
			<button type="submit" class="w3-button w3-black w3-round-large" style="float: right;margin-right:100px;"><i class="fa fa-trash-o"></i>삭제</button>
			<button type="button" class="w3-button w3-black w3-round-large" id="update" style="float: right;margin-right:5px;"><i class="fa fa-cogs"></i>수정</button>
		 -->
			<!-- <button type="button" class="insert w3-button w3-black w3-round-large" style="float: right;margin-right:300px;"><i class="fa fa-upload"></i>동영상업로드</button> -->
			<button type="button" class="insert w3-button w3-border w3-round-large" style="background-color: #4C5870;float: right;margin-right:300px;">
			<i class="fa fa-video-camera" aria-hidden="true" style="color: white;"></i>
			<span style="color: #EBEDEC; font-weight: bold;">&nbsp;동영상 업로드</span></button>
		</c:if>
		</div>
		</form>	
		
		<br><br>
		
		<!-- 페이징 -->
		<div class="w3-bar-all w3-center" style="width:980px;margin-bottom:50px;">
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/${requestScope.id}/video/list?pageNum=${pu.startPageNum-1 }'/>" class="w3-bar-item w3-button w3-hover-black">이전</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">이전</a>
			</c:otherwise>
		</c:choose>
			<c:if test="${err!=null }">
				<a href="#" class="w3-bar-item w3-button w3-hover-black"><span style="color:red">1</span></a>
			</c:if>
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<a href="#" class="w3-bar-item w3-button w3-hover-black"><span style="color:red">${i }</span></a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/${requestScope.id}/video/list?pageNum=${i }'/>" class="w3-bar-item w3-button w3-hover-black">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<a href="<c:url value='/${requestScope.id}/video/list?pageNum=${pu.endPageNum+1 }'/>" class="w3-bar-item w3-button w3-hover-black">다음</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">다음</a>
			</c:otherwise>
		</c:choose>
		</div>

		<!-- 작성END -->

		<footer>
			<div class="w3-light-grey w3-center w3-padding-24"
				style="width: 1000px; font-size: 11px; border-top: 1px solid #CFCFCF; margin-top: 100px;">
				All Contents Copyright ©Your Cast...Co.,Ltd. All Rights Reserved.</div>
		</footer>

	</div>
</body>