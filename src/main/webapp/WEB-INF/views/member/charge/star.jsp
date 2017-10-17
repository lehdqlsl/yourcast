<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1"> 
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/star.css'/>?ver=1">

<style>
.st_area {
	border: 1px solid #e0e0e0;
	border-radius: 5px;
	background: #fcfcfc
		url('<c:url value="/resources/img/img_balloon.png"/>') -9999em -9999em
		no-repeat;
	*zoom: 1
}
</style>
<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;">
	<script type="text/javascript">
		$(document).ready(function(){
			$( "button[name=btn]" ).on( "click", function() {
				var ea = $(this).attr("data-value");
				window.open("<c:url value='/member/charge/starCharge?ea=" + ea + "'/>","_blank","width=500,height=500");
			});
			$( "#money" ).on( "click", function() {
				window.open("<c:url value='/member/charge/money'/>","_blank","width=500,height=500");
			});
		});
	</script>

	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">
			<a href="#" style="text-decoration: none;color:red;">
				별사탕구매
			</a>
			&nbsp;&nbsp;&nbsp;
			<a href="#" style="text-decoration: none;" id="money">
				캐쉬충전
			</a>
		</h3>
	</div>
	<div class="item_balloon">
                    <ul>
                    <li>
                        <div class="st_area st1">
                            <div class="buy">
                                <div class="area">
                                    <span class="num">별사탕<strong>10</strong>개</span>
                                    <span class="price">1,100원</span>
                                </div>
                                <button type="button" name="btn" class="btn_buy" data-value="10">구매하기</button>                                                     
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="st_area st2">
                            <div class="buy">
                                <div class="area">
                                    <span class="num">별사탕<strong>30</strong>개</span>
                                    <span class="price">3,300원</span>
                                </div>
                                <button type="button" name="btn" class="btn_buy" data-value="30">구매하기</button>                                                     
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="st_area st3">
                            <div class="buy">
                                <div class="area">
                                    <span class="num">별사탕<strong>50</strong>개</span>
                                    <span class="price">5,500원</span>
                                </div>
                                <button type="button" name="btn" class="btn_buy" data-value="50">구매하기</button>                                                     
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="st_area st4">
                            <div class="buy">
                                <div class="area">
                                    <span class="num">별사탕<strong>100</strong>개</span>
                                    <span class="price">11,000원</span>
                                </div>
                                <button type="button" name="btn" class="btn_buy" data-value="100">구매하기</button>                                                     
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="st_area st5">
                            <div class="buy">
                                <div class="area">
                                    <span class="num">별사탕<strong>300</strong>개</span>
                                    <span class="price">33,000원</span>
                                </div>
                                <button type="button" name="btn" class="btn_buy" data-value="300">구매하기</button>                                                     
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="st_area st6">
                            <div class="buy">
                                <div class="area">
                                    <span class="num">별사탕<strong>500</strong>개</span>
                                    <span class="price">55,000원</span>
                                </div>
                                <button type="button" name="btn" class="btn_buy" data-value="500">구매하기</button>                                                     
                            </div>
                        </div>
                    </li>
                    </ul>
                </div>
<!-- 
	<div id="stardiv" style="display: none;">
		<form method="post" action="<c:url value='/member/charge/buyStar'/>">
			<input type="hidden" name="buy_ea1" id="buy_ea1">
			구매수량 : <span id="ea"></span> x <input type="text" id="buy_ea2" name="buy_ea2"><br>
			합계금액 : <span id="result"></span>
		</form>
	</div>
-->

</div>

