<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/home.css'/>?ver=4">
<style>
.title_list{
	width:300px;
	text-decoration: none;
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<body class="w3-light-grey w3-content" style="max-width:1600px">
<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">

  <!-- Header -->
  <header id="portfolio">
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">
	<div class="link-2">
				<h1>
					<a href="<c:url value='/${requestScope.id }'/>" class="maintitle">
					<b>${voMP.profile_title }</b></a>
				</h1>
			</div>
	<div class="w3-section w3-bottombar w3-padding-16">
    </div>
    </div>
  </header>
  	<div class="w3-row-padding w3-margin">
  		${voMP.profile_content }
	</div>
  <hr>
  <div class="w3-container w3-padding-large" style="margin-bottom:32px">
    <div class="w3-row-padding" style="margin:0 -16px">
      <!-- 공지사항 -->
      
      <div class="w3-third w3-margin-bottom">
    	<div style="border-bottom: 3px solid #bbb">
    		<h5 style="margin-left: 20px;font-weight: bold"><i class="fa fa-asterisk" aria-hidden="true"></i>&nbsp;&nbsp;공지사항</h5>
    		<span style="width:100px;height:5px;margin-left:370px;font-size: 12px;color: #757575"><a href="<c:url value='/${requestScope.id }/board/list'/>">더보기</a></span>
    	</div>
        <table class="w3-table w3-bordered">
        	<c:choose>
        		<c:when test="${empty nlist }">
        			<tr>
        				<td>공지사항이 존재하지 않습니다.</td>
        			</tr>
        		</c:when>
        		<c:otherwise>
        			<c:forEach var="vo" items="${nlist }">
		        		<tr>
		        			<td>
		        				<span class="title_list">
		        					<span class="noti"></span>
		        					<span><a href='<c:url value="/${requestScope.id }/board/getInfo?b_num=${vo.b_num }&category_num=${vo.category_num }"/>' style="text-decoration: none; font-size: 13px;">${vo.b_title }</a></span>
		        				
		        				</span>
		        				<span style="float: right;font-size: 12px;color: #7b7474;"><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;&nbsp;${vo.brcnt }</span>
		        			</td>
		        		</tr>
		        	</c:forEach>
        		</c:otherwise>
        	</c:choose>
        </table>
      </div>
      <!-- 최신글 -->
      
      <div class="w3-third w3-margin-bottom">
      	<div style="border-bottom: 3px solid #bbb">
      		<h5 style="margin-left: 20px;font-weight: bold"><i class="fa fa-file-text-o" aria-hidden="true"></i>&nbsp;&nbsp;최신글목록</h5>
      		<span style="width:100px;height:5px;margin-left:370px;font-size: 12px;color: #757575"><a href="<c:url value='/${requestScope.id }/board/list'/>">더보기</a></span>
      	</div>
      	
  
        <table class="w3-table w3-bordered">
        	<c:choose>
        		<c:when test="${empty blist }">
        			<tr>
        				<td>최신 글이 존재하지 않습니다.</td>
        			</tr>
        		</c:when>
        		<c:otherwise>
        			<c:forEach var="vo" items="${blist }">
		        		<tr>
		        			<td>
		        				<span class="title_list">
		        					<a href='<c:url value="/${requestScope.id }/board/getInfo?b_num=${vo.b_num }&category_num=${vo.category_num }"/>' style="text-decoration: none;font-size: 13px;">${vo.b_title }</a>
		        				</span>
		        				<span style="float: right;font-size: 12px;color: #7b7474"><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;&nbsp;${vo.brcnt }</span>
		        			</td>
		        		</tr>
		        	</c:forEach>
        		</c:otherwise>
        	</c:choose>
        </table>
      </div>
      <!-- 동영상 목록 -->
      
      <div class="w3-third">
      	<div style="border-bottom: 3px solid #bbb">	
      		<h5 style="margin-left: 20px;font-weight: bold"><i class="fa fa-film" aria-hidden="true"></i>&nbsp;&nbsp;VOD</h5>
      		<span style="width:100px;height:5px;margin-left:370px;font-size: 12px;color: #757575"><a href="<c:url value="/${requestScope.id }/video/list"/>">더보기</a></span>
      	</div>
        <table class="w3-table w3-bordered">
        	<c:choose>
        		<c:when test="${empty vlist }">
        			<tr>
        				<td>동영상이 존재하지 않습니다.</td>
        			</tr>
        		</c:when>
        		<c:otherwise>
        			<c:forEach var="vo" items="${vlist }">
		        		<tr>
		        			<td>
		        				<span class="title_list"><a href='<c:url value="/videomain/getInfo?v_num=${vo.v_num }"/>' style="text-decoration: none;font-size: 13px;">${vo.v_title }</a></span>
		        				<span style="float: right;font-size: 12px;color: #7b7474;"><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;&nbsp;${vo.vrcnt }</span>
		        			</td>
		        		</tr>
		        	</c:forEach>
        		</c:otherwise>
        	</c:choose>
        </table>
      </div>
    </div>
  </div>
  

  <!-- Footer -->
		<footer>
			<div class="w3-light-grey w3-center w3-padding-24"
				style="width: 1300px; font-size: 11px; border-top: 1px solid #CFCFCF; margin-top: 100px;">
				All Contents Copyright ©Your Cast...Co.,Ltd. All Rights Reserved.</div>
		</footer>
</div>
</body>
</html>
