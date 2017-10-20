<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".move").on('click',function(){
			var b_num = $(this).attr("data-b");
			var category_num = $(this).attr("data-category");
			var bj_id = $(this).attr("data-bj");
			location.href="<c:url value='/" + bj_id + "/board/getInfo?b_num=" + b_num + "&category_num=" + category_num + "'/>";
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
			var pageNum = "${pu.pageNum}";
			$("input[type=checkbox]:checked").each(function(){
				arr.push($(this).val());
			});
			location.href="<c:url value='/admin/report/boardReplyDelete?arr=" + arr + "&pageNum=" + pageNum + "'/>";
		});
	});
</script>

<div class="content">
<div class="container-fluid">
	<div class="row">
		<div class="content">
            <div class="col-md-12">
                <div class="card">
                    <div class="header">
                    
                    	<a href="<c:url value='/admin/report/board'/>" class="w3-bar-item w3-button" style="color: inherit;">글신고</a>
                    	<a href="#" class="w3-bar-item w3-button" style="background-color: #cccccc;">덧글신고</a> 
                    	<a href="<c:url value='/admin/report/video'/>" class="w3-bar-item w3-button" style="color: inherit;">동영상신고</a>
                    	<a href="<c:url value='/admin/report/videoReply'/>" class="w3-bar-item w3-button" style="color: inherit;">동영상덧글신고</a>
                    	
                        <h4 class="title">덧글 신고 목록</h4>
                        <p class="category">BoardReply Report List</p>
                        <div style="margin-right:40px;text-align: right;"><button type="button" class="btn btn-info btn-fill pull-right" id="del">삭제하기</button></div>
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th>덧글 번호</th>
                                <th>글 작성자 아이디</th>
                                <th>게시판종류</th>
                                <th>글 제목</th>
                            	<th>덧글 작성자 아이디</th>
                            	<th>덧글 내용</th>
                            	<th>신고 수</th>
                            	<th><input type="checkbox" id="chkAll"></th>
                            </thead>
                            <tbody>
                            <c:forEach var="brrvo" items="${brrlist }">
                                <tr>
                                	<td>${brrvo.br_num }</td>
                                	<td>${brrvo.writer_id }</td>
                                	<td>${brrvo.category_name }</td>
                                	<td>${brrvo.b_title }</td>
                                	<td>${brrvo.id}</td>
                                	<td><a href="#" class="move" data-bj="${brrvo.bj_id }" data-b="${brrvo.b_num }" data-category="${brrvo.category_num }">${brrvo.br_content}</a></td>
                                	<!--
                                	<td style="color:red;">${brrvo.brrcnt}</td>
                                	-->
                                	<td>
                                		<div class="dropdown" data-b="${brrvo.br_num }">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:red;">${brrvo.brrcnt}</a>
											<ul class="dropdown-menu"></ul>
										</div> 
									</td> 
                                	<td><input type="checkbox" value="${brrvo.br_num }"></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        
                        <script type="text/javascript">
                        	$(function(){
                        		$(".dropdown").on("click",function(){
                        			$(".dropdown-menu").empty();
                        			var br_num = $(this).attr("data-b");
                        			$.ajax({
                        				url:"<c:url value='/admin/report/boardReplyReport'/>",
                        				data:{"br_num":br_num},
                        				success:function(data){
                        					$(data).find("brplist").each(function(){
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
								<a href="<c:url value='/admin/report/reply?pageNum=${1 }'/>">[처음으로]</a>
							</c:when>
							<c:otherwise>
								[처음으로]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pu.startPageNum>5 }">
								<a href="<c:url value='/admin/report/reply?pageNum=${pu.startPageNum-1 }'/>">[이전]</a>
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
										<a href="<c:url value='/admin/report/reply?pageNum=${i }'/>"><span style="color:#555">[${i }]</span></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						<c:choose>
							<c:when test="${pu.endPageNum<pu.totalPageCount }">
								<a href="<c:url value='/admin/report/reply?pageNum=${pu.endPageNum+1 }'/>">[다음]</a>
							</c:when>
							<c:otherwise>
								[다음]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pu.startPageNum<pu.totalPageCount }">
								<a href="<c:url value='/admin/report/reply?pageNum=${pu.totalPageCount }'/>">[끝으로]</a>
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