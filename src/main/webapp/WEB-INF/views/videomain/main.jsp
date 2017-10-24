<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.title_list{
	width:350px;
	text-decoration: none;
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script>
	$(document).ready(function(){
		var count=0;
		//처음에 20개 동영상 불러오기
		$.ajax({
			url:'<c:url value="/videomain/alllist?pageNum=1"/>',
			dataType:'xml',
			success:function(data){
				count = $(data).find("count").text();
				$(data).find("list").each(function(){
					var img=$(this).find("v_savethumbnail").text();
					var v_title=$(this).find("v_title").text();
					var id=$(this).find("id").text();
					var v_hit=$(this).find("v_hit").text();
					var v_num=parseInt($(this).find("v_num").text());
					var age=parseInt($(this).find("age_grade_num").text());
					if(age==1){
						var div='<div class="w3-col l3 m6 w3-margin-bottom videolist">'+
						'<div><a href="<%=request.getContextPath()%>/videomain/getInfo?v_num='+v_num+'">'
						+'<img src="/app/resources/upload/'+img+'" style="width:100%;height:250px;" class="w3-round-large w3-border w3-hover-opacity"></a></div>'
						+
						'<div>'+
						'<a style="padding:0 10px 0 10px;font-size: 1.4em;font-weight: bold;" href="<%=request.getContextPath()%>/videomain/getInfo?v_num='+v_num+'" class="title_list">'+v_title+'</a>'+
						'</div>'+
						'<div style="padding:0 10px 0 10px;">'+
						'<p><span style="color: #328fde;"><a href="<%=request.getContextPath()%>/'+id+'" style="text-decoration: none;">'+id+'</a></span> 조회수 '+v_hit+'</p>'+
						'</div></div>'
					}else{
						var div='<div class="w3-col l3 m6 w3-margin-bottom videolist">'+
						'<div><a class="adult" id="'+v_num+'" href="<%=request.getContextPath()%>/videomain/getInfo?v_num='+v_num+'">'
						+'<img src="/app/resources/upload/adult.png" style="width:100%;height:250px;" class="w3-round-large w3-border w3-hover-opacity"></a></div>'
						+
						'<div>'+
						'<a style="padding:0 10px 0 10px;font-size: 1.4em;font-weight: bold;" href="<%=request.getContextPath()%>/videomain/getInfo?v_num='+v_num+'" class="title_list">'+v_title+'</a>'+
						'</div>'+
						'<div style="padding:0 10px 0 10px;">'+
						'<p><span style="color: #328fde;"><a href="<%=request.getContextPath()%>/'+id+'" style="text-decoration: none;">'+id+'</a></span> 조회수 '+v_hit+'</p>'+
						'</div></div>'
					}
					$("#videolist").append(div);
				});
			}
		});
		//더보기를 눌렀을 때 동영상 더 불러오기
		$("#more").click(function(){
			var vlcount=$(".videolist").length;
			var vlc=vlcount/20+1;
			if(vlcount==count){
				alert("더 이상 목록을 불러올 수 없습니다.");
				$("#more").prop("disabled",true);
			}else{
				$.ajax({
					url:'<c:url value="/videomain/alllist?pageNum='+vlc+'"/>',
					dataType:'xml',
					success:function(data){
						count = $(data).find("count").text();
						$(data).find("list").each(function(){
							var img=$(this).find("v_savethumbnail").text();
							var v_title=$(this).find("v_title").text();
							var id=$(this).find("id").text();
							var v_hit=$(this).find("v_hit").text();
							var v_num=parseInt($(this).find("v_num").text());
							var age=parseInt($(this).find("age_grade_num").text());
							if(age==1){
								var div='<div class="w3-col l3 m6 w3-margin-bottom videolist">'+
								'<div><a href="<%=request.getContextPath()%>/videomain/getInfo?v_num='+v_num+'">'
								+'<img src="/app/resources/upload/'+img+'" style="width:100%;height:250px;" class="w3-round-large w3-border w3-hover-opacity"></a></div>'
								+
								'<div>'+
								'<a style="padding:0 10px 0 10px;font-size: 1.4em;font-weight: bold;" href="<%=request.getContextPath()%>/videomain/getInfo?v_num='+v_num+'" class="title_list">'+v_title+'</a>'+
								'</div>'+
								'<div style="padding:0 10px 0 10px;">'+
								'<p><span style="color: #328fde;"><a href="<%=request.getContextPath()%>/'+id+'" style="text-decoration: none;">'+id+'</a></span> 조회수 '+v_hit+'</p>'+
								'</div></div>'
							}else{
								var div='<div class="w3-col l3 m6 w3-margin-bottom videolist">'+
								'<div><a class="adult" id="'+v_num+'" href="<%=request.getContextPath()%>/videomain/getInfo?v_num='+v_num+'" >'
								+'<img src="/app/resources/upload/adult.png" style="width:100%;height:250px;" class="w3-round-large w3-border w3-hover-opacity"></a></div>'
								+
								'<div>'+
								'<a style="padding:0 10px 0 10px;font-size: 1.4em;font-weight: bold;" href="<%=request.getContextPath()%>/videomain/getInfo?v_num='+v_num+'" class="title_list">'+v_title+'</a>'+
								'</div>'+
								'<div style="padding:0 10px 0 10px;">'+
								'<p><span style="color: #328fde;"><a href="<%=request.getContextPath()%>/'+id+'" style="text-decoration: none;">'+id+'</a></span> 조회수 '+v_hit+'</p>'+
								'</div></div>'
							}
							$("#videolist").append(div);
						});
					}
				});
			}
		});
		//성인방송 검사
		$("#videolist").on("click",".adult",function(event){
			event.preventDefault();
			var v_num=$(this).attr("id");
			if("${sessionScope.id}"){
				$.ajax({ 
					url:"<c:url value='/adult/check'/>",
					dataType:"json",
					success:function(data){
						if(data.result==true){
							location.href='<c:url value="/videomain/getInfo?v_num='+v_num+'"/>';
						}else{
							alert("만 19세 미만의 청소년은 이용할 수 없습니다.");
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
<!-- 메인페이지 -->
<!-- 전체 동영상 리스트 출력-->
<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">
	
	<div class="w3-container w3-padding-32" id="about">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">전체 보기</h3>
	</div>
	<!-- 동영상 목록 부분 -->
	<div class="w3-row-padding" id="videolist">
		
	</div>
	<button class="w3-button w3-light-grey" id="more" style="width: 1600px"><b style="color: #00416D;">더보기 ∨</b></button>
	<br>
	<footer>
		<div class="w3-light-grey w3-center w3-padding-24"
			style="width: 1600px; font-size: 11px; border-top: 1px solid #CFCFCF; margin-top: 100px;">
			All Contents Copyright ©Your Cast...Co.,Ltd. All Rights Reserved.</div>
	</footer>
</div>


