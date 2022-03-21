<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 자유게시판 글쓰기</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.tltle_input_box{
	position: relative;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 110px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;
}
.cont_input_box{
	position: relative;
    width: 100%;
    height: 400px;
    border: solid 1px #dadada; 
    padding: 10px 110px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;
    resize: none;
}

.btn_type {
    font-weight: 80;
    display: block;
    width: 40px;
    font-size: 11px;
    font-weight: 150;
    text-align: center;
    cursor: pointer;
    box-sizing: border-box;
}
.btn_rgstrtn{
	display: inline-block;
	margin-left: 850px;
	color: #000000;
    border: solid 1px rgba(0,0,0,.08);
    font-weight: bold;
    background-color: #F2B705;
}
.cmn_btn{
	margin-left: 850px;
}
.page_title_text {
	margin-bottom: 29px;
}
</style>
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
			<div class="page_title_text">자유게시판</div>
			
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">

</head>
<body>
<input type="text" class="tltle_input_box" placeholder="제목을 입력하세요">
<textarea rows="20" cols="60" class="cont_input_box" placeholder="내용을 입력하세요"></textarea>
<input type= "file" />
<div class="cmn_btn">등록</div>		
</div>
</body>
</html>