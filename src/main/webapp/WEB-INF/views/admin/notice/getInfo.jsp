<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script>
	$(document).ready(function(){
		$("#back").click(function(){
			location.href="<c:url value='/admin/notice/list?pageNum=${pageNum}'/>";
		});
	});
</script>
<div class="content" style="margin-left: 250px;">
	<div class="container-fluid">
		<div class="row">
			<div class="content">
	            <div class="col-md-6 col-md-offset-3">
	                <div class="card">
	                    <div class="header">
	                        <h4 class="title">공지사항 조회</h4>
	                        <p class="category">Notice GetInfo</p>
	                    </div>
	                    <div class="content table-responsive table-full-width">
							<table class="table table-hover table-striped" >
								<tr>
									<td width="20%">제목<td>
									<td width="80%">${nvo.n_title }<td>
								</tr>
								<tr>
									<td width="20%">내용<td>
									<td width="80%">${nvo.n_content }<td>
								</tr>
							</table>
							<div style="text-align: center;">
								<button id="back" class="btn btn-info btn-fill pull-center">목록으로 돌아가기</button>
							</div>
	                    </div>
	                </div>
	            </div>
	        </div>
		</div>
	</div>
</div>