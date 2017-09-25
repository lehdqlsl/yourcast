<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<b>My Portfolio</b>
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
			function delete(){
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
			function update(){
				var chk = document.getElementsByName("chk");
				var v_num = document.getElementsByName("v_num")[0];
				var cnt = 0;
				for(var i=0;i<chk.length;i++){
					if(chk[i].checked){
						v_num.value = chk[i].value;
						cnt++;
					}
				}
				if(cnt>1){
					alert("하나의 항목만 선택해주세요.");
					return false;
				}else if(cnt==0){
					alert("항목을 선택해주세요.");
				}else if(cnt==1){
					return true;
				}
			}
		</script>

		<h1>Video목록</h1>
		<form method="post" action="<c:url value='/${requestScope.id}/video/delete'/>" onsubmit="return delete()">
		<table border="1">
			<tr>
				<th><input type="checkbox" id="chkAll" onclick="All()"></th><th>글번호</th><th>관람등급</th><th>장르</th><th>제목</th><th>내용</th><th>등록일</th>
				<th>썸네일</th><th>조회수</th>
			</tr>
			
			<c:forEach var="vo" items="${list }">
				<tr>
					<td><input type="checkbox" value="${vo.v_num }" name="chk"></td>
					<td>${vo.v_num }</td>
					<td>${vo.genre_name }</td>
					<td>${vo.age_grade_name }</td>
					<td>${vo.v_title }</td>
					<td>${vo.v_content }</td>
					<td>${vo.v_regdate }</td>				
					<td><a href="<c:url value="/${id}/video/detail?v_num=${vo.v_num }"/>">
							<img src="<c:url value='/resources/upload/${vo.v_savethumbnail }'/>" style="width:50px;height:50px;">
							</a></td>
					<td>${vo.v_hit }</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${sessionScope.id==requestScope.id }">
			<input type="submit" value="삭제">
		</c:if>
		</form>	
		
		<c:if test="${sessionScope.id==requestScope.id }">
			<form method="get" action="<c:url value='/${requestScope.id}/video/update'/>" onsubmit="return update()">
				<input type="hidden" value="1" name="v_num">
				<input type="submit" value="수정">
			</form>	
		</c:if>
		
		<c:if test="${sessionScope.id==requestScope.id }">
			<a href="<c:url value="/${requestScope.id}/video/insert"/>">동영상업로드</a>
		</c:if>
		
		<!-- 페이징 -->
		<div>
		<c:choose>
			<c:when test="${pu.startPageNum>1 }">
				<a href="<c:url value='/${requestScope.id}/video/list?pageNum=${1 }'/>">[처음으로]</a>
			</c:when>
			<c:otherwise>
				[처음으로]
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/${requestScope.id}/video/list?pageNum=${pu.startPageNum-1 }'/>">[이전]</a>
			</c:when>
			<c:otherwise>
				[이전]
			</c:otherwise>
		</c:choose>
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<span style="color:blue">[${i }]</span>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/${requestScope.id}/video/list?pageNum=${i }'/>"><span style="color:#555">[${i }]</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<a href="<c:url value='/${requestScope.id}/video/list?pageNum=${pu.endPageNum+1 }'/>">[다음]</a>
			</c:when>
			<c:otherwise>
				[다음]
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pu.startPageNum<pu.totalPageCount }">
				<a href="<c:url value='/${requestScope.id}/video/list?pageNum=${pu.totalPageCount }'/>">[끝으로]</a>
			</c:when>
			<c:otherwise>
				[끝으로]
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