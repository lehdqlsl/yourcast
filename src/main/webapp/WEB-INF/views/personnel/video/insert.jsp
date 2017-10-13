<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#btn").on("click",function(){
					if($("#v_title").val()==null || $("#v_title").val()==""){
						alert("제목을 입력하세요.");
						return false;
					}
					if($("#v_content").val()==null || $("#v_content").val()==""){
						alert("내용을 입력하세요.");
						return false;
					}
					if($("#vfile").val()==null || $("#vfile").val()==""){
						alert("동영상을 선택하세요.");
						return false;
					}
					if($("#imgfile").val()==null || $("#imgfile").val()==""){
						alert("썸네일을 선택하세요");
						return false;
					}
					$("#frm").submit();
				});
			});
		</script>

		<!-- 여기작성 -->

		<h1>동영상업로드</h1>
		<form id="frm" method="post" action="<c:url value="/${requestScope.id}/video/insert"/>" enctype="multipart/form-data">
		<table>
			<tr>
				<th>장르</th>
				<td>
					<select name="genre">
					<c:forEach var="gvo" items="${glist }">
						<option value="${gvo.genre_num }">${gvo.genre_name }</option>
					</c:forEach>
					</select>
					
				</td>
			</tr>
			<tr>
				<th>관람등급</th>
				<td>
					<select name="age_grade">
					<c:forEach var="agevo" items="${agelist }">
						<option value="${agevo.age_grade_num }">${agevo.age_grade_name }</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th><td><input type="text" name="v_title" id="v_title"><td>
			</tr>
			<tr>
				<th>내용</th><td><input type="text" name="v_content" id="v_content"></td>
			</tr>
			<tr>
				<th>동영상</th><td><input type="file" name="vfile" id="vfile"></td>
			</tr>
			<tr>
				<th>썸네일</th><td><input type="file" name="imgfile" id="imgfile"></td>
			</tr>
			<tr>
				<th colspan="2"><button type="button" id="btn">업로드</button><input type="reset" value="다시입력"></th>
			</tr>
		</table>
		</form>
		
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