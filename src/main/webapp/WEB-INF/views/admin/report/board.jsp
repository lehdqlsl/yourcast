<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content" style="margin-left: 250px;">
<div class="container-fluid">
	<div class="row">
		<div class="content">
            <div class="col-md-12">
                <div class="card">
                    <div class="header">
                    
                    	<a href="#">글신고</a>
                    	<a href="<c:url value='/admin/report/reply'/>" style="color: inherit;">덧글신고</a>
                    	
                        <h4 class="title">글 신고 목록</h4>
                        <p class="category">Board Report List</p>
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th>글 번호</th>
                                <th>작성자아이디</th>
                            	<th>글 제목</th>
                            	<th>신고 수</th>
                            </thead>
                            <tbody>
                            <c:forEach var="bvo" items="${blist }">
                                <tr>
                                	<td>${bvo.b_num }</td>
                                	<td>${bvo.id}</td>
                                	<td><a href="<c:url value='/${bvo.bj_id }/board/getInfo?b_num=${bvo.b_num }&category_num=${bvo.category_num }'/>">${bvo.b_title}</a></td>
                                	<td style="color:red;">${bvo.b_report}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        
                        <!-- 페이징 -->
						<div style="text-align: center;">
						<c:choose>
							<c:when test="${pu.pageNum>1 }">
								<a href="<c:url value='/admin/report/board?pageNum=${1 }'/>">[처음으로]</a>
							</c:when>
							<c:otherwise>
								[처음으로]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pu.startPageNum>5 }">
								<a href="<c:url value='/admin/report/board?pageNum=${pu.startPageNum-1 }'/>">[이전]</a>
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
										<a href="<c:url value='/admin/report/board?pageNum=${i }'/>"><span style="color:#555">[${i }]</span></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						<c:choose>
							<c:when test="${pu.endPageNum<pu.totalPageCount }">
								<a href="<c:url value='/admin/report/board?pageNum=${pu.endPageNum+1 }'/>">[다음]</a>
							</c:when>
							<c:otherwise>
								[다음]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pu.startPageNum<pu.totalPageCount }">
								<a href="<c:url value='/admin/report/board?pageNum=${pu.totalPageCount }'/>">[끝으로]</a>
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