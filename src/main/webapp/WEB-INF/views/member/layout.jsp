<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

</head>
<!-- 메인페이지 레이아웃 -->
<body id="body">
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>

		<div id="main">
			<tiles:insertAttribute name="content" />
		</div>

		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>

<!-- 선물받은 별풍선 페이징 -->
	<script type="text/javascript">
	$("#datepicker").datepicker({
		showMonthAfterYear: true,
		dateFormat:"yy/mm/dd", //날짜포맷형식
		changeMonth:true,
		changeYear:true,
		yearSuffix:" ",
		showAnim:"slide"
	});
		$(document).ready(function(){
			$(".pagingR").filter(':first').css('color','red');
			$("#preRecv a").on('click',function(){
				var pageNum = parseInt($(".pagingR").filter(':first').text()) - 1;
				if(pageNum<5){
					return false;
				}
				$("#recvlistB").empty();
				$.ajax({
					url:"<c:url value='/member/history/recvStarPaging'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						$(data).find("recvlist").each(function(){
							var use_ea = $(this).find("use_ea").text();
							var id = $(this).find("id").text();
							var use_regdate = $(this).find("use_regdate").text();
							$("#recvlistT").append("<tr><th>" + use_ea + "</th><th>" + id + "</th><th>" + use_regdate + "</th></tr>");						
						});
					}
				});
				$("#pagingRecv").empty();
				$.ajax({
					url:"<c:url value='/member/history/recvStarPagingPre'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						for(var i=data-4;i<=data;i++){
							$("<a href='#' class='pagingR'>" + i + "</a>").appendTo("#pagingRecv").css('margin','4px').on('click',function(){
								var pageNum1 = $(this).text();
								$("#recvlistB").empty();
								$(".pagingR").removeAttr('style');
								$(".pagingR").css('margin','5px')
								$(this).css('color','red');
								$.ajax({
									url:"<c:url value='/member/history/recvStarPaging'/>",
									data:{"pageNum":pageNum},
									success:function(data){
										$(data).find("recvlist").each(function(){
											var use_ea = $(this).find("use_ea").text();
											var id = $(this).find("id").text();
											var use_regdate = $(this).find("use_regdate").text();
											$("#recvlistT").append("<tr><th>" + use_ea + "</th><th>" + id + "</th><th>" + use_regdate + "</th></tr>");						
										});
									}
								});
							});
						}
						$(".pagingR").filter(':first').css('color','red');
					}
				});
			});
			$(".pagingR").on('click',function move(){
				var pageNum = $(this).text();
				$("#recvlistB").empty();
				$(".pagingR").removeAttr('style');
				$(this).css('color','red');
				$.ajax({
					url:"<c:url value='/member/history/recvStarPaging'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						$(data).find("recvlist").each(function(){
							var use_ea = $(this).find("use_ea").text();
							var id = $(this).find("id").text();
							var use_regdate = $(this).find("use_regdate").text();
							$("#recvlistT").append("<tr><th>" + use_ea + "</th><th>" + id + "</th><th>" + use_regdate + "</th></tr>");						
						});
					}
				});
			});
			$("#nextRecv a").on('click',function(){
				var pageNum = parseInt($(".pagingR").filter(':last').text()) + 1;
				if((pageNum-1)%5!=0){
					return false;
				}
				$("#recvlistB").empty();
				$.ajax({
					url:"<c:url value='/member/history/recvStarPaging'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						$(data).find("recvlist").each(function(){
							var use_ea = $(this).find("use_ea").text();
							var id = $(this).find("id").text();
							var use_regdate = $(this).find("use_regdate").text();
							$("#recvlistT").append("<tr><th>" + use_ea + "</th><th>" + id + "</th><th>" + use_regdate + "</th></tr>");						
						});
					}
				});
				$("#pagingRecv").empty();
				$.ajax({
					url:"<c:url value='/member/history/recvStarPagingNext'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						for(var i=pageNum;i<=data;i++){
							$("<a href='#' class='pagingR'>" + i + "</a>&nbsp;").appendTo("#pagingRecv").css('margin','4px').on('click',function(){
								var pageNum1 = $(this).text();
								$("#recvlistB").empty();
								$(".pagingR").removeAttr('style');
								$(".pagingR").css('margin','5px')
								$(this).css('color','red');
								$.ajax({
									url:"<c:url value='/member/history/recvStarPaging'/>",
									data:{"pageNum":pageNum1},
									success:function(data){
										$(data).find("recvlist").each(function(){
											var use_ea = $(this).find("use_ea").text();
											var id = $(this).find("id").text();
											var use_regdate = $(this).find("use_regdate").text();
											$("#recvlistT").append("<tr><th>" + use_ea + "</th><th>" + id + "</th><th>" + use_regdate + "</th></tr>");						
										});
									}
								});
							});
						}
						$(".pagingR").filter(':first').css('color','red');
					}
				});
			});
		});		
	</script>
	
	<!-- 환전내역 페이징 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$(".pagingE").filter(':first').css('color','red');
			$("#preEx a").on('click',function(){
				var pageNum = parseInt($(".pagingE").filter(':first').text()) - 1;
				if(pageNum<5){
					return false;
				}
				$("#exlistB").empty();
				$.ajax({
					url:"<c:url value='/member/history/exStarPaging'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						$(data).find("exlist").each(function(){
							var e_ea = $(this).find("e_ea").text();
							var e_fee = $(this).find("e_fee").text();
							var sum = parseFloat(e_ea)*parseFloat(e_fee);
							var e_regdate = $(this).find("e_regdate").text();
							$("#exlistT").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "</th><th>" + parseInt(sum) + "</th><th>" + e_regdate + "</th></tr>");						
						});
					}
				});
				$("#pagingEx").empty();
				$.ajax({
					url:"<c:url value='/member/history/exStarPagingPre'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						for(var i=data-4;i<=data;i++){
							$("<a href='#' class='pagingE'>" + i + "</a>").appendTo("#pagingEx").css('margin','4px').on('click',function(){
								var pageNum1 = $(this).text();
								$("#exlistB").empty();
								$(".pagingE").removeAttr('style');
								$(".pagingE").css('margin','5px')
								$(this).css('color','red');
								$.ajax({
									url:"<c:url value='/member/history/exStarPaging'/>",
									data:{"pageNum":pageNum},
									success:function(data){
										$(data).find("exlist").each(function(){
											var e_ea = $(this).find("e_ea").text();
											var e_fee = $(this).find("e_fee").text();
											var sum = parseFloat(e_ea)*parseFloat(e_fee);
											var e_regdate = $(this).find("e_regdate").text();
											$("#exlistT").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "</th><th>" + parseInt(sum) + "</th><th>" + e_regdate + "</th></tr>");						
										});
									}
								});
							});
						}
						$(".pagingE").filter(':first').css('color','red');
					}
				});
			});
			$(".pagingE").on('click',function move(){
				var pageNum = $(this).text();
				$("#exlistB").empty();
				$(".pagingE").removeAttr('style');
				$(this).css('color','red');
				$.ajax({
					url:"<c:url value='/member/history/exStarPaging'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						$(data).find("exlist").each(function(){
							var e_ea = $(this).find("e_ea").text();
							var e_fee = $(this).find("e_fee").text();
							var sum = parseFloat(e_ea)*parseFloat(e_fee);
							var e_regdate = $(this).find("e_regdate").text();
							$("#exlistT").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "</th><th>" + parseInt(sum) + "</th><th>" + e_regdate + "</th></tr>");						
						});
					}
				});
			});
			$("#nextEx a").on('click',function(){
				var pageNum = parseInt($(".pagingE").filter(':last').text()) + 1;
				if((pageNum-1)%5!=0){
					return false;
				}
				$("#exlistB").empty();
				$.ajax({
					url:"<c:url value='/member/history/exStarPaging'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						$(data).find("exlist").each(function(){
							var e_ea = $(this).find("e_ea").text();
							var e_fee = $(this).find("e_fee").text();
							var sum = parseFloat(e_ea)*parseFloat(e_fee);
							var e_regdate = $(this).find("e_regdate").text();
							$("#exlistT").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "</th><th>" + parseInt(sum) + "</th><th>" + e_regdate + "</th></tr>");						
						});
					}
				});
				$("#pagingEx").empty();
				$.ajax({
					url:"<c:url value='/member/history/exStarPagingNext'/>",
					data:{"pageNum":pageNum},
					success:function(data){
						for(var i=pageNum;i<=data;i++){
							$("<a href='#' class='pagingE'>" + i + "</a>&nbsp;").appendTo("#pagingEx").css('margin','4px').on('click',function(){
								var pageNum1 = $(this).text();
								$("#exlistB").empty();
								$(".pagingE").removeAttr('style');
								$(".pagingE").css('margin','5px')
								$(this).css('color','red');
								$.ajax({
									url:"<c:url value='/member/history/exStarPaging'/>",
									data:{"pageNum":pageNum1},
									success:function(data){
										$(data).find("exlist").each(function(){
											var e_ea = $(this).find("e_ea").text();
											var e_fee = $(this).find("e_fee").text();
											var sum = parseFloat(e_ea)*parseFloat(e_fee);
											var e_regdate = $(this).find("e_regdate").text();
											$("#exlistT").append("<tr><th>" + e_ea + "</th><th>" + e_fee + "</th><th>" + parseInt(sum) + "</th><th>" + e_regdate + "</th></tr>");						
										});
									}
								});
							});
						}
						$(".pagingE").filter(':first').css('color','red');
					}
				});
			});
		});		
	</script>
</html>