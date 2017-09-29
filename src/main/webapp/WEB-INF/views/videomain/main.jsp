<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 메인페이지 -->

<!-- 기본 페이지 레이아웃 아래 div영역으로 쓰세용.-->
<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">
	<!-- About Section -->
	<div class="w3-container w3-padding-32" id="about">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">비디오 메인 페이지</h3>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
			eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
			ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
			aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat
			non proident, sunt in culpa qui officia deserunt mollit anim id est
			laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt
			ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
			nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
			consequat.</p>
	</div>

	<div class="w3-row-padding w3-grayscale">
		<div class="w3-col l3 m6 w3-margin-bottom">
			<img src="/w3images/team2.jpg" alt="John" style="width: 100%">
			<h3>John Doe</h3>
			<p class="w3-opacity">CEO & Founder</p>
			<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse
				sodales pellentesque elementum.</p>
			<p>
				<button class="w3-button w3-light-grey w3-block">Contact</button>
			</p>
		</div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<img src="/w3images/team1.jpg" alt="Jane" style="width: 100%">
			<h3>Jane Doe</h3>
			<p class="w3-opacity">Architect</p>
			<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse
				sodales pellentesque elementum.</p>
			<p>
				<button class="w3-button w3-light-grey w3-block">Contact</button>
			</p>
		</div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<img src="/w3images/team3.jpg" alt="Mike" style="width: 100%">
			<h3>Mike Ross</h3>
			<p class="w3-opacity">Architect</p>
			<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse
				sodales pellentesque elementum.</p>
			<p>
				<button class="w3-button w3-light-grey w3-block">Contact</button>
			</p>
		</div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<img src="/w3images/team4.jpg" alt="Dan" style="width: 100%">
			<h3>Dan Star</h3>
			<p class="w3-opacity">Architect</p>
			<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse
				sodales pellentesque elementum.</p>
			<p>
				<button class="w3-button w3-light-grey w3-block">Contact</button>
			</p>
		</div>
	</div>

	<!-- Contact Section -->
	<div class="w3-container w3-padding-32" id="contact">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h3>
		<p>Lets get in touch and talk about your and our next project.</p>
		<form action="/action_page.php" target="_blank">
			<input class="w3-input" type="text" placeholder="Name" required
				name="Name"> <input class="w3-input w3-section" type="text"
				placeholder="Email" required name="Email"> <input
				class="w3-input w3-section" type="text" placeholder="Subject"
				required name="Subject"> <input class="w3-input w3-section"
				type="text" placeholder="Comment" required name="Comment">
			<button class="w3-button w3-black w3-section" type="submit">
				<i class="fa fa-paper-plane"></i> SEND MESSAGE
			</button>
		</form>
	</div>

	<!-- End page content -->
</div>

