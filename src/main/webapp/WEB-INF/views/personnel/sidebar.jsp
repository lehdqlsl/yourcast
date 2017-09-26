<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <img src="/w3images/avatar_g2.jpg" style="width:45%;" class="w3-round"><br><br>
    <h4><b>PORTFOLIO</b></h4>
    <p class="w3-text-grey">Template by W3.CSS</p>
    <p class="w3-text-grey" id="id">${requestScope.id}&nbsp&nbsp&nbsp<a href="<c:url value="/${requestScope.id }/setting/info"/>" style="text-decoration: none;" class="fa fa-cog w3-hover-opacity"></a></p>
  </div>
	<button class="w3-button w3-dark-grey w3-padding-large w3-margin-top w3-margin-bottom" style="width: 100%" id="btn1"><i class="fa fa-pencil fa-fw w3-margin-right"></i>글 쓰 기</button>
  <div class="w3-bar-block">


  	
	<c:forEach var="vo" items="${clist }">
    	<a href="<c:url value='/${requestScope.id }/board/list?category_num=${vo.category_num }'/>" class="w3-bar-item w3-button w3-padding">
    	<i class="fa fa-bars fa-fw w3-margin-right"></i>${vo.category_name }</a>
	</c:forEach>
      <a href="<c:url value="/${requestScope.id }/video/list"/>" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bars fa-fw w3-margin-right"></i>Video</a>
  </div>
  <div class="w3-panel w3-large">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>