<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 고객센터 > 이벤트 > 진행중 이벤트 등록 페이지</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<link rel="stylesheet" type="text/css" href="resources/css/CS/content.css" />
<link rel="stylesheet" type="text/css" href="resources/css/CS/event.css" />

<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
.popup_bg {
	/* 숨김용 */
	/* display: none; */
	display: none;
}
.popup {
	/* 숨김용 */
	/* display: none; */
	/* 크기변경용 */
	width: 600px;
	height: 400px;
	top: calc(50% - 200px); /* 높이 반  */
	left: calc(50% - 300px); /* 너비 반 */
	display: none;
}

.popup_cont {
	/* 내용 변경용 */
	font-size: 10.5pt;
}
/* 개인 작업 영역 */

p {
	text-align: left;
	font-size: 20px;
	
}

#subject_line{

	margin-top: 5px;
	margin-bottom: 5px;
}

#subject{
	
	width:870px;
	height:35px;
	font-size: 20px;
	
}

#content_line{
	
	margin-top: 5px;
	margin-bottom: 5px;
}

#btn_file{

	width: 300px;
	height: 35px;
	font-size: 15px;
	font-weight:bold;
	padding: 5px;

	padding-bottom: -5px;
	
	margin-top: 10px;

}
		
.eventAdd_btn {
	float: right;
	margin-top: 10px;
	margin-right: 37px;
}

#content{
	font-size: 20px;
}

</style>
<script type="text/javascript">

$(document).ready(function() {
	CKEDITOR.replace("content", {
		// 옵션
		resize_enabled : false, // 크기변경
		language : "ko", // 언어
		enterMode : 2, // 엔터 <br/>처리
		width : "730", // 가로
		height : "250" // 세로
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
		<input type="hidden" id="top" name="top" value="${param.top}"/>
		<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}"/>
		<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
	</form>
	
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">진행중 이벤트 등록</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="container">
				<p id="subject_line">제목</p>
				<input type="text" name="subject" id="subject" placeholder="제목을 입력하세요">
				<p id="content_line">글내용</p>
				<textarea name="content" id="content" rows="15" cols="110" placeholder="내용을 입력하세요" ></textarea>
				<div><input type="file" value="첨부파일" id="btn_file"></div>
				<div class="eventAdd_btn">
					<div class="cmn_btn_mr">등록</div>
					<div class="cmn_btn_mr">취소</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>