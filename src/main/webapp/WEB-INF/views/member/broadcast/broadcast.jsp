<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">
	<div class="w3-container w3-padding-32" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">
			방송 설정</h3>
		<form action="<c:url value='/member/broadcast/update'/>" method="post">
			<div>
				<dl>
					<dt>서버 URL</dt>
					<dd>
						<p>rtmp://192.168.0.31:3535/myapp</p>
					</dd>
				</dl>
				<dl>
					<dt>스트림 이름</dt>
					<dd>
						<input type="text" value="${bvo.stream_key }" readonly="readonly">
					</dd>
				</dl>
				<dl>
					<dt>방송 제목</dt>
					<dd>
						<input type="text" name="broadcast_title"
							value="${bvo.broadcast_title }">
					</dd>
				</dl>
				<dl>
					<dt>방송 테마</dt>
					<dd>
						<input type="text" name="genre_num" value="${bvo.genre_num }">
					</dd>
				</dl>
				<dl>
					<dt>방송 속성</dt>
					<dd>
						<input type="checkbox" name="frmAdult" id="check1" value="19"><label
							for="check1"><span></span>성인방송 설정</label>
						&nbsp;&nbsp;&nbsp;&nbsp;

						<div class="input_wrap off checkbox btn">
							<input type="checkbox" name="frmAccess" id="check3" value="1"><label
								for="check3"><span></span>패스워드 설정</label> <input type="password"
								name="frmAccessCode" value="" disabled="disabled"> <span
								class="text_count"><em>0</em>/11</span>
						</div>
					</dd>
				</dl>
			</div>
			<input type="submit" value="업데이트">
		</form>
	</div>
</div>
<script type="text/javascript">
	 $("#check3").change(function(){
	        if($("#check3").is(":checked")){
	            $("input[name=frmAccessCode]").attr("disabled",false);
	        }else{
	        	 $("input[name=frmAccessCode]").attr("disabled",true);
	        }
	    });
</script>
