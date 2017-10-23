<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1"> 
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/star.css'/>?ver=4">

<style>
.st_area {
	border: 1px solid #e0e0e0;
	border-radius: 5px;
	background: #fcfcfc
		url('<c:url value="/resources/img/img_balloon.png"/>') -9999em -9999em
		no-repeat;
	*zoom: 1
}
.sinfo ul li .box_gry .img{
	border-radius: 5px;
	background: #fcfcfc
		url('<c:url value="/resources/img/balloon_desc.png"/>') -9999em -9999em 
		no-repeat;
	*zoom: 1
	
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

* {
	font-family: 'Hanna', serif;
	margin: 0;
	padding: 0;
}
.sinfo ul li.desc1 .img{background-position:0 0px}
.sinfo ul li.desc2 .img{background-position:0 -105px}
.sinfo ul li.desc3 .img{background-position:0 -207px}
.sinfo ul li.desc4 .img{background-position:0 -317px}
.sinfo ul li.desc5 .img{background-position:0 -432px}
.sinfo ul li.desc6 .img{background-position:0 -539px}
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
				별풍선구매
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
                                    <span class="num">별풍선<strong>10</strong>개</span>
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
                                    <span class="num">별풍선<strong>30</strong>개</span>
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
                                    <span class="num">별풍선<strong>50</strong>개</span>
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
                                    <span class="num">별풍선<strong>100</strong>개</span>
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
                                    <span class="num">별풍선<strong>300</strong>개</span>
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
                                    <span class="num">별풍선<strong>500</strong>개</span>
                                    <span class="price">55,000원</span>
                                </div>
                                <button type="button" name="btn" class="btn_buy" data-value="500">구매하기</button>                                                     
                            </div>
                        </div>
                    </li>
                    </ul>
                </div>
                <!-- 설명 -->
				<div class="inwrap">
					<h4>별풍선 이란?</h4>
					<div class="sinfo">
						<ul>
							<li class="desc1">
								<div class="box_gry">
									<span class="img"></span>
									<dl>
										<dt>BJ 팬클럽 가입!</dt>
										<dd>
											별풍선을 선물하면, <br> 선물한 BJ의 팬클럽에 가입됩니다.<br> 팬클럽은 <span>팬클럽
												공개 게시판</span>을 이용할 수 있고, 팬클럽만을 위한 특별한 글자색으로 채팅이 돋보입니다.
										</dd>
									</dl>
								</div>
							</li>
							<li class="desc2">
								<div class="box_gry">
									<span class="img"></span>
									<dl>
										<dt>BJ에게 도움!</dt>
										<dd>
											선물받은 BJ는 모인 별풍선을 <br> <span>현금으로 환전</span>하여 실제 수익으로<br>돌려
											받게 됩니다.
										</dd>
									</dl>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="notice" style="width: 100%;">
					<dl>
						<dt>별풍선 구매 안내</dt>
						<dd>구매한 별풍선의 유효기간은 구매일로 부터 5년 입니다.</dd>
						<dd>선물한 별풍선은 취소가 불가능 합니다.</dd>
						<dd>별풍선 보유/구매/선물 내역은 내 별풍선에서 확인 하실 수 있습니다.</dd>
						<dd>별풍선 환전 신청은 내 별풍선에서 가능합니다</dd>
						<div id="help_broad" style="display: block;">
						</div>
					</dl>
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

