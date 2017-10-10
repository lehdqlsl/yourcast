<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
<div class="w3-main">

	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
	<script type="text/javascript">
		 $(document).ready(function(){
			if($("#hid").val()=="exit"){
				self.close();
			}
			$("#cancel").on("click",function(){
				self.close();
			});
			
			$(".result").text($(":radio[name=moneyC]:checked").val());
			$("#resultP").text($(":radio[name=pay]:checked").attr("data-value"));
			
			$(".mm").on("change",function(){
				$(".result").text($(":radio[name=moneyC]:checked").val());
			});
			$(".pp").on("change",function(){
				$("#resultP").text($(":radio[name=pay]:checked").attr("data-value"));
			});
			
			$("#sm").on("click",function(){
				alert($(":radio[name=moneyC]:checked").val() + "원의 금액이 충전되었습니다.");
				$('#frm').submit();
			});
		 });
	</script>

	<div>
		<form method="post" id="frm" action="<c:url value='/member/charge/moneyCharge'/>">
			<div>결제수단 선택</div>
			<table style="text-align: left;width:500px;">
				<tr>
				<c:forEach var="vo" items="${plist }">
				
					<c:choose>
						<c:when test="${vo.p_num==1 }">
							<th><label><input type="radio" value="${vo.p_num }" data-value="${vo.p_name }" name="pay" checked="checked" class="pp">${vo.p_name }</label><th>
						</c:when>
						<c:otherwise>
							<th><label><input type="radio" value="${vo.p_num }" data-value="${vo.p_name }" name="pay" class="pp">${vo.p_name }</label><th>
						</c:otherwise>
					</c:choose>
					<c:if test="${vo.p_num%4==0 }">
						<tr>
						</tr>
					</c:if>
					
				</c:forEach>
				</tr>
				
			</table>
			
			<br>
			<div>결제할 금액</div>
			<table style="width:500px;">
				<tr>
					<th><label><input type="radio" value="3300" checked="checked" name="moneyC" class="mm">3000원</label></th>
					<th><label><input type="radio" value="5500" name="moneyC" class="mm">5000원</label></th>
					<th><label><input type="radio" value="11000" name="moneyC" class="mm">10000원</label></th>
					<th><label><input type="radio" value="33000" name="moneyC" class="mm">30000원</label></th>
					<th><label><input type="radio" value="55000" name="moneyC" class="mm">50000원</label></th>
				</tr>
				<tr>
					<th colspan="5">충전되는 캐시 : <span class="result" style="color: red;"></span></th>
				</tr>
			</table>
			<br>
			
			<div>결제 정보</div>
			<table style="text-align: left;width:500px;">
				<tr>
					<th>이름</th><th>${mvo.name } (${mvo.id })</th>
				</tr>
				<tr>
					<th>결제수단</th><th><span id="resultP"></span></th>
				</tr>
				<tr>
					<th>구매금액</th><th><span class="result" style="color: red;"></span> ※부가세 별도</th>
				</tr>
			</table>
			<br>
		
			<input type="button" id="sm" value="충전">
			<input type="button" id="cancel" value="취소">
			
			<input type="hidden" id="hid" value="${exit }">
		</form>
	</div>

</div>

