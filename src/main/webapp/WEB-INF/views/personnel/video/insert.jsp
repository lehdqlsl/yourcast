<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="<c:url value='/resources/se2/js/HuskyEZCreator.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/radio.css'/>?ver=5">
<body class="w3-light-grey w3-content" style="max-width: 1600px">
	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px">

		<!-- Header -->
		<header id="portfolio">
			<a href="#"><img src="/w3images/avatar_g2.jpg"
				style="width: 65px;"
				class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<div class="w3-container">
				<div class="link-2">
				<h1>
					<a href="<c:url value='/${requestScope.id }'/>" class="maintitle">
					<b>${voMP.profile_title }</b></a>
				</h1>
			</div>
				<div class="w3-section w3-bottombar w3-padding-16" style="width: 1000px;"></div>
			</div>
		</header>
		
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#cancel").on("click",function(){
					location.href="<c:url value='/${requestScope.id}/video/list'/>";
				});
				$("#imgfile").change(function () {
		            if (this.files && this.files[0]) {
		            	$("#br").empty();
		                var reader = new FileReader();
		                $("#br").append("<br>");
		                reader.onload = function (e) {
		                    $('#imgLogo').attr('src', e.target.result);
		                }
		                reader.readAsDataURL(this.files[0]);
		            }
		        });
			});
		</script>

		<!-- 여기작성 -->

		<h2 style="margin-left:30px;">동영상 업로드</h2>
		<p style="margin-left:30px;margin-top:-10px;color:#9A9A9A">Video Upload</p>
		
		<br>
		
		<form id="frm" method="post" action="<c:url value="/${requestScope.id}/video/insert"/>" enctype="multipart/form-data">
		<table class="w3-table w3-bordered">
			<tr>
				<th>장르</th>
				<td>
				<!-- 
					<select name="genre">
					<c:forEach var="gvo" items="${glist }">
						<option value="${gvo.genre_num }">${gvo.genre_name }</option>
					</c:forEach>
					</select>
				-->
				<c:forEach var="gvo" items="${glist }">
					<c:choose>
						<c:when test="${gvo.genre_num==1}">
							<label style="font-family:굴림;font-size:13px;"><input type="radio"  class="option-input radio" name="genre_num" checked="checked" value="${gvo.genre_num }">${gvo.genre_name }</label>
						</c:when>
						<c:otherwise>
							<label style="font-family:굴림;font-size:13px;"><input type="radio"  class="option-input radio" name="genre_num" value="${gvo.genre_num }">${gvo.genre_name }</label>
							<c:if test="${gvo.genre_num%10==0}">		
								<br>
							</c:if>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</td>
			</tr>
			<tr>
				<th>관람등급</th>
				<td><input type="checkbox" name="age_grade_num" value="2">&nbsp;&nbsp;성인</td>
			</tr>
			<tr>
				<th>제목</th><td><input type="text" name="v_title" id="v_title" autocomplete=off style="width: 770px;"><td>
			</tr>
			<tr>
				<th>내용</th><td><textarea name="v_content" id="ir1" rows="10" cols="100"
							style="width: 766px; height: 412px; display: none;"></textarea></td>
			</tr>
			<tr>
				<th>동영상</th><td><input type="file" name="vfile" id="vfile"></td>
			</tr>
			<tr>
				<th>썸네일</th><td><input type="file" name="imgfile" id="imgfile"><span id="br"></span><img src="#" height="100" id="imgLogo"></td>
			</tr>
			<tr>
				<th colspan="2" style="text-align:left;">
				
				<button type="submit" class="w3-button w3-border w3-round-large" style="background-color: #4C5870;">
				<i class="fa fa-upload" style="color: white;"></i>
				<span style="color: #EBEDEC;">&nbsp;업로드</span></button>
				
				<button type="reset" class="w3-button w3-border w3-round-large" style="background-color: #4C5870;">
				<i class="fa fa-refresh" style="color: white;"></i>
				<span style="color: #EBEDEC;">&nbsp;다시입력</span></button>
				
				<button type="button" id="cancel"  class="w3-button w3-border w3-round-large" style="background-color: #4C5870;">
				<i class="fa fa-times" style="color: white;"></i>
				<span style="color: #EBEDEC;">&nbsp;취소</span></button>
			</tr>
		</table>
		</form>
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

	$('#frm').submit(function() {
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
		var videoname = document.getElementById('vfile').value;
		videoname = videoname.slice(videoname.indexOf(".") + 1).toLowerCase();
		
		var imgname = document.getElementById('imgfile').value;
		imgname = imgname.slice(imgname.indexOf(".") + 1).toLowerCase(); 
		
		if($("#v_title").val()==null || $("#v_title").val()==""){
			alert("제목을 입력하세요.");
			return false;
		}else if($("#v_title").val().byteLength()>100){
			alert("제목이 너무 깁니다!");
			return false;
		}else if(document.getElementById("ir1").value==null || document.getElementById("ir1").value==""){
			alert("내용을 입력하세요.");
			return false;
		}else if($("#vfile").val()==null || $("#vfile").val()==""){
			alert("동영상을 선택하세요.");
			return false;
		}else if($("#imgfile").val()==null || $("#imgfile").val()==""){
			alert("썸네일을 선택하세요");
			return false;
		} else if(imgname != "jpg" && imgname != "png" &&  imgname != "gif" &&  imgname != "bmp"){
			alert('썸네일은 이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
			return false;
		}else if(videoname != "mp4"){
			alert('동영상은 확장자가 mp4인 파일만 등록 가능합니다.');
			return false;
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