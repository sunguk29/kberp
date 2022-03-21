<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 ERP - 리드등록</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1013px;;
}
/* 팝업 조회영역 */
.popup_title_mid {
	width: calc(100% + 20px);
    height: 70px;
    margin: -10px 0px 0px -10px;
	background-color: #F2F2F2;
	font-size: 11pt;
	padding-bottom: 3px;
	border-bottom: 1px solid #d7d7d7;
}

.ptm_left {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 70px;
}
.ptm_left2 {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 50px;
	margin-top: 20px;
}
.ptm_left_top, .ptm_left_bot {
	width: 100px;
	height: 35px;
	line-height: 35px;
	text-align: right;
	font-size: 15px;
	font-weight: bold;
}
.ptm_right_bot {
	width: 94px;
	height: 32px;
	margin-top: 5px;
	text-align: center;
}
.ptm_right_bot2, .ptm_right_top2 {
	width: 94px;
    height: 32px;
    margin-top: 5px;
    text-align: center;
}
.ptm_mid {
	display: inline-block;
	vertical-align: top;
	width: 150px;
	height: 70px;
}
.ptm_mid2 {
	display: inline-block;
	vertical-align: top;
	width: 150px;
	height: 50px;
	margin-top: 20px;
}
.ptm_mid_top, .ptm_mid_bot {
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.sel_size {
	width: 130px;
	height: 25px;
	outline: none;
}
.ptm_mid_right0 {
	display: inline-block;
	vertical-align: top;
	width: 50px;
	height: 70px;
}
.ptm_mid_right {
	display: inline-block;
	vertical-align: top;
	width: 240px;
	height: 70px;
}
.ptm_mid_right_top, .ptm_mid_right_bot {
	width: 240px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.text_size {
	width: 230px;
	height: 19px;
	outline: none;
}
.text_size1 {
	width: 123px;
	height: 19px;
	outline: none;
}
.text_size2 {
	width: 300px;
	height: 19px;
	margin-left : 10px;
	outline: none;
}
.ptm_right {
	display: inline-block;
	vertical-align: top;
	width: 94px;
	height: 100%;
}
.ptm_right2 {
	display: inline-block;
	vertical-align: top;
	width: 94px;
	height: 50px;
	margin-top: 20px;
}
.ptm_right_top {
	width: 94px;
	height: 32px;
	text-align: center;
}
/* 팝업 내용 */
.popup_cc_box_left {
   display: inline-block;
   vertical-align: top;
   width: 120px;
   height: 50px;
}
/* 담당자 조회 내용  */
.popup_cc_box_right {
   display: inline-block;
   width: 300px;
   height: 50px;
   font-size: 14px;
   line-height: 50px;
}
/* 고객사 조회 내용  */
.popup_cc_box_right2 {
   display: inline-block;
   width: 400px;
   height: 50px;
   margin: 0px;
   font-size: 0px;
}
/* 고객 조회 내용 */
.popup_cc_box_right3 {
   display: inline-block;
   width: 400px;
   height: 50px;
   font-size: 14px;
}
/* 고객 추가 팝업 */
.btn2 {
	width : 90px;
	height: 40px;
	font-weight: bold;
	font-size: 14px;
	text-align: center;
	line-height: 40px;
	display: inline-block;
	vertical-align: top;
}
.txt2 {
	height: 30px;
	width: 450px;
	margin: 7px 5px 3px 5px;
	font-size: 10.5px;
	color: black;
	display: inline-block;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	line-height: 30px;
	border-bottom: 1px solid #d7d7d7;
}
.txt3 {
	height: 25px;
	width: 400px;
	font-size: 12px;
	display: inline-block;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	line-height: 30px;
	margin: 0px;
	padding: 0px;
	border : none;
}
.btnImg2 {
	width : 20px;
	height: 20px;
	text-align: right;
	margin-left: 25px;
	background-size: 20px 20px;
}
.btnImg3 {
	width : 15px;
	height: 15px;
	text-align: right;
	margin-left: 5px;
	background-size: 15px 15px;
}
.imgPos2 {
	display: inline-block;
	vertical-align: middle;
}
.popup_cont2 {
	/* 내용 변경용 */
	font-size: 13pt;
	font-weight: 600;
	text-align: center;
	line-height: 80px;
}
/* 고객 추가 팝업 끝  */
.popup_box_in {
   width: calc(100% - 4px);
   height: 50px;
   border: 2px solid #d7d7d7;
   border-radius: 3px;
   background-color: #F2F2F2;
   margin-bottom: 5px;
}
.popup_box_in:hover {
   cursor: pointer;
   border: 2px solid #2E83F2;
}
.company {
   display: inline-block;
   width: 25px;
   height: 25px;
   background-size: 25px 25px;
   background-repeat: no-repeat;
   margin-top: 13px;
   margin-left: 45px;
}
.boldname{
	margin-left: 30px;
	font-weight: bold;
}
.boldname2 {
	font-weight: bold;
	font-size : 12px;
	padding: 0px;
}
.boldname3 {
	font-weight: bold;
	font-size : 12px;
	margin-top: 10px;
	display: inline-block;
	vertical-align: top;
}
.mg_wid {
	margin-left: 50px;
}
/* 팝업 내용 배경색 */
.pc_back {
	background-color: #fff;
}

/* 팝업 페이징 */
.board_bottom2 {
	height: 30px;
	position: relative;
	text-align: right;
	background-color: #fff;
	padding: 5px 0px;
}
/* 대출한도, 이자율, 판매상태 */
.adrs_name {
	font-weight: bold;
	font-size: 12px;
	margin: 0px;
}
.clntCmpny_dt {
	font-weight: bold;
	color: #2E83F2;
	font-size: 12px;
}
/*----- 팝업 CSS 끝 ----- */

.body {
	display: block;
	background-color: white;
	width: 1013px;
	height: 100%;
	margin: auto;
}
.bodyWrap {
	display: block;
	background-color: white;
	width: 927px;
	height: 100%;
	margin: 40px auto;
}

/* 개인 작업 영역 */
table{
	
	border: 1px;
	width: 927px;
	margin: 40px auto;
}
td:nth-child(2){
	border-bottom: 1px solid #d7d7d7;
}
tr:nth-child(10) td{
	border-bottom: 1px solid #d7d7d7;
}
tr:nth-child(9) td:nth-child(1){
	height: 66px;
}
td:nth-child(1) {
	text-align: center;
}
.btn{
	width : 90px;
	height: 40px;
}
.address{
	width : 90px;
	height: 100px;
}
.btn, .address{
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	width: 150px;
	border: none;
}
.plus_btn, .btnImg:hover{
	cursor: pointer;
}
.txt{
	height: 33px;
	width: 90%;
	padding: 0 5px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}
.rvn_txt {
	height: 33px;
	width: 885px;
	padding: 0 15px;
	font-size: 14px;
	color: black;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: 1px solid #d7d7d7;
	background-color: #F2F2F2;
	text-align: left;
	font-weight: bold;
	margin-left: 40px;
	margin-bottom: 5px;
}
.txt_in{
	height: 33px;
	width: 100%;
	padding: 0 5px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}
.cntrct_box_in {
	width: 885px;
	height: 150px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
}
.btnImg{
	width : 30px;
	float: right;
	margin-left: 10px;
}
.btnImg_in{
	display: inline-block;
	vertical-align: middle;
	width: 25px;
	height: 25px;
	float: right;
	cursor: pointer;
	margin-right: 5px;
}
.plus_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 5px;
	margin-top: 5.5px;	
}
.imgPos{
	text-align: right;
}
.imgPos_in{
	text-align: right;
	background-color: #f2f2f2;
}

/* 예정된 일정 */
.mgtop {
	margin-top: 50px;
}
hr { /* 구분선 */
	margin-bottom: 10px;
}
.bot_title { 
	font-size: 11pt;
}
.bx { /* 스크롤때문에 div 박스 추가 */
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}
.OpinionBox {
	width: 830px;
	height: 70px;
	font-size: 10pt;
	border: 1px solid gray;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	border-bottom-left-radius: 12px;
	border-bottom-right-radius: 12px;
	margin-bottom: 5px;
	background-color: #F2F2F2;
}
.name {
	margin-top: 3px;
	font-weight: bold;
	padding-top: 5px;
	padding-left: 20px;
}
.txtOp, .dt {
	padding-left: 20px;
}
.dt {
	display: inline-block;
	vertical-align: top;
	font-size: 9pt;
	padding-right: 590px;
	color: gray;
}
.drop_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
}
.plus_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
	margin-right: 20px;
}
.up_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/up_arrow.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
}
.drop_btn:hover, .plus_btn:hover, .up_btn:hover {
	cursor: pointer;
}
/* 예정된 일정  */
.sche {
	display: inline-block;
	width: 696.5px;
}
.sch_re, .sch_del {
	font-size: 9pt;
	color: gray;
}
.sch_re:hover, .sch_del:hover {
	cursor: pointer;
	color: #F2CB05;
}
/* 첨부자료 */
.cntrct_box_in {
	width: 885px;
	height: 100px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
}
.rvn_txt {
	height: 33px;
	width: 885px;
	padding: 0 15px;
	font-size: 14px;
	color: black;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: 1px solid #d7d7d7;
	background-color: #F2F2F2;
	text-align: left;
	font-weight: bold;
	margin-left: 40px;
	margin-bottom: 5px;
}
.plus_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 5px;
	margin-top: 5.5px;
}
.plus_btn_bot {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 7px;
	margin-top: 7.5px;
}
.plus_btn_bot:hover {
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#listBtn").on("click", function() {
		$("#listForm").submit();
	});	
	
/* 	$("#writeBtn").on("click", function() {
		if(checkEmpty("#leadName")) {
			alert("알림" "리드명을 입력하세요.");
			$("#leadName").focus();
		} else if(checkEmpty("#clntName")) {
			alert("알림" "고객명을 입력하세요.");
			$("#clntName").focus();
		} else if(checkEmpty("#ccName")) {
			alert("알림" "고객사명을 입력하세요.");
			$("#ccName").focus();
		} else if(checkEmpty("#rPath")) {
			alert("알림" "인지경로를 입력하세요.");
			$("#rPath").focus();
		} else if(checkEmpty("#meName")) {
			alert("알림" "담당자를 입력하세요.");
			$("#meName").focus();
		} else {	
			
		}
	}); */
	
	$("#clntIcon").on("click", function() {
		var html = "";
		
		html += "<div class=\"popup_title_mid\">";
		html += "<div class=\"ptm_left2\">";
		html += "<div class=\"ptm_left_top\">고객/고객사</div>";			
		html += "</div>";
		html += "<div class=\"ptm_mid2\">";
		html += "<div class=\"ptm_mid_top\">";
		html += "<input type=\"text\" class=\"text_size2\" placeholder=\"검색어를 입력해주세요\" />";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"ptm_mid_right\"></div>";
		html += "<div class=\"ptm_right2\">";
		html += "<div class=\"ptm_right_top2\">";
		html += "<div class=\"cmn_btn\">검색</div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"popup_cont pc_back\">";
		html += "<div class=\"popup_box_in\">";
		html += "<div class=\"popup_cc_box_left\">";
		html += "<span><img alt=\"고객이미지\" class=\"company\" src=\"resources/images/sales/clnt.png\"></span>";
		html += "</div>";
		html += "<div class=\"popup_cc_box_right3\">";
		html += "<div class=\"boldname3\">고객명 / 고객사명 / 고객사등급</div><br/>";
		html += "<span class=\"clntCmpny_dt\">등록일(2022-02-08)</span>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"popup_box_in\">";
		html += "<div class=\"popup_cc_box_left\">";
		html += "<span><img alt=\"고객이미지\" class=\"company\" src=\"resources/images/sales/clnt.png\"></span>";
		html += "</div>";
		html += "<div class=\"popup_cc_box_right3\">";
		html += "<div class=\"boldname3\">고객명 / 고객사명 / 고객사등급</div><br/>";
		html += "<span class=\"clntCmpny_dt\">등록일(2022-02-08)</span>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"popup_box_in\">";
		html += "<div class=\"popup_cc_box_left\">";
		html += "<span><img alt=\"고객이미지\" class=\"company\" src=\"resources/images/sales/clnt.png\"></span>";
		html += "</div>";
		html += "<div class=\"popup_cc_box_right3\">";
		html += "<div class=\"boldname3\">고객명 / 고객사명 / 고객사등급</div><br/>";
		html += "<span class=\"clntCmpny_dt\">등록일(2022-02-08)</span>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"popup_box_in\">";
		html += "<div class=\"popup_cc_box_left\">";
		html += "<span><img alt=\"고객이미지\" class=\"company\" src=\"resources/images/sales/clnt.png\"></span>";
		html += "</div>";
		html += "<div class=\"popup_cc_box_right3\">";
		html += "<div class=\"boldname3\">고객명 / 고객사명 / 고객사등급</div><br/>";
		html += "<span class=\"clntCmpny_dt\">등록일(2022-02-08)</span>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"popup_box_in\">";
		html += "<div class=\"popup_cc_box_left\">";
		html += "<span><img alt=\"고객이미지\" class=\"company\" src=\"resources/images/sales/clnt.png\"></span>";
		html += "</div>";
		html += "<div class=\"popup_cc_box_right3\">";
		html += "<div class=\"boldname3\">고객명 / 고객사명 / 고객사등급</div><br/>";
		html += "<span class=\"clntCmpny_dt\">등록일(2022-02-08)</span>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"board_bottom2\">";
		html +=	"<div class=\"pgn_area\">";
		html +=	"<div class=\"page_btn page_first\">first</div>";
		html +=	"<div class=\"page_btn page_prev\">prev</div>";
		html +=	"<div class=\"page_btn_on\">1</div>";
		html +=	"<div class=\"page_btn\">2</div>";
		html +=	"<div class=\"page_btn\">3</div>";
		html +=	"<div class=\"page_btn\">4</div>";
		html +=	"<div class=\"page_btn\">5</div>";
		html +=	"<div class=\"page_btn page_next\">next</div>";
		html +=	"<div class=\"page_btn page_last\">last</div>";
		html +=	"</div>";
		html +=	"</div>";
		html +=	"</div>";
	
		makePopup({
			depth : 1,
			bg : true,
			bgClose : false,
			title : "고객 조회",
			contents : html,
			width : 600,
			height : 500,
			buttons : [{
				name : "고객 추가",
				func:function() {
					var html = "";
					
				html += "<div class=\"popup_cont pc_back\">";
				html += "<div class=\"popup_table\">";
				html += "<div class=\"btn2\">고객</div>";
				html += "<div class=\"txt2\"><input type=\"text\" class=\"txt3\" /></div>";
				html += "<div class=\"btn2\">고객사 *</div>";
				html += "<div class=\"txt2\"><input type=\"text\" class=\"txt3\" />";
				html += "<span class=\"imgPos2\"><img class=\"btnImg2\" alt=\"돋보기\" src=\"resources/images/sales/mg.png\" /></span>";		
				html += "</div>";
				html += "<div class=\"btn2\">부서</div>";
				html += "<div class=\"txt2\"><input type=\"text\" class=\"txt3\" /></div>";
				html += "<div class=\"btn2\">직책</div>";
				html += "<div class=\"txt2\"><input type=\"text\" class=\"txt3\" /></div>";							
				html += "<div class=\"btn2\">휴대폰 번호*</div>";
				html += "<div class=\"txt2\"><input type=\"text\" class=\"txt3\" /></div>";															
				html += "<div class=\"btn2\">메일</div>";
				html += "<div class=\"txt2\"><input type=\"text\" class=\"txt3\" /></div>";							
				html += "<div class=\"btn2\">첨부자료</div>";
				html += "<div class=\"txt2\"><input type=\"text\" class=\"txt3\" />";
				html += "<div class=\"imgPos2\">";
				html += "<span>";
				html += "<img class=\"btnImg3\" alt=\"추가\" src=\"resources/images/sales/plus.png\" />";
				html += "<img class=\"btnImg3\" alt=\"접기\" src=\"resources/images/sales/uparrow.png\" />";
				html += "</span>";
				html += "</div>";
				html += "</div>";
				html += "</div>";
				html += "</div>";

					makePopup({
						depth : 2,
						bg : true,
						bgClose : false,
						title : "고객 등록",
						contents : html,
						width : 600,
						height : 400,
						buttons : [{
							name : "등록",
							func: function() {
								
								var html = "";
								
								html += "<div class=\"popup_cont2\">저장되었습니다.</div>";
								
								makePopup({
									depth : 3,
									bg : true,
									bgClose : true,
									title : "저장 완료",
									contents : html,
									width : 400,
									height : 180,
									buttons : {
										name : "확인"	
									}
								});
							}
						}, {
							name : "취소"
						}]
					});									
				}
			},	{
				name : "등록",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});			
	});
	
	$("#ccIcon").on("click", function() {
		var html = "";
		
		html += "<div class=\"popup_title_mid\">";
		html += "<div class=\"ptm_left\">";
		html +=	"<div class=\"ptm_left_top\">고객사분류</div>";	
		html +=	"<div class=\"ptm_left_bot\">고객사명</div>";	
		html += "</div>";
		html += "<div class=\"ptm_mid\">";
		html +=	"<div class=\"ptm_mid_top\">";
		html +=	"<select class=\"sel_size\">";
		html +=		"<option>선택안함</option>";
		html +=		"<option>거래고객사</option>";
		html +=		"<option>파트너사</option>";
		html +=		"<option>해지고객사</option>";
		html +=		"<option>정지고객사</option>";
		html +=		"<option>외국고객사</option>";
		html +=		"<option>기타</option>";
		html +=	"</select>";
		html +=	"</div>";		
		html +=	"<div class=\"ptm_mid_bot\">";
		html +=	"<input type=\"text\" class=\"text_size2\" placeholder=\"검색어를 입력해주세요\" />";
		html +=	"</div>";	
		html += "</div>";
		html += "<div class=\"ptm_mid_right\">";
		html +=	"<div class=\"ptm_mid_right_top\"></div>";
		html +=	"<div class=\"ptm_mid_right_bot\"></div>";
 		html += "</div>"; 
		html += "<div class=\"ptm_right\">";
		html +=	"<div class=\"ptm_right_top\"></div>";
		html +=	"<div class=\"ptm_right_bot\">";
		html +=	"<div class=\"cmn_btn\">검색</div>";
		html +=	"</div>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"popup_cont pc_back\">";
		html += "<div class=\"popup_box_in\">";
		html += "<div class=\"popup_cc_box_left\">";
		html += "<span><img alt=\"고객사이미지\" class=\"company\" src=\"resources/images/sales/client.png\"></span>";
		html += "</div>";
		html += "<div class=\"popup_cc_box_right2\">";
		html += "<span class=\"boldname2\">고객사명 / 고객사 분류 / 고객 등급</span><br/>";
		html += "<span class=\"adrs_name\">주소</span><br/>";
		html += "<span class=\"clntCmpny_dt\">등록일(2022-02-08)</span>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"popup_box_in\">";
		html += "<div class=\"popup_cc_box_left\">";
		html += "<span><img alt=\"고객사이미지\" class=\"company\" src=\"resources/images/sales/client.png\"></span>";
		html += "</div>";
		html += "<div class=\"popup_cc_box_right2\">";
		html += "<span class=\"boldname2\">고객사명 / 고객사 분류 / 고객 등급</span><br/>";
		html += "<span class=\"adrs_name\">주소</span><br/>";
		html += "<span class=\"clntCmpny_dt\">등록일(2022-02-08)</span>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"popup_box_in\">";
		html += "<div class=\"popup_cc_box_left\">";
		html += "<span><img alt=\"고객사이미지\" class=\"company\" src=\"resources/images/sales/client.png\"></span>";
		html += "</div>";
		html += "<div class=\"popup_cc_box_right2\">";
		html += "<span class=\"boldname2\">고객사명 / 고객사 분류 / 고객 등급</span><br/>";
		html += "<span class=\"adrs_name\">주소</span><br/>";
		html += "<span class=\"clntCmpny_dt\">등록일(2022-02-08)</span>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"popup_box_in\">";
		html += "<div class=\"popup_cc_box_left\">";
		html += "<span><img alt=\"고객사이미지\" class=\"company\" src=\"resources/images/sales/client.png\"></span>";
		html += "</div>";
		html += "<div class=\"popup_cc_box_right2\">";
		html += "<span class=\"boldname2\">고객사명 / 고객사 분류 / 고객 등급</span><br/>";
		html += "<span class=\"adrs_name\">주소</span><br/>";
		html += "<span class=\"clntCmpny_dt\">등록일(2022-02-08)</span>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"popup_box_in\">";
		html += "<div class=\"popup_cc_box_left\">";
		html += "<span><img alt=\"고객사이미지\" class=\"company\" src=\"resources/images/sales/client.png\"></span>";
		html += "</div>";
		html += "<div class=\"popup_cc_box_right2\">";
		html += "<span class=\"boldname2\">고객사명 / 고객사 분류 / 고객 등급</span><br/>";
		html += "<span class=\"adrs_name\">주소</span><br/>";
		html += "<span class=\"clntCmpny_dt\">등록일(2022-02-08)</span>";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"board_bottom2\">";
		html +=	"<div class=\"pgn_area\">";
		html +=	"<div class=\"page_btn page_first\">first</div>";
		html +=	"<div class=\"page_btn page_prev\">prev</div>";
		html +=	"<div class=\"page_btn_on\">1</div>";
		html +=	"<div class=\"page_btn\">2</div>";
		html +=	"<div class=\"page_btn\">3</div>";
		html +=	"<div class=\"page_btn\">4</div>";
		html +=	"<div class=\"page_btn\">5</div>";
		html +=	"<div class=\"page_btn page_next\">next</div>";
		html +=	"<div class=\"page_btn page_last\">last</div>";
		html +=	"</div>";
		html +=	"</div>";
		html +=	"</div>";	

		makePopup({
			bg : true,
			bgClose : false,
			title : "고객사 조회",
			contents : html,
			width : 600,
			height : 500,
			buttons : [{
				name : "등록",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});		
	});
	
	$("#userIcon").on("click", function() {
		var html = "";
		
	 	html += "<div class=\"popup_title_mid\">"; 
		html += "<div class=\"ptm_left\">";
		html += "<div class=\"ptm_left_top\">팀분류</div>";
		html +=	"<div class=\"ptm_left_bot\">사원분류</div>";		
		html += "</div>";
		html += "<div class=\"ptm_mid\">";
		html +=	"<div class=\"ptm_mid_top\">";
		html +=	"<select class=\"sel_size\">"
		html +=		"<option>영업1팀</option>";
		html +=		"<option>영업2팀</option>";
		html +=		"<option>영업3팀</option>";
		html +=	"</select>";
		html +=	"</div>";		
		html +=	"<div class=\"ptm_mid_bot\">";
		html +=	"<select class=\"sel_size\">";
		html +=		"<option>사원번호</option>";
		html +=		"<option>사원명</option>";
		html +=	"</select>";
		html +=	"</div>";	
		html += "</div>";
		html += "<div class=\"ptm_mid_right\">";
		html +=	"<div class=\"ptm_mid_right_top\"></div>";
		html +=	"<div class=\"ptm_mid_right_bot\">";
		html +=	"<input type=\"text\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" />";
		html +=	"</div>";
		html += "</div>";
		html += "<div class=\"ptm_right\">";
		html +=	"<div class=\"ptm_right_top\"></div>";
		html +=	"<div class=\"ptm_right_bot\">";
		html +=	"<div class=\"cmn_btn\">검색</div>";
		html +=	"</div>";
		html +=	"</div>";
		html += "</div>";
		html += "<div class=\"popup_cont pc_back\">";
		html +=	"<div class=\"popup_box_in\">";
		html +=	"<div class=\"popup_cc_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"company\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_cc_box_right\">";
		html +=	"17824<span class=\"boldname\">김길동 / 대리</span>";
		html +=	"<span class=\"mg_wid\">영업1팀</span>";
		html +=	"</div>";
		html +=	"</div>";
		html +=	"<div class=\"popup_box_in\">";
		html +=	"<div class=\"popup_cc_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"company\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_cc_box_right\">";
		html +=	"17824<span class=\"boldname\">김길동 / 대리</span>";
		html +=	"<span class=\"mg_wid\">영업1팀</span>";
		html +=	"</div>";
		html +=	"</div>";
		html +=	"<div class=\"popup_box_in\">";
		html +=	"<div class=\"popup_cc_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"company\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_cc_box_right\">";
		html +=	"17824<span class=\"boldname\">김길동 / 대리</span>";
		html +=	"<span class=\"mg_wid\">영업1팀</span>";
		html +=	"</div>";
		html +=	"</div>";
		html +=	"<div class=\"popup_box_in\">";
		html +=	"<div class=\"popup_cc_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"company\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_cc_box_right\">";
		html +=	"17824<span class=\"boldname\">김길동 / 대리</span>";
		html +=	"<span class=\"mg_wid\">영업1팀</span>";
		html +=	"</div>";
		html +=	"</div>";
		html +=	"<div class=\"popup_box_in\">";
		html +=	"<div class=\"popup_cc_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"company\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_cc_box_right\">";
		html +=	"17824<span class=\"boldname\">김길동 / 대리</span>";
		html +=	"<span class=\"mg_wid\">영업1팀</span>";
		html +=	"</div>";
		html +=	"</div>";
		html += "<div class=\"board_bottom2\">";
		html +=	"<div class=\"pgn_area\">";
		html +=	"<div class=\"page_btn page_first\">first</div>";
		html +=	"<div class=\"page_btn page_prev\">prev</div>";
		html +=	"<div class=\"page_btn_on\">1</div>";
		html +=	"<div class=\"page_btn\">2</div>";
		html +=	"<div class=\"page_btn\">3</div>";
		html +=	"<div class=\"page_btn\">4</div>";
		html +=	"<div class=\"page_btn\">5</div>";
		html +=	"<div class=\"page_btn page_next\">next</div>";
		html +=	"<div class=\"page_btn page_last\">last</div>";
		html +=	"</div>";
		html +=	"</div>";
		html +=	"</div>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "담당자 조회",
			contents : html,
			width : 600,
			height : 500,
			buttons : [{
				name : "등록",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});	
});

function checkEmpty(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
}	
</script>
</head>
<body>
<form action="leadList" id="listForm" method="post">
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" id="no" name="no" />
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
</form>
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">리드 등록</div>
			<!-- 검색영역 선택적 사항 -->
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />
			<img alt="저장버튼" src="resources/images/sales/save.png" class="btnImg" id="writeBtn"/>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
				<div class="bodyWrap">
				<!-- 시작 -->
					<table>
						<colgroup>
							<col width="200" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<tr>
								<td><input type="button" class="btn" id="leadName" value="리드명 *" readonly="readonly"/></td>
								<td><input type="text" class="txt" /></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" id="clntName" value="고객명 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" />
									<img class="btnImg_in" id="clntIcon" alt="팝업" src="resources/images/sales/popup.png" />
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" id="ccName" value="고객사 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" />
									<img class="btnImg_in" id="ccIcon" alt="팝업" src="resources/images/sales/popup.png" />
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객사 등급" readonly="readonly"/></td>
								<td><select class="txt_in" id="ccGrade" name="ccGrade" disabled="disabled">
										<optgroup>
											<option>고객사 등록 후 자동 입력</option>
											<option value="0">S</option>
											<option value="1">A</option>
											<option value="2">B</option>
											<option value="3">C</option>
											<option value="4">D</option>
										</optgroup>
								</select></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="인지경로 *" readonly="readonly"/></td>
								<td><select class="txt_in" id="rPath" name="rPath">
										<optgroup>
											<option value="0">자사홈페이지</option>
											<option value="1">인터넷검색</option>
											<option value="2">지인소개</option>
											<option value="3">세미나</option>
											<option value="4">전화</option>
										</optgroup>
								</select></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" id="meName" value="담당자 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" />
									<img class="btnImg_in" id="userIcon" alt="담당자아이콘" src="resources/images/sales/usericon.png" />
								</td>
							</tr>
							
						</tbody>
					</table>
					<!-- 첨부자료 -->
					<div class="rvn_txt"> 첨부자료 (0)
						<input type=file name='file1' style='display: none;' /> 
						<img class="plus_btn" src="resources/images/sales/plus.png" border='0' onclick="document.all.file1.click();" > 
					</div>
					<div class="cntrct_box_in"></div>
				</div> <!-- bodyWrap end -->
			</div>	
		</div>
	</div>
<!-- bottom -->
<c:import url="/bottom"></c:import>
</body>
</html>