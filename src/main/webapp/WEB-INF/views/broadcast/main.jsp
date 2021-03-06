<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
.videobox {
	position: absolute;
	top: 57px;
	left: 0px;
	bottom: 0;
	overflow-x: hidden;
	overflow-y: scroll;
	max-width: 1600px;
	right: 320px;
}

.info {
	position: relative;
	z-index: 11;
	padding: 15px 0 40px 100px;
	min-height: 80px;
	display: block;
}

.player {
	bottom: 0;
	overflow-x: hidden;
	overflow-y: hidden;
	max-width: 1600px;
	max-height: 760px;
	height: 100%;
	width: 100%;
	left: 0px;
	display: block;
}

.player_list {
	position: relative;
	min-width: 460px;
	z-index: 52;
	height: 30px;
	padding: 15px 20px 40px 0;
	border-bottom: 1px solid #ddd;
}

.bjlogo {
	position: absolute;
	left: 10px;
	top: 0;
	padding: 16px 0 0 1px;
}

.player_list ul {
	position: relative;
	float: right;
	padding: 0;
	margin: 0;
}

.player_list ul li {
	display: inline;
	margin-left: 10px;
	line-height: 1.6;
}

.chat_area * {
	margin: 0;
	padding: 0;
	font-size: 12px;
	font-family: '돋움', dotum;
}

ul, ol {
	list-style: none;
}

em {
	font-style: normal;
}

.blind {
	display: block;
	position: absolute;
	overflow: hidden;
	left: -9999px;
	width: 1px;
	height: 1px;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
}

dd.name {
	margin: 0;
	font-size: 14px;
	color: #328fde;
	font-weight: bold;
	padding: 0 0 8px;
}

.info .bj dt {
	width: 100%;
	font-size: 18px;
	line-height: 1.3em;
	font-weight: bold;
	color: #555;
	padding: 0 0 13px;
	margin: 0 0 0 -2px;
	word-wrap: break-word;
}

.broadcast_viewer_cnt button span {
	position: relative;
	padding-left: 28px;
	font-size: 15px;
	background: url(http://res.afreecatv.com/images/flashplayer/broadcast_viewer.png) no-repeat left
		50%;
}

.broadcast_viewer_cnt button {
	position: relative;
	z-index: 2;
	overflow: visible;
	height: 19px;
	cursor: pointer;
	outline: none;
	border: none;
	color: #555;
	font-size: 15px;
	background-color: #fff;
	padding-top: 15px;
}

.broadcast_viewer_cnt button span em {
	font-size: 16px;
}

.broadcast_viewer_cnt {
	position: absolute;
	top: -2px;
	right: 10px;
	z-index: 12;
}
</style>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/chat_wrap.css'/>?ver=18">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/chat_layer.css'/>?ver=4">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/pop_layer.css'/>?ver=2">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/chat.css'/>?ver=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
</html>
<div class="w3-main" style="margin-top: 54px;">
	<div class="videobox">
		<div class="player">
			<div id="container">Loading the player ...</div>
		</div>
		<div class="player_list">
			<ul>
				<li><c:if test="${not empty sessionScope.id }">
			<c:choose>
			<c:when test="${bookmark==true }">
				<button class="w3-button w3-white" style="margin-left: 1185px" id="bookmark"><i class="fa fa-star" style="color:orange" id="yellowstar"></i>&nbsp;즐겨찾기</button>
			</c:when>
			<c:otherwise>
				<button class="w3-button w3-white" style="margin-left: 1185px" id="bookmark"><i class="fa fa-star" style="color:#BDBDBD" id="yellowstar"></i>&nbsp;즐겨찾기</button>
			</c:otherwise>
		</c:choose>
		</c:if></li>
			</ul>
		</div>


		<div class="info">
			<div class="broadcast_viewer_cnt">
				<button type="text">
					<span id="viewer_cnt"><em id="nAllViewer">0</em>명 시청</span>
				</button>
			</div>
			<div class="bjlogo">
				<a
					href="http://192.168.0.4:8082/app/${bjvo.id }" target="_blank" title="방송국 가기"
					class="btn"><img src="<c:url value='/resources/upload/${voMP.profile_savefilename }'/>"
					onerror="this.src='http://www.afreecatv.com/mybs/img/default_small_re.gif'"
					alt="BJ 로고" class="w3-circle" style="width: 69px;height: 69px;"> </a>
			</div>
			<dl class="bj">
				<dd class="name">${bjvo.name }</dd>
				<dt id="broadcast_title">${bvo.broadcast_title }</dt>
			</dl>
		</div>
	</div>

	<div class="chatbox" id="chatbox">
		<div class="chat_area" id="chat_area">
		</div>
		<div id="actionbox" class="actionbox">
			<!-- 버튼들 -->
			<ul id="ul1" class="ul1">
				<li id="btn_emo" class="emo first"><a href="javascript:;">이모티콘</a><em
					class="ttip" style="display: none;">이모티콘<span></span></em><span
					class="emo_tiplayer" id="emoLayer" style="display: none;"><em
						class="txt">이모티콘은 한번에 3개까지만 사용가능합니다.</em><span class="icon"></span>
						<button type="button" class="close">닫기</button></span></li>
			</ul>
			<ul id="ul2" class="ul2">
				<li id="btn_hope" class="hope" style="display: none;"><a
					href="javascript:;">희망풍선 선물하기</a><em class="ttip">희망풍선 선물하기<span></span></em></li>
				<li id="btn_star" class="star"><a href="javascript:;">별풍선
						선물하기</a><em class="ttip" style="display: none;">별풍선 선물하기<span></span></em></li>
			</ul>
			<!-- //버튼들 -->
			<!-- chat_write -->
			<div id="chat_write" class="chat_write">
				<h3>채팅쓰기</h3>
				<div class="ad_toggle">
					<span class="blue"> <input id="manage" type="radio"
						name="managerchat" checked="checked" class="on"
						data-message-type="1"> <label for="manage" class="on">운영</label>
					</span> <span class="red"> <input id="warning" type="radio"
						name="managerchat" data-message-type="2"> <label
						for="warning">경고</label>
					</span>
				</div>
				<div id="write_area" class="write_area" contenteditable="true"
					ondragenter="return false;" ondrop="return false;"
					ondragover="return false;">
					<c:if test="${empty sessionScope.id}">채팅에 참여하시려면 로그인이 필요합니다.</c:if>
				</div>
				<button type="button" id="btn_send" class="btn_send" title="보내기">보내기</button>

			</div>
			<div class="poll_layer" id="layer_poll" style="display: none;"></div>
		</div>
		<div id="emoticonArea">
			<div id="emoticonBox">
				<h1>이모티콘</h1>
				<div class="scroll_area">
					<span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/1.png"
							alt="샤방" title="/샤방/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/2.png"
							alt="윽" title="/윽/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/3.png"
							alt="휘파람" title="/휘파람/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/4.png"
							alt="짜증" title="/짜증/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/5.png"
							alt="헉" title="/헉/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/6.png"
							alt="하이" title="/하이/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/7.png"
							alt="개좋아" title="/개좋아/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/8.png"
							alt="개도발" title="/개도발/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/9.png"
							alt="개털림" title="/개털림/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/10.png"
							alt="개감상" title="/개감상/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/11.png"
							alt="개화나" title="/개화나/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/12.png"
							alt="개이득" title="/개이득/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/13.png"
							alt="개번쩍" title="/개번쩍/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/14.png"
							alt="주작" title="/주작/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/15.png"
							alt="꿀잼" title="/꿀잼/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/16.png"
							alt="업" title="/업/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/17.png"
							alt="갑" title="/갑/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/18.png"
							alt="묻" title="/묻/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/19.png"
							alt="심쿵" title="/심쿵/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/20.png"
							alt="스겜" title="/스겜/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/21.png"
							alt="추천" title="/추천/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/22.png"
							alt="인정" title="/인정/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/23.png"
							alt="사이다" title="/사이다/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/24.png"
							alt="TheLove" title="/TheLove/"></a></span><span><a
						href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/25.png"
							alt="극혐" title="/극혐/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/26.png"
							alt="매너챗" title="/매너챗/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/27.png"
							alt="강퇴" title="/강퇴/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/28.png"
							alt="드루와" title="/드루와/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/29.png"
							alt="아잉" title="/아잉/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/30.png"
							alt="기겁" title="/기겁/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/31.png"
							alt="우울" title="/우울/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/32.png"
							alt="쳇" title="/쳇/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/33.png"
							alt="ㅋㅋ" title="/ㅋㅋ/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/34.png"
							alt="졸려" title="/졸려/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/35.png"
							alt="최고" title="/최고/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/36.png"
							alt="엉엉" title="/엉엉/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/37.png"
							alt="후훗" title="/후훗/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/38.png"
							alt="부끄" title="/부끄/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/39.png"
							alt="제발" title="/제발/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/40.png"
							alt="덜덜" title="/덜덜/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/41.png"
							alt="좋아" title="/좋아/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/42.png"
							alt="반함" title="/반함/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/43.png"
							alt="멘붕" title="/멘붕/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/44.png"
							alt="버럭" title="/버럭/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/45.png"
							alt="우엑" title="/우엑/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/46.png"
							alt="뽀뽀" title="/뽀뽀/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/47.png"
							alt="심각" title="/심각/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/48.png"
							alt="쥘쥘" title="/쥘쥘/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/49.png"
							alt="훌쩍" title="/훌쩍/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/50.png"
							alt="헤헤" title="/헤헤/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/51.png"
							alt="코피" title="/코피/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/52.png"
							alt="철컹철컹" title="/철컹철컹/"></a></span><span><a
						href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/53.png"
							alt="섬뜩" title="/섬뜩/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/54.png"
							alt="꺄" title="/꺄/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/55.png"
							alt="굿" title="/굿/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/56.png"
							alt="글썽" title="/글썽/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/57.png"
							alt="황당" title="/황당/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/58.png"
							alt="정색" title="/정색/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/59.png"
							alt="피곤" title="/피곤/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/60.png"
							alt="사랑" title="/사랑/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/61.png"
							alt="좌절" title="/좌절/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/62.png"
							alt="목캔디" title="/목캔디/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/63.png"
							alt="RIP" title="/RIP/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/64.png"
							alt="건빵" title="/건빵/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/65.png"
							alt="사과" title="/사과/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/66.png"
							alt="겁나좋군" title="/겁나좋군/"></a></span><span><a
						href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/67.png"
							alt="근육남" title="/근육남/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/68.png"
							alt="박수" title="/박수/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/69.png"
							alt="케이크" title="/케이크/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/70.png"
							alt="약" title="/약/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/71.png"
							alt="소주" title="/소주/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/72.png"
							alt="짱" title="/짱/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/73.png"
							alt="꽃" title="/꽃/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/74.png"
							alt="왕" title="/왕/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/75.png"
							alt="썰렁" title="/썰렁/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/76.png"
							alt="무지개" title="/무지개/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/77.png"
							alt="태극기" title="/태극기/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/78.png"
							alt="절교" title="/절교/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/79.png"
							alt="하트" title="/하트/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/80.png"
							alt="불" title="/불/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/81.png"
							alt="별" title="/별/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/82.png"
							alt="폭탄" title="/폭탄/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/83.png"
							alt="폭죽" title="/폭죽/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/84.png"
							alt="보석" title="/보석/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/85.png"
							alt="금" title="/금/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/86.png"
							alt="돈" title="/돈/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/87.png"
							alt="맥주" title="/맥주/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/88.png"
							alt="입술" title="/입술/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/89.png"
							alt="콜!" title="/콜!/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/90.png"
							alt="번쩍" title="/번쩍/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/91.png"
							alt="19" title="/19/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/92.png"
							alt="즐거워" title="/즐거워/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/1.png"
							alt="SK" title="/SK/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/2.png"
							alt="두산" title="/두산/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/3.png"
							alt="LG" title="/LG/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/4.png"
							alt="롯데" title="/롯데/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/5.png"
							alt="삼성" title="/삼성/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/6.png"
							alt="한화" title="/한화/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/7.png"
							alt="기아" title="/기아/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/8.png"
							alt="넥센" title="/넥센/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/9.png"
							alt="NC" title="/NC/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/10.png"
							alt="KT" title="/KT/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/11.png"
							alt="SK마" title="/SK마/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/12.png"
							alt="두산마" title="/두산마/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/13.png"
							alt="LG마" title="/LG마/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/14.png"
							alt="롯데마" title="/롯데마/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/15.png"
							alt="삼성마" title="/삼성마/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/16.png"
							alt="한화마" title="/한화마/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/17.png"
							alt="기아마" title="/기아마/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/18.png"
							alt="넥센마" title="/넥센마/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/19.png"
							alt="NC마" title="/NC마/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/20.png"
							alt="KT마" title="/KT마/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/21.png"
							alt="메가폰" title="/메가폰/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/22.png"
							alt="신문" title="/신문/"></a></span><span><a href="javascript:;"><img
							src="http://res.afreecatv.com/images/chat/emoticon/small/baseball/23.png"
							alt="봉투" title="/봉투/"></a></span>
				</div>
				<div class="btn_close">
					<a href="javascript:;" title="닫기">닫기</a>
				</div>
			</div>
		</div>
	</div>
	<div class="layer_l" id="layerStarGift" style="margin-top: -189.5px; margin-left: -190px; display: none;"><div class="layer_in">
		<strong class="title">별풍선 선물하기</strong>
		<div class="layer_al">
			<strong class="color_blk">별풍선이란?</strong> &nbsp; <a href="http://www.afreecatv.com/balloon.htm" target="_blank" class="color_bl fts11">별풍선 헤택이 궁금하다면 클릭!</a><br>
			<ul class="sub_list2">
				<li>시청자가 BJ에게 선물할 수 있는 유료 아이템입니다. <br><span class="fts11 color_gray">(BJ는 별풍선을 환전하여 실제수익으로 돌려받게 됩니다.)</span></li>
				<li>별풍선을 선물하시면 자동으로 BJ 팬클럽에 가입이 됩니다. <br><span class="fts11 color_gray">(팬클럽 이모티콘 표시 / 팬클럽 전용 채팅컬러 제공)</span></li>
			</ul>
			<ul class="table_list">
				<li><span><em>별풍선을 선물할 BJ</em> : </span><strong class="color_bl">${bjvo.name } (${bjvo.id })</strong></li>
				<li><span>내가 보유한 별풍선 : </span><div id="star" style="float: left">${vo.star_candy }</div><label>개</label></li>
				<li>
					<span><em>선물할 별풍선</em> : </span>
					<fieldset class="select_area" style="border: none;">
						<input type="radio" name="optStarBalloon" label="no5" class="input_radio" value="5" checked=""> <label for="no5">5개</label> &nbsp;
						<input type="radio" name="optStarBalloon" label="no10" class="input_radio" value="10"> <label for="no5">10개</label> &nbsp;
						<input type="radio" name="optStarBalloon" label="no50" class="input_radio" value="50"> <label for="no5">50개</label> &nbsp;
						<input type="radio" name="optStarBalloon" label="no100" class="input_radio" value="100"> <label for="no5">100개</label><br>
						<em><input type="radio" label="write" name="optStarBalloon" value="-1" class="input_radio"> 직접입력 <input type="text" id="nStarBalloon" class="input_text" style="width:60px" maxlength="5" disabled="" value="5"> 개</em>
					</fieldset>
				</li>
			</ul>
		</div>
		<div class="btn_wrap"><a href="javascript:;" class="btn_st1">선물하기</a> <a href="javascript:;" class="btn_st2">취소</a></div>
		<a href="javascript:;" class="btn_close2">닫기&lt;</a>
	</div>
	</div>
	  
     <div id="Demo"  class="w3-dropdown-content w3-bar-block w3-border" style="z-index: 100" user_id="" user_nick="">
      <a href="#" class="w3-bar-item w3-button" target="_blank">아이디</a>
      <a href="#" class="w3-bar-item w3-button" id="msg1">쪽지보내기</a>
      <a href="#" class="w3-bar-item w3-button" id="kick">강퇴</a>
      <a href="#" class="w3-bar-item w3-button" id="black">블랙리스트</a>
    </div>
    
     <div id="Demo1"  class="w3-dropdown-content w3-bar-block w3-border" style="z-index: 100" user_id="" user_nick="">
      <a href="#" class="w3-bar-item w3-button" target="_blank">아이디</a>
      <a href="#" class="w3-bar-item w3-button" id="msg2">쪽지보내기</a>
    </div>
</div>

<script type="text/javascript">
	$("#btn_star").click(function(){
		var vo = '${requestScope.vo}';
		if(vo != ''){
			$("#layerStarGift").toggle();
		}
	});
	
	$(".btn_st1").click(function(){
		var cnt = $("#nStarBalloon").val();
		var user = $("#star").html();
		var bjid = '${bjvo.id }';
		var uid = '${sessionScope.id }';
			
		if(parseInt(cnt) > parseInt(user)){
			alert("보유한 별풍선 개수까지만 선물할 수 있습니다. 별풍선을 더 구매하시겠습니까?");
		}else if(bjid == uid){
			alert("자기 자신에게는 선물할 수 없습니다.");
		}else{
			$.ajax({
				url:"<c:url value='/broadcast/starcandy?cnt="+cnt+"&bjid="+bjid+"&uid="+uid+"'/>",
				dataType:"json",
				success:function(data){
					$("#star").html(data.result);
					$("#layerStarGift").toggle();
					
					var bj_num = ${requestScope.bj_num};
					var sendmsg = {};
					sendmsg.packet = 4;
					sendmsg.cnt = cnt;
					sendmsg.bj_num = bj_num;
					sendmsg.grade = data.grade;
					if(data.fancnt != null){
						sendmsg.fancnt = data.fancnt;
					}
					wsocket.send( JSON.stringify(sendmsg));
					
				}
			});
		}
	});
	
	$(".btn_st2").click(function(){
		$("#layerStarGift").toggle();
	});
	
	
	$("input[label=no5]").click(function(){
		$("#nStarBalloon").attr("disabled",true);
		$("#nStarBalloon").val("5");
	});
	
	$("input[label=no10]").click(function(){
		$("#nStarBalloon").attr("disabled",true);
		$("#nStarBalloon").val("10");
	});
	
	$("input[label=no50]").click(function(){
		$("#nStarBalloon").attr("disabled",true);
		$("#nStarBalloon").val("50");
	});
	
	$("input[label=no100]").click(function(){
		$("#nStarBalloon").attr("disabled",true);
		$("#nStarBalloon").val("100");
	});
	
	$("input[label=write]").click(function(){
		$("#nStarBalloon").attr("disabled",false);
	});
	
	$("#nStarBalloon").keyup(function( event ) {
		var val = parseInt(event.key);
		
		if(!(val>=0 && val<=9 || event.key == 'Backspace')){
			alert("숫자만 입력해주세요.");
			$("#nStarBalloon").val("");
		}
	});
	
	/*
	 * 패킷 정보
	 * 0 : 채팅 입장
	 * 1 : 채팅 보내기
	 * 2 : 퇴장
	 */
		var x=0;
		
		jwplayer("container").setup({
			sources : [ {
				file : '${requestScope.url}'
			} ],
			autostart : true,
			width: "100%",
			height: "100%",
			aspectratio: "16:9",
			primary : "flash"
		});
		var wsocket;
		
		$(window).on("unload", function(e) {
		  	if(wsocket != null){
				var sendmsg = {};
				sendmsg.packet = 2;
				sendmsg.bj_num =  ${requestScope.bj_num};
				wsocket.send( JSON.stringify(sendmsg));
		  	}else{
		  		console.log('널');
		  	}
		});

		$(window).on("load", function(e) {
			
			//방송정보 가져오기
			var bvo = '${requestScope.bvo.broadcast_pwd}';
			var bjid = '${bjvo.id }';
			var s_id = '${sessionScope.id}';
			var black = '${requestScope.black}';
			
			//블랙리스트 처리		
			if(black == 'true'){
				alert("BJ에 의해 블랙리스트로 등록되어 방송을 시청할 수 없습니다.");
				location.replace('http://192.168.0.4:8082/app');
			}else{
				if(bjid != s_id){
					//성인처리
					var adult = '${requestScope.bvo.age_grade_num}';
					if(adult != 1){
						if(s_id==''){
							location.replace('http://192.168.0.4:8082/app/member/login');
							alert('이 정보내용은 청소년 유해매체물로서 먼저 로그인이 필요합니다.');
						}else{
							//민증검사
							var dt1 = new Date();
							var year1 = dt1.getFullYear();
							var test = '${requestScope.vo.birth}';
							var year2 = test.substring(test.length-4,test.length);
							if(year1-year2 < 19){
								location.replace('http://192.168.0.4:8082/app');
								alert('만 19세 미만의 청소년이 이용할 수 없습니다.');
							}
						}
					}
					
					//비밀번호가 있을경우
					if(bvo != ''){
						var pwd = prompt("방송을 보려면 BJ가 정해놓은 비밀번호를 입력해야 합니다.", "");
					    if (pwd != null) {
					    	$.ajax({
								url:"<c:url value='/broadcast/password?bjid="+bjid+"&pwd="+pwd+"'/>",
								dataType:"json",
								success:function(data){
									if(!data.result){
										location.replace('http://192.168.0.4:8082/app');
										alert('비밀번호가 일치하지 않습니다.');	
									}else{
										init();
									}
								}
							});
					    }else{
					    	//취소버튼
					    	location.replace('http://192.168.0.4:8082/app');
					    }
					}else{
						//비밀번호 없는경우
						init();
					}
				}else{
					init();
				}
			}
		});

		function init(){
			//유저정보 가져오기
			var vo = '${requestScope.vo}';
			//등급처리
			//블랙리스트처리
			wsocket = new SockJS("/app/echo.sockjs");
			wsocket.onmessage = onMessage;
			wsocket.onclose = onClose;
			wsocket.onerror = onError;
			wsocket.onopen = function(){
				var join = {};
				join.packet = 0;
				join.bj_num = ${requestScope.bj_num};
				if(vo != ''){
					join.id = '${requestScope.vo.id}';
					join.name = '${requestScope.vo.name}';
					join.gender = '${requestScope.vo.gender_num}';
					
					// bj:bj
					// 열혈팬:hot
					// 일반팬:fan
					// 일반:user
					join.grade = '${requestScope.grade}';
				}else{
					join.packet=2;
				}
				wsocket.send( JSON.stringify(join));
			}
		}
		$("#actionbox").click(function(){
			var vo = '${requestScope.vo}';
			if(vo == ''){
				var result = confirm('채팅에 참여하시려면 로그인이 필요합니다. 로그인페이지로 이동하시겠습니까?'); 
				if(result) { 
					location.replace('http://192.168.0.4:8082/app/member/login');
				} else {
				}			
			}
		});
		
		 $("#write_area").keydown(function (event) {
	         if (event.which === 13) {  
	        	var msg = $("#write_area").html();
	        	if(msg.length > 0){
		        	var bj_num = ${requestScope.bj_num};
		        	var sendmsg = {};
		        	sendmsg.packet = 1;
		        	sendmsg.msg = msg;
		        	sendmsg.bj_num = bj_num;
		        	wsocket.send( JSON.stringify(sendmsg));
		        	$("#write_area").html("");
	        	}
				return false;
	         }
	     });

		$("#btn_send").click(function(){
			var msg = $("#write_area").html();
			if(msg.length > 0){
				var bj_num = ${requestScope.bj_num};
				var sendmsg = {};
				sendmsg.packet = 1;
				sendmsg.msg = msg;
				sendmsg.bj_num = bj_num;
				wsocket.send( JSON.stringify(sendmsg));
				$("#write_area").html("");
			}
		});

		$("#kick").click(function(){
			var x = document.getElementById("Demo");
			var id = $("#Demo").attr("user_id");
			var name = $("#Demo").attr("user_nick");
			var result = confirm(id+'님을 강퇴하시겠습니까?'); 
			if(result) {
				var sendmsg = {};
				sendmsg.packet = 6;
				sendmsg.bj_num = ${requestScope.bj_num};
				sendmsg.id = id;
				sendmsg.name = name;
				wsocket.send( JSON.stringify(sendmsg));
			}  
			x.className = x.className.replace(" w3-show", "");
		});
		
		$("#msg1").click(function(){
			var id = $("#Demo").attr("user_id");
			window.open('/app/message/send?id='+id,'_blank','resizable=no,width=400 height=400');	
			var x = document.getElementById("Demo");
			x.className = x.className.replace(" w3-show", "");
		});
		$("#msg2").click(function(){
			var id = $("#Demo1").attr("user_id");
			window.open('/app/message/send?id='+id,'_blank','resizable=no,width=400 height=400');	
			var x = document.getElementById("Demo1");
			x.className = x.className.replace(" w3-show", "");
		});
		
		$("#black").click(function(){
			var x = document.getElementById("Demo");
			var id = $("#Demo").attr("user_id");
			var name = $("#Demo").attr("user_nick");
			var result = confirm(id+'님을 블랙리스트에 추가하시겠습니까?'); 
			if(result) {
				$.ajax({
					url:"<c:url value='/${requestScope.id}/setting/blacklistI'/>",
					data:{"option":id},
					success:function(data){
						var sendmsg = {};
						sendmsg.packet = 6;
						sendmsg.bj_num = ${requestScope.bj_num};
						sendmsg.id = id;
						sendmsg.name = name;
						wsocket.send( JSON.stringify(sendmsg));				 
						x.className = x.className.replace(" w3-show", "");
					}
				});
			} 
		});
		//아이디 클릭
		$("#chat_area").on('click','.test',function(){
		    var offset = $(this).offset();
		    var top = offset.top;
		    var left = offset.left;		
			var bjid = '${bjvo.id }';
			var r_id = '${sessionScope.id}';
			var id = $(this).attr("user_id");
			var name = $(this).attr("user_nick");
			if(id != r_id){
				if(bjid == r_id){
				    var x = document.getElementById("Demo");
					if (x.className.indexOf("w3-show") == -1) {
				        x.className += " w3-show";
					    $("#Demo").offset({ top: top+15, left: left-20 });
					    $("#Demo a:nth-child(1)").html(id);
					    $("#Demo").attr("user_id",id);
					    $("#Demo").attr("user_nick",name);
					    $("#Demo a:nth-child(1)").attr('href','http://192.168.0.4:8082/app/'+id);
				    } else { 
				        x.className = x.className.replace(" w3-show", "");
				    }
				}else if(r_id != ''){
				    var x = document.getElementById("Demo1");
					if (x.className.indexOf("w3-show") == -1) {
				        x.className += " w3-show";
					    $("#Demo1").offset({ top: top+15, left: left-20 });
					    $("#Demo1 a:nth-child(1)").html(id);
					    $("#Demo1").attr("user_id",id);
					    $("#Demo1").attr("user_nick",name);
					    $("#Demo1 a:nth-child(1)").attr('href','http://192.168.0.4:8082/app/'+id);
				    } else { 
				        x.className = x.className.replace(" w3-show", "");
				    }
				}
			}			
		});
		function onMessage(evt){
			
			var list = $.parseJSON(evt.data);
			var packet = list.packet;
			if(packet == '1'){
				var msg = list.msg;
				var gender = list.gender;
				var grade = list.grade;
				var name = list.name;
				var id = list.id;
				
				if(gender == '1'){
					if(grade == 'bj'){
						$("#chat_area").append('<dl class="bj"><dt class="man"><img src="http://www.afreecatv.com/images/new_app/chat/ic_bj.gif" alt="BJ" title="BJ"><a href="#" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="bj" class="test">'+name+'<em>('+id+')</em></a> :</dt><dd id="'+(x++)+'">'+msg+'</dd></dl>');
					}else if(grade == 'hot'){
						$("#chat_area").append('<dl class=""><dt class="hot_m"><img src="http://www.afreecatv.com/images/new_app/chat/ic_hot.gif" alt="열혈팬" title="열혈팬"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan" class="test">'+name+'<em>('+id+')</em></a> :</dt><dd id="'+(x++)+'" style="color:#DE4D71;">'+msg+'</dd></dl>');
					}else if(grade == 'fan'){
						$("#chat_area").append('<dl class=""><dt class="fan_m"><img src="http://www.afreecatv.com/images/new_app/chat/ic_fanclub.gif" alt="팬클럽" title="팬클럽"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan" class="test">'+name+'<em>('+id+')</em></a> :</dt><dd id="'+(x++)+'" style="color:#56a704;">'+msg+'</dd></dl>');	
					}else{
						$("#chat_area").append('<dl class=""><dt class="user_m"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan" class="test">'+name+'<em>('+id+')</em></a> :</dt><dd id="377">'+msg+'</dd></dl>');
					}
				}else{
					if(grade == 'bj'){
						$("#chat_area").append('<dl class="bj"><dt class="woman"><img src="http://www.afreecatv.com/images/new_app/chat/ic_bj.gif" alt="BJ" title="BJ"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="bj" class="test">'+name+'<em>('+id+')</em></a> :</dt><dd id="'+(x++)+'">'+msg+'</dd></dl>');
					}else if(grade == 'hot'){
						$("#chat_area").append('<dl class=""><dt class="hot_w"><img src="http://www.afreecatv.com/images/new_app/chat/ic_hot.gif" alt="열혈팬" title="열혈팬"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan" class="test">'+name+'<em>('+id+')</em></a> :</dt><dd id="'+(x++)+'" style="color:#DE4D71;">'+msg+'</dd></dl>');
					}else if(grade == 'fan'){
						$("#chat_area").append('<dl class=""><dt class="fan_w"><img src="http://www.afreecatv.com/images/new_app/chat/ic_fanclub.gif" alt="팬클럽" title="팬클럽"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan" class="test">'+name+'<em>('+id+')</em></a> :</dt><dd id="'+(x++)+'" style="color:#56a704;">'+msg+'</dd></dl>');	
					}else{
						$("#chat_area").append('<dl class=""><dt class="user_w"><a href="javascript:;" user_id="'+id+'" user_nick="'+ name +'" userflag="589856" grade="fan" class="test">'+name+'<em>('+id+')</em></a> :</dt><dd id="'+(x++)+'">'+msg+'</dd></dl>');
					}
				}
				
				
				var objDiv = document.getElementById("chat_area");
				objDiv.scrollTop = objDiv.scrollHeight;
			}else if(packet == '3'){
				var cnt = list.cnt;
				$("#nAllViewer").html(cnt);
			}else if(packet == '4'){
				var name = list.name;
				var id = list.id;
				var cnt = list.cnt;
				var fancnt = list.fancnt;
				$("#chat_area").append('<div class="balloon_area"><p class="ea" style="color:#ED1C24">'+cnt+'</p><p class="img_balloon"><img src="http://www.afreecatv.com/new_player/items/ba_step3.png" alt="별풍선"></p><div class="text"><strong><a href="javascript:;" user_id="esime" user_nick="">'+name+'('+id+')'+'</a></strong><br><span class="bal_txt">별풍선 <span class="num">'+cnt+'</span>개 선물!</span></div></div>');
				if(fancnt != null){
					$("#chat_area").append('<p class="notice fanclub"><a href="javascript:;" user_id="'+id+'" user_nick="'+name+'">'+name+'('+id+')</a> 님이 '+fancnt+'번째로 팬클럽이 되셨습니다.</p>');
				}
				var objDiv = document.getElementById("chat_area");
				objDiv.scrollTop = objDiv.scrollHeight;
			}else if(packet == '0'){
				var name = list.name;
				var id = list.id;
				$("#chat_area").append('<p class="notice in hotfan"><a href="javascript:;" user_id="'+id+'" user_nick="'+name+'">열혈팬 '+name+'<em>('+id+')</em></a>님이 대화방에 참여했습니다.</p>');
				var objDiv = document.getElementById("chat_area");
				objDiv.scrollTop = objDiv.scrollHeight;
			}else if(packet == '5'){
				var title = list.title;
				var pwd = list.pwd;
				var adult = list.adult;
				$("#broadcast_title").html(title);
				
				var bjid = '${bjvo.id }';
				var s_id = '${sessionScope.id}';
				if(pwd != ''){
					if(bjid != s_id){
						$("#container").toggle();
						var pwd = prompt("방송을 보려면 BJ가 정해놓은 비밀번호를 입력해야 합니다.", "");
						 if (pwd != null) {
						    	$.ajax({
						    		url:"<c:url value='/broadcast/password?bjid="+bjid+"&pwd="+pwd+"'/>",
									dataType:"json",
									success:function(data){
										console.log(data.result);
										if(!data.result){
											history.back('http://192.168.0.4/app');
											alert('비밀번호가 일치하지 않습니다.');	
										}else{
											$("#container").toggle();
										}
									}
								});
							 }else{
						    	//취소버튼
						    	history.back('http://192.168.0.4/app');
						    }
					}
				}
				if(bjid != s_id){
					if(adult){
						if(s_id==''){
							alert('이 정보내용은 청소년 유해매체물로서 먼저 로그인이 필요합니다.');
							location.replace('http://192.168.0.4:8082/app/member/login'); 
						}else{
							//민증검사
							var dt1 = new Date();
							var year1 = dt1.getFullYear();
							var test = '${requestScope.vo.birth}';
							var year2 = test.substring(test.length-4,test.length);
							if(year1-year2 < 19){
								alert('만 19세 미만의 청소년이 이용할 수 없습니다.');
								history.back('http://192.168.0.4/app');
							}
						}
					}
				}

				
			}else if(packet == '6'){
				location.href="http://192.168.0.4:8082/app/";
				alert("강퇴당하였습니다.");
			}else if(packet == '7'){
				var name = list.name;
				var id = list.id;
				$("#chat_area").append('<p class="notice"><a href="javascript:;" user_id="'+id+'" user_nick="'+name+'" etcinfo="1">'+name+'<em>('+id+')</em></a> 님이 <span class="caution">강제퇴장</span> 처리되었습니다.</p>');
				var objDiv = document.getElementById("chat_area");
				$("#chat_area dl dt a").each(function(){
					var uid = $(this).attr("user_id");
					if(uid == id){
						$(this).parent().parent().detach();
					}
				});
				objDiv.scrollTop = objDiv.scrollHeight;
			}
		}
		
		function onClose(evt){
			console.log('종료호출');
		}
		function onError(evt){
			console.log('에러호출');
		}
		
		$("#btn_emo").click(function(){
			var vo = '${requestScope.vo}';
			if(vo != ''){
				$("#emoticonArea").toggle();
			}	
		});
		
		$(".btn_close").click(function(){
			$("#emoticonArea").toggle();
		});
		
		$("#emoticonArea img").click(function(){
			$("#write_area").append($(this).clone());
		});
		
		$("#bookmark").click(function(){
			var color=$("#yellowstar").css("color");
			var bjid = '${bjvo.id }';
			if(color == "rgb(255, 165, 0)"){//즐겨찾기 취소
				$.ajax({
					url:"<c:url value='/broadcast/bookmark/delete?bjid=${bjvo.id }'/>",
					dataType:"json",
					success:function(data){
						$("#yellowstar").css("color","#BDBDBD");
					}
				});
			}else{//즐겨찾기 등록
				$.ajax({
					url:"<c:url value='/broadcast/bookmark/insert?bjid=${bjvo.id }'/>",
					dataType:"json",
					success:function(data){
						$("#yellowstar").css("color","orange");
					}
				});
			}
		});
		setInterval(function(){ 
			var sendmsg = {};
			sendmsg.packet = 3;
			sendmsg.bj_num = ${requestScope.bj_num};
			wsocket.send( JSON.stringify(sendmsg));
		}, 3000);
		
</script>
