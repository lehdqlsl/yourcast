<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
.videobox {
	position: absolute;
	left: 0px;
	right: 20%;
	top: 57px;
	bottom: 0;
	height: 100%;
	overflow-x: hidden;
	overflow-y: scroll;
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
</style>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/chat_wrap.css'/>?ver=10">
</head>
</html>
<div class="w3-main" style="margin-top: 54px;">
	<div class="videobox">
		<div id="container" style="margin: auto;">Loading the player ...</div>
	</div>
	<div class="chatbox" id="chatbox">
		<div class="chat_area" id="chat_area">
	
		</div>
		<div id="actionbox" class="actionbox">
				<!-- 버튼들 -->
				<ul id="ul1" class="ul1">
                    <li id="btn_emo" class="emo first"><a href="javascript:;">이모티콘</a><em class="ttip" style="display: none;">이모티콘<span></span></em><span class="emo_tiplayer" id="emoLayer" style="display:none;"><em class="txt">이모티콘은 한번에 3개까지만 사용가능합니다.</em><span class="icon"></span><button type="button" class="close">닫기</button></span></li><!-- 활성화  class="on" 추가 -->
					<li id="btn_police" class="police"><a href="javascript:;">신고</a><em class="ttip">신고<span></span></em></li>
                    <li id="btn_translation" class="translation" style="display:none;"><em></em><a href="#n">번역</a><em class="ttip">번역<span></span></em></li>
				</ul>
				<ul id="ul2" class="ul2">
					<li id="btn_hope" class="hope" style="display:none;"><a href="javascript:;">희망풍선 선물하기</a><em class="ttip">희망풍선 선물하기<span></span></em></li>
					<li id="btn_star" class="star"><a href="javascript:;">별풍선 선물하기</a><em class="ttip" style="display: none;">별풍선 선물하기<span></span></em></li>
					<li id="btn_sticker" class="sticker"><a href="javascript:;">스티커 선물하기</a><em class="ttip">스티커 선물하기<span></span></em></li>
					<li id="btn_choco" class="choco"><a href="javascript:;">초콜릿  선물하기</a><em class="ttip" style="display: none;">초콜릿  선물하기<span></span></em></li>
				</ul>
				<!-- //버튼들 -->
				<!-- chat_write -->
				<div id="chat_write" class="chat_write">
					<h3>채팅쓰기</h3>
					<div class="ad_toggle">
							<span class="blue">
								<input id="manage" type="radio" name="managerchat" checked="checked" class="on" data-message-type="1">
								<label for="manage" class="on">운영</label>
							</span>
							<span class="red">
								<input id="warning" type="radio" name="managerchat" data-message-type="2">
								<label for="warning">경고</label>
							</span>
					</div>
					<div id="write_area" class="write_area" contenteditable="true" ondragenter="return false;" ondrop="return false;" ondragover="return false;">채팅에 참여하시려면 로그인이 필요합니다.</div>
                    <button type="button" id="btn_send" class="btn_send" title="보내기">보내기</button>
					
				</div>
				<div class="poll_layer" id="layer_poll" style="display: none;"></div>
			</div>
	</div>
</div>

