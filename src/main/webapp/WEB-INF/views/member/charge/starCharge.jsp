<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/starCharge.css'/>?ver=4">
</head>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						if ($("#hid").val() == "exit") {
							self.close();
						}
						$("#buy_ea2").on(
								"keyup",
								function() {
									$("#buy_ea1").val($("#ea").text());
									$("#result")
											.text(
													parseInt($("#ea").text()
															* $("#buy_ea2")
																	.val()
															* 110));
									$("#resultT").text(
											parseInt($("#ea").text()
													* $("#buy_ea2").val()));
									if (isNaN($("#result").text())) {
										alert("숫자가 아닌 값이 있습니다");
										$("#result").text("");
										$("#resultT").text("");
										$("#buy_ea1").val("");
										$("#buy_ea2").val("");
									}
								});

						$("#cancel").on("click", function() {
							self.close();
						});
						$("#sm")
								.on(
										"click",
										function() {
											if ($("#buy_ea2").val() == null
													|| $("#buy_ea2").val() == "") {
												alert("충전수량을 입력하세요.");
												$("#result").text("");
												$("#resultT").text("");
											} else if ($("#buy_ea2").val() == 0) {
												alert("충전수량은 1 이상의 숫자만 입력가능합니다.");
												$("#buy_ea2").val("");
												$("#result").text("");
												$("#resultT").text("");
											} else if (parseInt($("#result")
													.text()) > parseInt($(
													"#money").text())) {
												alert("소지금액이 부족합니다.");
												$("#buy_ea2").val("");
												$("#result").text("");
												$("#resultT").text("");
											} else {
												alert(parseInt($("#ea").text()
														* $("#buy_ea2").val())
														+ "개의 별풍선이 충전되었습니다.");
												$('form').submit();
											}
										});
					});
</script>
<body>
	<div>
		<%-- <form method="post" action="<c:url value='/member/charge/buyStar'/>">
		<input type="hidden" name="buy_ea1" id="buy_ea1">
		구매수량 : <span id="ea">${ea }</span> x <input type="text" id="buy_ea2" name="buy_ea2" size="5"><br>
		합계수량 : <span id="resultT"></span><br>
		합계금액 : <span id="result"></span><br><br>
		소지금액 : <span id="money">${money }</span><br>
		<input type="button" id="sm" value="구매">
		<input type="button" id="cancel" value="취소">
		
		<input type="hidden" id="hid" value="${exit }">
	</form> --%>

		<form name="form1" method="post"
			action="<c:url value='/member/charge/buyStar'/>">
			<input type="hidden" name="buy_ea1" id="buy_ea1">
			<input type="hidden" name="encparam"
				value="9AEBAA10DF2E74EF6F8CD4269317BA83CBECAF101290C2EC561B463B36807731539A26DE1FAE433555DD4D6ABC53F9027C3A537B51FCBD19D47AF3734B9ED80C19B034A8589309BE031471E1F0134785D87A6E98BF398DD272DADB8690F5980D9AFCF09D1E1812009731760B8EDEA50F4CA4E085266F46453A5B57BA3837ADBA5F008D1222FBA94C95770A86A74BF39203E284A39C48170D265F43639B169B6D1077DB75D4A5064C5DF450DAB4AC029D14394FD92CD53CE267F4E59F909BF9D387BFF197D5D51F0153DE7887810570A9A186DC441B4064191406CB4BAC6759EEFF254C1989CFF733D5EA67EBDB43A785B1EFD0E287B5E3AA1FD40209FF3D6FD82D79DFC06CB96DB4F9F5FF69667DDDF4F71E23A929D2519F">
			<input type="hidden" name="email" value="" maxlength="50"> <input
				type="hidden" name="payamt" value="3300"> <input
				type="hidden" name="idcheck" value=""> <input type="hidden"
				name="giftinfo" value=""> <input type="hidden" name="ruid"
				value=""> <input type="hidden" name="rresult" value="">
			<input type="hidden" name="rszval" value="">
			<center>
			<table width="470" border="0" cellspacing="0" cellpadding="0"> 
    <tbody><tr> 
      <td height="5"></td> 
    </tr> 
  </tbody>
				</table>
				<table width="470"  border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td width="5"></td>
							<td width="8"><img
								src="" width="8"
								height="33"></td>
							<td background="//res.afreecatv.com/img/popupbg_02.gif">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td align="left" width="22"><img
												src="//res.afreecatv.com/img/popup_icon.gif" width="19"
												height="19"></td>
											<td>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tbody>
														<tr>
															<td height="3"></td>
														</tr>
														<tr>
															<td class="white_b" align="left">구매하기</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td width="7"><img
								src="" width="7"
								height="33"></td>
							<td width="5"></td>
						</tr>
					</tbody>
				</table>
				<table width="470" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td height="17"></td>
						</tr>
					</tbody>
				</table>
				<!--구매할 상품-->
				<table width="442" border="0" cellspacing="0" cellpadding="0"
					class="s-title">
					<tbody>
						<tr>
							<td width="19"><img
								src="//res.afreecatv.com/img/newpopup_blt_01.gif"></td>
							<td align="left"><b>구매할 상품 : <span id="ea">${ea }</span>
								&nbsp;x&nbsp;&nbsp;<input type="text" id="buy_ea2" name="buy_ea2" size="5" autocomplete=off><br></td>
						</tr>
					</tbody>
				</table>

				<table width="442" border="0" cellspacing="0" cellpadding="0"
					class="s-title">
					<tbody>
						<tr>
							<td width="19"><img
								src="//res.afreecatv.com/img/newpopup_blt_01.gif"></td>
							<td align="left">총 상품 개수 : <span id="resultT"></span><br>
							</td>
						</tr>
					</tbody>
				</table>

				<!--//총상품개수-->

				<!--상품가격-->
				<table width="442" border="0" cellspacing="0" cellpadding="0"
					class="s-title">
					<tbody>
						<tr>
							<td width="19"><img
								src="//res.afreecatv.com/img/newpopup_blt_01.gif"></td>
							<td align="left">상품가격 : <span id="result"></span><br>
							</td>
						</tr>
					</tbody>
				</table>
				<!--//상품가격-->
				<!--제공기간-->
				<table width="442" border="0" cellspacing="0" cellpadding="0"
					class="s-title">
					<tbody>
						<tr>
							<td width="19"><img
								src="//res.afreecatv.com/img/newpopup_blt_01.gif"></td>
							<td align="left"><b>제공기간 : </b>구매일로부터 5년</td>
						</tr>
					</tbody>
				</table>
				<table width="445" border="0" cellspacing="0" cellpadding="2"
					class="cashbill-bigtable" style="margin-top: 50px;">
					<tbody>
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="cell-color">

									<!--//170830-->
									</tbody>
								</table>
							</td>
						</tr>

						<tr>
							<td width="90" align="center" bgcolor="EBF6FF"><b>캐쉬결제</b></td>
							<td bgcolor="#FFFFFF" height="35">

								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td width="235">&nbsp;( 잔액 : </b><span id="money">${money }원</span> )<b></td>

											<td align="left"><b><a href="<c:url value='/member/charge/money'/>"><img
														src="//res.afreecatv.com/img/newpopup_btn_01.gif"
														border="0"></a></b></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				</td>
				</tr>
				</tbody>
				</table>
				</td>
				</tr>
				</tbody>
				</table>

				<table width="436" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td height="12"></td>
						</tr>
					</tbody>
				</table>
				<!--결제정보-->
				<table width="436" border="0" cellspacing="0" cellpadding="0"
					height="2">
					<tbody>
						<tr>
							<td></td>
						</tr>
					</tbody>
				</table>

				<table width="470" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td rowspan="5" width="5">&nbsp;</td>
							<td height="5"></td>
							<td rowspan="5" width="5">&nbsp;</td>
						</tr>
						<tr>
							<td height="17">&nbsp;</td>
						</tr>
						<tr>
							<td>
								<div id="presubmit">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td align="right"><a href="#" id="sm"><img
														src="//res.afreecatv.com/img/popupbtn_ok.gif" border="0"></a></td>
												<td width="5"></td>
												<td align="left"><a href="javascript:window.close();" id="cencel"><img
														src="//res.afreecatv.com/img/popupbtn_cancel.gif"
														border="0"></a></td>
												<input type="hidden" id="hid" value="${exit }">
											</tr>
										</tbody>
									</table>
								</div> <!--확인취소 버튼-->

								</center>
								</form>
								</div>
</body>
</html>