<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/money.css'/>?ver=3">
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				if ($("#hid").val() == "exit") {
					self.close();
				}
				$("#cancel").on("click", function() {
					self.close();
				});

				$(".result").text($(":radio[name=moneyC]:checked").val());
				$("#resultP").text(
						$(":radio[name=pay]:checked").attr("data-value"));
				$(".mm").on("change", function() {
					//var a = $(":radio[name=moneyC]:checked").val();
					//var b = a * 0.10;
					$(".result").text($(":radio[name=moneyC]:checked").val());
					//$(".result").text(parseInt(a) + parseInt(b));
				});
				$(".pp").on(
						"change",
						function() {
							$("#resultP").text(
									$(":radio[name=pay]:checked").attr(
											"data-value"));
						});
				$("#sm").on(
						"click",
						function() {
							alert($(":radio[name=moneyC]:checked").val()
									+ "원 결제되었습니다.");
							$('#frm').submit();
						});
			});
</script>

<form name="form1" method="post" id="frm"
	action="<c:url value='/member/charge/moneyCharge'/>">
	<input type="hidden" name="encparam"
		value="9AEBAA10DF2E74EF6F8CD4269317BA83CBECAF101290C2EC561B463B36807731539A26DE1FAE433555DD4D6ABC53F9027C3A537B51FCBD19D47AF3734B9ED80C19B034A8589309BE031471E1F013478538F9359CB8CDE56ACAB992B48CAEFA335431DE67603CAB5CF0CA3C5B552CBFEBB3A740B663A88D91580A62CA11C18E2585D657EB7849CA6B33FF28DBD2D4482714116C500771442542EC1C6568A5A478250732ADDD8E728EBB470C9F65BC39538E77F67E61F7B545E396873314F1BF2A3B0A90C5AE1E487EAB50FB830C3AB44F">
	<input type="hidden" name="totalpayamt" value="11000"> <input
		type="hidden" name="payamt" value="11000">

	<center>
		<table width="470" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr>
					<td height="5"></td>
				</tr>
			</tbody>
		</table>
		<table width="470" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr>
					<td width="5"></td>
					<td width="8"><img
						src="//res.afreecatv.com/img/popupbg_01.gif" width="8" height="33"></td>
					<td background="//res.afreecatv.com/img/popupbg_02.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td align="left" width="22" valign="bottom"><img
										src="//res.afreecatv.com/img/popup_icon.gif" width="19"
										height="19"></td>
									<td>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td height="3"></td>
												</tr>
												<tr>
													<td class="white_b" align="left">캐쉬 충전</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="7"><img
						src="//res.afreecatv.com/img/popupbg_03.gif" width="7" height="33"></td>
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
		<script language="javascript"
			src="/lib/check_maintain.js?version=20130626">
		</script>
		<script language="javascript"></script>
		<table width="436" border="0" cellspacing="0" cellpadding="0"
			class="s-title">
			<tbody>
				<tr>
					<td width="19"><img
						src="//res.afreecatv.com/img/newpopup_blt_01.gif"></td>
					<td align="left"><b>결제수단 선택</b></td>
				</tr>
			</tbody>
		</table>
		<tbody>
		<!-- 	<tr>
				<td> -->
					<table style="text-align: left; width: 400px;">
						<tr>
							<c:forEach var="vo" items="${plist }">
								<c:choose>
									<c:when test="${vo.p_num==1 }">
										<th><label style="font-size: 11px;"><input
												type="radio" value="${vo.p_num }" data-value="${vo.p_name }"
												name="pay" checked="checked" class="pp">${vo.p_name }</label>
										</th>
									</c:when>
									<c:otherwise>
										<th><label style="font-size: 11px;"><input
												type="radio" value="${vo.p_num }" data-value="${vo.p_name }"
												name="pay" class="pp">${vo.p_name }</label>
										</th>
									</c:otherwise>
								</c:choose>
								<c:if test="${vo.p_num%4==0 }">
									<tr>
									</tr>
								</c:if>
							</c:forEach>
						</tr>
					</table>
			<tr>
				<td colspan="2" align="center"><img
					src="//res.afreecatv.com/img/newpopup_dodline.gif" width="432"
					height="1" style="margin-top: 5px;"></td>
			</tr>
		</tbody>
		<table width="442" border="0" cellspacing="0" cellpadding="0"
			height="17">
			<tbody>
				<tr>
					<td></td>
				</tr>
			</tbody>
		</table>
		<script language="javascript">
			function SetTotalPayAmt() {
				var payamt;

				for (i = 0; i < document.form1.moneyC.length; i++) {

					if (document.form1.moneyC[i].checked == true)
						payamt = document.form1.moneyC[i].value;

				}

				if (payamt == 3300) {
					chargepoint_info.innerHTML = "<span class='point-bold'>3,000C</span>";
				} else if (payamt == 5500) {
					chargepoint_info.innerHTML = "<span class='point-bold'>5,000C</span>";
				} else if (payamt == 11000) {
					chargepoint_info.innerHTML = "<span class='point-bold'>10,000C</span>";
				} else if (payamt == 33000) {
					chargepoint_info.innerHTML = "<span class='point-bold'>30,000C</span>";
				} else if (payamt == 55000) {
					chargepoint_info.innerHTML = "<span class='point-bold'>50,000C</span>";
				}

				document.form1.payamt.value = payamt;
				document.form1.totalpayamt.value = parseInt(payamt, 10)
						+ (parseInt(payamt, 10) * 0.1);
				totalpayamt_noti.innerHTML = MoneyFormat(payamt);

				 totalpayamt_noti2.innerHTML = MoneyFormat(payamt);

			}
		</script>
		<table width="436" border="0" cellspacing="0" cellpadding="0"
			class="s-title">
			<tbody>
				<tr>
					<td width="14"><img
						src="//res.afreecatv.com/img/newpopup_blt_01.gif" width="10"
						height="11"></td>
					<td width="75"><b>결제할 금액</b></td>
					<td valign="top">&nbsp;</td>
				</tr>
			</tbody>
		</table>
		<table width="436" border="0" cellspacing="0" cellpadding="2"
			class="cashbill-bigtable">
			<tbody>
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="cell-color">
							<tbody>
								<tr>
									<td align="center" height="34" class="cell-color">
										<table width="95%" border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td><input type="radio" value="3300" name="moneyC"
														class="mm" onclick="javascript:SetTotalPayAmt();">
														<span class="black_b">3,000원</span></td>
													<td><input type="radio" value="5500" name="moneyC"
														class="mm" onclick="javascript:SetTotalPayAmt();">
														<span class="black_b">5,000원</span></td>
													<td><input type="radio" value="11000" name="moneyC"
														class="mm" onclick="javascript:SetTotalPayAmt();"
														checked="checked"> <span class="black_b">10,000원</span></td>
													<td><input type="radio" value="33000" name="moneyC"
														class="mm" onclick="javascript:SetTotalPayAmt();">
														<span class="black_b">30,000원</span></td>
													<td><input type="radio" value="55000" name="moneyC"
														class="mm" onclick="javascript:SetTotalPayAmt();">
														<span class="black_b">50,000원</span></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center" height="1"><img
										src="//res.afreecatv.com/img/newpopup_dodline.gif" width="432"
										height="1"></td>
								</tr>
								<tr>
									<td align="center" height="31" class="cell-white"><span
										class="black_b">충전되는 캐쉬</span> <span id="chargepoint_info"><span
											class="point-bold">10,000C</span></span></td>
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
					<td align="right" height="18" valign="bottom"></td>
				</tr>
			</tbody>
		</table>
		<!--//금액-->
		<!--//결제할 금액-OK캐쉬백결제선택시 노출 안됨-->
		<!--결제정보-->
		<table width="442" border="0" cellspacing="0" cellpadding="0"
			height="2">
			<tbody>
				<tr>
					<td></td>
				</tr>
			</tbody>
		</table>
		<table width="442" border="0" cellspacing="0" cellpadding="0"
			class="s-title">
			<tbody>
				<tr>
					<td width="19"><img
						src="//res.afreecatv.com/img/newpopup_blt_01.gif"></td>
					<td align="left"><b>결제 정보</b></td>
				</tr>
			</tbody>
		</table>
		<table width="434" border="0" cellspacing="0" cellpadding="2"
			class="cashbill-bigtable">
			<tbody>
				<tr>
					<td>
						<!--결제정보-신용카드--> <span id="totalpayamt_noti2"
						style="display: none">10,000</span>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td width="110" align="left" height="25" bgcolor="#EBF6FF">&nbsp;&nbsp;
										<img src="//res.afreecatv.com/img/newpopup_blt_02.gif"
										align="absmiddle"> 이름
									</td>
									<td width="324" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;${mvo.name }
										(${mvo.id })</td>
								</tr>
								<tr>
									<td colspan="2"><img
										src="//res.afreecatv.com/img/newpopup_dodline.gif" width="432"
										height="1"></td>
								</tr>
								<tr align="left">
									<td class="table-td1" width="140"><img
										src="//res.afreecatv.com/img/newpopup_blt_02.gif"
										align="absmiddle"> 구매금액</td>
									<td class="table-td2"><span class="point-bold"><span
											class="result" style="color: red;"></span>원</span> ※부가세 별도</td>

								</tr>
								<tr>
									<td colspan="2"><img
										src="//res.afreecatv.com/img/newpopup_dodline.gif" width="432"
										height="1"></td>
								</tr>

							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<table width="442" border="0" cellspacing="0" cellpadding="0"
			class="table-caution">
			<tbody>
				<tr>
					<td>
						<!--//주의사항-->
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td class="caution" height="16" align="left"><font
										color="#0296CD">·</font> <span class="point-small"></span><span
										class="point-small">국가정책에 따라 미성년자는 휴대폰결제에 제한을 받으실
											수있습니다.</span></td>
								</tr>
								<tr>
									<td class="caution" height="16" align="left"><font
										color="#0296CD">·</font> <span class="point-small"></span><span
										class="point-small">휴대폰 결제 한도(월 50만원)</span></td>
								</tr>
							</tbody>
						</table>
					</td>
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
					<td height="1" bgcolor="cccccc"></td>
				</tr>
				<tr>
					<td height="17">&nbsp;</td>
				</tr>
				<tr>
					<td>
						<!--하단버튼-->
						<div id="presubmit">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td align="right"><a href="#" id="sm"><img
												src="//res.afreecatv.com/img/popupbtn_ok.gif" border="0"></a></td>
										<td width="5"></td>
										<td align="left"><a href="#" id="cancel"><img
												src="//res.afreecatv.com/img/popupbtn_cancel.gif" border="0"></a></td>
										<input type="hidden" id="hid" value="${exit }">
									</tr>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td height="17">&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</center>
</form>
</body>

