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
.cont_area {
	display: inline-block;
	margin-left: 50px;
	margin-top: 10px;
}

.cnsl_page {
	display: inline-block;
	width: 900px;
	height: 40px;
	line-height: 40px;
	color: #2E83F2;
	text-shadow: 0px 0 1px #7b7b7b;
	font-size: 14pt;
	font-weight: bold;
	text-indent: 10px;
	border-bottom: 2px solid #2E83F2;
}

.inqry_info {
	font-size: 11pt;
}

.inqry_info th {
	text-align: left;
	width: 100px;
	height: 50px;
}

.es_text {
	display: inline;
	line-height: 50px;
    font-size: 10pt;
    text-shadow: none;
    text-indent: 645px;
}

.th_star {
	display: inline-block;
	color: #2E83F2;
	margin-left: -3px;
}

.th_star_input {
	display: inline;
	color: #999;
	font-weight: normal;
}

tbody td {
	height: 30px;
}

tbody td input {
	width: 200px;
	height: 20px;
	padding: 5px 10px;
	border: none;
	border: 1px solid #d5d5d5;
	border-radius: 2px;
}

tbody td input:focus {
	outline: 1px solid;
	outline-color: #2E83F2;
}

.inqry_info td select {
	width: 210px;
	height: 30px;
}

tr:nth-child(4) input, tr:nth-child(6) input {
	width: 700px;
	border: 1px solid #d5d5d5;
	border-radius: 2px;
}

tr:nth-child(5) {
	vertical-align: top;
}

.wrtng_cont {
	resize: none;
	font-family: 맑은고딕;
	border: 1px solid #d5d5d5;
	border-radius: 2px;
	padding: 10px 10px;
}

.wrtng_cont:focus {
	outline: 1px solid;
	outline-color: #2E83F2;
}

.cmn_btn_ml {
	/* 마우스 드래그 금지 */
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
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


.cnsl_bottom {
	float: right;
	margin-top: 30px;
	vertical-align: bottom;
}

.cnsl_bottom input[type="text"] {
	width: 400px;
	height: 20px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#ansr_rvs").on("click", function () {
		$("#actionForm").attr("action", "ansrAdd");
		$("#actionForm").submit();
	});
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
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="no" value="${param.no}" />
		<input type="hidden" name="page" value="${param.page}" />
		<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" id="top" name="top" value="68"/>
		<input type="hidden" id="menuNum" name="menuNum" value="74"/>
		<input type="hidden" id="menuType" name="menuType" value="M"/>
	</form>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<span class="page_title_text">1:1 문의</span>
		</div>
		<div class="cnsl_page">상담글
			<div class="es_text">
				<div class="th_star">*</div>
				<div class="th_star_input">항목은 필수입력 항목입니다.</div>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="cnsl_top">
				<table class="inqry_info">
				<tbody>
					<tr>
						<th scope="row">이름
							<span class="th_star">*</span>
						</th>
						<td>
							<input type="text" readonly="readonly" value="${data.CLNT_NAME}">
						</td>
					</tr>
					<tr>
						<th scope="row">연락처
							<span class="th_star">*</span>
						</th>
						<td>
							<input type="text" readonly="readonly" value="${data.PHONE_NUM_1}">
						</td>
					</tr>
					<tr>
						<th scope="row">카테고리
							<span class="th_star">*</span>
						</th>
						<td>
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
						</td>
					</tr>
					<tr>
						<th scope="row">문의 제목
							<span class="th_star">*</span>
						</th>
						<td>
							<input type="text" readonly="readonly" value="${data.WRTNG_TITLE}">
						</td>
					</tr>
					<tr>
						<th scope="row">문의 내용
							<span class="th_star">*</span>
						</th>
						<td>
							<textarea class="wrtng_cont" rows="15" cols="110" readonly="readonly">${data.WRTNG_CONT}</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td>
							<input type="text" readonly="readonly" placeholder="첨부된 파일 & 이미지 : ">
						</td>
					</tr>
				</tbody>
				</table>
				<div class="cnsl_bottom">
					<div class="cmn_btn_ml" id="ansr_rvs">답변등록</div>
					<div class="cmn_btn_ml">삭제</div>
				</div>
			</div> <!-- cnsl_top의 끝 -->
			</div>
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>