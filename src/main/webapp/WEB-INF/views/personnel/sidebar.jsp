<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="w3-sidebar w3-collapse w3-white" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <a href="<c:url value='/${sessionScope.id }'/>">
    <img src="<c:url value='/resources/upload/${voMP.profile_savefilename }'/>" style="width:45%; text-decoration: none;" class="w3-round"></a><br><br>
    <p class="w3-text-grey">${voMP.profile_msg }</p>
    
    <span class="w3-text-grey" id="id">${requestScope.id}</span>
    <c:if test="${requestScope.id==sessionScope.id}">	
    	&nbsp&nbsp<span><a href="<c:url value='/${requestScope.id }/setting/info'/>" style="text-decoration: none;" class="fa fa-cog w3-hover-opacity"> 관리</a></span>
    </c:if>
    
  </div>
	<div style="margin-top: 25px;margin-bottom: 25px;">
		<button class="w3-button w3-dark-grey w3-padding-large w3-margin-top w3-margin-bottom" style="width: 100%;" id="btn1"><i class="fa fa-pencil fa-fw w3-margin-right"></i>글 쓰 기</button>
	</div>
  <div class="w3-bar-block">

	<hr>
  	<a href="<c:url value='/${requestScope.id }/board/list'/>" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bars fa-fw w3-margin-right"></i>전체보기</a>
	<c:forEach var="vo" items="${clist }">
    	<a href="<c:url value='/${requestScope.id }/board/list?category_num=${vo.category_num }'/>" class="w3-bar-item w3-button w3-padding">
    	<i class="fa fa-bars fa-fw w3-margin-right"></i>${vo.category_name }</a>
	</c:forEach>
      <a href="<c:url value="/${requestScope.id }/video/list"/>" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-play fa-fw w3-margin-right" aria-hidden="true"></i>Video</a>
  </div>
  
  <c:if test="${not empty flist}"><hr>
  <div class="w3-row-padding">
  	<ul class="w3-ul w3-border w3-white w3-center">
  		<li class="w3-light-grey" style="text-align: left;">열혈팬 Top5</li>
  		<li style="text-align: left;">
  			<c:forEach var="fvo" items="${flist }">
  				<c:choose>
  					<c:when test="${fvo.rnum==1 }">
  						<img src="<c:url value='/resources/upload/crown.png'/>">&nbsp;<span style="color: red;">회장</span>&nbsp;&nbsp;${fvo.id }<br>
  					</c:when>
  					<c:otherwise>
	  					<img src="<c:url value='/resources/upload/heart.png'/>">&nbsp;<span style="color: red;">${fvo.rnum }등</span>&nbsp;&nbsp;${fvo.id }<br>
	  				</c:otherwise>
  				</c:choose>
  			</c:forEach>
  					
  		</li>
  	</ul>
  </div>
  </c:if>  

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