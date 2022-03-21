<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
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
<div class="top_area">
	<div class="logo"><div class="logo_erp_text">ERP</div></div>
	<div class="menu_depth1_wrap">
		<!-- _on 달린 것이 활성화 상태 -->
		<div class="top_menu">
			<div class="top_menu_text">인사</div>
			<div class="top_menu_bar"></div>
		</div>
		<div class="top_menu_on">
			<div class="top_menu_text">그룹웨어</div>
			<div class="top_menu_bar"></div>
		</div>
		<div class="top_menu">
			<div class="top_menu_text">경영관리</div>
			<div class="top_menu_bar"></div>
		</div>
		<div class="top_menu">
			<div class="top_menu_text">영업관리</div>
			<div class="top_menu_bar"></div>
		</div>
		<div class="top_menu">
			<div class="top_menu_text">고객지원</div>
			<div class="top_menu_bar"></div>
		</div>
		<div class="top_menu">
			<div class="top_menu_text">경영정보</div>
			<div class="top_menu_bar"></div>
		</div>
	</div>
</div>
<div class="left_area">
	<div class="emp_info_area">
		<div class="emp_info">
			<div class="emp_image_area">
				<div class="emp_image_wrap">
					<img alt="사원이미지" src="../images/cmn/emp_image.png"/>
				</div>
			</div>
			<div class="emp_info_wrap">
				<div class="emp_name_txt">신지수<div class="emp_opt_btn"></div></div>
				<div class="emp_dept_txt">그룹웨어팀 대리</div>
			</div>
		</div>
		<div class="emp_menu_area">
			<div class="emp_menu">메신저</div>
			<div class="emp_menu">내정보</div>
			<div class="emp_menu_last">로그아웃</div>
		</div>
	</div>
	<div class="left_menu_dpeth1_txt">그룹웨어</div>
	<div class="left_menu_wrap">
		<!-- 2depth 메뉴 -->
		<!-- 현재 선택중인 메뉴는 on -->
		<div class="menu_depth2_on">
			<div class="menu_depth2_area">
				<div class="menu_depth2_text">게시판</div>
				<div class="left_menu_bar"></div>
			</div>
			<!-- 2depth 메뉴 -->
			<!-- 현재 선택중인 메뉴는 on -->
			<div class="menu_depth3_wrap">
				<div class="menu_depth3_on">자유게시판</div>
				<div class="menu_depth3">게시판 관리</div>
				<div class="menu_depth3">공용문서함</div>
			</div>
		</div>
		<div class="menu_depth2">
			<div class="menu_depth2_area">
				<div class="menu_depth2_text">전자결재</div>
				<div class="left_menu_bar"></div>
			</div>
			<div class="menu_depth3_wrap">
				<!-- 현재 선택중인 메뉴는 on -->
				<div class="menu_depth3">기안함</div>
				<div class="menu_depth3">결재함</div>
				
			</div>
		</div>
		<div class="menu_depth2">
			<div class="menu_depth2_area">
				<div class="menu_depth2_text">쪽지</div>
				<div class="left_menu_bar"></div>
			</div>
			<div class="menu_depth3_wrap">
				<div class="menu_depth3">쪽지쓰기</div>
				<div class="menu_depth3">받은쪽지함</div>
				<div class="menu_depth3">보낸쪽지함</div>		
			</div>
		</div>
		<div class="menu_depth2">
			<div class="menu_depth2_area">
				<div class="menu_depth2_text">캘린더</div>
				<div class="left_menu_bar"></div>
			</div>
			<div class="menu_depth3_wrap">
				<div class="menu_depth3">일정관리</div>
			</div>
		</div>
	</div>
</div>
<div class="right_area">
	<div class="navi_bar">
		Home
		<div class="navi_next"></div>
		그룹웨어
		<div class="navi_next"></div>
		게시판
		<div class="navi_next"></div>
		자유게시판
	</div>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">자유게시판</div>
			<!-- 검색영역 선택적 사항 -->
			
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">

</head>
<body>
<input type="text" class="tltle_input_box" placeholder="제목을 입력하세요">
<textarea rows="20" cols="60" class="cont_input_box" placeholder="내용을 입력하세요"></textarea>
<input type= "file" />
<div class="cmn_btn">
등록
</div>
			
</div>
</body>
</html>