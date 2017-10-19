<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/se2/js/HuskyEZCreator.js'/>"></script>
<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->
		<header id="portfolio">
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<div class="w3-container">
				<h1>
					<a href="<c:url value='/${requestScope.id }'/>" class="getinfo">
					<b>${voMP.profile_title }</b></a>
				</h1>
				<div class="w3-section w3-bottombar w3-padding-16"  style="width: 1000px;">
				</div>
			</div>
			
		</header>

		<!-- 여기작성 -->
		<form method="post"action='<c:url value="/${requestScope.id}/board/update?b_num=${vo.b_num }"/>'id="target">
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
					</select> &nbsp;<input type="checkbox" name="notice">게시판 공지</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title" value="${vo.b_title }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" id="ir1" rows="10" cols="100"
							style="width: 766px; height: 412px; display: none;">${vo.b_content }</textarea></td>
				</tr>
			</table>
			<br>
			<!-- <input type="submit" value="등록" id="reg"> -->
			<div class="w3-bar-all w3-center">
				<button type="submit" form="target" value="Submit" class="w3-button w3-black w3-round-large">등록</button>
			</div>
		</form>
		<br>

		<!-- 작성END -->

		<footer class="w3-container w3-padding-32 w3-dark-grey">
			<div class="w3-row-padding">
				<div class="w3-third">
					<h3>FOOTER</h3>
					<p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo
						condimentum, porta lectus vitae, ultricies congue gravida diam non
						fringilla.</p>
					<p>
						Powered by <a href="https://www.w3schools.com/w3css/default.asp"
							target="_blank">w3.css</a>
					</p>
				</div>

				<div class="w3-third">
					<h3>BLOG POSTS</h3>
					<ul class="w3-ul w3-hoverable">
						<li class="w3-padding-16"><img src="/w3images/workshop.jpg"
							class="w3-left w3-margin-right" style="width: 50px"> <span
							class="w3-large">Lorem</span><br> <span>Sed mattis
								nunc</span></li>
						<li class="w3-padding-16"><img src="/w3images/gondol.jpg"
							class="w3-left w3-margin-right" style="width: 50px"> <span
							class="w3-large">Ipsum</span><br> <span>Praes tinci
								sed</span></li>
					</ul>
				</div>

				<div class="w3-third">
					<h3>POPULAR TAGS</h3>
					<p>
						<span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span
							class="w3-tag w3-grey w3-small w3-margin-bottom">New York</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">London</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">IKEA</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">NORWAY</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">DIY</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Ideas</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Baby</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Family</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">News</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Clothing</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Shopping</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Sports</span>
						<span class="w3-tag w3-grey w3-small w3-margin-bottom">Games</span>
					</p>
				</div>

			</div>
		</footer>

		<div class="w3-black w3-center w3-padding-24">
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a>
		</div>



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