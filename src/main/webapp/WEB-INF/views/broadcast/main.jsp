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
	href="<c:url value='/resources/css/chat_wrap.css'/>?ver=16">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/chat_layer.css'/>?ver=1">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/pop_layer.css'/>?ver=1">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/chat.css'/>?ver=1">
</head>
</html>
<div class="w3-main" style="margin-top: 54px;">
	<div class="videobox">
		<div class="player">
			<div id="container">Loading the player ...</div>
		</div>
		<div class="player_list">
			<ul>
				<li class="chocolate"><button type="button" title="초콜릿">
						<em></em><span>초콜릿</span>
					</button></li>
				<li class="chocolate"><button type="button" title="초콜릿">
						<em></em><span>초콜릿</span>
					</button></li>
				<li class="chocolate"><button type="button" title="초콜릿">
						<em></em><span>초콜릿</span>
					</button></li>
				<li class="chocolate"><button type="button" title="초콜릿">
						<em></em><span>초콜릿</span>
					</button></li>
				<li class="chocolate"><button type="button" title="초콜릿">
						<em></em><span>초콜릿</span>
					</button></li>
				<li class="chocolate"><button type="button" title="초콜릿">
						<em></em><span>초콜릿</span>
					</button></li>
			</ul>
		</div>


		<div class="info">
			<div class="broadcast_viewer_cnt">
				<button type="text">
					<span><em id="nAllViewer">0</em>명 시청</span>
				</button>
			</div>
			<div class="bjlogo">
				<img src="http://stimg.afreecatv.com/LOGO/gt/gtv7/gtv7.jpg"
					onerror="this.src='http://www.afreecatv.com/mybs/img/default_small_re.gif'"
					alt="BJ 로고" class="thum"> <a
					href="http://www.afreecatv.com/gtv7" target="_blank" title="방송국 가기"
					class="btn"></a>
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
				<!-- 활성화  class="on" 추가 -->
				<li id="btn_police" class="police"><a href="javascript:;">신고</a><em
					class="ttip">신고<span></span></em></li>
				<li id="btn_translation" class="translation" style="display: none;"><em></em><a
					href="#n">번역</a><em class="ttip">번역<span></span></em></li>
			</ul>
			<ul id="ul2" class="ul2">
				<li id="btn_hope" class="hope" style="display: none;"><a
					href="javascript:;">희망풍선 선물하기</a><em class="ttip">희망풍선 선물하기<span></span></em></li>
				<li id="btn_star" class="star"><a href="javascript:;">별풍선
						선물하기</a><em class="ttip" style="display: none;">별풍선 선물하기<span></span></em></li>
				<li id="btn_sticker" class="sticker"><a href="javascript:;">스티커
						선물하기</a><em class="ttip">스티커 선물하기<span></span></em></li>
				<li id="btn_choco" class="choco"><a href="javascript:;">초콜릿
						선물하기</a><em class="ttip" style="display: none;">초콜릿 선물하기<span></span></em></li>
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
				<li><span>내가 보유한 별풍선 : </span><div id="star" style="float: left">${vo.star_candy }</div><label>개</label> <a href="javascript:;" class="btn_st3">별풍선 구매</a></li>
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
	</div></div>
</div>

<script type="text/javascript">
	$("#btn_star").click(function(){
		$("#layerStarGift").toggle();
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
</script>
