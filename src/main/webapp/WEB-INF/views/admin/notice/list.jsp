<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.test {
  width:100%;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1; /* 라인수 */
  -webkit-box-orient: vertical;
  word-wrap:break-word;
  line-height:3.0em;
  height:3.0em;
  }

</style>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#noti_reg").click(function() {
			location.href = "<c:url value='/admin/notice/insert'/>";
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
							<h4 class="title">공지사항</h4>
							<p class="category">Notice List</p>
							<div style="margin: 0 0 10px 10px;">
								<button type="button" class="btn btn-info btn-fill pull-right"
									id="noti_reg">작성하기</button>
							</div>
						</div>
						<br>
						<div class="content table-responsive table-full-width">
							<table class="table table-hover table-striped"
								style="table-layout: fixed;">
								<tr>
									<th width="10%">글번호</th>
									<th width="30%">제목</th>
									<th width="30%">내용</th>
									<th width="20%">등록일</th>
									<th width="10%">조회수</th>
								</tr>
								<c:forEach var="vo" items="${nlist }">
									<tr>
										<td width="10%">${vo.n_num }</td>
										<td><a href="<c:url value='/admin/notice/getInfo?n_num=${vo.n_num }&pageNum=${pu.pageNum }'/>">${vo.n_title }</a></td>
										<td class="test">${vo.n_content }</td>
										<td width="20%">${vo.n_regdate }</td>
										<td width="10%">${vo.n_hit }</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<!-- 페이징 -->
						<div style="text-align: center;">
							<c:choose>
								<c:when test="${pu.startPageNum>5 }">
									<a
										href="<c:url value='/admin/notice/list?pageNum=${pu.startPageNum-1 }'/>">[이전]</a>
								</c:when>
								<c:otherwise>
									[이전]
								</c:otherwise>
							</c:choose>
							<c:forEach var="i" begin="${pu.startPageNum }"
								end="${pu.endPageNum }">
								<c:choose>
									<c:when test="${i==pu.pageNum }">
										<a href="<c:url value='/admin/notice/list?pageNum=${i }'/>"><span
											style="color: red">[${i }]</span></a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/admin/notice/list?pageNum=${i }'/>"><span
											style="color: #555">[${i }]</span></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${pu.endPageNum<pu.totalPageCount }">
									<a
										href="<c:url value='/admin/notice/list?pageNum=${pu.endPageNum+1 }'/>">[다음]</a>
								</c:when>
								<c:otherwise>
									[다음]
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>