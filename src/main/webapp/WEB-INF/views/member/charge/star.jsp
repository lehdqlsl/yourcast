<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<style>
@charset "utf-8";

@import url("/css/global/common_set.css");
@import url("/css/global/gnb_new.css"); 
@import url("/css/global/af_layer.css");

#accessibility {position:relative; z-index:10001;}
#accessibility a {position:absolute; top:-999px; left:0; width:200px; height:24px; padding-top:4px; background-color:#000; text-align:center; color:#fff !important; font:bold 14px '맑은 고딕',Malgun Gothic,'돋움',Dotum,sans-serif;}
#accessibility a:active, #accessibility a:focus {top:0;}

/* HTML 5 Reset */
nav, section, article, header, aside, footer, figure, dialog {display:block}
time, progress, mark, output {display:inline}

/* mobile */
html{-webkit-text-size-adjust: none;} /* iphone */

/* Reset */
html,body{width:100%;height:100%}
html{overflow-y:scroll}
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,form,fieldset,p,button{margin:0;padding:0}
body,h1,h2,h3,h4,input,button,th,td{font-family:ng, Dotum, "돋움", verdana, sans-serif;font-size:12px;color:#383d41}

*{font-family:ng, Dotum, "돋움", verdana, sans-serif}
body{background-color:#fff;*word-break:break-all;/*-ms-word-break:break-all*/}
img,fieldset,iframe{border:0 none}
li{list-style:none}
input,select,button{vertical-align:middle}
img{vertical-align:top}
i,em,address{font-style:normal}
label,button{cursor:pointer}
button{margin:0;padding:0}
a{color:#222;text-decoration:none}
a:hover{/*color:#390;*/text-decoration:underline}
button *{position:relative}
button img{left:-3px;*left:auto}
html:first-child select{height:20px;padding-right:6px}
option{padding-right:6px}
hr{display:none}
legend{*width:0}
table{border-collapse:collapse;border-spacing:0}
input::-ms-clear{display:none}

/* common */
body{font-family:ng, Dotum, "돋움", verdana, sans-serif;font-size:12px;color:#666;background-color:#fff;min-width:960px}

.blind,legend{display:block;overflow:hidden;position:absolute;top:-1000em;left:0}
.ellipsis{overflow:hidden;white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis}
iframe{vertical-align:top}

ul, ol, li{list-style:none}
hr{display:none}
em{font-style:normal}
fieldset, img{border:none;}
button{border:0 none;cursor:pointer;background:transparent;outline: none;}
/* table { border-collapse: collapse;} */
.hide {display:none}  /* none */
.png24		{tmp:expression(setPng24(this));}
.loading_list {
    position: relative;
   /* display: block;*/
    width: 44px;
    height: 44px;
    margin: 0 auto 0;
    text-indent: -9999px;
    background: url('/images/common/loading.gif') no-repeat;
}

/* Link Css */
a {cursor:pointer;color:#666}
a:link,  a:visited,  a:active {text-decoration:none}
a:hover{text-decoration:none}

/* form */
textarea {font-family:Dotum, "돋움", verdana, sans-serif;font-size:12px}
select{font-family:Dotum, "돋움", verdana, sans-serif;font-size:12px;}
input {font-family:Dotum, "돋움", verdana, sans-serif;font-size:12px;}

/* CONTENTS */
.sballoon *{font-family:ng}
.inwrap{width:960px;margin:0 auto}
.inwrap h4{font-size:20px;font-weight:normal;margin:47px 0 20px 0}

.b_buy h4{color:#2f56ae}
.item_balloon{width:100%;overflow:hidden}
.item_balloon ul{float:left;margin-left:-16px}
.item_balloon li{float:left;width:472px;margin:0 0 15px 16px}
.st_area{border:1px solid #e0e0e0;border-radius:5px;background:#fcfcfc url('<c:url value="/resources/img/img_balloon.png"/>') -9999em -9999em no-repeat;*zoom:1}
.st_area.st1{background-position:0 3px}
.st_area.st2{background-position:0 -120px}
.st_area.st3{background-position:0 -243px}
.st_area.st4{background-position:0 -367px}
.st_area.st5{background-position:0 -491px}
.st_area.st6{background-position:0 -615px}

.st_area:after{content:"";clear:both;display:block}
.st_area .buy{height:126px;background:#fff;margin-left:190px;border-left:1px solid #e6e6e6;position:relative;z-index:5;border-radius:0 5px 5px 0}
.st_area .buy .btn_buy{border:1px solid #74b3ff;font-size:14px;color:#0072ff;padding:12px 20px;border-radius:2px;position:absolute;top:42px;left:144px}
.ja_JP .st_area .buy .btn_buy{left:150px}
.st_area .buy .area{text-align:right;width:125px;position:absolute;top:40px}
.ja_JP .st_area .buy .area{width:138px}
.st_area .buy .area .price{display:block;font-size:21px;color:#222}
.st_area .buy .area .num{font-size:13px;color:#666;margin-bottom:2px}
.st_area .buy .area .num strong{font-size:16px;color:#0e54ff;margin-left:2px}
.gift_banner{width:960px;margin:38px auto 10px auto;border:1px solid #ffe1ae;background:#fff9e6;display:block;text-align:center}
.gift_banner img{margin:9px 0}
.notice{border-top:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;background:#f8f8f8;padding:9px 0 57px 0}
.notice dl{width:960px;margin:48px auto 0 auto}
.notice dt{color:#222;font-size:17px;margin-bottom:17px}
.notice dd{color:#888;font-size:14px;margin-bottom:10px;background:url(/images/item/bul_sq_gry.gif) 1px 7px no-repeat;padding:0 0 0 11px}
.notice dd p.n_desc{margin:7px 0;width:100%;overflow:hidden;padding-left:17px}
.notice dd p.n_desc span{float:left;margin-left:-14px}
.notice dd a.btn_more{color:#1d6dda;font-size:14px;margin-left:3px}
.notice dd a.btn_more:hover{text-decoration:underline}
.qv #footer, .sballoon #footer{margin-top:-1px}

.sinfo{overflow:hidden;*zoom:1;margin-bottom:80px}
.sinfo:after{content:"";display:block;clear:both}
.sinfo ul{float:left;margin-left:-20px}
.sinfo ul li{width:470px;margin:0 0 20px 20px;float:left}
.sinfo ul li .box_gry{border:1px solid #e8e8e8;border-radius:5px;height:193px;position:relative;z-index:6}
.sinfo ul li .box_gry dl{margin:30px 10px 0 209px}
.sinfo ul li .box_gry dt{font-size:19px;color:#222;margin-bottom:12px;line-height:1.4em}
.sinfo ul li .box_gry dd{font-size:14px;color:#777;line-height:1.5em}
.sinfo ul li .box_gry dd span{color:#5788ff}

.sinfo ul li .box_gry .img{background:url(/images/item/balloon_desc.png) -9999em -9999em no-repeat;width:144px;height:95px;display:block;position:absolute;top:50px;left:43px}
.sinfo ul li.desc1 .img{background-position:0 0px}
.sinfo ul li.desc2 .img{background-position:0 -105px}
.sinfo ul li.desc3 .img{background-position:0 -207px}
.sinfo ul li.desc4 .img{background-position:0 -317px}
.sinfo ul li.desc5 .img{background-position:0 -432px}
.sinfo ul li.desc6 .img{background-position:0 -539px}


.notice a.btn_btype{display:inline-block;border:1px solid #356dc8;background:#fff;padding:8px 9px 9px 9px}
.notice a.btn_btype span{background:url(/images/item/bul_btype.png) right 1px no-repeat;padding-right:12px;color:#316bc7;font-family:ng;font-size:14px;letter-spacing:-1px}
.notice dd p.btn{margin-top:11px}

/*.pg_title{font-size:14px;color:#2f56ae;font-family:ngb;margin:19px 0 27px 0;background:url(/images/item/icon_pgtit.jpg) 0 1px no-repeat;padding-left:24px;font-weight:bold;letter-spacing:-1px}*/
.pg_title{font-size:20px;color:#000;letter-spacing:-1px;font-weight:normal;margin:28px 0 20px 0}


/**/
body.ko_KR *{font-family:ng}
.my_item{border-bottom:1px solid #e5e5e5;background:#fff;padding:21px 0 21px 0}
.my_item .inwrap{*zoom:1}
.my_item .inwrap:after{content:"";clear:both;display:block}
.my_item .my_qv{float:left;margin-top:2px}
.my_item .myitem{float:right}
.my_item .myitem li{float:left;padding:15px 25px 15px 25px}
.my_item .myitem li p{font-size:14px;color:#888;text-align:center;font-family:ng;margin-bottom:5px;letter-spacing:-1px}
.my_item .myitem li strong{display:block;color:#0e54ff;font-size:16px;font-family:ngb;text-align:center}
.my_item .myitem li.gift{border-left:1px solid #f2f2f2}
.my_item .my_qv  .img{display:inline-block;zoom:1;*display:inline;width:66px;height:66px;background:url(/images/item/img_icon.png) 0 0 no-repeat;margin-right:18px;vertical-align:middle;}
.my_item .my_star .img{display:inline-block;zoom:1;*display:inline;width:66px;height:66px;background:url(/images/item/img_icon.png) 0 -253px no-repeat;margin-right:18px;vertical-align:middle;}

.my_item .item{display:inline-block;zoom:1;*display:inline;vertical-align:middle}
.my_item .item p{font-size:24px;color:#0e54ff;letter-spacing:-1px;}
.my_item .item p .date{font-size:14px;color:#828eab;letter-spacing:0}
.my_item .item p .date em{color:#ff3600}
.my_item .item p .icon_use{background:#ff5353;color:#fff;font-size:12px;letter-spacing:-1px;padding:0 12px;height:22px;line-height:22px;display:inline-block;margin-left:9px;border-radius:10px;vertical-align:middle}
.b_buy, .qv_buy{background:#f5f5f5;padding:19px 0 65px 0;border-bottom:1px solid #e5e5e5}

.qv_buy li{width:100%;*zoom:1;margin-bottom:15px}
.qv_buy li:after{content:"";clear:both;display:block}
.qv_buy li .qv_item{background:#4978ff;border-radius:4px 0 0 4px;width:252px;height:126px;position:relative;padding:0 0 0 26px;letter-spacing:-1px;float:left;border:1px solid #4978ff;;word-break:break-all; word-wrap:break-word;-ms-word-break:break-all}
.qv_buy li .qv_item .name{color:#fff;font-size:23px;display:block;margin:20px 0 1px 0}
.qv_buy li .qv_item .date{color:#fff;font-size:23px;letter-spacing:-1px;width:165px;display:block;word-wrap:break-word}
.ko_KR .qv_buy li .qv_item .date{font-family:ngb}
.qv_buy li .qv_item span.img{background:url(/images/item/img_icon.png) -9999em -9999em no-repeat;width:42px;height:35px;display:block;position:absolute;top:48px;left:204px}
.qv_buy li .qv_item span.a30{background-position:0 -76px}
.qv_buy li .qv_item span.d30{background-position:0 -123px}
.qv_buy li .qv_item span.d90{background-position:0 -164px}
.qv_buy li .qv_item span.d365{background-position:0 -205px}

.qv_buy li .qv_desc{border:1px solid #e0e0e0;float:left;height:126px;background:#fff;width:679px;border-radius:0 4px 4px 0;border-left:none}
.qv_buy li .qv_desc .info{display:inline-block;zoom:1;*display:inline;vertical-align:middle;width:198px;margin-left:42px;font-size:14px;color:#6c6c6c;line-height:1.5em;letter-spacing:-1px;}
.qv_buy li .qv_desc .price{display:inline-block;zoom:1;*display:inline;vertical-align:middle;width:162px;margin-left:10px}
.qv_buy li .qv_desc .price .pr{font-size:21px;color:#222;text-align:right;letter-spacing:-1px !important}
.ja_JP .qv_buy li .qv_desc .price .pr{font-family:arial !important}

.qv_buy li .qv_desc .price .pr .icon{font-size:12px;color:#ff5353;border:1px solid #ff5353;height:22px;padding:0 8px;border-radius:12px;margin-right:5px;display:inline-block;line-height:1.9em;vertical-align:middle}
.ja_JP .qv_buy li .qv_desc .price .pr .icon{padding:0 6px}
.ko_KR .qv_buy li .qv_desc .price .pr .icon{font-family:ngb}
.qv_buy li .qv_desc .price .p_down{text-align:right;display:block;margin-bottom:3px}
.qv_buy li .qv_desc .btn_buy{display:inline-block;zoom:1;*display:inline;vertical-align:middle;width:228px;margin-left:13px;text-align:center}
.qv_buy li .qv_desc .btn_buy button{border:1px solid #74b3ff;color:#0072ff;font-size:14px;height:41px;margin:0 5px 0 4px;border-radius:2px;word-wrap:break-word}
.qv_buy li .qv_desc .btn_buy .btn1{width:217px}
.qv_buy li .qv_desc .btn_buy .btn2{width:103px}
.p_down span{font-size:15px;position:relative;padding:0 14px}
.p_down span:after {content: ''; position: absolute; bottom: 5px; left: 0;right: 0; height: 1px; margin-top: -1px; border-bottom: 1px solid red; background:url(/images/item/img_del.png) right 0 no-repeat;height:5px}
.qv_desc .h_c{height:126px;display:inline-block;vertical-align:middle}
.qinfo ul li .box_gry .img{background:url(/images/item/qv_be.png) -9999em -9999em no-repeat;width:146px;height:113px;display:block;position:absolute;top:47px;left:40px}
.qinfo ul li.qv1 .box_gry .img{background-position:0 0}
.qinfo ul li.qv3 .box_gry .img{background-position:0 -213px}
.qinfo ul li.qv2 .box_gry .img{background-position:0 -419px}
.qinfo ul li.qv4 .box_gry .img{background-position:0 -615px}
.qinfo ul li .box_gry dl{margin-left:205px}
</style>
<div class="w3-main" style="margin: 60px auto 0 auto; width: 960px;">
<!-- 
	 <script type="text/javascript">
		 $(document).ready(function(){
			function buyStar(){
				if($("#buy_ea2").val()==null || $("#buy_ea2").val()==""){
					alert("충전수량을 입력하세요.");
					return false;
				}else{
					$('form').submit();
					alert($("#result").text() + "개의 별사탕이 충전되었습니다.");
				}
			}
			$( ".star" ).on( "click", function() {
				$('form').dialog({
					modal:true,
					title:"별사탕구매",
					width:400,
					height:300,
					resizable:false,
					closeOnEscape:false,
					hide:'fadeOut',
					show:'fadeIn',
					position:"auto",
					buttons: {
						"구매하기": buyStar,
						Cancel: function() {
							$(this).dialog( "close" );
							$("#buy_ea2").val("");
							$("#result").text("");
						}
					},
				});
				$("#ea").text($(this).next().val());
				$("#buy_ea1").val($("#ea").text());
			});
			$("#buy_ea2").change(function(){
				$("#result").text(parseInt($("#ea").text()*$("#buy_ea2").val()));
			});
		 });
	 </script>
 -->

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
				Money충전
			</a>
		</h3>
	</div>
		
	<!-- <table style="width:700px;height:100px;">
		<tr>
			<th>별사탕 10개=1,100원&nbsp;<input type="button"  name="btn" class="w3-button w3-white w3-border w3-border-blue" data-value="10" value="구매하기"></th>
			<th></th>
			<th>별사탕 30개=3,300원&nbsp;<input type="button" name="btn" class="w3-button w3-white w3-border w3-border-blue" data-value="30" value="구매하기"></th>
		</tr>
		<tr>
			<th></th><th></th><th></th>
		</tr>
		<tr>
			<th>별사탕 50개=5,500원&nbsp;<input type="button" name="btn" class="w3-button w3-white w3-border w3-border-blue" data-value="50" value="구매하기"></th>
			<th></th>
			<th>별사탕 100개=11,000원&nbsp;<input type="button" name="btn" class="w3-button w3-white w3-border w3-border-blue" data-value="100" value="구매하기"></th>
		</tr>
		<tr>
			<th></th><th></th><th></th>
		</tr>
		<tr>
			<th>별사탕 300개=33,000원&nbsp;<input type="button" name="btn" class="w3-button w3-white w3-border w3-border-blue" data-value="300" value="구매하기"></th>
			<th></th>
			<th>별사탕 500개=55,000원&nbsp;<input type="button" name="btn" class="w3-button w3-white w3-border w3-border-blue" data-value="500" value="구매하기"></th>
		</tr>
	</table> -->
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

