<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 게시판관리</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
.cont_title{padding-bottom: 20px;
    border-bottom: 2px solid #353535;
    font-family: nanumgothic,sans-serif;
    font-size: 20px;
    line-height: 1;
    font-weight: 700;
    color: #000;
}
.page_title_text {
	margin-bottom: 30px;
}
.category_list ul {
    overflow: auto;
    overflow-x: hidden;
    zoom: 1;
    margin: 0;
    padding: 5px 0;
    width: 221px;
}
.tree{
	display: inline-block;
	border: 1px solid #6f6f65;
	height: 390px;
	width: 220px;
	margin-bottom: 20px;
	font-size: 12px;
}
.tree_list{
	zoom: 1;
    margin-left: 5px;
    margin-top: 5px;
    padding: 0;
    line-height: 1.2em;
    word-break: break-all;
    word-wrap: break-word;
    width: 221px;
    font-weight: bold;  
    cursor: pointer;
    
}
.ctgr_name{
	display: inline-block;
	width: 351px;
	height: 50px;
	vertical-align:top; 
	font-size: 12px;
	font-weight: bold;
	color: #424242;
	margin-left: 10px;
}
.tltle_input_box{
	position: relative;
    width: 90%;
    height: 30px;
    border: solid 1px #dadada;
    padding: 10px 110px 10px 14px;
    background: #fff;
    box-sizing: border-box;
    vertical-align: top;
}
/* 개인 작업 영역 */

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
<div class="right_area">
	<div class="navi_bar">
		Home
		<div class="navi_next"></div>
		그룹웨어
		<div class="navi_next"></div>
		게시판
		<div class="navi_next"></div>
		게시판 관리
	</div>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">게시판 관리
			<div class="emp_opt_btn"></div></div>
			<!-- 검색영역 선택적 사항 -->
			<h1 class="cont_title">카테고리 관리·설정</h1>
				<div class="tree">
					<div class="tree_list">자유게시판(10)</div><br/>
					<div class="tree_list">공용문서함(0)</div><br/>
				</div>
				<div class="ctgr_name">카테고리명
					<input type="text" class="tltle_input_box" placeholder="제목을 입력하세요">
				</div>
			<div class="cmn_btn">카테고리 추가</div>
			<div class="cmn_btn_ml">삭제</div>
			
		</div>
		
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		
		</div>
	</div>
</div>
</body>
</html>