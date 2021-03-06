<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 사이드바 -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <button class="w3-button w3-dark-grey w3-padding-large" style="width: 100%;margin: 0px;"><span style="color: white;">실시간 방송</span></button>
    <a href="<c:url value="/videomain"/>"><button class="w3-button w3-white w3-padding-large" style="width: 100%;text-align: center;margin: 0px;padding: 0px;">동영상</button></a>
  </div>
  <hr>
  <div class="w3-bar-block">
      <c:choose>
  	<c:when test="${empty sessionScope.id }">
  		<a href="<c:url value='/member/login'/>" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-th-large fa-fw w3-margin-right"></i>즐겨찾기</a>
  	</c:when>
  	<c:otherwise>
  		<a href="<c:url value="/broadcast/bookmark"/>" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-th-large fa-fw w3-margin-right"></i>즐겨찾기</a>
  	</c:otherwise>
  </c:choose>
    
    <hr>
    <a href='<c:url value="/"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-smile-o w3-margin-right"></i>전체보기</a>
   <c:forEach var="vo" items="${glist }">
    	
   		<c:choose>
    		<c:when test="${vo.genre_name eq '게임' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-gamepad w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '모바일게임' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-optin-monster w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '스포츠' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-futbol-o w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '토크/캠방' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-commenting-o w3-margin-right" ></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '먹방/쿡방' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-birthday-cake w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '펫방' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-paw w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '음악' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-music w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '학습' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-book w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '생활/정보' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-info-circle w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '시사/현장' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-video-camera w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '더빙/라디오' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-microphone w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '주식/금융' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-area-chart w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '애니' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-play-circle w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '지상파/케이블' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-television w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '음악(스트리밍)' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-volume-up w3-margin-right"></i>${vo.genre_name }</a>
    		</c:when>
    		<c:when test="${vo.genre_name eq '성인' }">
    			<a href='<c:url value="/?genre_num=${vo.genre_num }"/>' onclick="w3_close()" class="w3-bar-item w3-button w3-padding">19&nbsp;&nbsp;${vo.genre_name }</a>
    		</c:when>
    	</c:choose>	 
   </c:forEach>
    
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

