<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	a{
		text-decoration: none;
	}
	.title{
		overflow: hidden;
	}
</style>
<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;">
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">공지사항</h3>
	</div>
	<div>
		<table class="w3-table w3-table-all">
			<tr>
				<th style="width:10%;text-align: center">글번호</th>
				<th style="width:60%;text-align: center">제목</th>
				<th style="width:20%;text-align: center">등록일</th>
				<th style="width:10%;text-align: center">조회수</th>
			</tr>
			<c:forEach var="vo" items="${nlist }">
				<tr>
					<td style="width:10%;text-align: center">${vo.n_num }</td>
					<td style="width:60%;text-align: center" class="title"><a href="<c:url value='/member/notice/getInfo?n_num=${vo.n_num }&pageNum=${pu.pageNum }'/>">${vo.n_title }</a></td>
					<td style="width:20%;text-align: center">${vo.n_regdate }</td>
					<td style="width:10%;text-align: center">${vo.n_hit }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="w3-bar-all w3-center">
		<!-- 이전 -->
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href='<c:url value="/member/notice/list?pageNum=${pu.startPageNum-1 }"/>'class="w3-bar-item w3-button w3-hover-black">이전</a>
			</c:when>
			<c:otherwise>
				<a class="w3-bar-item w3-button w3-hover-black">이전</a>
			</c:otherwise>
		</c:choose>
		<!-- 페이지 -->
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==pu.pageNum }">
					<a href='<c:url value="/member/notice/list?pageNum=${i }"/>'class="w3-bar-item w3-button w3-hover-black"><span style="color:red">${i }</span></a>
				</c:when>
				<c:otherwise>
					<a href='<c:url value="/member/notice/list?pageNum=${i }"/>'class="w3-bar-item w3-button w3-hover-black"><span>${i }</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<!-- 다음 -->
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<a href='<c:url value="/member/notice/list?pageNum=${pu.endPageNum+1 }"/>'class="w3-bar-item w3-button w3-hover-black">다음</a>
			</c:when>
			<c:otherwise>
				<a class="w3-bar-item w3-button w3-hover-black">다음</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>