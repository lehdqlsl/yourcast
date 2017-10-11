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
                        <h4 class="title">회원 목록</h4>
                        <p class="category">Member List</p>
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th>회원번호</th>
                            	<th>아이디</th>
                            	<th>이름</th>
                            	<th>보유한 금액</th>
                            	<th>보유한 별사탕</th>
                            	<th>회원등급</th>
                            	<th>제재날짜</th>
                            </thead>
                            <tbody>
                            <c:forEach var="mvo" items="${mlist }">
                                <tr>
                                	<td>${mvo.m_num }</td>
                                	<td>${mvo.id }</td>
                                	<td>${mvo.name }</td>
                                	<td>${mvo.money }</td>
                                	<td>${mvo.star_candy }</td>
                                	<td>${mvo.grade_name }</td>
                                	<td>${mvo.limit_date }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

						<form action="<c:url value='/admin/member/listFind'/>" method="get">

						<input type="text" name="keyword" value="${keyword }" placeholder="아이디 또는 이름으로 검색" size="30">
						<button type="submit" style="border:none;background-color:white;">
							<i class="fa fa-search"></i>
						</button>
						</form>
						
						<!-- 페이징 -->
						<div style="text-align: center;">
							<c:choose>
								<c:when test="${keyword==null }">
								<c:choose>
									<c:when test="${pu.pageNum>1 }">
										<a href="<c:url value='/admin/member/list?pageNum=${1 }'/>">[처음으로]</a>
									</c:when>
									<c:otherwise>
										[처음으로]
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${pu.startPageNum>5 }">
										<a href="<c:url value='/admin/member/list?pageNum=${pu.startPageNum-1 }'/>">[이전]</a>
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
												<a href="<c:url value='/admin/member/list?pageNum=${i }'/>"><span style="color:#555">[${i }]</span></a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								<c:choose>
									<c:when test="${pu.endPageNum<pu.totalPageCount }">
										<a href="<c:url value='/admin/member/list?pageNum=${pu.endPageNum+1 }'/>">[다음]</a>
									</c:when>
									<c:otherwise>
										[다음]
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${pu.startPageNum<pu.totalPageCount }">
										<a href="<c:url value='/admin/member/list?pageNum=${pu.totalPageCount }'/>">[끝으로]</a>
									</c:when>
									<c:otherwise>
										[끝으로]
									</c:otherwise>
								</c:choose>
								</c:when>
								
								<c:otherwise>
									<c:choose>
									<c:when test="${pu.pageNum>1 }">
										<a href="<c:url value='/admin/member/listFind?pageNum=${1 }&name=${name }&id=${id }&sum=${sum }&keyword=${keyword }'/>">[처음으로]</a>
									</c:when>
									<c:otherwise>
										[처음으로]
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${pu.startPageNum>5 }">
										<a href="<c:url value='/admin/member/listFind?pageNum=${pu.startPageNum-1 }&name=${name }&id=${id }&sum=${sum }&keyword=${keyword }'/>">[이전]</a>
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
												<a href="<c:url value='/admin/member/listFind?pageNum=${i }&name=${name }&id=${id }&sum=${sum }&keyword=${keyword }'/>"><span style="color:#555">[${i }]</span></a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								<c:choose>
									<c:when test="${pu.endPageNum<pu.totalPageCount }">
										<a href="<c:url value='/admin/member/listFind?pageNum=${pu.endPageNum+1 }&name=${name }&id=${id }&sum=${sum }&keyword=${keyword }'/>">[다음]</a>
									</c:when>
									<c:otherwise>
										[다음]
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${pu.startPageNum<pu.totalPageCount }">
										<a href="<c:url value='/admin/member/listFind?pageNum=${pu.totalPageCount }&name=${name }&id=${id }&sum=${sum }&keyword=${keyword }'/>">[끝으로]</a>
									</c:when>
									<c:otherwise>
										[끝으로]
									</c:otherwise>
								</c:choose>
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