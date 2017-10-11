<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sidebar" data-color="purple" data-image="<c:url value='/resources/admin/img/sidebar-5.jpg'/>">

    <!--

        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag

    -->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="<c:url value='/'/>" class="simple-text">
                    Your BroadCast...
                </a>
            </div>

            <ul class="nav">
                <li class="active">
                    <a href="<c:url value='/admin/member/list'/>">
                        <i class="pe-7s-graph"></i>
                        <p>회원관리</p>
                    </a>
                </li>
                
                <li class="active">                
                    <a href="<c:url value='/admin/report/board'/>">
                        <i class="pe-7s-graph"></i>
                        <p>신고관리</p>
                    </a>
                </li>
                
                <li class="active">                
                    <a href="<c:url value='#'/>">
                        <i class="pe-7s-graph"></i>
                        <p>매출현황</p>
                    </a>
                </li>


            </ul>
    	</div>
    </div>