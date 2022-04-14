<!-- 
	계약 상세보기 : sales4CntrctCont
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계약 상세보기</title>
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

/* 개인 작업 영역 */
table{	
	border: 1px;
	width: 927px;
	margin: 40px auto;
}
td:nth-child(2), td:nth-child(4){
	border-bottom: 1px solid #d7d7d7;
}
tr:nth-child(9) td:nth-child(3){
	padding : 0;
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
.rmks{
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
	background-color: #F2F2F2;
}

.imgPos{
	text-align: right;
}
.title_name {
	font-size: 15px;
	font-weight: bold;
	border-bottom: 3px solid #2E83F2;
	padding-bottom: 10px;
	margin-top: 100px;
	margin-bottom: 30px;
}
.box_in {
	width: 885px;
	height: 80px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
	background-color: #F2F2F2;
	
}

.drop_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
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
.drop_btn:hover, .up_btn:hover {
	cursor: pointer;
}
.rmks{
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
	background-color: #F2F2F2;
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
.qBox {
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}
.bx2 { /* 스크롤때문에 div 박스 추가 */
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
.drop_btn:hover {
	cursor: pointer;
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
/* 영업관리 속성들 */
.page_cont_title_text {
	display: inline-block;
	vertical-align: top;
	width: 400px;
	height: 30px;
	line-height: 30px;
	color: #2E83F2;
	font-size: 12pt;
	font-weight: bold;
	text-shadow: 0px 0 1px #7b7b7b;
	margin: 5px 40px;
}
.hr_width {
	width: 900px;
	margin: 10px 40px;
	border: none;
	height: 0.2px;
	background-color: #333;
	opacity: 0.5;
}
.adc_txt {
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
	margin-left: 45px;
	margin-bottom: 5px;
	vertical-align: middle;
}
.spc{
	margin-bottom : 30px;
}
/* 첨부자료 */
.cntrct_box_in {
	width: 885px;
	height: 100px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 45px;
	font-size: 10pt;
}

[href] {
	color: black;
	text-decoration: none;
}

.btnImg_in{
	display: inline-block;
	vertical-align: middle;
	width: 25px;
	height: 25px;
	float: right;
	margin-right: 5px;
}
.mdhr {
   margin-bottom: 10px;
   float: right;
} 
.drop_btn2 {
   display:inline-block;
   vertical-align: middle;
   width: 15px;
   height: 15px;
   background-image: url("resources/images/sales/downarrow.png");
   background-size: 15px 15px;
   float: right;
   margin-top: 15px;
   margin-right: 5px;
}

/* 영업 종료 */
.salesOver_btn {
   display: inline-block;
   vertical-align: top;
   padding: 0px 10px;
   min-width: 30px;
   height: 30px;
   line-height: 30px;
   font-size: 10pt;
   font-weight: bold;
   text-align: center;
   background-color: #d7d7d7;
   border-radius: 2px;
   color: #222222;
   cursor: pointer;
}
.salesOver_btn:active {
   background-color: #E1E1E1;
}
.hr_bot {
	margin-bottom: 20px;
}
.mng_txt{
	width: 680px; 
}

[href] {
	color: black;
	text-decoration: none;
}
.op_title { 
	font-size: 11pt;
}
.opbx {
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}
.salesCont {
	width: 927px;
	height: 1138px;
}
.plus_btn {
	display: inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 5px;
    margin-top: 5.5px;
}

/* 끝 */
.PQ_title {
	position: relative;
	font-size: 11pt;
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
.drop_btn_bot:hover {
	cursor: pointer;
}
.qtnBox {
    width: 830px;
    height: 60px;
    font-size: 10pt;
    border: 1px solid gray;
    border-top-left-radius: 12px;
    border-top-right-radius: 12px;
    border-bottom-left-radius: 12px;
    border-bottom-right-radius: 12px;
    margin: 5px;
    background-color: #F2F2F2;
}
pre {
	font-family: "맑은 고딕";
    margin-top: 3px;
}
.qtnDiv {
	width: 100%;
	height: 100%;
}
.popup_cont2 {
	/* 내용 변경용 */
	font-size: 13pt;
	font-weight: 600;
	text-align: center;
	line-height: 100px;
}
/* ******** 예정된 일정 ******** */
.schdl_title {
	position: relative;
	font-size: 11pt;
}
.sBox {
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
.up_btn_bot {
	position: absolute;
	top: 7px;
	left: 909px;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/up_arrow.png");
	background-size: 18px 18px;
	float: right;
}
.drop_btn_bot:hover, .up_btn_bot:hover {
	cursor: pointer;
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
	padding-right: 27px;
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
	font-size: 10pt;
}
#attFileName {
	font-size: 10pt;
}
#att{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function() {

	console.log(${param.salesNum});
	console.log(${param.qtnNum});
	
	
	// 목록 버튼
	$("#listBtn").on("click", function() {
		
		$("#actionForm").attr("action", "salesList");
		$("#actionForm").submit();
	});
	
	
	// 수정 버튼
	$("#updateBtn").on("click", function() {
		
		$("#actionForm").attr("action", "sales4Update");
		$("#actionForm").submit();
	});
	
	//
	
	// 영업 종료하기 버튼
	$(".salesOver_btn").on("click", function() {
		// 수정이랑 같음, 상태를 종료로 변경, ajax로 failure로 보내기
		
		var html = "";
		
		html += "<div class=\"popup_cont2\">영업을 종료하시겠습니까?</div>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "영업 종료하기",
			contents : html,
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "확인",
				func:function() {
					/* 여기에 넣기 */
					var params = $("#updateForm").serialize();
					
					$.ajax({
						type : "post",
						url : "salesMng4ActionAjax/failure",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
								$("#updateForm").attr("action", "salesList");
								$("#updateForm").submit();
							} else {
								alert("영업 종료중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) { // 문제 발생 시 실행 함수
							console.log(request.responseText); // 결과텍스트
						}
					});
					
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	
	// 선택박스 초기값
	$("#loanCauseNum").val(${data.LOAN_CAUSE_NUM}).prop("selected", true);
	$("#loanHopeType").val(${data.LOAN_HOPE_TYPE}).prop("selected", true);
	$("#loanHopeTime").val(${data.LOAN_HOPE_TIME}).prop("selected", true);
	$("#expctdBsnsType").val(${data.EXPCTD_BSNS_TYPE}).prop("selected", true);
	
	$("#sgstnloanCauseNum").val(${data2.SGSTN_LOAN_CAUSE_NUM}).prop("selected", true);
	$("#sgstnloanType").val(${data2.SGSTN_LOAN_TYPE}).prop("selected", true);
	
	$("#mdType").val(${data3.MD_TYPE_NUM}).prop("selected", true);
	$("#prdmptn_psbl_check").val(${data3.MID_RDMPTN_PSBL_CHECK}).prop("selected", true);
	$("#srtx").val(${data3.SRTX}).prop("selected", true);
	$("#prncpl_pymnt").val(${data3.PRNCPL_PYMNT_MTHD_NUM}).prop("selected", true);
	$("#loanPrd").val(${data3.LOAN_PRD}).prop("selected", true);
	
	$("#dbNum").val(${data4.DPST_BANK_NUM}).prop("selected", true);
		
	
	
	
	
	/* 의견 목록 */
	reloadOpList();
	
	
	/* 의견 등록 버튼 클릭시 */
	$(".subm").on("click", function() {
		
		if(checkEmpty("#tatacont")) {
			var html = "";
			
			html += "<div class=\"popup_cont2\">의견 내용 입력 후, 등록버튼을 눌러주세요.</div>";
			
			makePopup({
				depth : 1,
				bg : true,
				width : 400,
				height : 200,
				title : "알림",
				contents : html,
				buttons : {
					name : "확인",
					func:function() {
						console.log("One!");
						closePopup();
					}
				}
			});
			("#tatacont").focus();
		} else {
			
			var params = $("#botOpActionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "cntrctBotActionAjax/insert",
				dataType : "json",
				data : params,
				success : function(res) {
					if(res.res == "success") {
						$("#tatacont").val("");
						reloadOpList();
					} else {
						alert("등록중 문제가 발생하였습니다.");
					}
				},
				error : function(request, status, error) {
					console.log(request.responseText);
				}
			});
		}
	});
	
	
	/* 의견 삭제 버튼 클릭시 */
	$(".opbx").on("click", ".del", function() {
		var cmntNum = $(this).children("#cmntNum").val();
		document.getElementById("cmntNum").value = cmntNum;

		var html = "";
		
		html += "<div class=\"popup_cont2\">삭제하시겠습니까?</div>";
		
		makePopup({
			bg : false,
			bgClose : false,
			title : "경고",
			contents : html,
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "확인",
				func:function() {
					console.log($("#cmntNum").val());
					var params = $("#botOpActionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "cntrctBotActionAjax/update",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
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
				name : "취소"
			}]
		});
		
	});
	$(".salesCont").hide();
	$(".sgstnCont").hide();
	$(".qtnCont").hide();
	
	// 영업기회 탭 접기펼치기
	$("#sales_btn").on("click", "#salesContBtn_h", function() {
		$(".salesCont").hide();
		html = "<div class=\"up_btn\" id=\"salesContBtn_s\"></div>";
		$("#sales_btn").html(html);
	});
	
	$("#sales_btn").on("click", "#salesContBtn_s", function() {
		$(".salesCont").show();
		html = "<div class=\"drop_btn\" id=\"salesContBtn_h\"></div>";
		$("#sales_btn").html(html);
	});
	
	// 제안 탭 접기펼치기
	$("#sgstn_btn").on("click", "#sgstnContBtn_h", function() {
		$(".sgstnCont").hide();
		html = "<div class=\"up_btn\" id=\"sgstnContBtn_s\"></div>";
		$("#sgstn_btn").html(html);
	});
	
	$("#sgstn_btn").on("click", "#sgstnContBtn_s", function() {
		$(".sgstnCont").show();
		html = "<div class=\"drop_btn\" id=\"sgstnContBtn_h\"></div>";
		$("#sgstn_btn").html(html);
	});
	
	// 견적 탭 접기펼치기
	$("#qtn_btn").on("click", "#qtnContBtn_h", function() {
		$(".qtnCont").hide();
		html = "<div class=\"up_btn\" id=\"qtnContBtn_s\"></div>";
		$("#qtn_btn").html(html);
	});
	$("#qtn_btn").on("click", "#qtnContBtn_s", function() {
		$(".qtnCont").show();
		html = "<div class=\"drop_btn\" id=\"qtnContBtn_h\"></div>";
		$("#qtn_btn").html(html);
	});
	
	$(".qtnDiv").hide();
	
	/* ***** 예정된 일정 접기 펼치기 ***** */
	$(".schdl_title").on("click", ".drop_btn_bot", function() {
		$(".sBox").hide();
		html = "<div class=\"up_btn_bot\"></div>";
		$("#scListCnt_right").html(html);
	});
	
	$(".schdl_title").on("click", ".up_btn_bot", function() {
		$(".sBox").show();
		html = "<div class=\"drop_btn_bot\"></div><div class=\"plus_btn_bot\"></div>";
		$("#scListCnt_right").html(html);
	});
	
	
	// 예정된 일정 실행
	reloadSScList();	

	/* 예정된 일정 등록 팝업 */
	$(".schdl_title").on("click", ".plus_btn_bot", function() {
		
		var html = "";
		
		html += "<form action=\"fileUploadAjax\" id=\"RegForm\" method=\"post\" enctype=\"multipart/form-data\">";
		html += "<input type=\"hidden\" name=\"sEmpNum\" value=\"${sEmpNum}\" />";
		html += "<table class=\"popup_table\">";
		html += "	<tbody>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"일정명 *\" readonly=\"readonly\" /></td>";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"ssname\" name=\"ssname\"/></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"영업\" readonly=\"readonly\" /></td>";
		html += "			<td>";
		html += "				<div class=\"imgP\">";
		html += "					<input type=\"text\" class=\"pop_txt imgName\" id=\"lName\" name=\"lName\" value=\"${data.LEAD_NAME}\" readonly=\"readonly\" />";
		html += "					<input type=\"hidden\" id=\"SSNum\" name=\"sNum\" value=\"${param.salesNum}\" />";
		html += "				</div>";
		html += "			</td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객명\" readonly=\"readonly\" /></td>";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"clName\" name=\"clName\" value=\"${data.CLNT_NAME}\" readonly=\"readonly\" /></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객사\" readonly=\"readonly\" /></td>";
		html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"ccName\" name=\"ccName\"  value=\"${data.CLNT_CMPNY_NAME}\" readonly=\"readonly\" /></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"활동분류 *\" readonly=\"readonly\" /></td>";
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
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"날짜 *\" readonly=\"readonly\" /></td>";
		html += "			<td><input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"sdt\" name=\"sdt\" />";
		html += "				<div class=\"wave\">" + " ~ "  + "</div>";
		html += "			<input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"edt\" name=\"edt\" /></td>";
		html += "		</tr>";
		html += "		<tr height=\"10\">                                                                                                          ";
		html += "			<td><input type=\"button\" class=\"popBtn\" value=\"활동내용 *\" readonly=\"readonly\" /></td>";
		html += "			<td style=\"border-bottom: none\"><textarea class=\"ta_box\" id=\"ssactvtycont\" name=\"ssactvtycont\"></textarea></td>";
		html += "		</tr>";
		html += "	</tbody>";
		html += "</table>";				
		html += "<div class=\"pop_rvn_txt\"> 첨부파일  ";
		html += "	<img class=\"plus_btn aff_btn\"  src=\"resources/images/sales/plus.png\" />"; 
		html += "</div>";
		html += "<div class=\"pop_cntrct_box_in\">";
		html += "	<input type=\"text\" id=\"popFileName\" name=\"fileName\" readonly=\"readonly\">";
		html += "</div>";
		html += "<input type=\"file\" id=\"att\" name=\"att\" onchange=\"uploadName(this)\" />";
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
			},
			width : 600,
			height : 520,
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
								
								console.log(${sEmpNum});
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
												reloadSScList();								
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

	/* 예정된 일정 수정 팝업 */
	$(".sBox").on("click", ".sch_re", function() {
		var slNum = $(this).children("#schdlListNumber").val();
		var sNum = $(this).children("#salesListNumber").val();
		document.getElementById("schdlNumber").value = slNum;
		document.getElementById("salesNumber").value = sNum;
		
		var params = $("#ssForm").serialize();
		
		$.ajax({
			type : "post",
			url : "SSchdlAjax",
			dataType : "json",
			data : params,
			success : function(SSData) {
				var html = "";
				
				$.each(SSData, function(index, data) {
					
					html += "<form action=\"fileUploadAjax\" id=\"RegForm\" method=\"post\" enctype=\"multipart/form-data\">";
					html += "<input type=\"hidden\" name=\"sEmpNum\" value=\"${sEmpNum}\" />";
					html += "<table class=\"popup_table\">";
					html += "	<tbody>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"일정명 *\" readonly=\"readonly\"/></td>";
					html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"ssname\" name=\"ssname\" value=\"" + data.SCHDL_NAME + "\"/></td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"영업\" readonly=\"readonly\"/></td>";
					html += "			<td>";
					html += "				<div class=\"imgP\">";
					html += "					<input type=\"text\" class=\"pop_txt imgName\" id=\"lName\" name=\"lName\" value=\"" + data.SALES_NAME + "\" readonly=\"readonly\" />";
					html += "					<input type=\"hidden\" id=\"SSNum\" name=\"sNum\" value=\"${param.salesNum}\" />";
					html += "				</div>";
					html += "			</td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객명\" readonly=\"readonly\"/></td>";
					html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"clName\" name=\"clName\" value=\"" + data.SALES_CLNT_NAME + "\" readonly=\"readonly\" /></td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"고객사\" readonly=\"readonly\"/></td>";
					html += "			<td><input type=\"text\" class=\"pop_txt\" id=\"ccName\" name=\"ccName\"  value=\"" + data.SALES_CLNT_CMPNY_NAME + "\" readonly=\"readonly\" /></td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"활동분류 *\" readonly=\"readonly\"/></td>";
					html += "			<td><select class=\"pop_txt_in\" id=\"ssactvtyclsfy\" name=\"ssactvtyclsfy\" >";
					html += "					<optgroup>";
					html += "						<option value=\"9\">선택하세요</option>";
					if(data.ACTVTY_CLSFY_NUM == 0) {
						html += "						<option value=\"0\" selected=\"selected\">전화</option>";
						html += "						<option value=\"1\">메일</option>";
						html += "						<option value=\"2\">방문</option>";
						html += "						<option value=\"3\">기타</option>";
					} else if (data.ACTVTY_CLSFY_NUM == 1) {
						html += "						<option value=\"0\">전화</option>";
						html += "						<option value=\"1\" selected=\"selected\">메일</option>";
						html += "						<option value=\"2\">방문</option>";
						html += "						<option value=\"3\">기타</option>";
					} else if (data.ACTVTY_CLSFY_NUM == 2) {
						html += "						<option value=\"0\">전화</option>";
						html += "						<option value=\"1\">메일</option>";
						html += "						<option value=\"2\" selected=\"selected\">방문</option>";
						html += "						<option value=\"3\">기타</option>";
					} else if (data.ACTVTY_CLSFY_NUM == 3) {
						html += "						<option value=\"0\">전화</option>";
						html += "						<option value=\"1\">메일</option>";
						html += "						<option value=\"2\">방문</option>";
						html += "						<option value=\"3\" selected=\"selected\">기타</option>";
					}
					html += "					</optgroup>";
					html += "			</select></td>";
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"날짜 *\" readonly=\"readonly\"/></td>";
					html += "			<td><input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"sdt\" name=\"sdt\" value=\"" + data.START_DATE_HR + "\"/>";
					html += "				<div class=\"wave\">" + " ~ "  + "</div>";
					if(data.END_DATE_HR == null) {
						html += "			<input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"edt\" name=\"edt\" /></td>";
					} else {
						html += "			<input type=\"datetime-local\" class=\"pop_dt_txt\" id=\"edt\" name=\"edt\" value=\"" + data.END_DATE_HR + "\"/></td>";
					}
					html += "		</tr>";
					html += "		<tr height=\"10\">                                                                                                          ";
					html += "			<td><input type=\"button\" class=\"popBtn\" value=\"활동내용 *\" readonly=\"readonly\"/></td>";
					html += "			<td style=\"border-bottom: none\"><textarea class=\"ta_box\" id=\"ssactvtycont\" name=\"ssactvtycont\">" + data.ACTVTY_CONT + "</textarea></td>";
					html += "		</tr>";
					html += "	</tbody>";
					html += "</table>";
					if(data.ATT_FILE_NAME != null) {
						var fileLength = data.ATT_FILE_NAME.length;
						var fileName = data.ATT_FILE_NAME.substring(20, fileLength);
					}
					html += "<div class=\"pop_rvn_txt\"> 첨부파일";
					html += "<span id=\"uploadBtn\">";
					if(data.ATT_FILE_NAME == null) {
						html += "	<img class=\"plus_btn aff_btn\" src=\"resources/images/sales/plus.png\" />";
					}
					html += "</span>";
					html += "</div>";
					html += "<div class=\"pop_cntrct_box_in\">";
					if(data.ATT_FILE_NAME != null) {
						html += "<a href=\"resources/upload/" + data.ATT_FILE_NAME + "\" download=\"" + fileName + "\"><span id=\"file_name\">" + fileName + "</span></a>";
						html += "	<input type=\"button\" id=\"fileDelete\" value=\"삭제\" />";
					}
					html += "	<input type=\"text\" id=\"popFileName\" readonly=\"readonly\" />                 ";
					html += "	<input type=\"file\" id=\"att\" name=\"att\" onchange=\"uploadName(this)\" />   ";
					html += "	<input type=\"hidden\" id=\"schdlAttFile\" name=\"schdlAttFile\" />           ";
					html += "	<input type=\"hidden\" id=\"schdlnum\" name=\"schdlnum\" />           ";
					html += "</div>                                                                     ";
					html += "</form>";
				}); // each end
				
			makePopup({
				depth : 1,
				bg : false,
				bgClose : false,
				title : "예정된 일정 수정",
				contents : html,
				contentsEvent : function() {
					
					$("#fileDelete").on("click", function() {
						$("#file_name").remove();
						$(this).remove();
						
						var html = "";
						
						html += "<img class=\"plus_btn aff_btn\" src=\"resources/images/sales/plus.png\" />";
						
						$("#uploadBtn").html(html);
					});
					
					function uploadName(e) {
						var files = e.files;
						var filename = files[0].name;
						$("#fileName").val(filename);
					}
					
					$(".pop_rvn_txt").on("click", ".aff_btn", function() {
						$("#att").click();
					});
					
					document.getElementById("schdlnum").value = slNum;
				},
				width : 600,
				height : 520,
				buttons : [{
					name : "수정",
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
									
									console.log(${sEmpNum});
									var RegForm = $("#RegForm");
											
									RegForm.ajaxForm({
									success: function(res) {
											if(res.fileName.length > 0) {
												$("#schdlAttFile").val(res.fileName[0]);
											}
											
											var params = $("#RegForm").serialize();
													
											$.ajax({
											type  : "post",
											url : "salesSchdlAction/update",
											dataType : "json",
											data : params,
											success : function(res) {
												if(res.res == "success"){
													reloadSScList();								
												} else {
														alert("수정중 문제가 발생하였습니다.");
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
			}, // success end
			error : function(request) {
				console.log(request.responseTxt);
			}
		}); // ajax end
		
	});
	
	/* 예정된 일정 삭제 */
	$(".sBox").on("click", ".sch_del", function() {
		var slNum = $(this).children("#schdlListNumber").val();
		console.log(slNum);
		document.getElementById("schdldeletenum").value = slNum;

		var html = "";
		
		html += "<div class=\"popup_cont2\">삭제하시겠습니까?</div>";

		makePopup({
			bg : false,
			bgClose : false,
			title : "경고",
			contents : html,
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			draggable : true,
			width : 400,
			height: 200,
			buttons : [{
				name : "확인",
				func:function() {
					
					var params = $("#SSchdlActionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "salesSchdlAction/delete",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
								reloadSScList();
							} else {
								alert("삭제중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) {
							console.log(request.responseTxt);
						}
					});
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	}); // 일정 삭제 function end
	
	
 	//대출금액
	var loanAmnt = ${data3.LOAN_AMNT};
	//대출기간
	var loanPrd
	if(${data3.LOAN_PRD eq 0}) {
		loanPrd = 6;
	} else if(${data3.LOAN_PRD eq 1}) {
		loanPrd = 12;
	} else if(${data3.LOAN_PRD eq 2}) {
		loanPrd = 36;
	} else if(${data3.LOAN_PRD eq 3}) {
		loanPrd = 60;
	}
	//이자율
	var intrstRate = ${data3.INTRST_RATE} * 0.01;
	//이자율(월)
	var mIntrstRate = (intrstRate / 12);
	
	//월 납부액
	if(${data3.PRNCPL_PYMNT_MTHD_NUM eq 0}) { // 원금 균등 상환
		$("#monthPymntAmnt").val(Math.round(loanAmnt / loanPrd));
		$("#monthIntrstAmnt").val(Math.round(loanAmnt * mIntrstRate));
	}
	if(${data3.PRNCPL_PYMNT_MTHD_NUM eq 1}) { // 원리금 균등 상환
		var temp1 = Math.pow(1 + mIntrstRate, loanPrd) - 1;
		var temp2 = loanAmnt * mIntrstRate * Math.pow(1 + mIntrstRate, loanPrd);
		$("#monthPymntAmnt").val(Math.round(temp2 / temp1));
		$("#monthIntrstAmnt").val(Math.round(loanAmnt * mIntrstRate));
	}
	if(${data3.PRNCPL_PYMNT_MTHD_NUM eq 2}) { // 만기 일시 상환
		if(${data3.INTRST_PYMNT_MTHD_NUM ne 2}) {
			$("#monthPymntAmnt").val("0");
			$("#monthIntrstAmnt").val(Math.round(loanAmnt * mIntrstRate));
		}
	
	}
	
	
}); // document.ready End

/* 의견 목록 Ajax */
function reloadOpList() {
	var params = $("#botOpActionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "cntrctOpBotListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawOpCnt(res.cntrctListCnt);
			drawOpList(res.list);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

/* 의견 목록 개수 html */
function drawOpCnt(cntrctListCnt) {
	var html = "";
	
	html = "<h3>의견(" + cntrctListCnt + ")</h3>";
	
	$(".op_title").html(html);
}

/* 의견 목록 html */
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


/* ******************** 예정된 일정 영역 ******************** */
function reloadSScList(){
	var params = $("#SSchdlActionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "SSchdlListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawSScCnt(res.SScListCnt);
			drawSScList(res.list);
		},
		error : function(request) {
			console.log(request.responseText);
		}
	});
}

function drawSScCnt(SScListCnt) {
	var html = "";
	
	html = "<h3>예정된 일정(" + SScListCnt + ")</h3><div id=\"scListCnt_right\"><div class=\"drop_btn_bot\"></div><div class=\"plus_btn_bot\"></div>";
	
	$(".schdl_title").html(html);
}

function drawSScList(list) {
	var html = "";
	
	for(var data of list){
		html += "<div class=\"OpinionBox\">";
		html += "<div class=\"schdl_box_in\">";
		html += "";
		html += "";
		html +=	"<div class=\"name\">일정명   :" + data.SCHDL_NAME + "</div>";
		html +=	"<div class=\"txtOp\">기간   " + data.START_DATE_HR +  " ~ " + data.END_DATE_HR + "</div>";
		html +=	"<div class=\"txtOp sche\">담당자   :" + data.EMP_NAME + "</div><span class=\"sch_re\" >수정<input type=\"hidden\" id=\"schdlListNumber\" value=\"" + data.SCHDL_NUM + "\" /><input type=\"hidden\" id=\"salesListNumber\" value=\"" + ${param.salesNum} + "\" /></span><span> | </span><span class=\"sch_del\" >삭제<input type=\"hidden\" id=\"schdlListNumber\" value=\"" + data.SCHDL_NUM + "\" /><input type=\"hidden\" id=\"salesListNumber\" value=\"" + ${param.salesNum} + "\" /></span>";
		html += "</div>";
		html += "</div>";
	}
	
	$(".sBox").html(html);
}

function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#popFileName").val(filename);
}


</script>
</head>
<body>
<form action="#" id="ssForm" method="post">
	<input type="hidden" id="schdlNumber" name="schdlNum"  />
	<input type="hidden" id="salesNumber" name="salesNum"  />
</form>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="page" name="page" value="${page}" />
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="salesNum" value="${param.salesNum}" /> <!-- 영업번호 -->
	<input type="hidden" name="cntrctNum" value="${data4.CNTRCT_NUM}" />
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
			<div class="page_title_text">영업관리 - 계약 상세보기</div>
				<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />
				<!-- <img alt="인쇄버튼" src="resources/images/sales/printer.png" class="btnImg" id="printBtn" /> -->
				<img alt="수정버튼" src="resources/images/sales/pencil.png" class="btnImg" id="updateBtn" data-toggle="tooltip" title="계약 수정하기" />
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
				<div class="bodyWrap">
				<!-- 시작 -->
				<form action="#" id="updateForm" method="post">
						<input type="hidden" id="page" name="page" value="${page}" />
						<input type="hidden" name="top" value="${param.top}" />
						<input type="hidden" name="menuNum" value="${param.menuNum}" />
						<input type="hidden" name="menuType" value="${param.menuType}" />
						<input type="text" name="prgrsStsNum" value="${data.PRGRS_STS_NUM}" />
						<input type="text" id="salesNum" name="salesNum" value="${data.SALES_NUM}" />
				
					<div class="bot_title">
						<h3>영업기회<span id="sales_btn"><div class="up_btn" id="salesContBtn_s"></div></span></h3>
					</div>
				<div class="salesCont">
					<div class="page_cont_title_text">기본정보</div>
					<hr class="hr_width">
					<table>
						<colgroup>
							<col width="200" />
							<col width="250" />
							<col width="200" />
							<col width="250" />
						</colgroup>
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="영업명*" /></td>
								<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.LEAD_NAME}" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="고객사"/></td>
									<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.CLNT_CMPNY_NAME}" /></td>								
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="고객" /></td>
									<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.CLNT_NAME}" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="고객사 등급"/></td>
									<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.GRADE_NAME}" /></td>		
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="영업시작일*" /></td>
									<td colspan="3"><input type="date" class="txt" readonly="readonly" value="${data.START_DATE}" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="담당자 *" readonly="readonly"/></td>
								<td colspan="3" value="${data.MNGR_EMP_NUM}">
									<input type="text" class="txt mng_txt" readonly="readonly" value="${data.EMP_NAME}" />
									<img class="btnImg_in" alt="담당자아이콘" src="resources/images/sales/usericon.png" />
								</td>
							</tr>
						</tbody>
					</table>
					<div class="page_cont_title_text">대출 상세정보</div>
					<hr class="hr_width">
					<table>
						<colgroup>
							<col width="200" />
							<col width="250" />
							<col width="200" />
							<col width="250" />
						</colgroup>
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="대출 원인*" /></td>
								<td colspan="3">
									<select class="txt" id="loanCauseNum" name="loanCauseNum" disabled="disabled">
										<option value="0">사업확장</option>
										<option value="1">제품개발</option>
										<option value="2">토지매매</option>
										<option value="3">기타</option>
									</select>
								</td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="예상 대출 규모"/></td>
									<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.EXPCTN_LOAN_SCALE}" /></td>								
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="대출 희망 유형*" /></td>
									<td colspan="3">
										<select class="txt" id="loanHopeType" name="loanHopeType" disabled="disabled">
											<option value="0" selected="selected">장기대출</option>
											<option value="1" selected="selected">단기대출</option>
										</select>
									</td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="대출 희망 시기*"/></td>
									<td colspan="3">
										<select class="txt" id="loanHopeTime" name="loanHopeTime" disabled="disabled">
											<option value="0">근시일 내</option>
											<option value="1">3개월 이후</option>
											<option value="2">6개월 이후</option>
											<option value="3">1년 이후</option>
										</select>
									</td>	
							</tr>
						</tbody>
					</table>
					<div class="page_cont_title_text">예정 사업 상세정보</div>
					<hr class="hr_width">
					<table>
						<colgroup>
							<col width="200" />
							<col width="250" />
							<col width="200" />
							<col width="250" />
						</colgroup>
						<tbody>
							<tr height="40">
									<td><input type="button" class="btn" value="예정 사업명"/></td>
									<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.EXPCTD_BSNS_NAME}" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="예정 사업 형태" /></td>
									<td colspan="3">
										<select class="txt" id="expctdBsnsType" name="expctdBsnsType" disabled="disabled">
											<option value="0">민수 사업</option>
											<option value="1">관공 사업</option>
											<option value="2">기타</option>
										</select>
									</td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="비고" /></td>
									<td colspan="3"><input type="text" class="rmks" readonly="readonly" value="${data.RMKS}" /></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!-- 첨부자료  -->
						<c:set var="salesFileLength" value="${fn:length(data.ATT_FILE_NAME)}"></c:set>
						<c:set var="salesFileName" value="${fn:substring(data.ATT_FILE_NAME, 20, salesFileLength)}"></c:set>
						<div class="spc">
							<div class="adc_txt">
								첨부자료
							</div>
							<div class="cntrct_box_in">
								<a href="resources/upload/${data.ATT_FILE_NAME}" download="${salesFileName}">${salesFileName}</a>
							</div> 
						</div>
				</div>
					
					<!-- *************** 영업기회 끝 **************** -->
					
					<hr class="hr_bot" color="#4B94F2" width="925px">
					<!-- *************** 제안 부분 시작 **************** -->
					
						<div class="bot_title">
							<h3>제안<span id="sgstn_btn"><div class="up_btn" id="sgstnContBtn_s"></div></span></h3>
						</div>
					<div class="sgstnCont">
						<div class="page_cont_title_text">대출 상세정보</div>
						<hr class="hr_width">
						<table class="detailList">
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr>
									<td>
										<input type="button" class="btn" value="대출 원인*"  />
									</td>
									<td colspan="3">
										<select class="txt" id="sgstnloanCauseNum" name="sgstnloanCauseNum" disabled="disabled">
											<option value="0">사업확장</option>
											<option value="1">제품개발</option>
											<option value="2">토지매매</option>
											<option value="3">기타</option>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 규모*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnLoanScale" name="sgstnLoanScale" value="${data2.SGSTN_LOAN_SCALE}" readonly="readonly" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 유형*" />
									</td>
									<td colspan="3">
										<select class="txt" id="sgstnloanType" name="sgstnloanType" disabled="disabled">
											<option value="0">장기 대출</option>
											<option value="1">단기 대출</option>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 시기*" />
									</td>
									<td colspan="3">
										<input type="month" class="txt" id="sgstnloanTime" name="sgstnloanTime" value="${data2.SGSTN_LOAN_TIME}"  disabled="disabled" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="상환 시기*" />
									</td>
									<td colspan="3">
										<input type="month" class="txt" id="sgstnRdmptnTime" name="sgstnRdmptnTime" value="${data2.SGSTN_RDMPTN_TIME}"  disabled="disabled" />
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page_cont_title_text">고객사 상세정보</div>
						<hr class="hr_width">
						<table class="detailList">
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="자산 총액*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnTotalAmnt" name="sgstnTotalAmnt" value="${data2.SGSTN_TOTAL_AMNT}"  disabled="disabled" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="부채액*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnDebtAmnt" name="sgstnDebtAmnt" value="${data2.SGSTN_DEBT_AMNT}"  disabled="disabled" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="평균 매출액" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnAvgRvnAmnt" name="sgstnAvgRvnAmnt" value="${data2.SGSTN_AVG_RVN_AMNT}"  disabled="disabled" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="사원 수" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnEmpCount" name="sgstnEmpCount" value="${data2.SGSTN_EMP_COUNT}"  disabled="disabled" />
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page_cont_title_text">상세정보</div>
						<hr class="hr_width">
						<table class="detail_info_table">
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="상세내용*" />
									</td>
									<td colspan="3">
										<textarea rows="100" cols="50" class="txt_area" id="dtlCont" name="dtlCont" readonly="readonly">${data2.DTL_CONT}</textarea>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="비고" />
									</td>
									<td colspan="3">
										<input type="text" class="rmks" id="rmrks" name="rmrks" value="${data2.RMRKS}" readonly="readonly" />
									</td>
								</tr>
								<tr height="10"></tr>
							</tbody>
						</table>
						<!-- 첨부자료  -->
						<c:set var="dtlSFileLength" value="${fn:length(data2.ATT_FILE_NAME)}"></c:set>
						<c:set var="dtlSFileName" value="${fn:substring(data2.ATT_FILE_NAME, 20, dtlSFileLength)}"></c:set>
						<div class="spc">
							<div class="adc_txt">
								첨부파일
							</div>
							<div class="cntrct_box_in">
								<a href="resources/upload/${data2.ATT_FILE_NAME}"  download="${dtlSFileName}">${dtlSFileName}</a>
							</div>
						</div>
					</div>
<!-- *************************************** 견적 시작 *************************************** -->			
	<hr class="hr_bot" color="#4B94F2" width="925px">
	<input type="hidden" name="salesNum" value="${param.salesNum}" /> <!-- 영업기회에서 가져온 영업번호 -->
					<input type="hidden" id= "mdNum" name="mdNum" /> <!-- 영업기회에서 가져온 영업번호 -->
					<div class="bot_title">
						<h3>견적<span id="qtn_btn"><div class="up_btn" id="qtnContBtn_s"></div></span></h3>
					</div>
					<div class="qtnCont">
					 <hr class="hr_bot" color="white" width="925px"> 
					<div class="hr_bot"></div>
					<table>
						<colgroup>
							<col width="200" />
							<col width="250" />
							<col width="200" />
							<col width="250" />
						</colgroup>
						<tbody>
							<tr height="40">
								<td><input type="button" class="btn" value="견적명*" readonly="readonly" /></td>
								<td colspan="3"><input type="text" class="txt" id="qtnName" name="qtnName" value="${data3.QTN_NAME}" readonly="readonly" /></td>		
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="상품유형" readonly="readonly" /></td>
								<td colspan="3">
									<select class="txt" id="mdType" name="mdType" disabled="disabled">
								 		<option value="0">개인사업</option>
								 		<option value="1">법인사업</option>
								 		<option value="2">공공사업</option>
									</select>
								</td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="견적일*" readonly="readonly" /></td>
									<td colspan="3"><input type="date" class="txt" id="qtnDate" name="qtnDate" value="${data3.QTN_DATE}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="대출금액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="LoanAmnt" name="LoanAmnt" value="${data3.LOAN_AMNT}" readonly="readonly" /></td>		
							</tr> 
							<tr height="40">
									<td><input type="button" class="btn" value="공급가액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="splyPrice" name="sqlyPrice" value="${data3.SPLY_PRICE}" readonly="readonly" /></td>		
							</tr> 
							<tr height="40">
									<td><input type="button" class="btn" value="세액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="taxAmnt" name="taxAmnt" value="${data3.TAX_AMNT}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="합계액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="sumAmnt" name="sumAmnt" value="${data3.TOTAL}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="중도상환가능여부" readonly="readonly" /></td>
									<td>
										<select class="txt" id="prdmptn_psbl_check" name="prdmptnPsbl"  disabled="disabled">
											<option value="0">가능</option>
											<option value="1">불가능</option>
										</select>
									</td>
									<td><input type="button" class="btn" value="부가세*" readonly="readonly" /></td>
									<td>
										<select class="txt" id="srtx" name="srtx" onchange="test(this);" disabled="disabled">
							 				<option value="0">미포함</option>
							 				<option value="1">포함</option>
							 				<option value="2">면세</option>
										</select>
									</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="대출기간" readonly="readonly" /></td>
								<td>
									<select class="txt" id="loanPrd" name="loanPrd" disabled="disabled">
										<option value="0">6개월</option>
										<option value="1">1년</option>
										<option value="2">3년</option>
										<option value="3">5년</option>
									</select>	
								</td>
								
								<td><input type="button" class="btn" value="원금상환방식" readonly="readonly" /></td>
								<td colspan="2">
									<select class="txt" id="prncpl_pymnt" name="prncplPymnt" disabled="disabled">
										<option value="0">원금 균등 상환</option>
										<option value="1">원리금 균등 상환</option>
										<option value="2">만기 일시 상환</option>
									</select>
								</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="이자율(%)" /></td>
								<td><input type="text" class="txt" id="intrstRate" name="intrstRate" value="${data3.INTRST_RATE}" readonly="readonly" /></td>
								<td><input type="button" class="btn" value="납부일" readonly="readonly" /></td>
								<td colspan="2"><input type="text" class="txt" id="pymntDate" name="pymntDate" value="${data3.PYMNT_DATE}" readonly="readonly" placeholder="매달    일" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="비고" readonly="readonly"/></td>
								<td colspan="3"><input type="text" class="rmks" name="rmksCont" value="${data3.RMKS}" readonly="readonly" /></td>
							</tr>							
						</tbody>
					</table>
					<!-- 첨부자료  -->
						<c:set var="qtnSFileLength" value="${fn:length(data3.ATT_FILE_NAME)}"></c:set>
						<c:set var="qtnSFileName" value="${fn:substring(data3.ATT_FILE_NAME, 20, qtnSFileLength)}"></c:set>
						<div class="spc">
							<div class="adc_txt">
								첨부파일
							</div>
							<div class="cntrct_box_in">
								<a href="resources/upload/${data3.ATT_FILE_NAME}" download="${qtnSFileName}">${qtnSFileName}</a>
							</div>
						</div>
				
					<!-- ********* 견적 끝 ********* -->					
			</div>							
						
<!-- ************************************************ 계약 시작 ************************************************ -->
				<hr class="hr_bot" color="#4B94F2" width="925px">
				<form action="fileUploadAjax" id="addForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="salesNum" value="${param.salesNum}" /> <!-- 영업기회에서 가져온 영업번호 -->
					<input type="hidden" id= "mdNum" name="mdNum" />
					<div class="bot_title"><h3>계약<div class="drop_btn"></div></h3></div>
					 <hr class="hr_bot" color="white" width="925px"> 
					<div class="hr_bot"></div>
					<table>
						<colgroup>
							<col width="200" />
							<col width="250" />
							<col width="200" />
							<col width="250" />
						</colgroup>
						<tbody>
							<tr height="40">
								<td><input type="button" class="btn" value="계약일*" readonly="readonly" /></td>
								<td colspan="3"><input type="date" class="txt" id="cntrctDt" name="cntrctDt" value="${data4.CNTRCT_DATE}" readonly="readonly" /></td>		
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="계약기간*" readonly="readonly"/></td>
								<td><input type="date" class="txt" id="cntrctSdt" name="cntrctSdt" value="${data4.CNTRCT_START_DATE}" readonly="readonly"/></td>
								<td>
									<div class="wave"> ~ </div>
								</td>
								<td><input type="date" class="txt" id="cntrctEdt" name="cntrctEdt" value="${data4.CNTRCT_END_DATE}" readonly="readonly"/></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="고객사" /></td>
									<td><input type="text" class="txt" value="${data.CLNT_CMPNY_NAME}"/></td>
									<td><input type="button" class="btn" value="고객" /></td>
									<td><input type="text" class="txt"  value="${data.CLNT_NAME}"/></td>		
							</tr> 
							<tr height="40">
									<td><input type="button" class="btn" value="입금계좌 소유주명*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="daoName" name="daoName" value="${data4.DPST_TRSC_OWNER_NAME}" readonly="readonly"/></td>		
							</tr> 
							<tr height="40">
									<td><input type="button" class="btn" value="입금 은행명*" /></td>
									<td>
										<select class="txt" id="dbNum" name="dbNum" disabled="disabled">
											<option value="0">카카오뱅크</option>												
											<option value="1">국민은행</option>												
											<option value="2">농협은행</option>												
											<option value="3">신한은행</option>												
											<option value="4">기업은행</option>												
										</select>
									</td>
									<td><input type="button" class="btn" value="입금 계좌번호*" /></td>
									<td><input type="text" class="txt" id="daNum" name="daNum" value="${data4.DPST_ACNT_NUM}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="납입자명*" /></td>
									<td><input type="text" class="txt" id="payerName" name="payerName" value="${data4.PAYER_NAME}" readonly="readonly"/></td>
									<td><input type="button" class="btn" value="납입 계좌번호*" /></td>
									<td><input type="text" class="txt" id="paNum" name="paNum" value="${data4.PYMT_ACNT_NUM}" readonly="readonly"/></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="갱신예정일*" /></td>
								<td colspan="3"><input type="date" class="txt"  id="reDate" name="reDate" value="${data4.RNWL_EXPCTD_DATE}" readonly="readonly"/></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="월 납부액" readonly="readonly" /></td>
								<td><input type="text" class="txt" id="monthPymntAmnt" name="monthPymntAmnt" readonly="readonly"  value="${data4.MONTH_PYMNT_AMNT}" /></td>
								<td><input type="button" class="btn" value="월 이자액" readonly="readonly" /></td>
								<td colspan="2"><input type="text" class="txt" id="monthIntrstAmnt" name="monthIntrstAmnt" readonly="readonly" value="${data4.MONTH_INTRST_AMNT}" /></td>
							</tr>
						</tbody>
					</table>
					<!-- 첨부자료 -->
					<c:set var="cntrctFileLength" value="${fn:length(data4.ATT_FILE_NAME)}"></c:set>
						<c:set var="cntrctFileName" value="${fn:substring(data4.ATT_FILE_NAME, 20, cntrctFileLength)}"></c:set>
						<div class="spc">
							<div class="adc_txt">
								첨부자료
							</div>
							<div class="cntrct_box_in">
								<a href="resources/upload/${data4.ATT_FILE_NAME}"  download="${cntrctFileName}">${cntrctFileName}</a>
							</div> 
						</div>
				</form>	
				<form action="#" id="botOpActionForm" method="post">
					<input type="hidden" name="cntrctNum" value="${data4.CNTRCT_NUM}" />
					<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
					<input type="hidden" id="cmntNum" name="cmntNum" />
					<!-- 의견 -->
					<div class="mgtop"></div>
					<div class="op_title"></div>
					<hr color="#F2B705" width="925px">
					<div class="opbx"></div>
					<div class="opBox">
						<textarea id="tatacont" name="tacont"></textarea>
						<div class="cmn_btn subm">등록</div>
					</div>
				</form>
				<!-- ************* 예정된 일정 ************** -->
				<form action="#" id="SSchdlActionForm" method="post">
					<input type="hidden" name="salesNum" value="${param.salesNum}" />
					<input type="hidden" name="schdlnum" id="schdldeletenum" />
					<div class="mgtop"></div>
					<div class="schdl_title"></div>
					<hr color="#F2B705" width="925px">
					<div class="sBox"></div>
				</form>
					<hr class="hr_bot" color="white" width="925px">
					<hr class="hr_bot" color="white" width="925px">
					<div class="salesOver_btn nb">영업 종료하기</div>
					<!-- 끝 -->
					</div>
				</div>
			</div>	
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>