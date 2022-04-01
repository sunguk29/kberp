<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 ERP - 리드 상세보기</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1013px;
}
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
.popup_bg {
	/* 숨김용 */
	display: none;
}
.popup {
	/* 숨김용 */
	display: none;
	/* 크기변경용 */
	width: 600px;
	height: 400px;
	top: calc(50% - 200px); /* 높이 반  */
	left: calc(50% - 300px); /* 너비 반 */
}



/* 개인 작업 영역 */
table{
	
	border: 1px;
	width: 927px;
	margin: 40px auto;
}
td:nth-child(2), td:nth-child(4){
	border-bottom: 1px solid #d7d7d7;
}
tr:nth-child(11) > td:nth-child(1){
	border-bottom: 1px solid #d7d7d7;
}
td:nth-child(1), td:nth-child(3){
	text-align: center;
}
.popup_table tr:nth-child(8) td:nth-child(2) {
    border: none;
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
.btnImg:hover{
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
.imgPos{
	text-align: right;
}
.imgPos_in{
	text-align: right;
	background-color: #f2f2f2;
}
/* 의견, 히스토리 */
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
.txtOp, .dt, .del {
	padding-left: 20px;
}
.dt {
	padding-right: 590px;
}
.dt, .del {
	display: inline-block;
	vertical-align: top;
	font-size: 9pt;
	color: gray;
}
.del:hover {
	cursor: pointer;
	color: #F2CB05;
}
.opBox {
	width: 860px;
	height: 56px;
	margin: 15px 0px 5px 47.5px;
}
textarea {
	width: 757px;
	height: 52px;
	font-size: 10.5pt;
	white-space: pre-wrap;
	resize: none;
	font-family: "맑은 고딕";
	display: inline-block;
	vertical-align: top;
	outline: none;
}
.subm {
	margin-left: 14px;
	width: 35px;
	height: 56px;
	line-height: 56px;
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
/* 전환 */
.next_bot {
	margin-top: 20px;
	width: 100%;
	height: 30px;
}
.nb {
	font-size: 14px;
	float: right;
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
	position: absolute;
	top: 7px;
	left: 884px;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
}
.plus_btn_bot:hover {
	cursor: pointer;
}
/* 의견 박스 */
.opbx{
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto; 
}

.op_title {
 font-size: 11pt;
}

/* 예정된 일정 */
.schdl_title {
	position: relative;
	font-size: 11pt;
}

.sbx { 
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}

.drop_btn_bot {
	position: absolute;
	top: 7px;
	left: 909px;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
}
.popup_table {
	border-collapse: collapse;
	display: table-cell;
	margin: 0px;
	table-layout: fixed;
}
.pop_cntrct_box_in {
    width: 538px;
    height: 50px;
    border: 1px solid #d7d7d7;
    border-radius: 7px;
    font-size: 10pt;
}
.pop_rvn_txt {
    height: 25px;
    width: 538px;
    padding: 0 15px;
    font-size: 14px;
    color: black;
    box-sizing: border-box;
    outline: none;
    border-radius: 3px;
    line-height: 25px;
    border: 1px solid #d7d7d7;
    background-color: #F2F2F2;
    text-align: left;
    font-weight: bold;
	margin-top: 10px;
    margin-bottom: 5px;
}
#fileName, #popFileName {
	border: hidden;
	outline: none;
}

.popBtn{
	width: 80px;
	height: 40px;
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	border: none;
	text-align: center;
}
.pop_txt{
	height: 30px;
	width: 420px;
	padding: 0 5px;
	padding-right: 25px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}
.pop_txt_in{
	height: 30px;
	width: 420px;
	padding: 0 5px;
	padding-right: 25px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}
.pop_dt_txt{
	height: 30px;
	width: 195px;
	padding: 0 5px;
	padding-right: 25px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}
.imgP{
	position: relative;
}
.ta_box {
    width: 450px;
    height: 52px;
    font-size: 10.5pt;
    white-space: pre-wrap;
    resize: none;
    font-family: "맑은 고딕";
    display: inline-block;
    vertical-align: top;
    outline: none;
    border-color: #d7d7d7;
}
.wave {
	display: inline-block;
	padding-left: 20px;
	padding-right: 20px;
}
</style>
<script type="text/javascript">
$(document).ready(function () {
	
	$("#listBtn").on("click", function() {
		
		$("#actionForm").attr("action", "leadList");
		$("#actionForm").submit();
	});
	
	/* 고객사 등급 선택되게 */
	$("#ccGrade").val(${data.GRADE_NUM}).prop("selected", this.selected);
	
	/* 인지경로 선택 되게 */
	$("#rp").val(${data.RCGNTN_PATH_NUM}).prop("selected", this.selected);
	
	
	/* 리드 상세보기 실행될 시 비동기로 의견 목록 그리기 위해 선언  */
	reloadOpList();
	
	/* 의견등록 start */
	$(".subm").on("click", function() {
		var params = $("#botOpActionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "llBotActionAjax/insert",
			dataType : "json",
			data : params,
			success : function(res) {
				if(res.res == "success"){
					$("#tatacont").val("");
					reloadOpList();
				} else {
					alert("등록중 문제가 발생하였습니다.");
				}
			}, error : function(request,status, error) {
				console.log(request.responseText);
			}
		});
	});
	/* 의견등록 end */
	
	/* 의견 삭제 버튼 start */
	$(".opbx").on("click", ".del", function() {
		var cmntNum = $(this).children("#cmntNum").val();
		document.getElementById("cmntNum").value = cmntNum;

		makePopup({
			bg : false,
			bgClose : false,
			title : "경고",
			contents : "삭제하시겠습니까?",
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "확인",
				func : function() {
					
					var params = $("#botOpActionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "llBotActionAjax/update",
						data : params,
						dataType : "json",
						success : function(res) {
							if(res.res == "success"){
								reloadOpList();
							} else {
								alert("삭제중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) {
							console.log(request.responseText);
						}
					});
					closePopup();
				}
			}, {
				name : "아니오"
			}]
		});
	});
	/* 의견 삭제 버튼 end */
	
	/* 예정된 일정 영역 */
	
	$(".schdl_title").on("click", ".drop_btn_bot", function() {
		$(".sbx").hide();
		html = "<div class=\"up_btn_bot\"></div>";
		$("#scListCnt_right").html(html);
	});
	
	$(".schdl_title").on("click", ".up_btn_bot", function() {
		$(".sbx").show();
		html = "<div class=\"drop_btn_bot\"></div><div class=\"plus_btn_bot\"></div>";
		$("#scListCnt_right").html(html);
	});
	
	// 상세보기 하단 예정된 일정 실행
	reloadSCList();
	
	/* 예정된 일정 팝업 */
	$(".schdl_title").on("click", ".plus_btn_bot", function() {
		var html = "";
		
		html += "<form action=\"fileUploadAjax\" id=\"RegForm\" method=\"post\" enctype=\"multipart/form-data\">";
		html += "<input type=\"hidden\" name=\"sEmpNum\" value=\"${sEmpNum}\" />";					
		html += "<table class=\"popup_table\">";
		html += "	<tbody>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"일정명 *\" readonly=\"readonly\"/></td>";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"ssname\" name=\"ssname\"/></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"영업\" /></td>";
		html += "			<td>";
		html += "				<div class=\"imgP\">";
		html += "					<input type=\"text\" class=\"pop_txt imgName\" id=\"sName\" name=\"sName\" />";
		html += "					<input type=\"hidden\" id=\"sNum\" name=\"sNum\"/>";
		html += "					<img class=\"btnImg_in\" id=\"salesPop\" src=\"resources/images/sales/popup.png\">";	
		html += "				</div>";
		html += "			</td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"리드\" readonly=\"readonly\"/></td>";
		html += "			<td>";
		html += "				<div class=\"imgP\">";
		html += "					<input type=\"text\" class=\"pop_txt imgName\" id=\"lName\" name=\"lName\" />";
		html += "					<input type=\"hidden\" id=\"lNum\" name=\"lNum\"/>";
		html += "					<img class=\"btnImg_in\" id=\"leadPop\" src=\"resources/images/sales/popup.png\">";	
		html += "				</div>";
		html += "			</td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객명\" readonly=\"readonly\"/></td>";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"clName\" name=\"clName\"/></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객사\" readonly=\"readonly\"/></td>";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"ccName\" name=\"ccName\" /></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"활동분류 *\" readonly=\"readonly\"/></td>";
		html += "			<td><select class=\"pop_txt_in\" id=\"ssactvtyclsfy\" name=\"ssactvtyclsfy\">";
		html += "					<optgroup>";
		html += "						<option value=\"9\">선택하세요</option>";
		html += "						<option value=\"0\">전화</option>";
		html += "						<option value=\"1\">메일</option>";
		html += "						<option value=\"2\">방문</option>";
		html += "						<option value=\"3\">기타</option>";
		html += "					</optgroup>";
		html += "			</select></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"날짜 *\" readonly=\"readonly\"/></td>";
		html += "			<td><input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"sdt\" name=\"sdt\"/>";
		html += "				<div class=\"wave\">" + " ~ "  + "</div>";
		html += "			<input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"edt\" name=\"edt\"/></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"활동내용 *\" readonly=\"readonly\"/></td>";
		html += "			<td><textarea class=\"ta_box\" id=\"ssactvtycont\" name=\"ssactvtycont\"></textarea></td>";
		html += "		</tr>";
		html += "	</tbody>";
		html += "</table>";				
		html += "<div class=\"pop_rvn_txt\"> 첨부파일  ";
		html += "	<img class=\"plus_btn aff_btn\"  src=\"resources/images/sales/plus.png\"/>"; 
		html += "</div>";
		html += "<div class=\"pop_cntrct_box_in\">";
		html += "	<input type=\"text\" id=\"popFileName\" name=\"fileName\" readonly=\"readonly\">";
		html += "</div>";
		html += "<input type=\"file\" id=\"att\" name=\"att\" onchange=\"uploadName(this)\"/>";
		html += "<input type=\"hidden\" id=\"schdlAttFile\" name=\"schdlAttFile\" />";	
		html += "</form>";
		
		makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			title : "예정된 일정 등록",
			contents : html,
			contentsEvent : function() {
				$(".aff_btn").on("click", function() {
					$("#att").click();
				});
				
				/* 리드 팝업  */
				 $("#leadPop").on("click", function() {
					 var html = "";
						
					 	html += "<div class=\"popup_title_mid\">"; 
					 	html += 	"<form id=\"popupLeadForm\">";
					 	html += 		"<input type=\"hidden\" id=\"lpage\" name=\"lpage\" value=\"1\" />";
						html += 		"<div class=\"ptm_left\">";
						html += 			"<div class=\"ptm_left_top\">팀분류</div>";
						html +=				"<div class=\"ptm_left_bot\">담당자</div>";		
						html += 		"</div>";
						html += 		"<div class=\"ptm_mid\">";
						html +=				"<div class=\"ptm_mid_top\">";
						html +=					"<select class=\"sel_size\" id=\"prgrS\" name=\"prgrS\">"
						html +=						"<option value=\"1\">진행중</option>";
						html +=						"<option value=\"2\">종료(영업기회전환)</option>";
						html +=						"<option value=\"3\">종료(영업기회실패)</option>";
						html +=					"</select>";
						html +=				"</div>";		
						html +=				"<div class=\"ptm_mid_bot\">";
						html +=					"<select class=\"sel_size\" id=\"empS\" name=\"empS\">";
						html +=						"<option value=\"0\">사원번호</option>";
						html +=						"<option value=\"1\">사원명</option>";
						html +=					"</select>";
						html +=				"</div>";	
						html += 		"</div>";
						html += 		"<div class=\"ptm_mid_right\">";
						html +=				"<div class=\"ptm_mid_right_top\"></div>";
						html +=				"<div class=\"ptm_mid_right_bot\">";
						html +=					"<input type=\"text\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" />";
						html +=				"</div>";
						html += 		"</div>";
						html += 		"<div class=\"ptm_right\">";
						html +=				"<div class=\"ptm_right_top\"></div>";
						html +=				"<div class=\"ptm_right_bot\">";
						html +=					"<div class=\"cmn_btn\" id=\"leadBtn\">검색</div>";
						html +=				"</div>";
						html +=			"</div>";
						html += 	"</form>";
						html += "</div>";
						html += "<div class=\"popup_cont pc_back\">";
						html +=		"<div class=\"popup_box\" id=\"leadBox\"></div>";
						html += 	"<div class=\"board_bottom2\">";
						html +=			"<div class=\"pgn_area\"></div>";
						html +=		"</div>"; 
						html +=	"</div>";
						
						makePopup({
							depth : 2,
							bg : true,
							bgClose : false,
							title : "리드 조회",
							contents : html,
							contentsEvent : function() {
								leadList();
								//페이징 
								$(".pgn_area").on("click", "div", function() {
									$("#lpage").val($(this).attr("lpage"));
									
									leadList();
								});
								// 검색버튼
								$("#leadBtn").on("click", function () {
									$("#lpage").val("1");
									
									leadList();
									
								});
								
								$("#searchTxt").on("keypress", function(event) {
									if(event.keyCode == 13 ) {
										$("#lpage").val("1");
										
										leadList();
										return false;
									}
								});
								
								$("#leadBox").on("click", ".popup_lead_box ", function() {
									// 변수에 값 가져와서 넣어줌
									var lnm = $(this).children("#lnm").val();
									var lna = $(this).children("#lna").val();
									var ccnm = $(this).children("#ccnm").val();
									var clnm = $(this).children("#clnm").val();
									
									// 본문에 해당 아이디와 일치하는 곳에 값 넣어줌
									document.getElementById("lNum").value = lnm;
									document.getElementById("lName").value = lna;
									document.getElementById("ccName").value = ccnm;
									document.getElementById("clName").value = clnm;
									closePopup();
								});
							},
							width : 600,
							height : 500,
							buttons : {
								name : "취소",
								func: function() {
									closePopup(2);
								}
							}
						});
							
					}); 
					/* 영업 조회 팝업 목록 함수 */
					function leadList() {
						var params = $("#popupLeadForm").serialize();
						
						$.ajax({
							type : "post",
							url : "leadPopAjax",
							dataType : "json",
							data : params,
							success : function(res) {
								leadDrawList(res.leadList);
								drawlPaging(res.pb);
							},
							error : function(req) {
								console.log(req.responseText);
							}
						});
					}
					
					function leadDrawList(leadList) {
						var html = "";
						
						for(var data of leadList){
							
							html +=	"<div class=\"popup_box_in\">";
							html +=	"<div class=\"popup_lead_box\">";
							html += "<input type=\"hidden\" id=\"lnm\" value=\"" + data.LEAD_NUM + "\" />";
							html += "<input type=\"hidden\" id=\"lna\" value=\"" + data.LEAD_NAME + "\" />";
							html += "<input type=\"hidden\" id=\"ccnm\" value=\"" + data.CLNT_CMPNY_NAME + "\" />";
							html += "<input type=\"hidden\" id=\"clnm\" value=\"" + data.CLNT_NAME + "\" />";
							html +=	"<span class=\"boldname\">리드명 : " + data.LEAD_NAME + "</span><span class=\"prgrs\">진행단계 :" +  data.PRGRS_STS_NUM + "</span><br/>"; 
							html += "<span class=\"boldname\">고객사 / 고객 : " + data.CLNT_CMPNY_NAME + " / " + data.CLNT_NAME  + "</span><br/>";
							html += "<span class=\"boldname\">담당자 : " + data.EMP_NAME + "</span><span class=\"boldname\">등록일 : " + data.RGSTRTN_DATE + "</span>"
							html +=	"</div>";
							html +=	"</div>";
						}
						
						$("#leadBox").html(html);
					}
					function drawlPaging(pb) { 
						var html = "";
						
						html += "<div lpage=\"1\" class=\"page_btn page_first\">first</div>";
						if($("#lpage").val() == "1") {
							html += "<div lpage=\"1\" class=\"page_btn page_prev\">prev</div>";
						} else {
							html += "<div lpage=\"" + ($("#lpage").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
						}
						
						for(var i = pb.startPcount; i <= pb.endPcount; i++) {
							if($("#lpage").val() == i) {
								html += "<div lpage=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
							} else {
								html += "<div lpage=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
							}
						}
						
						if($("#lpage").val() == pb.maxPcount) {
							html += "<div lpage=\"" + pb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
						} else {
							html += "<div lpage=\"" + ($("#lpage").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
						}
						html += "<div lpage=\"" + pb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
						
						$(".pgn_area").html(html);
					}
					/* 리드 팝업 끝 */
					
					
					/* 영업관리 팝업 */
					 $("#salesPop").on("click", function() {
						 var html = "";
							
						 	html += "<div class=\"popup_title_mid\">"; 
						 	html += 	"<form id=\"popupSalesForm\">";
						 	html += 		"<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
							html += 		"<div class=\"ptm_left\">";
							html += 			"<div class=\"ptm_left_top\">팀분류</div>";
							html +=				"<div class=\"ptm_left_bot\">담당자</div>";		
							html += 		"</div>";
							html += 		"<div class=\"ptm_mid\">";
							html +=				"<div class=\"ptm_mid_top\">";
							html +=					"<select class=\"sel_size\" id=\"deptS\" name=\"deptS\">"
							html +=						"<option value=\"6\">영업부</option>";
							html +=						"<option value=\"7\">영업1팀</option>";
							html +=						"<option value=\"8\">영업2팀</option>";
							html +=					"</select>";
							html +=				"</div>";		
							html +=				"<div class=\"ptm_mid_bot\">";
							html +=					"<select class=\"sel_size\" id=\"empS\" name=\"empS\">";
							html +=						"<option value=\"0\">사원번호</option>";
							html +=						"<option value=\"1\">사원명</option>";
							html +=					"</select>";
							html +=				"</div>";	
							html += 		"</div>";
							html += 		"<div class=\"ptm_mid_right\">";
							html +=				"<div class=\"ptm_mid_right_top\"></div>";
							html +=				"<div class=\"ptm_mid_right_bot\">";
							html +=					"<input type=\"text\" id=\"searchTxt\" name=\"searchTxt\" placeholder=\"검색어를 입력해주세요\" class=\"text_size\" />";
							html +=				"</div>";
							html += 		"</div>";
							html += 		"<div class=\"ptm_right\">";
							html +=				"<div class=\"ptm_right_top\"></div>";
							html +=				"<div class=\"ptm_right_bot\">";
							html +=					"<div class=\"cmn_btn\" id=\"salesBtn\">검색</div>";
							html +=				"</div>";
							html +=			"</div>";
							html += 	"</form>";
							html += "</div>";
							html += "<div class=\"popup_cont pc_back\">";
							html +=		"<div class=\"popup_box\" id=\"salesBox\"></div>";
							html += 	"<div class=\"board_bottom2\">";
							html +=			"<div class=\"pgn_area\"></div>";
							html +=		"</div>"; 
							html +=	"</div>";
							
							makePopup({
								depth : 2,
								bg : true,
								bgClose : false,
								title : "영업 조회",
								contents : html,
								contentsEvent : function() {
									$("#popup2").draggable();
									
									salesList();
									//페이징 
									$(".pgn_area").on("click", "div", function() {
										$("#page").val($(this).attr("page"));
										
										salesList();
									});
									// 검색버튼
									$("#salesBtn").on("click", function () {
										$("#page").val("1");
										
										salesList();
										
									});
									
									$("#searchTxt").on("keypress", function(event) {
										if(event.keyCode == 13 ) {
											$("#page").val("1");
											
											salesList();
											return false;
										}
									});
									
									$("#salesBox").on("click", ".popup_sales_box ", function() {
										//변수에 값 넣어줌
										var snm = $(this).children("#snm").val();
										var sna = $(this).children("#sna").val();
										var ccnm = $(this).children("#ccnm").val();
										var clnm = $(this).children("#clnm").val();
										
										// 본문에 해당하는 아이디에 값 넣어줌
										document.getElementById("sNum").value = snm;
										document.getElementById("sName").value = sna;
										document.getElementById("ccName").value = ccnm;
										document.getElementById("clName").value = clnm;
										closePopup();
									});
								},
								width : 600,
								height : 500,
								buttons : {
									name : "취소",
									func: function () {
										closePopup(2);
									}
								}
							});
						}); 
						/* 영업 조회 팝업 목록 함수 */
						function salesList() {
							var params = $("#popupSalesForm").serialize();
							
							$.ajax({
								type : "post",
								url : "salesPopAjax",
								dataType : "json",
								data : params,
								success : function(res) {
									salesDrawList(res.salesList);
									drawPaging(res.salesPb);
								},
								error : function(req) {
									console.log(req.responseText);
								}
							});
						}
						
						function salesDrawList(salesList) {
							var html = "";
							
							for(var data of salesList){
								
								html +=	"<div class=\"popup_box_in\">";
								html +=	"<div class=\"popup_sales_box\">";
								html += "<input type=\"hidden\" id=\"snm\" value=\"" + data.SALES_NUM + "\" />";
								html += "<input type=\"hidden\" id=\"sna\" value=\"" + data.LEAD_NAME + "\" />";
								html += "<input type=\"hidden\" id=\"ccnm\" value=\"" + data.CLNT_CMPNY_NAME + "\" />";
								html += "<input type=\"hidden\" id=\"clnm\" value=\"" + data.CLNT_NAME + "\" />";
								html +=	"<span class=\"boldname\">영업 : " + data.LEAD_NAME + "</span><span class=\"boldname\">담당자 : " + data.EMP_NAME + "</span><span class=\"prgrs\">진행단계 :" +  data.PRGRS_STS + "</span><br/>"; 
								html += "<span class=\"boldname\">고객사 : " + data.CLNT_CMPNY_NAME + "</span>";
								html +=	"</div>";
								html +=	"</div>";
							}
							
							$("#salesBox").html(html);
						}
						function drawPaging(salesPb) { 
							var html = "";
							
							html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
							if($("#page").val() == "1") {
								html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
							} else {
								html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
							}
							
							for(var i = salesPb.startPcount; i <= salesPb.endPcount; i++) {
								if($("#page").val() == i) {
									html += "<div page=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
								} else {
									html += "<div page=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
								}
							}
							
							if($("#page").val() == salesPb.maxPcount) {
								html += "<div page=\"" + salesPb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
							} else {
								html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
							}
							html += "<div page=\"" + salesPb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
							
							$(".pgn_area").html(html);
						}
						
						/* 영업 관리 팝업 끝 */
			},
			width : 600,
			height : 600,
			buttons : [{
				name : "등록",
				func : function() {
						if(checkEmpty("#ssname")){
							makeAlert("필수입력", "일정명을 입력하세요");
							$("#ssname").focus();
						} else if($("#ssactvtyclsfy").val() == 9){
							makeAlert("필수입력", "활동분류를 입력하세요");
							$("#ssactvtyclsfy").focus();
						} else if(checkEmpty("#sdt")){
							makeAlert("필수입력", "시작일을 입력하세요");
							$("#sdt").focus();
						} else if(checkEmpty("#ssactvtycont")){
							makeAlert("필수입력", "활동내용을 입력하세요");
							$("#ssactvtycont").focus();
						} else {					
								var RegForm = $("#RegForm");
										
								RegForm.ajaxForm({
								success: function(res) {
										if(res.fileName.length > 0) {
											$("#schdlAttFile").val(res.fileName[0]);
										}
										
										var params = $("#RegForm").serialize();
												
										$.ajax({
										type  : "post",
										url : "salesSchdlAction/insert",
										dataType : "json",
										data : params,
										success : function(res) {
											if(res.res == "success"){
												reloadSCList();								
											} else {
													alert("등록중 문제가 발생하였습니다.");
													}
											},
											error : function(request, status, error) {
												console.log(request.responseTxt);
											}
										});
									},
								error : function(req) {
										console.log(req.responseTxt);
								}
							});
								
							RegForm.submit();
							closePopup(1);
							reloadSCList();
							} //if else문 end
						}
					}, {
						name : "취소"
					}]// button 함수 end
										
				});
		});	
	});  //Jquery 

/* 의견 영역 */
function reloadOpList() {
	var params = $("#botOpActionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "llopBotListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawOpCnt(res.opListCnt);
			drawOpList(res.list);
		},
		error : function(request){
			console.log(request.responseText);
		}
	});
}

function drawOpCnt(opListCnt){
	var html = "";
	
	html = "<h3>의견(" + opListCnt + ")</h3>";
	
	$(".op_title").html(html);
}

function drawOpList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<div class=\"OpinionBox\">";
		html += "<div class=\"name\">" + data.EMP_NAME + "(" + data.DEPT_NAME + " / " + data.RANK_NAME + ")" + "</div>";
		html += "<div class=\"txtOp\">" + data.CONT + "</div>";
		html += "<div class=\"dt\">" + data.RGSTRTN_DATE + "</div>";
		html += "<div class=\"del\">삭제";
		html += "<input type=\"hidden\" id=\"cmntNum\" name=\"cmntNum\" value=\"" + data.CMNT_NUM + "\" />";
		html += "</div>";
		html += "</div>";
	}
	
	$(".opbx").html(html);
	
}

/* 의견 영역 종료 */
 
/* 예정된 일정 영역 */
function reloadSCList(){
	var params = $("#botSchdlActionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "shdlBotListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawScCnt(res.scListCnt);
			drawScList(res.list);
		},
		error : function(request) {
			console.log(request.responseText);
		}
	});
}

function drawScCnt(scListCnt) {
	var html = "";
	
	html = "<h3>예정된 일정(" + scListCnt + ")</h3><div id=\"scListCnt_right\"><div class=\"drop_btn_bot\"></div><div class=\"plus_btn_bot\"></div>";
	
	$(".schdl_title").html(html);
}

function drawScList(list) {
	var html = "";
	
	for(var data of list){
		html += "<div class=\"OpinionBox\">";
		html += "<div class=\"schdl_box_in\"><span class=\"boldname\">일정명   " + data.SCHDL_NAME + "</span><br/>기간   " + data.START_DATE_HR +  " ~ " + data.END_DATE_HR + "<br/>담당자   " + data.EMP_NAME + "</div>";
		html += "</div>";
	}
	
	$(".sbx").html(html);
}
function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#fileName").val(filename);
	$("#popFileName").val(filename);
}
</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="page" value="${param.page}" />	
	<input type="hidden" name="leadNum" value="${param.leadNum}" />	
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="searchDate" value="${param.searchDate}" />
	<input type="hidden" name="searchDate2" value="${param.searchDate2}" />
	<input type="hidden" name="srchType" value="${param.srchType}" />
	<input type="hidden" name="psNum" value="${param.psNum}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
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
			<div class="page_title_text">리드 상세보기</div>
			<!-- 검색영역 선택적 사항 -->
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />			
			<img alt="수정버튼" src="resources/images/sales/pencil.png" class="btnImg" />
			<img alt="삭제버튼" src="resources/images/sales/garbage.png" class="btnImg" />
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
								<td><input type="button" class="btn" value="리드명 *" readonly="readonly"/></td>
								<td><input type="text" class="txt" value="${data.LEAD_NAME}" readonly="readonly" /></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객명 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" value="${data.CLNT_NAME}" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객사 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" value="${data.CLNT_CMPNY_NAME}" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객사 등급" readonly="readonly"/></td>
								<td>
									<select class="txt_in" id="ccGrade" name="ccGrade" disabled="disabled">
										<optgroup>
											<option value="0">S</option>										
											<option value="1">A</option>										
											<option value="2">B</option>										
											<option value="3">C</option>										
											<option value="4">D</option>										
										</optgroup>
									</select>
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="인지경로 *" readonly="readonly"/></td>
								<td>
									<select class="txt_in" id="rp" name="rp" disabled="disabled" >
										<optgroup>
											<option value="0">자사홈페이지</option>										
											<option value="1">인터넷검색</option>										
											<option value="2">지인소개</option>										
											<option value="3">세미나</option>										
											<option value="4">전화</option>										
											<option value="5">기타</option>										
										</optgroup>
									</select>
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="담당자 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" value="${data.EMP_NAME}" readonly="readonly"  />
									<img class="btnImg_in" alt="담당자아이콘" src="resources/images/sales/usericon.png" />
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="진행상태 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" value="${data.PSNUM}" readonly="readonly"  />
								</td>
							</tr>
							
						</tbody>
					</table>
					<!-- 첨부파일 -->
					<c:set var="fileLength" value="${fn:length(data.ATT_FILE_NAME)}"></c:set>
					<c:set var="fileName" value="${fn:substring(data.ATT_FILE_NAME, 20, fileLength)}"></c:set>
					<div class="rvn_txt">
						첨부파일
					</div>
					<div class="cntrct_box_in">
						<a href="resources/upload/${data.ATT_FILE_NAME}"  download="${fileName}">${fileName}</a>
					</div>
					<!-- 의견 -->
					<form action="#" id="botOpActionForm" method="post">
						<input type="hidden" name="leadNum" value="${param.leadNum}" />	
						<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
						<input type="hidden" id="cmntNum" name="cmntNum" />
						<div class="mgtop"></div>
						<div class="op_title"></div>
						<hr color="#F2B705" width="925px">
						<div class="opbx"></div>
						<div class="opBox">
							<textarea id="tatacont" name="tacont"></textarea>
							<div class="cmn_btn subm">등록</div>
						</div>
					</form>
					<!-- 히스토리 -->
					<div class="mgtop"></div>
					<div class="bot_title"><h3>히스토리(5)<div class="drop_btn"></div></h3></div>
					<hr color="#F2B705" width="925px">
					<div class="bx">
							<div class="OpinionBox">
								<div class="name">영업기회 (21/12/27 17:01:00)</div>
								<div class="txtOp">내용: 등록된 영업기회 표시</div>
								<div class="txtOp">담당자:000</div>
							</div>
							<div class="OpinionBox">
								<div class="name">계약 (21/12/27 17:01:00)</div>
								<div class="txtOp">내용: 계약 외 추가된 내용 기록</div>
								<div class="txtOp">담당자:000</div>
							</div>
							<div class="OpinionBox">
								<div class="name">계약 (21/12/27 17:01:00)</div>
								<div class="txtOp">내용: 계약 외 추가된 내용 기록</div>
								<div class="txtOp">담당자:000</div>
							</div>
							<div class="OpinionBox">
								<div class="name">계약 (21/12/27 17:01:00)</div>
								<div class="txtOp">내용: 계약 외 추가된 내용 기록</div>
								<div class="txtOp">담당자:000</div>
							</div>
							<div class="OpinionBox">
								<div class="name">계약 (21/12/27 17:01:00)</div>
								<div class="txtOp">내용: 계약 외 추가된 내용 기록</div>
								<div class="txtOp">담당자:000</div>
							</div>
					</div>
					<!-- 예정된 일정 -->
					<form action="#" id="botSchdlActionForm" method="post">
						<input type="hidden" name="leadNum" value="${param.leadNum}" />
						<div class="mgtop"></div>
						<div class="schdl_title"></div>
						<hr color="#F2B705" width="925px">
						<div class="sbx"></div>
					</form>
					<!-- 끝 -->
				</div>
			</div>	
		</div>
	</div>
<!-- bottom -->
<c:import url="/bottom"></c:import>
</body>
</html>