<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP Sample</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.cmn_btn_ml {
	/* 마우스 드래그 금지 */
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
}

.cont_area {
	display: inline-block;
	margin-left: 80px;
	margin-top: 30px;
}

.cnsl_page {
	display: inline-block;
	width: 85px;
	height: 40px;
	line-height: 40px;
	color: #2E83F2;
	text-shadow: 0px 0 1px #7b7b7b;
	font-size: 14pt;
	font-weight: bold;
	text-align: center;
	border-bottom: 2px solid #2E83F2;
}

.cnsl_top .ctgr, .cnsl_top .wrtng_title, .cnsl_top .wrtng_wrtr {
	display: inline-block;
	margin-right: 20px;
	height: 50px;
}

.cnsl_top .ctgr select {
	width: 150px;
	height: 30px;
}

.cnsl_top .wrtng_title {
	width: 200px;
	height: 40px;
	margin-right: 200px;
}

.cnsl_top .wrtng_title input {
	width: 420px;
	height: 25px;
	
}

.wrtng_wrtr {
	margin-left: 50px;
}

.cnsl_top .wrtng_wrtr input {
	width: 115px;
	height: 25px;
	
}

.wrtng_cont {
	resize: none;
	font-family: 고딕;
}

.cnsl_bottom {
	margin-top: 30px;
}

.cnsl_bottom input[type="text"] {
	width: 400px;
	height: 20px;
}

.dwnld {
	height: 26px;
	vertical-align: bottom;
	margin-right: 123px;
}

.cmn_btn_ml {
	vertical-align: bottom;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
});
</script>
</head>
<body>
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<span class="page_title_text">1:1 문의</span>
		</div>
		<div class="cnsl_page">상담글</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="cnsl_top">
				<div class="ctgr">
					<select disabled="disabled">
						<option>인터넷뱅킹</option>
						<option>스마트폰뱅킹</option>
						<option>CD/ATM</option>
						<option>공인인증서</option>
						<option>인증/OTP/보안카드</option>
						<option>예금/신탁</option>
						<option>펀드</option>
						<option>대출</option>
						<option>외환</option>
						<option>로그인관련</option>
					</select>
				</div>
				<div class="wrtng_title">
					<input type="text" placeholder="제목" readonly="readonly">
				</div>
				<div class="wrtng_wrtr">
					<input type="text" placeholder="작성자" readonly="readonly">
				</div>
			</div> <!-- cnsl_top의 끝 -->
			
				<div class="cnsl_middle">
					<textarea class="wrtng_cont" rows="22" cols="116" placeholder="내용을 입력하세요." readonly="readonly"></textarea>
				</div>
				<div class="cnsl_bottom">
					<div class="file_atch">
						<input type="text" readonly="readonly" placeholder="첨부된 파일 & 이미지 : ">
						<input class="dwnld" type="button" value="다운로드">
					<div class="cmn_btn_ml">답변등록</div>
					<div class="cmn_btn_ml">삭제</div>
				</div>
		</div>
	</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>