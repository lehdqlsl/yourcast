<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/getinfo.css'/>?ver=5">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
							p="<p class='reply'><span style='color: #00416D;font-weight: bold;'>"+id+"</span>&nbsp;&nbsp;<span style='color: #8F9299;'>"+br_regdate+"</span><br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_delete'  style='float:right;'><i class='fa fa-trash-o' aria-hidden='true'></i></button>"+
							"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_up' id='"+br_num+"' style='float:right;'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+brucnt+"</b></button>"+
							"<span style='visibility:hidden;'>"+br_num+"</span>"+
							"</p>";
						}else{
							p="<p class='reply'><span style='color: #00416D;font-weight: bold;'>"+id+"</span>&nbsp;&nbsp;<span style='color: #8F9299;'>"+br_regdate+"</span><br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_report'  style='float:right;'>"+
							"<i class='fa fa-exclamation-triangle' aria-hidden='true'></i></button>&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_up' id='"+br_num+"' style='float:right;'>"+
							"<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+brucnt+"</b></button><span style='visibility:hidden;'>"+br_num+"</span></p>";
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
								p="<p class='reply'><span style='color: #00416D;font-weight: bold;'>"+id+"</span>&nbsp;&nbsp;<span style='color: #8F9299;'>"+br_regdate+"</span><br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_delete'  style='float:right;'><i class='fa fa-trash-o' aria-hidden='true'></i></button>"+
								"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_up' id='"+br_num+"' style='float:right;'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+brucnt+"</b></button>"+
								"<span style='visibility:hidden;'>"+br_num+"</span>"+
								"</p>";
							}else{
								p="<p class='reply'><span style='color: #00416D;font-weight: bold;'>"+id+"</span>&nbsp;&nbsp;<span style='color: #8F9299;'>"+br_regdate+"</span><br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_report'  style='float:right;'>"+
								"<i class='fa fa-exclamation-triangle' aria-hidden='true'></i></button>&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_up' id='"+br_num+"' style='float:right;'>"+
								"<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+brucnt+"</b></button><span style='visibility:hidden;'>"+br_num+"</span></p>";
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
						p="<p class='reply'><span style='color: #00416D;font-weight: bold;'>"+id+"</span>&nbsp;&nbsp;<span style='color: #8F9299;'>"+br_regdate+"</span><br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_delete'  style='float:right;'><i class='fa fa-trash-o' aria-hidden='true'></i></button>"+
						"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_up' id='"+br_num+"' style='float:right;'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+brucnt+"</b></button>"+
						"<span style='visibility:hidden;'>"+br_num+"</span>"+
						"</p>";
					}else{
						p="<p class='reply'><span style='color: #00416D;font-weight: bold;'>"+id+"</span>&nbsp;&nbsp;<span style='color: #8F9299;'>"+br_regdate+"</span><br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_report'  style='float:right;'>"+
						"<i class='fa fa-exclamation-triangle' aria-hidden='true'></i></button>&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_up' id='"+br_num+"' style='float:right;'>"+
						"<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+brucnt+"</b></button><span style='visibility:hidden;'>"+br_num+"</span></p>";
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
								p="<p class='reply'><span style='color: #00416D;font-weight: bold;'>"+id+"</span>&nbsp;&nbsp;<span style='color: #8F9299;'>"+br_regdate+"</span><br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_delete'  style='float:right;'><i class='fa fa-trash-o' aria-hidden='true'></i></button>"+
								"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_up' id='"+br_num+"' style='float:right;'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+brucnt+"</b></button>"+
								"<span style='visibility:hidden;'>"+br_num+"</span>"+
								"</p>";
							}else{
								p="<p class='reply'><span style='color: #00416D;font-weight: bold;'>"+id+"</span>&nbsp;&nbsp;<span style='color: #8F9299;'>"+br_regdate+"</span><br>"+br_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_report'  style='float:right;'>"+
								"<i class='fa fa-exclamation-triangle' aria-hidden='true'></i></button>&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large br_up' id='"+br_num+"' style='float:right;'>"+
								"<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+brucnt+"</b></button><span style='visibility:hidden;'>"+br_num+"</span></p>";
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
						  	$("#"+br_num).html("<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>" + data.replygetCount + "</b>");
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
							$("#thumbs_up").html("<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>" + data.getCount + "</b>");
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
	<div class="w3-main" style="margin-left: 300px;width: 980px;">

		<!-- Header -->
		<header id="portfolio">
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<div class="w3-container">
				<div class="link-2">
				<h1>
					<a href="<c:url value='/${requestScope.id }'/>" class="maintitle">
					<b>${voMP.profile_title }</b></a>
				</h1>
			</div>
				<div class="w3-section w3-bottombar w3-padding-16"  style="width: 1000px;">
				</div>
			</div>
		</header>
		<!-- 여기작성 -->
	
		<div class="wrap_view">
			<div class="img_profile">
				<img src="<c:url value='/resources/upload/${voMP.profile_savefilename }'/>"
					onerror="this.src='http://www.afreecatv.com/images/afmain/img_thumb_profile.gif';" style="width: 50px;height: 50px;border-radius: 25px;">
			</div>
			<div class="hit">조회수&nbsp;&nbsp;<b>${vo.b_hit }</b>&nbsp;&nbsp; | &nbsp;&nbsp;
			<a href="#" id="report" class="w3-hover-opacity" style="text-decoration: none">신고</a></div>
			<div id="info">
				작성자 : <span style="color: #1559ff;font-weight: bold;">${vo.id }</span>&nbsp;&nbsp;${vo.b_regdate }<br>
						<h4><c:if test="${vo.b_notice == 1 }">
								<span class="noti"></span>
							</c:if>${vo.b_title }</h4>
				
			</div>
			<div id="b_content">
				${vo.b_content}
			</div>

			<div id="edit">
				<c:choose>
					<c:when test="${sessionScope.id eq vo.id }">
						<br><br>
						<a href="#" id="b_update" class="w3-hover-opacity" style="text-decoration: none; color: grey;">수정</a>
						&nbsp;<a href="#" id="b_delete" class="w3-hover-opacity" style="text-decoration: none; color: grey;">삭제</a> 
					</c:when>
					<c:otherwise>
						<br><br>
						<button id="thumbs_up" class="w3-button w3-light-grey w3-border w3-round-large" style="margin-left: 490px;">
						<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>&nbsp;&nbsp;<b>${getCountInfo}</b></button>
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
				<button class="w3-button w3-border w3-round-large" id="br_reg" style="background-color: #4C5870"><span style="color: #EBEDEC;">등록</span></button>
			</div>
			<h6 style="font-weight: bold;">댓글 : <span id="totalbrcount" style="color: #1559ff">${brcount }</span> </h6>
			<div id="replylist">
				
			</div>
			<button class="w3-button w3-light-grey" id="more" style="width: 980px"><b style="color: #00416D;">댓글 더보기 ∨</b></button>
			
			<div class="w3-light-grey w3-center w3-padding-24" style="width: 980px; font-size: 11px; border-top: 1px solid #CFCFCF;margin-top: 100px;">
				All Contents Copyright ©Your Cast...Co.,Ltd. All Rights Reserved.
			</div>
		</div>

		<!-- 작성END -->


	</div>
</body>