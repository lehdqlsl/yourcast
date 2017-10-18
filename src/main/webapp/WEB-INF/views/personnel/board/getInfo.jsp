<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/boardgetInfo.css'/>?ver=1">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script>
	$(document).ready(function(){
		//댓글 유효성 검사
		//1. 로그인 여부 검사(o)
		$("#br_content").click(function(){
			if("${sessionScope.id}"){//로그인 한 경우
			}else{//로그인 안 한 경우
				var flag=confirm("먼저 로그인 하셔야 합니다. 로그인 페이지로 이동하시겠습니까?");
				location.href="<c:url value='/member/login'/>";
				
			}
		});
		////////////////////////////////////////////////////////////////////////////////		
		//글 삭제 하기(o)
		$("#b_delete").click(function(){
			var flag=confirm("정말 삭제하시겠습니까?");
			if(flag){
				location.href='<c:url value="/${sessionScope.id }/board/delete?b_num=${vo.b_num }&category_num=${category_num }"/>';
			}
		});
		//글 수정 하기(o)
		$("#b_update").click(function(){
			location.href='<c:url value="/${sessionScope.id }/board/update?b_num=${vo.b_num }&category_num=${category_num }"/>';
		});
		//댓글 추가 하기(o)
		$("#br_reg").click(function(){
			var br_content=$("#br_content").val();
			var b_num="${vo.b_num}";
			$.ajax({
				url:"<c:url value='/${vo.id}/boardreply/insert?br_content="+br_content+"&b_num="+b_num+"'/>",
				dataType:"xml",
				success:function(data){
					//alert(data);
					$("#br_content").val("");
					$("#replylist").empty();
					$(data).find("list").each(function(){
						var id=$(this).find("id").text();
						var br_regdate=$(this).find("br_regdate").text();
						var br_content=$(this).find("br_content").text();
						var br_num=$(this).find("br_num").text();
						var brucnt=$(this).find("brucnt").text();
						var p="";
						if(id=="${sessionScope.id}"){
							p="<p class='reply'>"+id+"&nbsp;&nbsp;"+br_regdate+"<br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-black w3-round-large br_delete'><i class='fa fa-trash-o' aria-hidden='true'></i></button>"+
							"&nbsp;&nbsp;<button class='w3-button w3-teal w3-round-large br_up' id='"+br_num+"'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>"+brucnt+"</button>"+
							"<span style='visibility:hidden;'>"+br_num+"</span>"+
							"</p>";
						}else{
							p="<p class='reply'>"+id+"&nbsp;&nbsp;"+br_regdate+"<br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-red w3-round-large br_report'>"+
							"<i class='fa fa-exclamation-triangle' aria-hidden='true'></i></button>&nbsp;&nbsp;<button class='w3-button w3-teal w3-round-large br_up' id='"+br_num+"'>"+
							"<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>"+brucnt+"</button><span style='visibility:hidden;'>"+br_num+"</span></p>";
						}
						$("#replylist").append(p);
					});
					$.ajax({
						url:'<c:url value="/boardreply/brcount?b_num=${vo.b_num}"/>',
						dataType:"json",
						success:function(data){
							$("#totalbrcount").text(data);
						}
					});
				}
			});
		});
		//댓글 삭제 하기(o)
		$("#replylist").on('click','.br_delete',function(event){
			var br_num=$(this).next().next().text();
			var flag=confirm("정말 삭제하시겠습니까?");
			if(flag){
				$.ajax({
					url:"<c:url value='/${vo.id}/boardreply/delete?br_num="+br_num+"'/>",
					dataType:"xml",
					success:function(data){
						$("#replylist").empty();
						$(data).find("list").each(function(){
							var id=$(this).find("id").text();
							var br_regdate=$(this).find("br_regdate").text();
							var br_content=$(this).find("br_content").text();
							var br_num=$(this).find("br_num").text();
							var brucnt=$(this).find("brucnt").text();
							var p="";
							if(id=="${sessionScope.id}"){
								p="<p class='reply'>"+id+"&nbsp;&nbsp;"+br_regdate+"<br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-black w3-round-large br_delete'><i class='fa fa-trash-o' aria-hidden='true'></i></button>"+
								"&nbsp;&nbsp;<button class='w3-button w3-teal w3-round-large br_up' id='"+br_num+"'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>"+brucnt+"</button>"+
								"<span style='visibility:hidden;'>"+br_num+"</span>"+
								"</p>";
							}else{
								p="<p class='reply'>"+id+"&nbsp;&nbsp;"+br_regdate+"<br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-red w3-round-large br_report'>"+
								"<i class='fa fa-exclamation-triangle' aria-hidden='true'></i></button>&nbsp;&nbsp;<button class='w3-button w3-teal w3-round-large br_up' id='"+br_num+"'>"+
								"<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>"+brucnt+"</button><span style='visibility:hidden;'>"+br_num+"</span></p>";
							}
							$("#replylist").append(p);
						});
						$.ajax({
							url:'<c:url value="/boardreply/brcount?b_num=${vo.b_num}"/>',
							dataType:"json",
							success:function(data){
								$("#totalbrcount").text(data);
							}
						});
					}
				});
			}
		});
		//댓글 처음 5개 출력(o)
		$.ajax({
			url:'<c:url value="/${requestScope.id}/boardreply/list?pageNum=1&b_num=${b_num}&category_num=${category_num}"/>',
			dataType:"xml",
			success:function(data){
				$(data).find("list").each(function(){
					var id=$(this).find("id").text();
					var br_regdate=$(this).find("br_regdate").text();
					var br_content=$(this).find("br_content").text();
					var br_num=$(this).find("br_num").text();
					var brucnt=$(this).find("brucnt").text();
					var p="";
					if(id=="${sessionScope.id}"){
						p="<p class='reply'>"+id+"&nbsp;&nbsp;"+br_regdate+"<br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-black w3-round-large br_delete'><i class='fa fa-trash-o' aria-hidden='true'></i></button>"+
						"&nbsp;&nbsp;<button class='w3-button w3-teal w3-round-large br_up' id='"+br_num+"'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>"+brucnt+"</button>"+
						"<span style='visibility:hidden;'>"+br_num+"</span>"+
						"</p>";
					}else{
						p="<p class='reply'>"+id+"&nbsp;&nbsp;"+br_regdate+"<br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-red w3-round-large br_report'>"+
						"<i class='fa fa-exclamation-triangle' aria-hidden='true'></i></button>&nbsp;&nbsp;<button class='w3-button w3-teal w3-round-large br_up' id='"+br_num+"'>"+
						"<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>"+brucnt+"</button><span style='visibility:hidden;'>"+br_num+"</span></p>";
					}
					$("#replylist").append(p);
				});
			}
		});
		//댓글 추가로 목록 불러오기(o)
		$("#more").click(function(){
			var replycount=$(".reply").length;
			var rc=replycount/5+1;
			if("${brcount}"==replycount){
				alert("더 이상 목록을 불러올 수 없습니다.");
				$("#more").prop("disabled",true);
				//event.preventDefault();
			}else{
				//alert(replycount);
				$.ajax({
					url:'<c:url value="/${requestScope.id}/boardreply/list?pageNum='+rc+'&b_num=${b_num}&category_num=${category_num}"/>',
					dataType:"xml",
					success:function(data){
						$(data).find("list").each(function(){
							var id=$(this).find("id").text();
							//alert(id);
							var br_regdate=$(this).find("br_regdate").text();
							var br_content=$(this).find("br_content").text();
							var br_num=$(this).find("br_num").text();
							var brucnt=$(this).find("brucnt").text();
							//console.log(id);
							var p="";
							if(id=="${sessionScope.id}"){
								p="<p class='reply'>"+id+"&nbsp;&nbsp;"+br_regdate+"<br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-black w3-round-large br_delete'><i class='fa fa-trash-o' aria-hidden='true'></i></button>"+
								"&nbsp;&nbsp;<button class='w3-button w3-teal w3-round-large br_up' id='"+br_num+"'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>"+brucnt+"</button>"+
								"<span style='visibility:hidden;'>"+br_num+"</span>"+
								"</p>";
							}else{
								p="<p class='reply'>"+id+"&nbsp;&nbsp;"+br_regdate+"<br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-red w3-round-large br_report'>"+
								"<i class='fa fa-exclamation-triangle' aria-hidden='true'></i></button>&nbsp;&nbsp;<button class='w3-button w3-teal w3-round-large br_up' id='"+br_num+"'>"+
								"<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>"+brucnt+"</button><span style='visibility:hidden;'>"+br_num+"</span></p>";
							}
							$("#replylist").append(p);
						});
					}
				});
			}
		});
		//댓글추천
		$("#replylist").on('click','.br_up',function(){
			if("${sessionScope.id}"){
				var br_num=$(this).attr("id");
				$.ajax({
					url:"<c:url value='/replyup/insert?br_num=" + br_num + "&m_num=${sessionScope.id}'/>",
					dataType:"json",
					success:function(data) {
						if(data.result=="true") {
							alert("이미 추천 하셨습니다");
						} else {
						  	$("#"+br_num).html("<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>" + data.replygetCount);
						}
					}
				});
			}else{
				var flag=confirm("먼저 로그인 하셔야 합니다. 로그인 페이지로 이동하시겠습니까?");
				if(flag){
					location.href="<c:url value='/member/login'/>";
				}
			}
		});  
		//댓글신고
		$("#replylist").on('click','.br_report',function(){
			if("${sessionScope.id}"){
				var br_num=$(this).next().next().text();
				var flag = confirm("신고 하시겠습니까?");
				if(flag){
					$.ajax({
						url:"<c:url value='/replyreport/insert?br_num=" + br_num +"&m_num=${sessionScope.id}'/>",
						dataType:"json",
						success:function(data){
							if(data.result=="true"){
								alert("이미 신고하셨습니다.");
							}
							else{
								alert("신고 되었습니다.");
							}
						}		
					});  
				}
			}else{
				var flag=confirm("먼저 로그인 하셔야 합니다. 로그인 페이지로 이동하시겠습니까?");
				if(flag){
					location.href="<c:url value='/member/login'/>";
				}
			}
			
		});
		//게시물 신고
		$("#report").click(function() {
			if("${sessionScope.id}"){
				var b_report = confirm("신고 하시겠습니까?");
				if(b_report == true){
					$.ajax({
						url:"<c:url value='/report/insert?b_num=${b_num}&m_num=${sessionScope.id}'/>",
						dataType:"json",
						success:function(data){
							if(data.result=="true"){
								alert("이미 신고하셨습니다.");
							}
							else{
								alert("신고 되었습니다.");
							}
						}		
					});
				}
			}else{
				var flag=confirm("먼저 로그인 하셔야 합니다. 로그인 페이지로 이동하시겠습니까?");
				if(flag){
					location.href="<c:url value='/member/login'/>";
				}
			}
		});
		//게시물 좋아요
		$("#thumbs_up").click(function() {
			if("${sessionScope.id}"){
				$.ajax({
					url:"<c:url value='/boardup/insert?b_num=${b_num}&m_num=${sessionScope.id}'/>",
					dataType:"json",
					success:function(data) {
						if(data.result=="true") {
							alert("이미 추천 하셨습니다.");
						} else {
							$("#thumbs_up").html("<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>" + data.getCount);
						}
					}
				});
			}else{
				var flag=confirm("먼저 로그인 하셔야 합니다. 로그인 페이지로 이동하시겠습니까?");
				if(flag){
					location.href="<c:url value='/member/login'/>";
				}
			}
		});
	});
</script>
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
	
		<div>
			<div class="img_profile">
				<img src=""
					onerror="this.src='http://www.afreecatv.com/images/afmain/img_thumb_profile.gif';">
			</div>
			<div id="info">
				<!-- 이미지 -->
				작성자 : ${vo.id }&nbsp;&nbsp;${vo.b_regdate }
			</div>
			<h2>${vo.b_title }</h2>
			<div id="etc">
				${vo.b_hit }&nbsp;&nbsp;
			</div>
			<div id="b_content">
				${vo.b_content}
			</div>

			<div id="edit">
				<c:choose>
					<c:when test="${sessionScope.id eq vo.id }">
						<br><br>
						<button id="b_delete">삭제</button>
						<button id="b_update">수정</button>
					</c:when>
					<c:otherwise>
						<br><br>
						<button id="report"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></button>
						<button id="thumbs_up"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>${getCountInfo}</button>
					</c:otherwise>
				</c:choose>
			</div>
			<br>

			<!-- 댓글 영역 -->
			<div>
				<input type="hidden" value="${vo.b_num }" name="b_num">
				<div id="replyinsert">
					<textarea rows="4" cols="70" id="br_content" name="br_content" placeholder="다른 사람의 권리를 침해하는 내용은 제재 받을 수 있습니다" style="padding: 12px 20px;box-sizing: border-box;border: 2px solid #ccc;border-radius: 4px;background-color: #f8f8f8;resize: none;"></textarea>
				</div>
				<button class="w3-button w3-black w3-round-large" id="br_reg">등록</button>
			</div>
			<h6>댓글 : <span id="totalbrcount">${brcount }</span> </h6>
			<div id="replylist">
				
			</div>
			<button class="w3-button w3-black" id="more" style="width: 1300px">더보기</button>
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