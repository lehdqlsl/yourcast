<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/videogetInfo.css'/>?ver=1">
<link href="http://vjs.zencdn.net/6.2.8/video-js.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
<script src="http://vjs.zencdn.net/6.2.8/video.js"></script>
<style type="text/css">
.info {
	position: relative;
	z-index: 11;
	padding: 15px 0 0 100px;
	min-height: 80px;
	display: block;
}


.bjlogo {
	position: absolute;
	left: 0;
	top: 0;
	padding: 16px 0 0 1px;
}


dd.name {
	margin: 0;
	font-size: 14px;
	color: #328fde;
	font-weight: bold;
	padding: 0 0 8px;
}

.bj dt {
	width: 100%;
	font-size: 18px;
	line-height: 1.3em;
	font-weight: bold;
	color: #555;
	padding: 0 0 13px;
	margin: 0 0 0 -2px;
	word-wrap: break-word;
}

</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script>
	$(document).ready(function(){
		//동영상 번호
		var v_num=$("#v_num").val();
		//댓글 작성 유효성
		$("#vr_content").click(function(){
			if("${sessionScope.id}"){
				
			}else{
				var flag=confirm("먼저 로그인 하셔야 합니다. 로그인 페이지로 이동하시겠습니까?");
				if(flag){
					location.href="<c:url value='/member/login'/>";
				}
			}
		});
		//동영상 수정 페이지 이동
		$("#v_update").click(function(){
			location.href="<c:url value='/${vvo.id}/video/update?v_num=${vvo.v_num}'/>";
		});
		//동영상 삭제 페이지 이동
		$("#v_delete").click(function(){
			var flag=confirm("동영상을 삭제하시겠습니까?");
			if(flag){
				alert("삭제되었습니다!");
				location.href="<c:url value='/${vvo.id}/video/delete?v_num=${vvo.v_num}'/>";
			}
		});
		//댓글 작성
		$("#vr_reg").click(function(){
			var vr_content=$("#vr_content").val();
			var sid="${sessionScope.id}";
			var id="${vvo.id}";
			$.ajax({
				url:'<c:url value="/'+id+'/videoreply/insert?vr_content='+vr_content+'&sid='+sid+'&v_num='+v_num+'"/>',
				dataType:"xml",
				success:function(data){
					$("#vr_content").val("");
					$("#replylist").empty();
					$(data).find("list").each(function(){
						var id=$(this).find("id").text();
						var name=$(this).find("name").text();
						var vr_regdate=$(this).find("vr_regdate").text();
						var vr_content=$(this).find("vr_content").text();
						var vr_num=$(this).find("vr_num").text();
						var vrucnt=$(this).find("vrucnt").text();
						var p='';
						if(id=="${sessionScope.id}"){
							p="<p class='reply'><span style='color: #1559ff;font-weight: bold;'>"+name+"</span>&nbsp;&nbsp;<span style='color:#8F9299'>("+ id + ")</span>&nbsp;<span style='color: #8F9299;'>"+vr_regdate+"</span><br>"+vr_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_delete' style='float:right;'><i class='fa fa-trash-o' aria-hidden='true'></i></button>"+
							"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_up' id='"+vr_num+"' style='float:right;'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+vrucnt+"</b></button>"+
							"<span style='visibility:hidden;'>"+vr_num+"</span>"+
							"</p>";
						}else{
							p="<p class='reply'><span style='color: #1559ff;font-weight: bold;'>"+name+"</span>&nbsp;&nbsp;<span style='color:#8F9299'>("+ id + ")</span>&nbsp;<span style='color: #8F9299;'>"+vr_regdate+"</span><br>"+vr_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_report' style='float:right;'>"+
							"<i class='fa fa-exclamation-triangle' aria-hidden='true'></i></button>&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_up' id='"+vr_num+"' style='float:right;'>"+
							"<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>"+vrucnt+"</button><span style='visibility:hidden;'>"+vr_num+"</span></p>";
						}
						$.ajax({
							url:'<c:url value="/videoreply/vrcount?v_num='+v_num+'"/>',
							dataType:"json",
							success:function(data){
								//alert(data);
								$("#totalvrcount").text(data);
							}
						});
						$("#replylist").append(p);
					});
				}
			});
		});
		//댓글 삭제
		$("#replylist").on('click','.vr_delete',function(event){
			var vr_num=$(this).next().next().text();
			var flag=confirm("정말 삭제하시겠습니까?");
			if(flag){
				$.ajax({
					url:'<c:url value="/videoreply/delete?vr_num='+vr_num+'&v_num=${vvo.v_num}"/>',
					dataType:"xml",
					success:function(data){
						alert("삭제되었습니다!");
						$("#vr_content").val("");
						$("#replylist").empty();
						$(data).find("list").each(function(){
							var id=$(this).find("id").text();
							var name=$(this).find("name").text();
							var vr_regdate=$(this).find("vr_regdate").text();
							var vr_content=$(this).find("vr_content").text();
							var vr_num=$(this).find("vr_num").text();
							var vrucnt=$(this).find("vrucnt").text();
							var p='';
							if(id=="${sessionScope.id}"){
								p="<p class='reply'><span style='color: #1559ff;font-weight: bold;'>"+name+"</span>&nbsp;&nbsp;<span style='color:#8F9299'>("+ id + ")</span>&nbsp;<span style='color: #8F9299;'>"+vr_regdate+"</span><br>"+vr_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_delete' style='float:right;'><i class='fa fa-trash-o' aria-hidden='true'></i></button>"+
								
								"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_up' id='"+vr_num+"' style='float:right;'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+vrucnt+"</b></button>"+
								"<span style='visibility:hidden;'>"+vr_num+"</span>"+
								"</p>";
							}else{
								p="<p class='reply'><span style='color: #1559ff;font-weight: bold;'>"+name+"</span>&nbsp;&nbsp;<span style='color:#8F9299'>("+ id + ")</span>&nbsp;<span style='color: #8F9299;'>"+vr_regdate+"</span><br>"+vr_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_report' style='float:right;'>"+
								"<i class='fa fa-exclamation-triangle' aria-hidden='true'></i></button>&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_up' id='"+vr_num+"' style='float:right;'>"+
								"<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>"+vrucnt+"</button><span style='visibility:hidden;'>"+vr_num+"</span></p>";
							}
							$.ajax({
								url:'<c:url value="/videoreply/vrcount?v_num='+v_num+'"/>',
								dataType:"json",
								success:function(data){
									//alert(data);
									$("#totalvrcount").text(data);
								}
							});
							$("#replylist").append(p);
						});
					}
				});
			}
		});
		//처음에 다섯개 얻어오기
		$.ajax({
			url:'<c:url value="/videoreply/list?pageNum=1&v_num='+v_num+'"/>',
			dataType:'xml',
			success:function(data){
				console.log(data);
				$(data).find("list").each(function(){
					var id=$(this).find("id").text();
					var name=$(this).find("name").text();
					var vr_regdate=$(this).find("vr_regdate").text();
					var vr_content=$(this).find("vr_content").text();
					var vr_num=$(this).find("vr_num").text();
					var vrucnt=$(this).find("vrucnt").text();
					//alert(id+", "+vr_regdate+", "+vr_content+", "+vrucnt);
					var p='';
					if(id=="${sessionScope.id}"){
						p="<p class='reply'><span style='color: #1559ff;font-weight: bold;'>"+name+"</span>&nbsp;&nbsp;<span style='color:#8F9299'>("+ id + ")</span>&nbsp;<span style='color: #8F9299;'>"+vr_regdate+"</span><br>"+vr_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_delete' style='float:right;'><i class='fa fa-trash-o' aria-hidden='true'></i></button>"+
						"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_up' id='"+vr_num+"' style='float:right;'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+vrucnt+"</b></button>"+
						"<span style='visibility:hidden;'>"+vr_num+"</span>"+
						"</p>";
					}else{
						p="<p class='reply'><span style='color: #1559ff;font-weight: bold;'>"+name+"</span>&nbsp;&nbsp;<span style='color:#8F9299'>("+ id + ")</span>&nbsp;<span style='color: #8F9299;'>"+vr_regdate+"</span><br>"+vr_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_report' style='float:right;'>"+
						"<i class='fa fa-exclamation-triangle' aria-hidden='true'></i></button>&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_up' id='"+vr_num+"' style='float:right;'>"+
						"<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+vrucnt+"</b></button><span style='visibility:hidden;'>"+vr_num+"</span></p>";
					}
					$("#replylist").append(p);
				});
			}
		});
		//댓글 추가로 얻어오기
		$("#more").click(function(){
			var replycount=$(".reply").length;//보여지는 개수
			var rc=replycount/5+1;
			var vrcount=$("#totalvrcount").text();//총 개수
			if(vrcount==replycount){
				alert("더 이상 목록을 불러올 수 없습니다.");
				$("#more").prop("disabled",true);
			}
			$.ajax({
				url:'<c:url value="/videoreply/list?pageNum='+rc+'&v_num='+v_num+'"/>',
				dataType:'xml',
				success:function(data){
					console.log(data);
					$(data).find("list").each(function(){
						var id=$(this).find("id").text();
						var name=$(this).find("name").text();
						var vr_regdate=$(this).find("vr_regdate").text();
						var vr_content=$(this).find("vr_content").text();
						var vr_num=$(this).find("vr_num").text();
						var vrucnt=$(this).find("vrucnt").text();
						//alert(id+", "+vr_regdate+", "+vr_content+", "+vrucnt);
						var p='';
						if(id=="${sessionScope.id}"){
							p="<p class='reply'><span style='color: #1559ff;font-weight: bold;'>"+name+"</span>&nbsp;&nbsp;<span style='color:#8F9299'>("+ id + ")</span>&nbsp;<span style='color: #8F9299;'>"+vr_regdate+"</span><br>"+vr_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_delete' style='float:right;'><i class='fa fa-trash-o' aria-hidden='true'></i></button>"+
							
							"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_up' id='"+vr_num+"' style='float:right;'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+vrucnt+"</b></button>"+
							"<span style='visibility:hidden;'>"+vr_num+"</span>"+
							"</p>";
						}else{
							p="<p class='reply'><span style='color: #1559ff;font-weight: bold;'>"+name+"</span>&nbsp;<span style='color:#8F9299'>("+ id + ")</span>&nbsp;<span style='color: #8F9299;'>"+vr_regdate+"</span><br>"+vr_content+"&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_report'>"+
							"<i class='fa fa-exclamation-triangle' aria-hidden='true'></i></button>&nbsp;&nbsp;<button class='w3-button w3-light-grey w3-border w3-round-large vr_up' id='"+vr_num+"'>"+
							"<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>"+vrucnt+"</button><span style='visibility:hidden;'>"+vr_num+"</span></p>";
						}
						$("#replylist").append(p);
					});
				}
			});
		});
		//동영상 신고
		$("#v_report").click(function(){
			if("${sessionScope.id}"){
				var flag=confirm("동영상을 신고하시겠습니까?");
				if(flag){
					//alert("신고 되었습니다!");
					$.ajax({
						url:"<c:url value='/video/report?v_num="+v_num+"&id=${sessionScope.id}'/>",
						dataType:"json",
						success:function(data){
							//alert(data);
							if(data.result){
								alert("신고 되었습니다!");
							}else{
								alert("이미 신고한 동영상입니다.");
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
		//동영상 추천
		$("#v_up").click(function(){
			if("${sessionScope.id}"){
				$.ajax({
					url:"<c:url value='/video/up?v_num="+v_num+"&id=${sessionScope.id}'/>",
					dataType:"json",
					success:function(data){
						if(data.result){
							$("#v_upcount").html("&nbsp;&nbsp;<b>" + data.vucount + "</b>");
						}else{
							alert("이미 추천한 동영상입니다.");
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
		//동영상 댓글 신고
		$("#replylist").on("click",".vr_report",function(){
			if("${sessionScope.id}"){
				var vr_num=$(this).next().next().text();
				var flag=confirm("해당 댓글을 신고하시겠습니까?");
				if(flag){
					$.ajax({
						url:"<c:url value='/video/reply/report?vr_num="+vr_num+"&id=${sessionScope.id}'/>",
						dataType:"json",
						success:function(data){
							//alert(data);
							if(data.result){
								alert("댓글을 신고하였습니다!");
							}else{
								alert("이미 신고한 댓글입니다.");
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
		//동영상 댓글 추천
		$("#replylist").on("click",".vr_up",function(){
			if("${sessionScope.id}"){
				var btnid=$(this).attr("id");
				var vr_num=$(this).next().text();
				//alert(vr_num+"번 댓글 추천함");
				$.ajax({
					url:"<c:url value='/video/reply/up?vr_num="+vr_num+"&id=${sessionScope.id}'/>",
					dataType:"json",
					success:function(data){
						if(data.result){
							$("#"+btnid).html("<i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;&nbsp;<b>"+data.vrucount+"</b>");
						}else{
							alert("이미 추천한 댓글입니다.");
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
		//즐겨찾기
		$("#bookmark").click(function(){
			var color=$("#star").css("color");
			//alert(color);
			if(color == "rgb(255, 165, 0)"){//즐겨찾기 취소
				$.ajax({
					url:"<c:url value='/bookmark/delete?v_num=${vvo.v_num}'/>",
					dataType:"json",
					success:function(data){
						if(data.result){
							$("#star").css("color","#BDBDBD");
						}else{
							alert("오류가 발생했습니다.");
						}
					}
				});
				
			}else{//즐겨찾기 등록
				$.ajax({
					url:"<c:url value='/bookmark/insert?v_num=${vvo.v_num}'/>",
					dataType:"json",
					success:function(data){
						if(data.result){
							$("#star").css("color","orange");
						}else{
							alert("오류가 발생했습니다.");
						}
					}
				});
				
			}
		});
	});
</script>

<div class="w3-main" style="margin-left: 300px; margin-top: 54px;">
	<!-- <video controls="controls" style="width: 1300px;height:735px; "> -->
	<video id="example_video_1" class="video-js vjs-default-skin"
		controls autoplay preload="auto" width="1300" height="735"
		poster="<c:url value='/resources/upload/${vvo.v_savethumbnail}'/>"
		data-setup='{ "controls": true, "autoplay": true "preload": "auto" }'>
		<source src="<c:url value='/resources/upload/${vvo.v_savefilename}'/>" type="video/mp4">
		</video>
	<!-- </video> -->
	<div>
		<c:if test="${not empty sessionScope.id }">
			<c:choose>
			<c:when test="${bookmark==true }">
				<button class="w3-button w3-white" style="margin-left: 1185px" id="bookmark"><i class="fa fa-star" style="color:orange" id="star"></i>&nbsp;즐겨찾기</button>
			</c:when>
			<c:otherwise>
				<button class="w3-button w3-white" style="margin-left: 1185px" id="bookmark"><i class="fa fa-star" style="color:#BDBDBD" id="star"></i>&nbsp;즐겨찾기</button>
			</c:otherwise>
		</c:choose>
		</c:if>
		<hr style="width: 81%">
	</div>	
	<!-- 동영상 정보 -->
	<div class="info">
		<div class="bjlogo">
			<a href='<c:url value="/${vvo.id }"/>'><img src='<c:url value="/resources/upload/${vvo.profile_savefilename }"/>' class="w3-circle" style="width: 80px;height: 80px;"></a>
		</div>
		<dl class="bj">
			<dd class="name"><span style="color: #00416d;font-weight: bold;">${vvo.name }</span>&nbsp;<span style="color: #8f9299;">(${vvo.id })&nbsp;&nbsp;${vvo.v_regdate }</span></dd>
			<dt>${vvo.v_title }</dt>
		</dl>
	</div>
	
	<div class="etc">
		<c:choose>
			<c:when test="${sessionScope.id eq vvo.id }">
				<button class="w3-button w3-light-grey w3-border w3-round-large" id="v_update"><i class="fa fa-cogs" aria-hidden="true"></i></button>
				<button class="w3-button w3-light-grey w3-border w3-round-large" id="v_delete"><i class='fa fa-trash-o' aria-hidden='true'></i></button><br><br>
			</c:when>
			<c:otherwise>
				<button class="w3-button w3-light-grey w3-border w3-round-large" id="v_report"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></button>
				<button class="w3-button w3-light-grey w3-border w3-round-large" id="v_up"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i><span id="v_upcount">&nbsp;&nbsp;<b>${vucount }</b></span></button><br><br>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 댓글 작성 -->
	
	
	<div>		
		<input type="hidden" value="${vvo.v_num }" id="v_num" name="v_num">
		<div id="replyinsert">
			<textarea rows="4" cols="70" id="vr_content" name="vr_content" placeholder="다른 사람의 권리를 침해하는 내용은 제재 받을 수 있습니다" style="padding: 12px 20px;box-sizing: border-box;border: 2px solid #ccc;border-radius: 4px;background-color: #f8f8f8;resize: none;"></textarea>
		</div>
		<div>
			<button type="submit" form="target" value="Submit"  id="vr_reg"
			class="w3-button w3-border w3-round-large" style="background-color: #4C5870;"><i class="fa fa-check" style="color: white;"></i>
			<span style="color: #EBEDEC;">&nbsp;등록</span></button>
		</div>
	</div>
	<div id="vrcount">
		<h6 style="font-weight: bold;">댓글 : <span id="totalvrcount" style="color: #1559ff">${vrcount }</span></h6>
	</div>
	<div id="replylist">
	
	</div>
	<button class="w3-button w3-light-grey" id="more" style="width: 1300px"><b style="color: #00416D;">댓글 더보기 ∨</b></button>
</div>















