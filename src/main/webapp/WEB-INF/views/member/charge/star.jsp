<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.min.css'/>?ver=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.theme.min.css'/>?ver=1">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>

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
			$( ".star" ).on( "click", function() {
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
		
	<table style="width:700px;height:100px;">
		<tr>
			<th>별사탕 10개=1,100원<input type="button" class="star" data-value="10" value="구매하기"></th>
			<th></th>
			<th>별사탕 30개=3,300원<input type="button" class="star" data-value="30" value="구매하기"></th>
		</tr>
		<tr>
			<th></th><th></th><th></th>
		</tr>
		<tr>
			<th>별사탕 50개=5,500원<input type="button" class="star" data-value="50" value="구매하기"></th>
			<th></th>
			<th>별사탕 100개=11,000원<input type="button" class="star" data-value="100" value="구매하기"></th>
		</tr>
		<tr>
			<th></th><th></th><th></th>
		</tr>
		<tr>
			<th>별사탕 300개=33,000원<input type="button" class="star" data-value="300" value="구매하기"></th>
			<th></th>
			<th>별사탕 500개=55,000원<input type="button" class="star" data-value="500" value="구매하기"></th>
		</tr>
	</table>
	
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

