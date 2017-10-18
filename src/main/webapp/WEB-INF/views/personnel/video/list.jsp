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
				<h1>
					<b>${voMP.profile_title }</b>
				</h1>
				<div class="w3-section w3-bottombar w3-padding-16">
					<span class="w3-margin-right">Filter:</span>
					<button class="w3-button w3-black">ALL</button>
					<button class="w3-button w3-white">
						<i class="fa fa-diamond w3-margin-right"></i>Design
					</button>
					<button class="w3-button w3-white w3-hide-small">
						<i class="fa fa-photo w3-margin-right"></i>Photos
					</button>
					<button class="w3-button w3-white w3-hide-small">
						<i class="fa fa-map-pin w3-margin-right"></i>Art
					</button>
				</div>
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
				$("#insert").on("click",function(){
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
		 <c:if test="${err==null || err eq null}">	 
			 <div style="float: left;margin-left:50px;"><input type="checkbox" id="chkAll" onclick="All()"></div>
			 <br>
		 </c:if>
		 <c:forEach var="vo" items="${list }">	

		<div class="wrap_view">
			<c:choose>
				<c:when test="${err==null || err eq null}">
					<div class="img_profile">
						<img src="<c:url value='/resources/upload/${voMP.profile_savefilename }'/>" style="width:50px;" class="w3-round">
					</div>
					<div class="img_thumbnail">
						<a href="<c:url value='/videomain/getInfo?v_num=${vo.v_num }'/>" style="text-decoration:none;">
							<img src="<c:url value='/resources/upload/${vo.v_savethumbnail }'/>" style="height:180px;" class="w3-round">
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="img_profile">
						<img src="<c:url value='/resources/upload/default.jpg'/>" style="width:50px;" class="w3-round">
					</div>
					<div class="v_title">
						${err }
					</div>
				</c:otherwise>			
			</c:choose>
			
			<div class="v_article">
				<div> ${id } &nbsp;&nbsp; ${vo.v_regdate }</div>
				<div class="v_title">
					<a href="<c:url value='/videomain/getInfo?v_num=${vo.v_num }'/>">${vo.v_title }</a>
				</div>
				<div class="view">${vo.v_content }</div>
			</div>	
			<span class="chk"><input type="checkbox" value="${vo.v_num }" name="chk"></span>	
		</div>

		</c:forEach>
		<div style="padding-top:10px;">
		<c:if test="${sessionScope.id==requestScope.id }">
			<button type="submit" class="w3-button w3-black w3-round-large" style="float: right;margin-right:100px;"><i class="fa fa-trash-o"></i>삭제</button>
			<button type="button" class="w3-button w3-black w3-round-large" id="update" style="float: right;margin-right:5px;"><i class="fa fa-cogs"></i>수정</button>
			<button type="button" class="w3-button w3-black w3-round-large" id="insert" style="float: right;margin-right:5px;"><i class="fa fa-upload"></i>동영상업로드</button>
		</c:if>
		</div>
		</form>	
		
		<c:if test="${empty list}">
			<script type="text/javascript">
				$(function(){
					$("#page").css("margin-left","550px");
				});
			</script>
		</c:if>

		<!-- 페이징 -->
		<div class="w3-bar" id="page" style="margin-left:450px;">
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/${requestScope.id}/video/list?pageNum=${pu.startPageNum-1 }'/>" class="w3-bar-item w3-button w3-hover-black">이전</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">이전</a>
			</c:otherwise>
		</c:choose>
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<a href="#" class="w3-bar-item w3-button w3-hover-black">${i }</a>
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

		<footer class="w3-container w3-padding-32 w3-dark-grey">
			<div class="w3-row-padding">
				<div class="w3-third">
					<h3>FOOTER</h3>
					<p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo
						condimentum, porta lectus vitae, ultricies congue gravida diam non
						fringilla.</p>
					<p>
						Powered by <a href="https://www.w3schools.com/w3css/default.asp"
							target="_blank">w3.css</a>
					</p>
				</div>

				<div class="w3-third">
					<h3>BLOG POSTS</h3>
					<ul class="w3-ul w3-hoverable">
						<li class="w3-padding-16"><img src="/w3images/workshop.jpg"
							class="w3-left w3-margin-right" style="width: 50px"> <span
							class="w3-large">Lorem</span><br> <span>Sed mattis
								nunc</span></li>
						<li class="w3-padding-16"><img src="/w3images/gondol.jpg"
							class="w3-left w3-margin-right" style="width: 50px"> <span
							class="w3-large">Ipsum</span><br> <span>Praes tinci
								sed</span></li>
					</ul>
				</div>

				<div class="w3-third">
					<h3>POPULAR TAGS</h3>
					<p>
						<span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span
							class="w3-tag w3-grey w3-small w3-margin-bottom">New York</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">London</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">IKEA</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">NORWAY</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">DIY</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Ideas</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Baby</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Family</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">News</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Clothing</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Shopping</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Sports</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Games</span>
					</p>
				</div>

			</div>
		</footer>

		<div class="w3-black w3-center w3-padding-24">
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a>
		</div>



	</div>
</body>