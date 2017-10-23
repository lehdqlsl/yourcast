<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		$("#more").click(function(){
			var vlcount=$(".videolist").length;
			//alert(vlcount);
			
			var vlc=vlcount/20+1;
			//alert("${pu.totalRowCount}");
			if("${pu.totalRowCount}"==vlcount){
				alert("더 이상 목록을 불러올 수 없습니다.");
				$("#more").prop("disabled",true);
			}else{
				$.ajax({
					url:'<c:url value="/videomain/list/list2?pageNum='+vlc+'&genre_num=${genre_num}"/>',
					dataType:'xml',
					success:function(data){
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
								'<div><a href="<%=request.getContextPath()%>/videomain/getInfo?v_num='+v_num+'"'
								+' class="adult" id="'+v_num+'">'
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
							alert("성인만 조회가 가능합니다.");
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
<!-- 카테고리 별 동영상 리스트 출력-->
<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">
	<!-- About Section -->
	<div class="w3-container w3-padding-32" id="about">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">${genre_name }</h3>
	</div>
	
	<div class="w3-row-padding" id="videolist">
		<c:choose>
			<c:when test="${empty vlist }">
				<div class="w3-col l3 m6 w3-margin-bottom w3-center videolist">
					<h5 style="font-weight: bold;width: 1558px;">해당 카테고리에 영상이 존재하지 않습니다.</h5>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${vlist }">
					<div class="w3-col l3 m6 w3-margin-bottom videolist">
						<div>
							<c:choose>
								<c:when test="${vo.genre_num==16 || vo.age_grade_num==2}">
									<a href='<c:url value="/videomain/getInfo?v_num=${vo.v_num }"/>'class="adult" id="${vo.v_num }"><img src='<c:url value="/resources/upload/adult.png"/>' style="width: 100%;height: 250px;" class="w3-round-large w3-border w3-hover-opacity"></a>
								</c:when>
								<c:otherwise>
									<a href='<c:url value="/videomain/getInfo?v_num=${vo.v_num }"/>'><img src='<c:url value="/resources/upload/${vo.v_savethumbnail }"/>' style="width: 100%;height: 250px;" class="w3-round-large w3-border w3-hover-opacity"></a>
								</c:otherwise>
							</c:choose>
						
							
						</div>
						<div>
							<a style="padding:0 10px 0 10px;font-size: 1.4em;font-weight: bold;" href="<c:url value="/videomain/getInfo?v_num=${vo.v_num }"/>" class="title_list ">${vo.v_title}</a>
						</div>
						<div style="padding:0 10px 0 10px;">
							<p><span style="color: #328fde;"><a href="<c:url value='/${vo.id }'/>" style="text-decoration: none;">${vo.id }</a></span> 조회수 ${vo.v_hit }</p>
						</div> 
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<button class="w3-button w3-light-grey" id="more" style="width: 1600px"><b style="color: #00416D;">더보기 ∨</b></button>
	<br>
</div>