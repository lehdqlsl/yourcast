<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						//alert(data);
						$(data).find("list").each(function(){
							var img=$(this).find("v_savethumbnail").text();
							var v_title=$(this).find("v_title").text();
							var id=$(this).find("id").text();
							var v_hit=$(this).find("v_hit").text();
							var v_num=parseInt($(this).find("v_num").text());
							//alert(v_num);
							
							var div='<div class="w3-col l3 m6 w3-margin-bottom videolist">'+
							'<a href="<%=request.getContextPath()%>/videomain/getInfo?v_num='+v_num+'">'
							+'<img src="/app/resources/upload/'+img+'" style="width:100%;height:250px;"></a>'
							+
							'<div style="width: 100%; display: block; height: 20px; padding-left: 0px; margin-top: 5px;">'+
							'<p style="margin: 0px 0px 0px 0px;	font-size: 1.4em;">'+v_title+'</p>'+
							'</div>'+
							'<div style="width: 100%; display: block; height: 20px; padding-left: 0px;">'+
							'<p style="margin: 5px 0px 0px 0px;	font-size: 1.0em; color: #6e6779;">'+id+' 조회수 '+v_hit+'</p>'+
							'</div></div>'
							$("#videolist").append(div);
						});
						
					}
				});
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
		<c:forEach var="vo" items="${vlist }">
			<div class="w3-col l3 m6 w3-margin-bottom videolist">
				<a href='<c:url value="/videomain/getInfo?v_num=${vo.v_num }"/>'><img src='<c:url value="/resources/upload/${vo.v_savethumbnail }"/>' style="width: 100%;height: 250px;"></a>
				<div style="width: 100%; display: block; height: 20px; padding-left: 0px; margin-top: 5px;">
					<p style="margin: 0px 0px 0px 0px;	font-size: 1.4em;">${vo.v_title}</p>
				</div>
				<div style="width: 100%; display: block; height: 20px; padding-left: 0px;">
					<p style="margin: 5px 0px 0px 0px;	font-size: 1.0em; color: #6e6779;">${vo.id } 조회수 ${vo.v_hit }</p>
				</div>
			</div>
		</c:forEach>
	</div>
	<button class="w3-button w3-block w3-black" id="more">더보기</button>
	<br>
</div>