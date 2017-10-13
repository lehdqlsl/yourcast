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

p {
	font-size: 1.2rem;
	line-height: 2rem;
}
}
</style>
<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">
	<!-- 내용 -->
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">전체</h3>
	</div>

	<c:set var="doneLoop" value="false" />
	<c:set var="vo" value="${requestScope.blist }" />

	<c:if test="${requestScope.cnt>0}">
		<c:forEach varStatus="status1" begin="0" end="${requestScope.cnt }"
			step="1">
			<div class="w3-row-padding">
				<c:forEach var="vo" varStatus="status2" begin="${status1.index*4}"
					end="${status1.index*4+3}" step="1">
					<c:if test="${not doneLoop}">
						<div class="w3-col l3 m6 w3-margin-bottom">

							<div class="w3-display-container w3-hover-opacity">
								<a
									href="http://192.168.0.4:8082/app/bs/${blist[status2.index].id}">
									<img
									src="http://192.168.0.31:3030/${blist[status2.index].stream_key }.png"
									alt="House"
									style="width: 100%; text-decoration: none !important;">

								</a>
								<div class="w3-row">
									<div style="width: 100%; display: block; height: 20px; padding-left: 0px; margin-top: 5px;">
										<p style="margin: 0px 0px 0px 0px;	font-size: 1.4em;">${blist[status2.index].broadcast_title}</p>
									</div>
									<div style="width: 100%; display: block; height: 20px; padding-left: 0px;">
										<p style="margin: 5px 0px 0px 0px;	font-size: 1.0em; color: #6e6779;">${blist[status2.index].name}
											시청자수 ${blist[status2.index].cnt}</p>
									</div>
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

	<!-- About Section -->
	<div class="w3-container w3-padding-32" id="about">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">About</h3>
		<p>test</p>
	</div>

	

	<!-- Contact Section -->
	<div class="w3-container w3-padding-32" id="contact">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h3>
		<p>Lets get in touch and talk about your and our next project.</p>
		<form action="/action_page.php" target="_blank">
			<input class="w3-input" type="text" placeholder="Name" required name="Name"> 
			<input class="w3-input w3-section" type="text" placeholder="Email" required name="Email">
			<input	class="w3-input w3-section" type="text" placeholder="Subject" required name="Subject"> 
			<input class="w3-input w3-section" type="text" placeholder="Comment" required name="Comment">
			<button class="w3-button w3-black w3-section" type="submit"><i class="fa fa-paper-plane"></i> SEND MESSAGE</button>
		</form>
	</div>

	<!-- End page content -->
</div>


