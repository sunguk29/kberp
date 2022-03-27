<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 고객사</title>
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
	margin: 20px auto;
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
/* tr:nth-child(9) > td:nth-child(2){
	background-color: #F2F2F2;
} */
td:nth-child(1), td:nth-child(3){
	text-align: center;
}
.btn{
	width : 90px;
	height: 40px;
}
.btn, .address{
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	width: 150px;
	border: none;
	text-align: center;
}
.btnImg:hover, .plus_btn:hover {
	cursor: pointer;
}
.txt{
	height: 30px;
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
.drop_btn:hover, .up_btn:hover {
	cursor: pointer;
}
.cc_box_in {
	display: inline-block;
	vertical-align: top;
	width: 480px;
	height: 65px;
	padding-top: 5px;
	padding-left: 20px;
	white-space: pre;
	font-size: 13px;
	line-height: 20px;
}
.cc_box_in:hover {
	cursor: pointer;
	color: #2E83F2;
}
.cc_box_right {
	display: inline-block;
	vertical-align: top;
	width: 305px;
	height: 70px;
	padding-right: 20px;
}
.right_box {
	width: 136px;
	height: 70px;
	font-size: 14px;
	padding-left: 162px;
	line-height: 70px;
	text-align: center;
}
.boldname{
	font-weight: bold;
}
/* 첨부자료 */
.cntrct_box_in {
	width: 885px;
	height: 100px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
	font-size: 10pt;
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
#att {
	display: none;
}
/* 의견 */
.opbx { /* 스크롤때문에 div 박스 추가 */
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}
.cbx { /* 스크롤때문에 div 박스 추가 */
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}
.hbx { /* 스크롤때문에 div 박스 추가 */
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}
hr { /* 구분선 */
	margin-bottom: 10px;
}
.op_title { 
	font-size: 11pt;
}
.cl_title { 
	font-size: 11pt;
}
.bot_title { 
	font-size: 11pt;
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
.del:hover {
	cursor: pointer;
	color: #F2CB05;
}
.dt, .del {
	display: inline-block;
	vertical-align: top;
	font-size: 9pt;
	color: gray;
}
.opBox {
	width: 860px;
	height: 56px;
	margin: 15px 0px 5px 47.5px;
}
/* 히스토리 */
.dwon_icon {
	display:inline-block;
	vertical-align: middle;
	width: 24px;
	height: 24px;
	background-image: url("../../images/sales/downarrow.png");
	background-size: 24px 24px;
	float: right;
	margin-top: 3px;
}
.dwon_icon:hover {
	cursor: pointer;
}
.side_btn_area {
	display: inline-block;
	vertical-align: top;
	text-align: right;
	width: 827px;
	height: 30px;
	margin-left: 100px;
	line-height: 30px;
}

.save_btn, .list_btn {
	display: inline-block;
	vertical-align: top;
	width: 30px;
	height: 30px;
	line-height: 30px;
	font-size: 11pt;
	font-weight: bold;
	margin: 0px 5px;
	border-radius: 2px;
	cursor: pointer;
	color: #7b7b7b;
}
.mgtop {
	margin-top: 50px;
}
.sc_title {
	width: 927px;
	height: 30px;
	font-size: 16px;
	font-weight: bold;
	line-height: 30px;
	background-color: #F2CB05;
}
.hands{
	display: inline-block;
	vertical-align: middle;
	width: 48px;
	height: 48px;
	background-image: url("resources/images/sales/hands.png");
	background-size: 48px 48px;
	margin-right: 10px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action", "clntCmpnyList");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action", "clntCmpnyUpdate");
		$("#actionForm").submit();
	});
/*************************************** 의견삭제 ***************************************/	
	$(".opbx").on("click", ".del", function() {
		var cmntNum = $(this).children("#cmntNum").val();
		document.getElementById("cmNum").value = cmntNum;
		
		makePopup({
			bg : false,
			bgClose : false,
			title : "경고",
			contents : "삭제하시겠습니까?",
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "예",
				func:function() {
					
					var params = $("#botOpActionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "ccBotActionAjax/update",
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
				name : "아니오"
			}]
		});
		
		
		
	});
/***********************************************************************************/
	
/*************************************** 글 삭제 ***************************************/
	$("#deleteBtn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "경고",
			contents : "삭제하시겠습니까?",
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "삭제",
				func:function() {
					
					var params = $("#actionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "clntCmpnyMngActionAjax/delete",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
								location.href = "clntCmpnyList";
							} else {
								alert("삭제중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) {
							console.log(request.responseText);
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
/***********************************************************************************/
	
/*************************************** 의견 ***************************************/
	reloadOpList();
	$(".subm").on("click", function() {
		var params = $("#botOpActionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "ccBotActionAjax/insert",
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
	});
/***********************************************************************************/
	
	reloadCList(); // 하단 고객

/*************************************** 고객 등록 ***************************************/
	$(".cl_title").on("click", ".plus_btn_bot", function() {
 		var html = "";
 		
		html += "<table class=\"popup_table\">                                                                                ";
		html += "	<colgroup>                                                                                              ";
		html += "		<col width=\"100\" />                                                                                 ";
		html += "		<col width=\"auto\" />                                                                                ";
		html += "	</colgroup>                                                                                             ";
		html += "	<tbody>                                                                                                 ";
		html += "		<tr>                                                                                                ";
		html += "			<td><input type="button" class="btn" value="고객 *" readonly="readonly"/></td>                  ";
		html += "			<td><input type="text" class="txt" id="cName" name="cName" /></td>                                                      ";
		html += "		</tr>                                                                                               ";
		html += "		<tr height=\"10\">                                                                                    ";
		html += "			<td><input type="button" class="btn" value="고객사 *" /></td>                                 ";
		html += "			<td>                                                                                            ";
		html += "				<div class=\"imgPos\">                                                                        ";
		html += "					<input type=\"text\" class=\"txt imgName\" id=\"ccName\" name=\"ccName\" />                     ";
		html += "					<input type=\"hidden\" id=\"ccNum\" name=\"ccNum\" />                     ";
		html += "					<img class=\"btnImg_in\" id="ccPop" alt="팝업" src="resources/images/sales/popup.png">                     ";
		html += "				</div>                                                                                      ";
		html += "			</td>                                                                                           ";
		html += "		</tr>                                                                                               ";
		html += "		<tr height="10">                                                                                    ";
		html += "			<td><input type="button" class="btn" value="부서" /></td>                                       ";
		html += "			<td><input type="text" class="txt" id="dept" name="dept" /></td>                                                      ";
		html += "		</tr>                                                                                               ";
		html += "		<tr height="10">                                                                                    ";
		html += "			<td><input type="button" class="btn" value="직책" /></td>                                       ";
		html += "			<td><input type="text" class="txt" id="duty" name="duty" /></td>								                        ";
		html += "		</tr>                                                                                               ";
		html += "		<tr height="10">                                                                                    ";
		html += "			<td><input type="button" class="btn" value="휴대폰 번호*" /></td>                               ";
		html += "			<td><input type="text" class="txt" id="mbl" name="mbl" /></td>															";		
		html += "		</tr>                                                                                               ";
		html += "		<tr height="10">                                                                                    ";
		html += "			<td><input type="button" class="btn" value="메일" /></td>                                       ";
		html += "			<td><input type="text" class="txt" id="email" name="email" /></td>                                                     ";
		html += "		</tr>                                                                                               ";
		html += "		<tr height="10">                                                                                    ";
		html += "			<td><input type="button" class="btn" value="담당자 *" /></td>                                      ";
		html += "			<td>                                                     ";
		html += "				<div class="imgPos">                                                     ";
		html += "					<input type="text" class="txt imgName" id="mngEmp" name="mngEmp" />                                                    ";
		html += "					<input type="hidden"id="mngNum" name="mngNum" />                                                    ";
		html += "					<img class="btnImg_in" id="mngPop" alt="팝업" src="resources/images/sales/usericon.png">                                                    ";
		html += "				</div>                                                   ";
		html += "				</td>                                                  ";
		html += "		</tr>                                                                                               ";
		html += "		<tr height="10">                                                                                    ";
		html += "			<td><input type="button" class="btn" value="첨부자료"></td>                                     ";
		html += "			<td>                                                                                            ";
		html += "				<div class="imgPos">                                                                        ";
		html += "					<span>                                                                                  ";
		html += "						<img class="btnImg" alt="추가" src="resources/images/sales/plus.png"  />                ";
		html += "						<img class="btnImg" alt="접기" src="resources/images/sales/uparrow.png"  />             ";
		html += "					</span>                                                                                 ";
		html += "				</div>                                                                                      ";
		html += "			</td>                                                                                           ";
		html += "		</tr>                                                                                               ";
		html += "	</tbody>                                                                                                ";
		html += "</table>                                                                                                   ";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "고객 등록",
			contents : html,
			contentsEvent : function() {
				
			},
			width : 600,
			height : 500,
			buttons : [{
				name : "등록",
				func:function() {
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
/***********************************************************************************/	
	
}); // JQuery End

/*************************************** 의견 ***************************************/
function reloadOpList() {
	var params = $("#botOpActionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "opBotListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawOpCnt(res.opListCnt);
			drawOpList(res.list);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

function drawOpCnt(opListCnt) {
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
/***********************************************************************************/

/*************************************** 고객 ***************************************/
 
function reloadCList() {
	var params = $("#botClActionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "clBotListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawClCnt(res.clListCnt);
			drawClList(res.list);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

function drawClCnt(clListCnt) {
	var html = "";
	
	html = "<h3>고객(" + clListCnt + ")<div class=\"drop_btn\"></div><div class=\"plus_btn_bot\"></div></h3>";
	
	$(".cl_title").html(html);
}

function drawClList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<div class=\"OpinionBox\">";
		html += "<div class=\"cc_box_in\"><span class=\"boldname\">" + data.CLNT_NAME + "(" + data.DUTY + " / " + data.DEPT + ")</span><br/>tel	" + data.MBL + "<br/>mail	" + data.EMAIL + "</div>";
		html += "<div class=\"cc_box_right\">";
		html += "	<div class=\"right_box\">";
		html += "		<div class=\"hands\"></div>";
		html += "2건";
		html += "	</div>";
		html += "</div>";
		html += "</div>";
	}
	
	$(".cbx").html(html);
	
}

/***********************************************************************************/
</script>
</head>
<body>
<!-- 목록이동 -->
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="page" name="page" value="${param.page}" />
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
	
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">고객사 상세보기</div>
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />
			<img alt="수정버튼" src="resources/images/sales/pencil.png" class="btnImg" id="updateBtn" />
			<img alt="삭제버튼" src="resources/images/sales/garbage.png" class="btnImg" id="deleteBtn" />
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="bodyWrap">
				<table>
					<colgroup>
						<col width="200" />
						<col width="auto" />
					</colgroup>
					<tbody>
						<tr>
							<td><input type="button" class="btn" value="고객사 *" readonly="readonly" /></td>
							<td><input type="text" class="txt" value="${data.CLNT_CMPNY_NAME}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="고객사 분류 *" /></td>
							<td>
								<select class="txt" id="ccClsfy" name="ccClsfy" disabled="disabled">
									<c:if test="${data.CLNT_CMPNY_CLSFY_NUM eq 0}">
										<option value="0" selected="selected">거래고객사</option>
									</c:if>
									<c:if test="${data.CLNT_CMPNY_CLSFY_NUM eq 1}">
										<option value="1" selected="selected">파트너사</option>
									</c:if>
									<c:if test="${data.CLNT_CMPNY_CLSFY_NUM eq 2}">
										<option value="2" selected="selected">해지고객사</option>
									</c:if>
									<c:if test="${data.CLNT_CMPNY_CLSFY_NUM eq 3}">
										<option value="3" selected="selected">정지고객사</option>
									</c:if>
									<c:if test="${data.CLNT_CMPNY_CLSFY_NUM eq 4}">
										<option value="4" selected="selected">외국고객사</option>
									</c:if>
									<c:if test="${data.CLNT_CMPNY_CLSFY_NUM eq 5}">
										<option value="5" selected="selected">기타</option>
									</c:if>
								</select>
							</td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="등급 *" /></td>
							<td>
								<select class="txt" id="ccGrade" name="ccGrade" disabled="disabled">
									<c:if test="${data.GRADE_NUM eq 0}">
										<option value="0" selected="selected">S</option>
									</c:if>
									<c:if test="${data.GRADE_NUM eq 1}">
										<option value="1" selected="selected">A</option>
									</c:if>
									<c:if test="${data.GRADE_NUM eq 2}">
										<option value="2" selected="selected">B</option>
									</c:if>
									<c:if test="${data.GRADE_NUM eq 3}">
										<option value="3" selected="selected">C</option>
									</c:if>
									<c:if test="${data.GRADE_NUM eq 4}">
										<option value="4" selected="selected">D</option>
									</c:if>
								</select>
							</td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="사업자번호" /></td>
							<td><input type="text" class="txt" value="${data.BSNSMN_RGSTRTN_NUM}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="대표" /></td>
							<td><input type="text" class="txt" value="${data.CLNT_NAME}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="유선번호" /></td>
							<td><input type="text" class="txt" value="${data.PHONE_NUM}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="팩스번호" /></td>
							<td><input type="text" class="txt" value="${data.FAX}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="웹사이트" /></td>
							<td><input type="text" class="txt" value="${data.HMPG}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="우편번호" /></td>
							<td><input type="text" class="txt" value="${data.ZIP_CODE_NUM}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td rowspan="2"><input type="button" class="address" value="주소 *" /></td>
							<td><input type="text" class="txt search_text" value="${data.ADRS}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="text" class="txt" placeholder="상세주소" value="${data.DTL_ADRS}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="매출(년)*" /></td>
							<td><input type="text" class="txt" value="${data.RVN}" readonly="readonly" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="인지경로"></td>
							<td>
								<select class="txt" id="rp" name="rp" disabled="disabled">
									<c:if test="${data.RCGNTN_PATH_NUM eq 0}">
										<option value="0" selected="selected">자사홈페이지</option>
									</c:if>
									<c:if test="${data.RCGNTN_PATH_NUM eq 1}">
										<option value="1" selected="selected">인터넷검색</option>
									</c:if>
									<c:if test="${data.RCGNTN_PATH_NUM eq 2}">
										<option value="2" selected="selected">지인소개</option>
									</c:if>
									<c:if test="${data.RCGNTN_PATH_NUM eq 3}">
										<option value="3" selected="selected">세미나</option>
									</c:if>
									<c:if test="${data.RCGNTN_PATH_NUM eq 4}">
										<option value="4" selected="selected">전화</option>
									</c:if>
									<c:if test="${data.RCGNTN_PATH_NUM eq 5}">
										<option value="5" selected="selected">기타</option>
									</c:if>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 첨부파일 -->
				<div class="rvn_txt">
					첨부파일
				</div>
				<div class="cntrct_box_in">
				</div>
<!-- ************************************************ 상세보기 하단 *********************************************** -->
			<form action="#" id="botOpActionForm" method="post">
				<input type="hidden" name="ccn" value="${param.ccn}" />
				<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
				<input type="hidden" id="cmNum" name="cmNum" />
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
			<form action="#" id="botClActionForm" method="post">
				<input type="hidden" name="ccn" value="${param.ccn}" />
				<!-- 고객 -->
				<div class="mgtop"></div>
				<div class="cl_title"></div>
				<hr color="#F2B705" width="925px">
				<div class="cbx"></div>
			</form>
				<!-- 히스토리 -->
				<div class="mgtop"></div>
				<div class="bot_title"><h3>히스토리(5)<div class="drop_btn"></div></h3></div>
				<hr color="#F2B705" width="925px">
				<div class="hbx">
					<div class="OpinionBox">
						<div class="name">영업기회 (21/12/27 17:01:00)</div>
						<div class="txtOp">내용: 등록된 영업기회 표시</div>
						<div class="txtOp">담당자:000</div>
					</div>
				</div>
				<!-- 끝 -->
<!-- *********************************************************************************************************** -->
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>