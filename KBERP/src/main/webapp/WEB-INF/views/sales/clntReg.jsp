<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 고객</title>
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

td:nth-child(1), td:nth-child(3){
	text-align: center;
}
.btn{ /* 내용 제목 영역 */
	width : 90px;
	height: 40px;
}
.btn {
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	width: 150px;
	border: none;
	text-align: center;
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
	width: 30px;
	float: right;
	margin-left: 10px;
}

/* 목록, 수정, 삭제 영역 */
.imgPos{
	position: relative;
}
.plus_btn:hover {
	cursor: pointer;
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
#att {
	display: none;
}
.btnImg_in {
    position: absolute;
    left: 691px;
    top: 4px;
    width: 25px;
    cursor: pointer;
}
.imgName {
	padding-right: 30px;
}
/* 팝업 */
.popup_title_mid {
	width: calc(100% + 20px);
	height: 70px;
	background-color: #F2F2F2;
	font-size: 11pt;
	padding-bottom: 3px;
	border-bottom: 1px solid #d7d7d7;
    margin: -10px 0px 0px -10px;
}
.ptm_left {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 70px;
}
.ptm_left_top, .ptm_left_bot  {
	width: 100px;
	height: 35px;
	line-height: 35px;
	text-align: right;
	font-size: 15px;
	font-weight: bold;
}
.ptm_right_bot {
	width: 94px;
	height: 35px;
	line-height: 35px;
	text-align: left;
	font-size: 15px;
	font-weight: bold;
}
.ptm_right_bot2 {
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
	width: 185px;
	height: 70px;
}
.ptm_mid_right_top, .ptm_mid_right_bot {
	width: 180px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.text_size1 {
	width: 123px;
	height: 19px;
	outline: none;
}
.text_size2 {
	width: 170px;
	height: 19px;
	margin-left : 12px;
	outline: none;
}
.ptm_right {
	display: inline-block;
	vertical-align: top;
	width: 94px;
	height: 100%;
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
.popup_cc_box_right {
   display: inline-block;
   width: 400px;
   height: 50px;
   font-size: 14px;
}
.popup_box_in {
   width: 550px;
   height: 55px;
   border: 2px solid #d7d7d7;
   border-radius: 7px;
   background-color: #F2F2F2;
   margin-left: 15px;
   margin-bottom: 10px;
}
.popup_box {
	margin-top: 20px;
	height: 286px;
}
.popup_box_mng {
	margin-top: 20px;
	height: 286px;
}
.popup_box_in:hover {
   cursor: pointer;
   border: 2px solid #2E83F2;
}
.company {
   display: inline-block;
   width: 42px;
   height: 25px;
   background-image: url("resources/images/sales/client.png");
   background-size: 42px 25px;
   margin-top: 13px;
   margin-left: 45px;
}
.mngIcon {
   display: inline-block;
   width: 42px;
   height: 25px;
   margin-top: 13px;
   margin-left: 45px;
}
.boldname{
	font-weight: bold;
	font-size : 12px;
}
.mg_wid {
	margin-left: 50px;
}
.popCmnBtn {
	margin-top: 35px;
	margin-left: 200px;
}
.popMngBtn {
	margin-top: 5px;
	margin-left: 25px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#listBtn").on("click", function() {
		makePopup({
			bg : true,
			bgClose : false,
			title : "알림",
			contents : "나가면 저장되지않습니다, 나가시겠습니까?",
			contentsEvent : function() {
				
			},
			buttons : [{
				name : "나가기",
				func:function() {
					$("#listForm").submit();
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
// ************** 고객사 팝업 **************
	$("#ccPop").on("click", function() {
		var html = "";
        
	 	html += "<form action=\"#\" id=\"popupForm\">";
		html += " <div class=\"popup_title_mid\">                                                   ";
	 	html += "<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += " <div class=\"ptm_left\">                                                          ";
		html += " 	<div class=\"ptm_left_top\">고객사명</div>		                              ";
		html += " 	<div class=\"ptm_left_bot\">고객사분류</div>		                              ";
		html += " </div>                                                                          ";
		html += " <div class=\"ptm_mid\">                                                           ";
		html += " 	<div class=\"ptm_mid_top\">                                                     ";
		html += " 		<input type=\"text\"  class=\"text_size2\" placeholder=\"검색어를 입력해주세요\" /> ";
		html += " 	</div>		                                                                  ";
		html += " 	<div class=\"ptm_mid_bot\">                                                     ";
		html += " 		<select class=\"sel_size\">                                                 ";
		html += " 			<option value=\"9\">선택안함</option>                                             ";
		html += " 			<option value=\"0\">거래고객사</option>                                           ";
		html += " 			<option value=\"1\">파트너사</option>                                             ";
		html += " 			<option value=\"2\">해지고객사</option>                                           ";
		html += " 			<option value=\"3\">정지고객사</option>                                           ";
		html += " 			<option value=\"4\">외국고객사</option>                                           ";
		html += " 			<option value=\"5\">기타</option>                                                 ";
		html += " 		</select>                                                                 ";
		html += " 	</div>	                                                                      ";
		html += " </div>                                                                          ";
		html += " <div class=\"cmn_btn popCmnBtn\">검색</div>                                           ";
		html += " </div>";
		html += "</form>";
		html +=	"<div class=\"popup_box\"></div>";
		html += "<div class=\"board_bottom\">     ";
		html += "<div class=\"pgn_area\"></div>   ";
		html += "</div>                         ";
		
		makePopup({
			depth : 1,
			bg : true,
			width : 600,
			height : 524,
			title : "고객사 조회",
			contents : html,
			contentsEvent : function() {
				
				drawCcList();
				
				$(".popup_box").on("click", ".popup_box_in", function() {
					var a = $(this).attr("id");
					for(var i = 1; i < 5; i++) {
						if(a.substr(3,1) == $("#ccn" + i + "").attr("id").substr(3,1)) {
							var ccn = $("#ccn" + i + "").val(); 
							var cnn = $("#cnn" + i + "").val(); 
							document.getElementById("ccName").value = ccn;
							document.getElementById("ccNum").value = cnn;
							closePopup();
							break;
						}
					}
				});
				
				$(".pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));

					drawCcList();
				});
				
			},
			buttons : {
				name : "닫기",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}
		});
	});
// ************** 고객사 팝업 END **************	

// ************** 담당자 팝업 **************
	$("#mngPop").on("click", function() {
		
		var html = "";
		
	 	html += "<div class=\"popup_title_mid\">"; 
	 	html += 	"<form action=\"#\" id=\"popupMngForm\">";
	 	html += 		"<input type=\"hidden\" id=\"page\" name=\"page\" value=\"1\"/>";
		html += 		"<div class=\"ptm_left\">";
		html += 			"<div class=\"ptm_left_top\">팀분류</div>";
		html +=				"<div class=\"ptm_left_bot\">사원분류</div>";		
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
		html +=					"<input type=\"text\" id=\"searchT\" name=\"searchT\" placeholder=\"검색어를 입력해주세요\" class=\"text_size2\" />";
		html +=				"</div>";
		html += 		"</div>";
		html += 		"<div class=\"ptm_right\">";
		html +=				"<div class=\"ptm_right_top\"></div>";
		html +=				"<div class=\"ptm_right_bot\">";
		html +=					"<div class=\"cmn_btn popMngBtn\">검색</div>";
		html +=				"</div>";
		html +=			"</div>";
		html += 	"</form>";
		html += "</div>";
		html +=	"<div class=\"popup_box_mng\"></div>";
		html += "<div class=\"board_bottom\">     ";
		html += "<div class=\"pgn_area\"></div>   ";
		html += "</div>                         ";
		
		
		
		makePopup({
			depth : 1,
			bg : true,
			width : 600,
			height : 500,
			title : "담당자 조회",
			contents : html,
			contentsEvent : function() {
				
				drawMngList();
				
				$(".popup_box_mng").on("click", ".popup_box_in", function() {
					var a = $(this).attr("id");
					for(var i = 1; i < 5; i++) {
						if(a.substr(3,1) == $("#mng" + i + "").attr("id").substr(3,1)) {
							var mng = $("#mng" + i + "").val(); 
							var mge = $("#mge" + i + "").val(); 
							document.getElementById("mngEmp").value = mng;
							document.getElementById("mngNum").value = mge;
							closePopup();
							break;
						}
					}
				});
				
				$(".pgn_area").on("click", "div", function() {
					$("#page").val($(this).attr("page"));

					drawMngList();
				});
			},
			buttons : {
				name : "닫기",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}
		});
		
	});
// ************** 담당자 팝업 END **************

	$(".aff_btn").on("click", function() {
		$("#att").click();
	});
	
	$("#addBtn").on("click", function() {
		if(checkEmpty("#cName")) {
			makeAlert("필수 항목 알림", "고객을 입력하세요");
		} else if(checkEmpty("#ccName")) {
			makeAlert("필수 항목 알림", "고객사를 입력하세요");
		} else if(checkEmpty("#mbl")) {
			makeAlert("필수 항목 알림", "휴대폰번호를 입력하세요");
		} else if(checkEmpty("#mngEmp")) {
			makeAlert("필수 항목 알림", "담당자를 입력하세요");
		} else {
			makePopup({
				bg : true,
				bgClose : false,
				title : "알림",
				contents : "저장하시겠습니까?",
				contentsEvent : function() {
					$("#popup1").draggable();
				},
				buttons : [{
					name : "저장",
					func:function() {
						var addForm = $("#addForm");
						
						addForm.ajaxForm({
							success : function(res) {
								if(res.fileName.length > 0) {
									$("#attFile").val(res.fileName[0]);
								}
								
								var params = $("#addForm").serialize();
								
								$.ajax({
									type : "post",
									url : "clntMngAjax/insert",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "success") {
											$("#listForm").submit();
										} else {
											alert("등록중 문제가 발생하였습니다.");
										}
									},
									error : function(request, status, error) {
										console.log(request.responseText);
									}
								});
								
							},
							error : function(req) {
								console.log(req.responseText);
							}
						});
						
						addForm.submit();
						console.log("One!");
						closePopup();
					}
				}, {
					name : "취소"
				}]
			});
				
		}
	});
});

function checkEmpty(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
}

// *********************************************** 고객사 팝업 ***********************************************
function drawCcList() {
	var params = $("#popupForm").serialize();
	
	$.ajax({
		type : "post",
		url : "popupCcListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

function drawList(list) {
	var html = "";
	var i = 1;
	var j = 1;
	var k = 1;
	
	for(var data of list) {                                                                               
		html += "<div class=\"popup_box_in\" id=\"box" + (i++) + "\">                                                               ";
		html += "<input type=\"hidden\" id=\"ccn" + (j++) + "\" value=\"" + data.CLNT_CMPNY_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"cnn" + (k++) + "\" value=\"" + data.CLNT_CMPNY_NUM + "\" />";
		html += "<div class=\"popup_cc_box_left\">                                                          ";
		html += "	<span class=\"company\"></span>                                                         ";
		html += "</div>                                                                                   ";
		html += "<span class=\"popup_cc_box_right\">                                                        ";
		html += "	<span class=\"boldname\">" + data.CLNT_CMPNY_NAME + " / " +  data.CLNT_CMPNY_CLSFY_NUM + " / " + data.GRADE_NUM + "</span><br/>                 ";
		html += "	<span class=\"adrs_name\">" + data.ADRS + "</span><br/>                                              ";
		html += "	<span class=\"clntCmpny_dt\">" + data.RGSTRTN_DATE + "</span>                                  ";
		html += "</span>                                                                                  ";
		html += "</div>                                                                           ";
	}                                                                                                     
	                      
	$(".popup_box").html(html);
	
}

function drawPaging(pb) {
	var html = "";
	
	html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
	if($("#page").val() == "1") {
		html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div page=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
		} else {
			html += "<div page=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
	}
	html += "<div page=\"" + pb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
	
	$(".pgn_area").html(html);

}
// *********************************************** 고객사 팝업 END ***********************************************



// *********************************************** 담당자 팝업 ***********************************************
function drawMngList() {
	var params = $("#popupMngForm").serialize();
	
	$.ajax({
		type : "post",
		url : "mngListAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			drawMngCont(res.mngList);
			drawMngPaging(res.mngPb);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

function drawMngCont(mngList) {
	var html = "";
	var i = 1;
	var j = 1;
	var k = 1;
	
	for(var data of mngList) {
		html +=	"<div class=\"popup_box_in\" id=\"mlb" + (i++) + "\">";
		html += "<input type=\"hidden\" id=\"mng" + (j++) + "\" value=\"" + data.EMP_NAME + "\" />";
		html += "<input type=\"hidden\" id=\"mge" + (k++) + "\" value=\"" + data.EMP_NUM + "\" />";
		html +=	"<div class=\"popup_cc_box_left\">";
		html +=	"<span><img alt=\"담당자이미지\" class=\"mngIcon\" src=\"resources/images/sales/usericon.png\"></span>";
		html +=	"</div>";
		html +=	"<div class=\"popup_cc_box_right\">";
		html +=	 data.EMP_NUM + " " + "<span class=\"boldname\">" + data.EMP_NAME + " / " + data.RANK_NAME + "</span>";
		html +=	"<span class=\"mg_wid\">" + data.DEPT_NAME + "</span>";
		html +=	"</div>";
		html +=	"</div>";                                                                      
	}                                                                                                     
	                      
	$(".popup_box_mng").html(html);
	
}

function drawMngPaging(mngPb) {
	var html = "";
	
	html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
	if($("#page").val() == "1") {
		html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
	}
	
	for(var i = mngPb.startPcount; i <= mngPb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div page=\"" + i + "\" class=\"page_btn_on\">" + i + "</div>";
		} else {
			html += "<div page=\"" + i + "\" class=\"page_btn\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == mngPb.maxPcount) {
		html += "<div page=\"" + mngPb.maxPcount + "\" class=\"page_btn page_next\">next</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</div>";
	}
	html += "<div page=\"" + mngPb.maxPcount + "\" class=\"page_btn page_last\">last</div>";
	
	$(".pgn_area").html(html);

}
// *********************************************** 담당자 팝업 END ***********************************************
</script>
</head>
<body>
<form action="clntList" id="listForm" method="post">
	<input type="hidden" id="page" name="page" value="${page}" />
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
			<div class="page_title_text">고객 등록</div>
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />
			<img alt="등록버튼" src="resources/images/sales/save.png" class="btnImg" id="addBtn" />
			<!-- 검색영역 선택적 사항 -->
			
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="bodyWrap">
				<form action="fileUploadAjax" id="addForm" method="post" enctype="multipart/form-data">
					<input type="hidden" id="page" name="page" value="${page}" />
					<input type="hidden" name="top" value="${param.top}" />
					<input type="hidden" name="menuNum" value="${param.menuNum}" />
					<input type="hidden" name="menuType" value="${param.menuType}" />
					<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
					<table>
						<colgroup>
							<col width="200" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="고객 *" readonly="readonly"/></td>
								<td><input type="text" class="txt" id="cName" name="cName" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="고객사 *" /></td>
								<td>
									<div class="imgPos">
										<input type="text" class="txt imgName" id="ccName" name="ccName" />
										<input type="hidden" id="ccNum" name="ccNum" />
										<img class="btnImg_in" id="ccPop" alt="팝업" src="resources/images/sales/popup.png">
									</div>
								</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="부서" /></td>
								<td><input type="text" class="txt" id="dept" name="dept" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="직책" /></td>
								<td><input type="text" class="txt" id="duty" name="duty" /></td>								
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="휴대폰 번호*" /></td>
								<td><input type="text" class="txt" id="mbl" name="mbl" /></td>																
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="메일" /></td>
								<td><input type="text" class="txt" id="email" name="email" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="담당자 *" /></td>
								<td>
									<div class="imgPos">
										<input type="text" class="txt imgName" id="mngEmp" name="mngEmp" />
										<input type="hidden"id="mngNum" name="mngNum" />
										<img class="btnImg_in" id="mngPop" alt="팝업" src="resources/images/sales/usericon.png">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- 첨부자료 -->
					<div class="rvn_txt"> 첨부파일
						<img class="plus_btn aff_btn" src="resources/images/sales/plus.png" border='0' />
					</div>
					<div class="cntrct_box_in">
					</div>
					<input type="file" id="att" name="att" />
					<input type="hidden" id="attFile" name="attFile" />
				</form>	
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>