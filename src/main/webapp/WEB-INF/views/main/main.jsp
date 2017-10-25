<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 메인페이지 -->

<!-- 기본 페이지 레이아웃 아래 div영역으로 쓰세용.-->
<style>
.title {
	color: #19171c;
	margin-top: .5rem;
	font-size: 1.4rem;
	line-height: 2rem;
}

h3 {
	display: block;
	font-size: 1.17em;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	font-weight: bold;
}

.w3-row div p {
	font-size: 1.2rem;
	line-height: 2rem;
}
}
</style>
<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">
	<!-- 내용 -->
	<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
	<div class="w3-container w3-padding-32" id="projects">
		<c:choose>
			<c:when test="${genre_num == 0 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">전체보기</h3>
			</c:when>
			<c:when test="${genre_num == 1 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">게임</h3>
			</c:when>
			<c:when test="${genre_num == 2 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">모바일게임</h3>
			</c:when>
			<c:when test="${genre_num == 3 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">스포츠</h3>
			</c:when>
			<c:when test="${genre_num == 4 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">토크/캠방</h3>
			</c:when>
			<c:when test="${genre_num == 5 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">먹방/쿡방</h3>
			</c:when>
			<c:when test="${genre_num == 6 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">펫방</h3>
			</c:when>
			<c:when test="${genre_num == 7 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">음악</h3>
			</c:when>
			<c:when test="${genre_num == 8 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">학습</h3>
			</c:when>
			<c:when test="${genre_num == 9 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">생활/정보</h3>
			</c:when>
			<c:when test="${genre_num == 10 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">시사/현장</h3>
			</c:when>
			<c:when test="${genre_num == 11 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">더빙/라디오</h3>
			</c:when>
			<c:when test="${genre_num == 12 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">주식/금융</h3>
			</c:when>
			<c:when test="${genre_num == 13 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">애니</h3>
			</c:when>
			<c:when test="${genre_num == 14 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">지상파/케이블</h3>
			</c:when>
			<c:when test="${genre_num == 15 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">음악(스트리밍)</h3>
			</c:when>
			<c:when test="${genre_num == 16 }">
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">성인</h3>
			</c:when>
			<c:otherwise>
				<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">즐겨찾기</h3>
			</c:otherwise>
		</c:choose>

	</div>

	<c:set var="doneLoop" value="false" />
	<c:set var="vo" value="${requestScope.blist }" />
	<c:if test="${empty blist}">
		<div class="w3-row-padding ">
			<h5 style="font-weight: bold;">해당 카테고리에 대한 방송이 존재하지 않습니다.</h5>
		</div>
	</c:if>
	<c:if test="${requestScope.cnt>0}">
		<c:forEach varStatus="status1" begin="0" end="${requestScope.cnt }"
			step="1">
			<div class="w3-row-padding">
				<c:forEach var="vo" varStatus="status2" begin="${status1.index*4}"
					end="${status1.index*4+3}" step="1">
					<c:if test="${not doneLoop}">
						<div class="w3-col l3 m6 w3-margin-bottom">
							<div class="w3-display-container">
								<c:choose>
									<c:when test="${blist[status2.index].age_grade_num == 1}">
									<a
									href="http://192.168.0.4:8082/app/bs/${blist[status2.index].id}"
									style="text-decoration: none !important;"> <img
									src="http://192.168.0.31:3030/${blist[status2.index].stream_key }.png"
									class="w3-round-large w3-border w3-hover-opacity"
									style="width: 100%;">
									</c:when>
									<c:otherwise>
										<a
									href="http://192.168.0.4:8082/app/bs/${blist[status2.index].id}"
									style="text-decoration: none !important;"> <img
									src="<c:url value='/resources/upload/adult.png'/>"
									class="w3-round-large w3-border w3-hover-opacity"
									style="width: 100%;">
									</c:otherwise>
								</c:choose>
									<div class="w3-container">
										<h5>
											<b>${blist[status2.index].broadcast_title}</b>
										</h5></a>
								<p>
									<a
										href="http://192.168.0.4:8082/app/${blist[status2.index].id}"
										class="w3-hover-opacity"
										style="color: #328fde; text-decoration: none;">${blist[status2.index].name}</a>
									시청자수 ${blist[status2.index].cnt}
								</p>
							</div>

						</div>
			</div>
			<c:if test="${status2.index == requestScope.end}">
				<c:set var="doneLoop" value="true" />
			</c:if>
	</c:if>
	</c:forEach>
</div>
</c:forEach>
</c:if>
<script>
	var time = Math.random()*1000;
	$("img").each(function(){
		var src = $(this).attr('src')+"?time="+time;
		$(this).attr('src', src);
	});
</script>


