<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$(".move").on('click',function(){
			var v_num = $(this).attr("data-v");
			location.href="<c:url value='/videomain/getInfo?v_num=" + v_num + "'/>";
		});
		$("#chkAll").on("click",function(){
			if($("#chkAll").is(":checked")){
				$("input[type=checkbox]").prop("checked",true);
			}else{
				$("input[type=checkbox]").prop("checked",false);
			}
		});
		$("#del").on("click",function(){
			var arr = [];
			$("input[type=checkbox]:checked").each(function(){
				arr.push($(this).val());
			});
			location.href="<c:url value='/admin/report/videoDelete?arr=" + arr + "'/>";
		});
	});
</script>

<div class="content" style="margin-left: 250px;">
<div class="container-fluid">
	<div class="row">
		<div class="content">
            <div class="col-md-12">
                <div class="card">
                    <div class="header">
                    
                    	<a href="<c:url value='/admin/report/board'/>" style="color: inherit;">글신고</a>
                    	<a href="<c:url value='/admin/report/reply'/>" style="color: inherit;">덧글신고</a>
                    	<a href="<c:url value='#'/>">동영상신고</a>
                    	<a href="<c:url value='/admin/report/videoReply'/>" style="color: inherit;">동영상덧글신고</a>
                    	
                        <h4 class="title">동영상 신고 목록</h4>
                        <p class="category">Video Report List</p>
                        <div style="margin-right:40px;text-align: right;"><button type="button" class="btn btn-info btn-fill pull-right" id="del">삭제하기</button></div>
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th>동영상 번호</th>
                                <th>관람등급</th>
                                <th>장르</th>
                          		<th>썸네일</th>
                                <th>동영상 제목</th>
                                <th>작성자아이디</th>
                            	<th>신고 수</th>
                            	<th><input type="checkbox" id="chkAll"></th>
                            </thead>
                            <tbody>
                            <c:forEach var="vvo" items="${vlist }">
                                <tr>
                                	<td>${vvo.v_num }</td>
                                	<td>${vvo.age_grade_name }</td>
                                	<td>${vvo.genre_name }</td>
                                	<td><a href="#" class="move" data-v="${vvo.v_num }"><img src="<c:url value='/resources/upload/${vvo.v_savethumbnail }'/>" style="width:50px;height:50px;"></a></td>
                                	<td>${vvo.v_title }</td>
                                	<td>${vvo.id}</td>
                                	<!-- 
                                	<td style="color:red;">${vvo.v_report}</td>
                                	 -->
                                	 <td>
                                		<div class="dropdown" data-v="${vvo.v_num }">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:red;">${vvo.v_report}</a>
											<ul class="dropdown-menu"></ul>
										</div> 
									</td> 
                                	<td><input type="checkbox" value="${vvo.v_num }"></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        
                        <script type="text/javascript">
                        	$(function(){
                        		$(".dropdown").on("click",function(){
                        			$(".dropdown-menu").empty();
                        			var v_num = $(this).attr("data-v");
                        			$.ajax({
                        				url:"<c:url value='/admin/report/videoReport'/>",
                        				data:{"v_num":v_num},
                        				success:function(data){
                        					$(data).find("vplist").each(function(){
                        						var id = $(this).find("id").text();
                        						$(".dropdown-menu").append("<li><a href='#'>" + id + "</a></li>");
                        					});
                        				}
                        			});
                        		});
                        	});
                        </script>
                        
                        <!-- 페이징 -->
						<div style="text-align: center;">
						<c:choose>
							<c:when test="${pu.pageNum>1 }">
								<a href="<c:url value='/admin/report/video?pageNum=${1 }'/>">[처음으로]</a>
							</c:when>
							<c:otherwise>
								[처음으로]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pu.startPageNum>5 }">
								<a href="<c:url value='/admin/report/video?pageNum=${pu.startPageNum-1 }'/>">[이전]</a>
							</c:when>
							<c:otherwise>
								[이전]
							</c:otherwise>
						</c:choose>
							<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
								<c:choose>
									<c:when test="${i==pu.pageNum }">
										<span style="color:blue">[${i }]</span>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/admin/report/video?pageNum=${i }'/>"><span style="color:#555">[${i }]</span></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						<c:choose>
							<c:when test="${pu.endPageNum<pu.totalPageCount }">
								<a href="<c:url value='/admin/report/video?pageNum=${pu.endPageNum+1 }'/>">[다음]</a>
							</c:when>
							<c:otherwise>
								[다음]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pu.startPageNum<pu.totalPageCount }">
								<a href="<c:url value='/admin/report/video?pageNum=${pu.totalPageCount }'/>">[끝으로]</a>
							</c:when>
							<c:otherwise>
								[끝으로]
							</c:otherwise>
						</c:choose>
						</div>
						
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>
</div>