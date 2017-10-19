<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
@charset "euc-kr";

@import url("//res.afreecatv.com/css/global/layer.css"); 





td { font-size:9pt; font-family:돋움;  text-decoration: none; color: #393939;} 



.ok
       {font-family:돋움; font-size:12px; color:#603811; font-weight : bold;}
a:link.ok
       {font-family:돋움; font-size:12px; color:#603811; font-weight : bold; text-decoration:none; } 
a:visited.ok
       {font-family:돋움; font-size:12px; color:#603811; font-weight : bold; text-decoration:none; } 
a:hover.ok
       {font-family:돋움; font-size:12px; color:#603811; text-decoration:underline; }




.bkb
       {font-family:돋움; font-size:12px; color:#000000; font-weight : bold;} 
a:link.bkb
       {font-family:돋움; font-size:12px; color:#000000; text-decoration:underline; font-weight : bold;} 
a:visited.bkb
       {font-family:돋움; font-size:12px; color:#000000; text-decoration:underline; font-weight : bold;} 
a:hover.bkb
       {font-family:돋움; font-size:12px; color:#000000; text-decoration:underline; font-weight : bold;}


.black_link
       {font-family:돋움; font-size:12px; color:#000000;} 
a:link.black_link 
       {font-family:돋움; font-size:12px; color:#000000; text-decoration:none;} 
a:visited.black_link 
       {font-family:돋움; font-size:12px; color:#000000; text-decoration:none;} 
a:hover.black_link
       {font-family:돋움; font-size:12px; color:#FF4F30; text-decoration:underline;}

.black_link_underline
       {font-family:돋움; font-size:12px; color:#000000; text-decoration:underline;} 
a:link.black_link_underline 
       {font-family:돋움; font-size:12px; color:#000000; text-decoration:underline;} 
a:visited.black_link_underline 
       {font-family:돋움; font-size:12px; color:#000000; text-decoration:underline;} 
a:hover.black_link_underline
       {font-family:돋움; font-size:12px; color:#ff4f30; text-decoration:underline;}

.point_small_link
       {font-family:돋움; font-size:11px; color:#ff4f30; text-decoration:underline;} 
a:link.point_small_link 
       {font-family:돋움; font-size:11px; color:#ff4f30; text-decoration:underline;} 
a:visited.point_small_link 
       {font-family:돋움; font-size:11px; color:#ff4f30; text-decoration:underline;} 
a:hover.point_small_link
       {font-family:돋움; font-size:11px; color:#ff4f30; text-decoration:underline;}
	   
.point_small_link2
       {font-family:돋움; font-size:11px; color:#1671A9; text-decoration:underline;} 
a:link.point_small_link2 
       {font-family:돋움; font-size:11px; color:#1671A9; text-decoration:underline;} 
a:visited.point_small_link2 
       {font-family:돋움; font-size:11px; color:#1671A9; text-decoration:underline;} 
a:hover.point_small_link2
       {font-family:돋움; font-size:11px; color:#1671A9; text-decoration:underline;}

.grey_small_link
       {font-family:돋움; font-size:11px; color:#666; text-decoration:underline;} 
a:link.grey_small_link 
       {font-family:돋움; font-size:11px; color:#666; text-decoration:underline;} 
a:visited.grey_small_link 
       {font-family:돋움; font-size:11px; color:#666; text-decoration:underline;} 
a:hover.grey_small_link
       {font-family:돋움; font-size:11px; color:#666; text-decoration:underline;}



/* 폰트스타일 */
.white_b     {font-family:돋움; font-size:12px; color:#ffffff;  font-weight:bold;}
.black_b     {font-family:돋움; font-size:12px; color:#000000;  font-weight:bold;}
.black14_b     {font-family:돋움; font-size:14px; color:#000000;  font-weight:bold;}
.black     {font-family:돋움; font-size:12px; color:#000000; line-height: 16px; }
.black_l     {font-family:돋움; font-size:12px; color:#000000;}
.black_small     {font-family:돋움; font-size:11px; color:#000000;}
.grey_small     {font-family:돋움; font-size:11px; color:#666666;}
.orange     {font-family:돋움; font-size:12px; color:#FF3300;}




/*현금영수증 팝업 테이블스타일*/
.tbl-cashbill {
	border: 0;
	}
.tbl-cashbill-td1 {
	border-right: #dbdbdb 1px solid;
	border-bottom: #dbdbdb 1px solid;
	}
.tble-sashbill-td2 {
	border-bottom: #dbdbdb 1px solid;
	}

/**********************************88현금영수증 발급팝업 스타일**************************************/
/**pdbox**/
.s-title {
	margin-bottom: 6px;
	}
.head-title {
	padding: 5px 0 0 12px;
	background: #000 url("//res.afreecatv.com/foreign/pointinfo/img/cashbill_pop_title_url.gif") bottom right no-repeat;
	}
.head-color {
	background: #ff6c52;
	}
.pay-pop-help {
	padding-right: 8px;
	}
.cashbill-bigtable {
	background: #9FD6EC;
	}
.table-td1 {
	width: 140px;
	height: 25px;
	padding: 2px 0 0 10px;
	background: #EBF6FF;
	}
.table-td11 {
	width: 160px;
	height: 25px;
	padding: 2px 0 0 10px;
	background: #FDF4F4;
	}
.table-td2 {
	width: 294px;
	height: 25px;
	padding: 2px 0 0 10px;
	background: #ffffff;
	}
.table-td22 {
	width: 274px;
	height: 45px;
	padding: 2px 0 0 10px;
	background: #ffffff;
	}
.table-td3 {
	height: 25px;
	padding: 2px 0 0 0;
	background: #FDF4F4;
	align: center;
	}
.table-td4 {
	height: 25px;
	padding: 2px 0 0 0;
	background: #ffffff;
	align: center;
	}
.cell-color {
	background: #EBF6FF;
	}
.cell-white {
	background: #ffffff;
	}
.form {
	border: 0;
	}
.form2 {
	color: #000;
	background: #FFFFFF;
	border: #cccccc 1px solid;
	}


/**clubbox**/
.club-head-color {
	background: #4EB2FF;
	}
.club-cashbill-bigtable {
	background: #99CAF0;
	}
.club-cashbill-td1 {
	width: 140px;
	height: 25px;
	padding: 2px 0 0 10px;
	background: #F0F9FF;
	}
.club-cashbill-td2 {
	height: 25px;
	padding: 2px 0 0 10px;
	background: #ffffff;
	}
.club-cashbill-form {
	border: 0;
	}
.club-cashbill-form2 {
	background: #F6F6F6;
	}
/**공통**/
.table-caution {
	margin: 15px 0 15px 0;
	}
.caution {
	font-size: 11px;
	letter-spacing: -0.05em;
	font-weight: normal;
	}
.point-small {
	/*letter-spacing: -0.05em;*/
	font-size: 11px;
	color: #0296CD;
	}
.point-small-bold {
	/*letter-spacing: -0.05em;*/
	font-size: 11px;
	color: #0296CD;
	font-weight: bold;
	}
.point-b {
	/*letter-spacing: -0.05em;*/
	font-size: 12px;
	color: #0296CD;
	}
.point {
	letter-spacing: 0;
	font-size: 12px;
	color: #F44074;
	}
.point-bold {
	letter-spacing: 0;
	font-size: 12px;
	color: #F44074;
	font-weight: bold;
	}
.point2 {
	letter-spacing: 0;
	font-size: 12px;
	color: #3C83E3;
	}
.point2-bold {
	letter-spacing: 0;
	font-size: 12px;
	color: #3C83E3;
	font-weight: bold;
	}
.point3-bold{
	letter-spacing: 0;
	font-size: 12px;
	color: #0089d8;
	font-weight: bold;
	}
/****************************************************************************/

/* 인풋 스타일 */

.chek_wh{Background-color:#FFFFFF; 	Border:1x SOLID  gray ;}
input {
	background-color: transparent;
	border: 1;
	}



/* 스크롤박스 스타일 */


#scrollbox360{width:360; height:260; overflow:auto; padding:0px; border:0; }

/*고객감사 이벤트 용*/
.cashbill-bigtable-thanks {
	background: #ffe39a;
	}

.cell-color-thanks {
	background: #faf6e2;
	}
	
	
	.m_blue12
       {font-family:돋움; font-size:12px; color:#1671A9; text-decoration:none;} 
a:link.m_blue12
       {font-family:돋움; font-size:12px; color:#1671A9; text-decoration:none;} 
a:visited.m_blue12
       {font-family:돋움; font-size:12px; color:#1671A9; text-decoration:none;} 
a:hover.m_blue12
       {font-family:돋움; font-size:12px; color:#1671A9; text-decoration:underline;} 


/*cash*/
.txt_price{text-align:center;font-size:11px;color:#518cc8;padding:0 0 14px 0;margin:0 0 0 0}
.txt_price p.q{font-weight:bold;color:#666;font-size:12px;padding:5px 0 0 0}
.txt_price p{margin:0;padding:0}

/**/
.ga_item{margin:0 0 0 5px;padding:10px 0 9px 0;width:436px;}
  .ga_item li{
	list-style:none;
	background:url(//res.afreecatv.com/images/pop_up/common/sq_blue_1x.gif) 0 8px no-repeat;
	padding:0 0 0 5px;margin:0;
	font-size:11px;font-family:돋움;color:#393939;text-align:left;
	}
  .ga_item li span{color:#0296cd}

.bul_top {padding-top:4px;}
.inp_gift {border:1px solid #cccccc;width:84px;height:18px;vertical-align:middle;}
.btn_gift {margin-left:3px;vertical-align:middle;}
span.tax {color:#f44074;font-weight:normal;}
span.tax em {font-weight:normal;font-style:normal;color:#393939;}
.txt_s01 {padding-bottom:10px;line-height:16px;font-size:11px;color:#393939;}
.txt5 {font-size:11px;padding:8px 0 4px 17px;color:#000;background:url(//res.afreecatv.com/images/popup/common/bul_sq_blue02.gif) 10px 12px no-repeat;}
.txt5 em {color:#1a73bf;font-style:normal;}
.txt5 a {color:#1a73bf;}

/* 자동결제 */
.pay_line {border:1px solid #9fd6ec}
.pay_line ul {margin:0;padding:15px 0 8px 11px}
.pay_line li {list-style:none;margin:0 0 5px 0;padding:0 0 0 7px;letter-spacing:-1px;line-height:16px;font-size:11px;color:#424542;background:url(//res.afreecatv.com/images/popup/common/bg_dot3.gif) no-repeat 0 5px}
.pay_line li span {color:#f44074}
.pay_line li ul{padding:10px 0 3px 0;}
.pay_line li ul li{background:none; padding:0; color:#666;}

.agree_scroll {width:440px;height:124px;overflow:auto}
.agree_scroll p {padding:10px 15px;margin:0;line-height:16px;font-size:11px}
.radio_w {width:13px;height:13px;margin:0 6px 3px 0;vertical-align:middle}

.box_txt01 {padding:10px 0 7px;line-height:16px;color:#424542;text-align:center;border:1px solid #9fd6ec;background:#ebf6ff} 

.find_input {font-size:9pt;font-family:돋움;color:#000000;Background-color:#FFFFFF;Border:1px SOLID #999999;}


/*120326 구매*/
.list_pay_info{margin:0 0 15px 0;padding:0}
.list_pay_info *{margin:0;padding:0}
.list_pay_info{width:436px}
.list_pay_info li{list-style:none;text-align:left;font-size:11px;font-family:돋움;line-height:1.5em;background:url(//res.afreecatv.com/images/popup/bul_sq.gif) 0 6px no-repeat;padding:0 0 3px 6px}
.list_pay_info li span, .list_pay_info li strong{color:#0296cd}
.tb_bluebox{border:2px solid #9fd6ec;width:438px;margin-top:9px}
.tb_bluebox th{background:#ebf6ff;font-size:12px;text-align:left;font-weight:normal;padding:10px 0 6px 0}
.tb_bluebox th p{background:url(//res.afreecatv.com/images/popup/bul_sq.gif) 0 5px no-repeat;margin-left:12px;padding-left:7px}
.tb_bluebox td{padding:0 0 0 10px}

.total_point input{vertical-align:middle; }
.linea{margin:0px; padding:5px 5px 0 5px;  }
.linea_dot{margin:0px; padding:0px 5px 15px 28px;  text-align:left }
.rule_wrap02{background:#F8F8F8; color:#ff3400; width:416px; margin:10px auto 10px; font-size:12px; padding:10px; text-align:left; }
.rule_wrap03{background:#F8F8F8; color:#393939; width:416px; margin:10px auto 10px; font-size:12px; padding:10px; text-align:left; letter-spacing:-1px; }
.rule_wrap03 span{color:#ff3400; }

.cinfo td{padding:5px 10px; text-align:left; }
.line{margin:0; padding:0; font-size:0; height:1px; background:#ffffff; }
.btn_use{margin-left:10px; vertical-align:middle; }
.linea_dot a img{vertical-align:middle;  }

	
</style>
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
								&nbsp;x&nbsp;&nbsp;<input type="text" id="buy_ea2" name="buy_ea2" size="5"><br></td>
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