<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<script type="text/javascript">
		 $(document).ready(function(){
			if($("#hid").val()=="exit"){
				self.close();
			}
			$("#buy_ea2").on("keyup",function(){
				$("#buy_ea1").val($("#ea").text());
				$("#result").text(parseInt($("#ea").text()*$("#buy_ea2").val()*110));
				$("#resultT").text(parseInt($("#ea").text()*$("#buy_ea2").val()));
				if(isNaN($("#result").text())){
					alert("숫자가 아닌 값이 있습니다");
					$("#result").text("");
					$("#resultT").text("");
					$("#buy_ea1").val("");
					$("#buy_ea2").val("");
				}
			});
			
			$("#cancel").on("click",function(){
				self.close();
			});
			$("#sm").on("click",function(){
				if($("#buy_ea2").val()==null || $("#buy_ea2").val()==""){
					alert("충전수량을 입력하세요.");
					$("#result").text("");
					$("#resultT").text("");
				}else if($("#buy_ea2").val()==0){
					alert("충전수량은 1 이상의 숫자만 입력가능합니다.");
					$("#buy_ea2").val("");
					$("#result").text("");
					$("#resultT").text("");
				}else if(parseInt($("#result").text())>parseInt($("#money").text())){
					alert("소지금액이 부족합니다.");
					$("#buy_ea2").val("");
					$("#result").text("");
					$("#resultT").text("");
				}else{
					alert(parseInt($("#ea").text()*$("#buy_ea2").val()) + "개의 별사탕이 충전되었습니다.");
					$('form').submit();
				}	
			});
		 });
</script>
<body>
<div>
	<form method="post" action="<c:url value='/member/charge/buyStar'/>">
		<input type="hidden" name="buy_ea1" id="buy_ea1">
		구매수량 : <span id="ea">${ea }</span> x <input type="text" id="buy_ea2" name="buy_ea2" size="5"><br>
		합계수량 : <span id="resultT"></span><br>
		합계금액 : <span id="result"></span><br><br>
		소지금액 : <span id="money">${money }</span><br>
		<input type="button" id="sm" value="구매">
		<input type="button" id="cancel" value="취소">
		
		<input type="hidden" id="hid" value="${exit }">
	</form>
</div>
</body>
</html>