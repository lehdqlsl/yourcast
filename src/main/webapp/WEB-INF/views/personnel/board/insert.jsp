<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="<c:url value='/resources/se2/js/HuskyEZCreator.js'/>"></script>
<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->
		<header id="portfolio">
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<div class="w3-container">
				<div class="link-2">
				<h1>
					<a href="<c:url value='/${requestScope.id }'/>" class="maintitle">
					<b>${voMP.profile_title }</b></a>
				</h1>
			</div>
				<div class="w3-section w3-bottombar w3-padding-16"  style="width: 1000px;">
				</div>
			</div>
			
		</header>

		<!-- 여기작성 -->

		<form method="post"action='<c:url value="/${requestScope.id}/board/insert"/>'id="target">
			<input type="hidden" value="${sessionScope.id }" name="sid">
			<table class="w3-table w3-bordered">
				<tr>
					<td>게시판</td>
					<td><select name="cate_list">
							<c:forEach var="vo" items="${clist }">
								<c:if test="${vo.category_name ne '전체보기'}">
									<option value="${vo.category_num}">${vo.category_name}</option>
								</c:if>
							</c:forEach>
					</select>
					<c:if test="${sessionScope.id eq requestScope.id}">
					 &nbsp;<input type="checkbox" class="notice" name="notice">게시판 공지
					 </c:if></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" id="ir1" rows="10" cols="100"
							style="width: 766px; height: 412px; display: none;"></textarea></td>
				</tr>
			</table>
			<br>
			<!-- <input type="submit" value="등록" id="reg"> -->
			<div class="w3-bar-all w3-center">
				<button type="submit" form="target" value="Submit"
				class="w3-button w3-border w3-round-large" style="background-color: #4C5870;"><i class="fa fa-check" style="color: white;"></i>
				<span style="color: #EBEDEC;">&nbsp;등록</span></button>
			</div>
		</form>
		<br>

		<!-- 작성END -->
		
		<footer>
			<div class="w3-light-grey w3-center w3-padding-24"
				style="width: 1000px; font-size: 11px; border-top: 1px solid #CFCFCF; margin-top: 100px;">
				All Contents Copyright ©Your Cast...Co.,Ltd. All Rights Reserved.</div>
		</footer>
		
	</div>
</body>
<script type="text/javascript">
	var oEditors = [];

	// 추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "ir1",
		sSkinURI : "/app/resources/se2/SmartEditor2Skin.html",
		htParams : {
			bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function() {
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function() {
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator : "createSEditor2"
	});

	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["ir1"].exec("PASTE_HTML", [ sHTML ]);
	}

	function showHTML() {
		var sHTML = oEditors.getById["ir1"].getIR();
		alert(sHTML);
	}
	
	//글자 바이트
	String.prototype.byteLength = function() {
			var l = 0;
			for (var idx = 0; idx < this.length; idx++) {
				var c = escape(this.charAt(idx));
				if (c.length == 1)
					l++;
				else if (c.indexOf("%u") != -1)
					l += 3;
				else if (c.indexOf("%") != -1)
					l += c.length / 3;
			}
			return l;
		};

	$('#target').submit(function(event) {
		
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
		var content = document.getElementById("ir1").value;
		var title = document.getElementById("title").value;
		console.log("내용 : " + content);
		if (content == null || content == "<p>&nbsp;</p>") {
			alert("내용을 입력하세요!");
			event.preventDefault();
		} else if (title == null || title == "") {
			alert("제목을 입력하세요!");
			event.preventDefault();
		} else if(title.byteLength()>100){
			alert("제목이 너무 깁니다!");
			event.preventDefault();
		}else {
			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}
	});

	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>