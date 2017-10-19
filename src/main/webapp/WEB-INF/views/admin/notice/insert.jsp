<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/se2/js/HuskyEZCreator.js'/>"></script>
<div class="content" style="margin-left: 250px;">
	<div class="container-fluid">
		<div class="row">
			<div class="content">
	            <div class="col-md-6 col-md-offset-3">
	                <div class="card">
	                    <div class="header">
	                        <h4 class="title">공지사항 작성</h4>
	                        <p class="category">Notice Insert</p>
	                    </div>
	                    <div class="content table-responsive table-full-width">
	                    	<form method="post" action='<c:url value="/admin/notice/insert"/>'id="target">
								<table class="table table-hover table-striped" >
									<tr>
										<td>제목<td>
										<td><input type="text" class="form-control" id="title" name="title"><td>
									</tr>
									<tr>
										<td>내용<td>
										<td><textarea name="content" id="ir1" rows="10" cols="100" style="width: 605px; height: 412px; display: none;"></textarea><td>
									</tr>
								</table>
								<div style="text-align: center;">
									<button type="submit" form="target" class="btn btn-info btn-fill pull-center">등록</button>
								</div>
							</form>
	                    </div>
	                    
	                </div>
	            </div>
	        </div>
		</div>
	</div>
</div>
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