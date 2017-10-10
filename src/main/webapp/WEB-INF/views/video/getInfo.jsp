<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script>
	$(document).ready(function(){
		//동영상 번호
		var v_num=$("#v_num").val();
		//댓글 작성
		$("#vr_reg").click(function(){
			var vr_content=$("#vr_content").val();
			var sid="${sessionScope.id}";
			var id="${vvo.id}";
			$.ajax({
				url:'<c:url value="/'+id+'/videoreply/insert?vr_content='+vr_content+'&sid='+sid+'&v_num='+v_num+'"/>',
				dataType:"xml",
				success:function(data){
					alert("댓글을 추가하였습니다!");
					$("#vr_content").val("");
					$(".reply").empty();
					$(data).find("list").each(function(){
						var id=$(this).find("id").text();
						var vr_regdate=$(this).find("vr_regdate").text();
						var vr_content=$(this).find("vr_content").text();
						var vr_num=$(this).find("vr_num").text();
						var vrucnt=$(this).find("vrucnt").text();
						var p='';
						if(id=="${sessionScope.id}"){
							p="<p class='reply'>"+id+"&nbsp;&nbsp;"+vr_content+"&nbsp;&nbsp;"+vr_regdate+"&nbsp;&nbsp;<button class='w3-button w3-black w3-round-large vr_delete'>삭제</button>"+
							"<a href='#' class='replyup'>추천["+vrucnt+"]</a>"+
							"<span style='visibility:hidden;'>"+vr_num+"</span>"+
							"</p>";
						}else{
							p="<p class='reply'>"+id+"&nbsp;&nbsp;"+vr_content+"&nbsp;&nbsp;"+vr_regdate+"&nbsp;&nbsp;<a>신고</a>&nbsp;&nbsp;<a href='#' class='replyup'>추천["+vrucnt+"]</a></p>";
						}
						$.ajax({
							url:'<c:url value="/videoreply/vrcount?v_num='+v_num+'"/>',
							dataType:"json",
							success:function(data){
								//alert(data);
								$("#vrcount").text("댓글 : "+data);
							}
						});
						$("#replylist").append(p);
					});
				}
			});
			
		
		});
		//처음에 다섯개 얻어오기
		$.ajax({
			url:'<c:url value="/videoreply/list?pageNum=1&v_num='+v_num+'"/>',
			dataType:'xml',
			success:function(data){
				//alert(data);
				$(data).find("list").each(function(){
					var id=$(this).find("id").text();
					var vr_regdate=$(this).find("vr_regdate").text();
					var vr_content=$(this).find("vr_content").text();
					var vr_num=$(this).find("vr_num").text();
					var vrucnt=$(this).find("vrucnt").text();
					//alert(id+", "+vr_regdate+", "+vr_content+", "+vrucnt);
					var p='';
					if(id=="${sessionScope.id}"){
						p="<p class='reply'>"+id+"&nbsp;&nbsp;"+vr_content+"&nbsp;&nbsp;"+vr_regdate+"&nbsp;&nbsp;<button class='w3-button w3-black w3-round-large vr_delete'>삭제</button>"+
						"<a href='#' class='replyup'>추천["+vrucnt+"]</a>"+
						"<span style='visibility:hidden;'>"+vr_num+"</span>"+
						"</p>";
					}else{
						p="<p class='reply'>"+id+"&nbsp;&nbsp;"+vr_content+"&nbsp;&nbsp;"+vr_regdate+"&nbsp;&nbsp;<a>신고</a>&nbsp;&nbsp;<a href='#' class='replyup'>추천["+vrucnt+"]</a></p>";
					}
					$("#replylist").append(p);
				});
			}
		});
		//댓글 추가로 얻어오기
		$("#more").click(function(){
			var replycount=$(".reply").length;//보여지는 개수
			var rc=replycount/5+1;
			var vrcount=$("#vrcount").text();//총 개수
			if(vrcount==replycount){
				alert("더 이상 목록을 불러올 수 없습니다.");
				$("#more").prop("disabled",true);
			}
			$.ajax({
				url:'<c:url value="/videoreply/list?pageNum='+rc+'&v_num='+v_num+'"/>',
				dataType:'xml',
				success:function(data){
					//alert(data);
					$(data).find("list").each(function(){
						var id=$(this).find("id").text();
						var vr_regdate=$(this).find("vr_regdate").text();
						var vr_content=$(this).find("vr_content").text();
						var vr_num=$(this).find("vr_num").text();
						var vrucnt=$(this).find("vrucnt").text();
						//alert(id+", "+vr_regdate+", "+vr_content+", "+vrucnt);
						var p='';
						if(id=="${sessionScope.id}"){
							p="<p class='reply'>"+id+"&nbsp;&nbsp;"+vr_content+"&nbsp;&nbsp;"+vr_regdate+"&nbsp;&nbsp;<button class='w3-button w3-black w3-round-large vr_delete'>삭제</button>"+
							"<a href='#' class='replyup'>추천["+vrucnt+"]</a>"+
							"<span style='visibility:hidden;'>"+vr_num+"</span>"+
							"</p>";
						}else{
							p="<p class='reply'>"+id+"&nbsp;&nbsp;"+vr_content+"&nbsp;&nbsp;"+vr_regdate+"&nbsp;&nbsp;<a href='#'>신고</a>&nbsp;&nbsp;<a href='#' class='replyup'>추천["+vrucnt+"]</a></p>";
						}
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
				alert("삭제되었습니다!");
				location.href='<c:url value="/videoreply/delete?vr_num='+vr_num+'&v_num=${vvo.v_num}"/>';
			}
		});
	});
</script>
<div class="w3-main" style="margin-left: 300px; margin-top: 54px;">
	<h1>동영상 조회 페이지</h1>
	<p>제목 : ${vvo.v_title }</p>
	<video controls="controls" style="width: 1300px;height:735px; ">
		<source src="<c:url value='/resources/upload/${vvo.v_savefilename}'/>" type="video/mp4">
	</video>	
	<!-- 동영상 정보 -->
	<div>
		<a href='<c:url value="/${vvo.id }"/>'><img src='<c:url value="/resources/upload/${vvo.profile_savefilename }"/>' style="width: 100px;height: 100px;"></a>${vvo.id }
	</div>
	<!-- 댓글 작성 -->
	<div>		
		<input type="hidden" value="${vvo.v_num }" id="v_num" name="v_num">
		<div id="replyinsert">
			<textarea rows="4" cols="70" id="vr_content" name="vr_content" placeholder="다른 사람의 권리를 침해하는 내용은 제재 받을 수 있습니다" style="padding: 12px 20px;box-sizing: border-box;border: 2px solid #ccc;border-radius: 4px;background-color: #f8f8f8;resize: none;"></textarea>
		</div>
		<input type="button" value="등록" id="vr_reg">
	</div>
	<div id="vrcount">
		댓글 : ${vrcount }
	</div>
	<div id="replylist">
	
	</div>
	<button class="w3-button w3-black" id="more" style="width: 1300px">더보기</button>
</div>
