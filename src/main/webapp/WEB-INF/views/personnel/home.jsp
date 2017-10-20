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
    	<div class="w3-bottombar">
    		<h5 style="margin-left: 20px;font-weight: bold">공지사항</h5><span style="width:100px;height:5px;margin-left:370px;font-size: 10px;color: #353535"><a href="<c:url value='/${requestScope.id }/board/list'/>">더보기</a></span>
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
		        					<span><a href='<c:url value="/${requestScope.id }/board/getInfo?b_num=${vo.b_num }&category_num=${vo.category_num }"/>' style="text-decoration: none;">${vo.b_title }</a></span>
		        				
		        				</span>
		        				<span style="float: right"><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;&nbsp;${vo.brcnt }</span>
		        			</td>
		        		</tr>
		        	</c:forEach>
        		</c:otherwise>
        	</c:choose>
        </table>
      </div>
      <!-- 최신글 -->
      
      <div class="w3-third w3-margin-bottom">
      	<div class="w3-bottombar">
      		<h5 style="margin-left: 20px;font-weight: bold">최신글목록</h5><span style="width:100px;height:5px;margin-left:370px;font-size: 10px;color: #353535"><a href="<c:url value='/${requestScope.id }/board/list'/>">더보기</a></span>
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
		        					<a href='<c:url value="/${requestScope.id }/board/getInfo?b_num=${vo.b_num }&category_num=${vo.category_num }"/>' style="text-decoration: none;">${vo.b_title }</a>
		        				</span>
		        				<span style="float: right"><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;&nbsp;${vo.brcnt }</span>
		        			</td>
		        		</tr>
		        	</c:forEach>
        		</c:otherwise>
        	</c:choose>
        </table>
      </div>
      <!-- 동영상 목록 -->
      
      <div class="w3-third">
      	<div class="w3-bottombar">	
      		<h5 style="margin-left: 20px;font-weight: bold">VOD</h5><span style="width:100px;height:5px;margin-left:370px;font-size: 10px;color: #353535"><a href="<c:url value="/${requestScope.id }/video/list"/>">더보기</a></span>
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
		        				<span class="title_list"><a href='<c:url value="/videomain/getInfo?v_num=${vo.v_num }"/>' style="text-decoration: none;">${vo.v_title }</a></span>
		        				<span style="float: right"><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp;&nbsp;${vo.vrcnt }</span>
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
  <footer class="w3-container w3-padding-32 w3-dark-grey">
  <div class="w3-row-padding">
    <div class="w3-third">
      <h3>FOOTER</h3>
      <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
      <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
    </div>
  
    <div class="w3-third">
      <h3>BLOG POSTS</h3>
      <ul class="w3-ul w3-hoverable">
        <li class="w3-padding-16">
          <img src="/w3images/workshop.jpg" class="w3-left w3-margin-right" style="width:50px">
          <span class="w3-large">Lorem</span><br>
          <span>Sed mattis nunc</span>
        </li>
        <li class="w3-padding-16">
          <img src="/w3images/gondol.jpg" class="w3-left w3-margin-right" style="width:50px">
          <span class="w3-large">Ipsum</span><br>
          <span>Praes tinci sed</span>
        </li> 
      </ul>
    </div>

    <div class="w3-third">
      <h3>POPULAR TAGS</h3>
      <p>
        <span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">New York</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">London</span>
        <span class="w3-tag w3-grey w3-small w3-margin-bottom">IKEA</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">NORWAY</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">DIY</span>
        <span class="w3-tag w3-grey w3-small w3-margin-bottom">Ideas</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Baby</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Family</span>
        <span class="w3-tag w3-grey w3-small w3-margin-bottom">News</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Clothing</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Shopping</span>
        <span class="w3-tag w3-grey w3-small w3-margin-bottom">Sports</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Games</span>
      </p>
    </div>

  </div>
  </footer>
  
  <div class="w3-black w3-center w3-padding-24">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>

<!-- End page content -->
</div>


</body>
</html>
