<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 사원조회</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.srch_wrap {
	width: calc(100%-20px);
	height: 100px;
	/* background-color: #22222222; */
	border-top: 2px solid #cccccc;
	border-bottom: 2px solid #cccccc;
	padding: 10px 4px 10px 4px;
	/* border-radius: 4px; */
}
.page_srch_area {
	display: inline-block;
	vertical-align: top;
	text-align: left;
	width: 100%;
	height: 30px;
	line-height: 30px;
}

.srch_sel {
	min-width: 100px;
	height: 30px;
	margin-left: 0px;
}

.srch_text_wrap {
	display: inline-block;
	vertical-align: top;
	width: calc(100% - 174px);
	height: 28px;
	margin-left: 10px;
	text-align: left;
	border: 1px solid #d7d7d7;
	line-height: 28px;
	background-image: url('./images/cmn/srch_icon.png');
	background-repeat: no-repeat;
	background-size: 26px;
	background-position: right center;
	background-color: #fff;
}

.srch_text_wrap input {
	width: calc(100% - 30px);
	height: 28px;
	padding: 0px 2px;
	vertical-align: middle;
	border: none;
}

.cmn_btn {
	float: right;
}

.srch_cndt_area {
	height: 60px;
	width: 100%;
	margin-top: 10px;
}

.item_wrap {
	display: inline-block;
	vertical-align: top;
	height: 100%;
	width: 410px;
}
#left_item_wrap {
	margin-right: 35px;
}

.radio_wrap, .prd_wrap {
	display: table;
	height: 30px;
	width: 100%;
	margin-bottom: 0px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

.radio_wrap .radio_title {
	display: table-cell;
	vertical-align: middle;
	height: 30px;
	width: 80px;
	padding-right: 30px;
	text-align: right;
	font-weight: 900;
	font-size: 10pt;
}

.radio_wrap .radio_item_name {
	display: table-cell;
	vertical-align: middle;
	height: 30px;
	width: 60px;
	margin: 0;
	padding-left: 10px;
	padding-right: 15px;
	font-size: 10pt;
}

.radio_wrap input:hover, .radio_wrap label:hover {
	cursor: pointer;
}

.radio_wrap input {
	display: table-cell;
	vertical-align: middle;
	height: 30px;
	width: 15px;
	margin: 0;
}

#join_date {
	width: 75%;
}

#prd_wrap_empty {
	display: table-cell;
	height: 30px;
	width: 80px;
	padding-right: 30px;
}

.prd_text_wrap {
	display: table-cell;
	height: 30px;
	width: 140px;
}

.prd_text {
	display: inline-block;
	vertical-align: top;
	height: 18px;
	width: 124px;
	font-size: 10pt;
	margin-top: 3px;
}

.prd_clsftn {
	display: table-cell;
	vertical-align: middle;
	height: 30px;
	width: 20px;
	font-size: 10pt;
	text-align: center;
}

.prd_sel_btn:hover {
	cursor: pointer;
}

.rslt_wrap {
	width: 100%;
	height: 460px;
	/* border-top: 2px solid #cccccc; */
	border-bottom: 2px solid #cccccc;
	/* background-color: #22222222; */
	/* border-radius: 4px; */
}

.rslt_area {
	width: calc(100% - 8px);
	height: 400px;
	padding: 10px 4px 10px 4px;
}

.pgn_area {
	display: block;
	min-width: 300px;
	text-align:center;
	height: 30px;
	position: static;
	float: center;
}

table {
	width: 100%;
	border: 0px;
	border-collapse: collapse;
	background-color: #FFFFFF;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}
tr {
	text-align: center;
}

th {
	height: 26px;
	font-size: 9pt;
	font-weight: 900;
	color: #fff;
}
td {
	height: 21px;
	font-size: 9pt;
	margin-left: 6px;
	border-bottom: 1px solid #f0f0f0;
}
thead tr th {
	position: sticky;
	top: 0;
}
th:nth-child(odd) {
	background-color: #999999;
}
th:nth-child(even) {
	background-color: #939393;
}

td:nth-child(odd) {
	background-color: #fafafa;
}
td:nth-child(even) {
	background-color: #f6f6f6;
}

.td_cont {
	height: 21px;
	width: 100%;
	margin-top: 1px;
}

.func_btn {
	display: inline-block;
	vertical-align: bottom;
	width: 80px;
	height: 28px;
	border: 1px solid #00000022;
	border-radius: 4px;
	font-size: 9pt;
	font-weight: 900;
	text-align: center;
	line-height: 26px;
	-ms-user-select: none; 
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

#inqry_btn {
	background-color: #4B94F2;
	color: #fff;
	float: right;
}

#add_btn {
	background-color: #4B94F2;
	color: #fff;
	float: right;
	margin-left: 2px;
}

#inqry_btn:hover, #add_btn:hover {
	background-color: #2E83F2;
}

#del_btn {
	background-color: #fe3a40;
	color: #fff;
	float: right;
	margin-left: 2px;
}

#del_btn:hover {
	background-color: #ff1016;
}

#emp_del_popup {
	/* 숨김용 */
	/* display: none; */
	/* 크기변경용 */
	width: 300px;
	height: 140px;
	top: calc(50% - 70px); /* 높이 반  */
	left: calc(50% - 150px); /* 너비 반 */
}

#emp_del_popup .popup_cont {
	/* 내용 변경용 */
	font-size: 10.5pt;
	font-weight: 900;
	text-align: center;
	line-height: 40px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	if ("${param.srch_sel}" != "") {
		$("#srch_sel").val("${param.srch_sel}");
	} else {
		$("#old_srch_sel").val("0");
	}
	
	if ("${param.work_clsftn}" != "") {
		switch ("${param.work_clsftn}") {
		case "-1" :
			$("#work_clsftn_entr").prop("checked", true);
			break;
		case "0" :
			$("#work_clsftn_work").prop("checked", true);
			break;
		case "1" :
			$("#work_clsftn_rsgnt").prop("checked", true);
			break;
		}
	}

	if ("${param.emplynt_type}" != "") {
		switch ("${param.emplynt_type}") {
		case "-1" :
			$("#emplynt_type_entr").prop("checked", true);
			break;
		case "0" :
			$("#emplynt_type_rgl_wrk").prop("checked", true);
			break;
		case "1" :
			$("#emplynt_type_cntr_wrk").prop("checked", true);
			break;
		}
	}

	if ("${param.join_date}" != "") {
		switch ("${param.join_date}") {
		case "-1" :
			$("#join_date_entr").prop("checked", true);
			break;
		case "0" :
			$("#join_date_prd_dsgnt").prop("checked", true);
			if ("${param.prd_start}" != "") {
				$("#prd_start").val("${param.prd_start}");
			}
			if ("${param.prd_end}" != "") {
				$("#prd_end").val("${param.prd_end}");
			}
			break;
		}
	}
	
	reloadList();
	btnSetting();
		
	$(".rslt_area").on("mouseenter", ".table_item", function() {
		var state = $(this).find(".item_selected").val();
		if (state == "false") {
			$(this).children("td:nth-child(odd)").css("background-color", "#f3f3f3");
			$(this).children("td:nth-child(even)").css("background-color", "#efefef");
		}
	});
	$(".rslt_area").on("mouseleave", ".table_item", function() {
		var state = $(this).find(".item_selected").val();
		if (state == "false") {
			$(this).children("td:nth-child(odd)").css("background-color", "#fafafa");
			$(this).children("td:nth-child(even)").css("background-color", "#f6f6f6");
		}
	});
	
	$(".pgn_area").on("click", ".page_btn", function() {
		$("#page").val($(this).attr("page"));
		
		reloadList();
	});
	
	$("#srch_rslt").on("click", "tr", function() {	// 목록에서 사원 선택 및 선택 해제하는 기능
		var state = $(this).find(".item_selected").val();
		var flag = $(this).find(".val_existed").val();
		if (flag == "true") {
			if (state == "false") {
				$(this).parent("tbody").find(".table_item .item_selected").val("false");
				$(this).find(".item_selected").val("true");
				
				$("#empNum").val($(this).attr("num"));
				$("#inqry_btn").attr("da", "false");
				$("#del_btn").attr("da", "false");
				btnSetting();
				
				console.log("selected : " + $("#empNum").val());
		
				$(this).parent("tbody").find(".table_item").children("td:nth-child(odd)").css("background-color", "#fafafa");
				$(this).parent("tbody").find(".table_item").children("td:nth-child(even)").css("background-color", "#f6f6f6");
				
				$(this).children("td").css("background-color", "#b3e0ff");
			} else {
				$(this).find(".item_selected").val("false");
				
				$("#empNum").val("-1");
				$("#inqry_btn").attr("da", "true");
				$("#del_btn").attr("da", "true");
				btnSetting();
				
				console.log("unselected");
				
				$(this).children("td:nth-child(odd)").css("background-color", "#fafafa");
				$(this).children("td:nth-child(even)").css("background-color", "#f6f6f6");
			}
		}
	});
	
	$("input:radio[name=join_date]").on("click", function() {
		if ($(this).val() == 0) {
			$(".prd_text").attr("disabled", false);
		} else {
			$(".prd_text").attr("disabled", true);
		}
	});
	
	$("#srch_txt").on("keypress", function(event) {
		if (event.keyCode == 13) {
			$(".cmn_btn_ml").click();
			
			return false;
		}
	});
	
	$(".cmn_btn_ml").on("click", function() {
		$("#page").val("1");
		
		reloadList();
	});
	
	$(".func_btn").on("mouseenter", function() {
		if ($(this).attr("da") == "false") {
			$(this).css("cursor", "pointer");
		}
	});	
	$(".func_btn").on("mouseleave", function() {
		$(this).css("cursor", "default");
	});
	
	$("#inqry_btn").on("click", function() {
		if ($("#empNum").val() != "-1") {
			console.log($("#empNum").val());
			
			$("#i_menuNum").val("5");
			
 			$("#inqryForm").attr("action", "prsnlCard");
			$("#inqryForm").submit();
		}
	});
	
	$("#del_btn").click(function() {
		if ($("#empNum").val() != "-1") {
			
		}
	});
	
	$(".cont_area").on("click", ".popup #cnl_btn", function() {
		$(".popup_bg, .popup").fadeOut(function() {
			$(".popup_bg, .popup").remove();
		});
	});
	
	$(".cont_area").on("click", ".popup #cnfrm_btn", function() {
		$(".popup_bg, .popup").fadeOut(function() {
			$(".popup_bg, .popup").remove();
		});
	});
});

function reloadList() { // 목록 조회용 + 페이징 조회용
	$(".prd_text").attr("disabled", false);
	var params = $("#inqryForm").serialize();
	if ($("input[name=join_date]:checked").val() == "-1") {
		$(".prd_text").attr("disabled", true);
	}
	
	$.ajax({
		type : "post",
		url : "empInqryAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function drawList(list) {
	var html = "";
	
	if (list.length == 0) {
		html += "<tr class=\"table_item\">                 ";
		html += "<td colspan=\"9\">검색 결과가 없습니다.</td> "
		html += "</tr>                                     ";
	} else {
		for (var data of list) {
			html += "<tr class=\"table_item\" num=\"" + data.EMP_NUM + "\">                 ";
			html += "	<input type=\"hidden\" class=\"item_selected\" value=\"false\" />        ";
			html += "	<input type=\"hidden\" class=\"val_existed\" value=\"true\" />        ";
			html += "	<td><div class=\"td_cont\">" + data.EMP_NUM + "</div></td> ";
			html += "	<td><div class=\"td_cont\">" + data.EMP_NAME + "</div></td> ";
			html += "	<td><div class=\"td_cont\">" 
			if (data.DEPT_NAME != null) {
				html += data.DEPT_NAME;
			}
			html += "</div></td> ";
			html += "	<td><div class=\"td_cont\">" + data.RANK_NAME + "</div></td> ";
			html += "	<td><div class=\"td_cont\">" + data.MBL_NUM + "</div></td> ";
			html += "	<td><div class=\"td_cont\">" + data.JOIN_DATE + "</div></td> ";
			html += "	<td><div class=\"td_cont\">";
			if (data.HIRE_TYPE == 0) {
				html += "정규직";
			}
			else if (data.HIRE_TYPE == 1) {
				html += "계약직";
			}
			html += "</div></td> ";
			html += "	<td><div class=\"td_cont\">";
			if (data.WORK_TYPE == 0) {
				html += "재직";
			} else if (data.WORK_TYPE == 1) {
				html += "퇴사";
			}
			html += "</div></td> ";
			html += "	<td><div class=\"td_cont\">" + data.RSGNT_DATE + "</div></td> ";
			html += "</tr>                                     ";
		}
	}
	
	$("tbody").html(html);
}

function drawPaging(pb) {
	var html = "";

	html += "<div class=\"page_btn page_first\" page=\"1\">first</div>";
	
	if ($("#page").val() == 1) {
		html += "<div class=\"page_btn page_prev\" page=\"1\">prev</div>";
	} else {
		html += "<div class=\"page_btn page_prev\" page=\"" + ($("#page").val() * 1 - 1) + "\">prev</div>";
	}
	for (var i = pb.startPcount; i <= pb.endPcount; i++) {
		if ($("#page").val() == i) {
			html += "<div class=\"page_btn_on\" page=\"" + i + "\">" + i + "</div>";
		} else {
			html += "<div class=\"page_btn\" page=\"" + i + "\">" + i + "</div>";
		}
	}
	if ($("#page").val() == pb.maxPcount) {
		html += "<div class=\"page_btn page_next\" page=\"" + pb.maxPcount + "\">next</div>";
	} else {
		html += "<div class=\"page_btn page_next\" page=\"" + ($("#page").val() * 1 + 1) + "\">next</div>";
	}
	
	html += "<div class=\"page_btn page_last\" page=\"" + pb.maxPcount + "\">last</div>";
	
	$(".pgn_area").html(html);	
}

function btnSetting() {
	if ($("#inqry_btn").attr("da") == "true") {
		$("#inqry_btn").css("background-color", "#eeeeee");
		$("#inqry_btn").css("color", "#999999");
	} else {
		$("#inqry_btn").css("background-color", "#4B94F2");
		$("#inqry_btn").css("color", "#fff");
	}
	
	if ($("#add_btn").attr("da") == "true") {
		$("#add_btn").css("background-color", "#eeeeee");
		$("#add_btn").css("color", "#999999");
	} else {
		$("#add_btn").css("background-color", "#4B94F2");
		$("#add_btn").css("color", "#fff");
	}
	
	if ($("#del_btn").attr("da") == "true") {
		$("#del_btn").css("background-color", "#eeeeee");
		$("#del_btn").css("color", "#999999");
	} else {
		$("#del_btn").css("background-color", "#fe3a40");
		$("#del_btn").css("color", "#fff");
	}
}
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
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">사원조회</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="func_btn" id="del_btn" da="true">삭제</div>
			<div class="func_btn" id="add_btn" da="false">신규</div>
			<div class="func_btn" id="inqry_btn" da="true">조회</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<input type="hidden" id="old_srch_sel" value="${param.srch_sel}" />
			<input type="hidden" id="old_srch_txt" value="${param.srch_txt}" />
			<input type="hidden" id="old_work_clsftn" value="${param.work_clsftn}" />
			<input type="hidden" id="old_emplynt_type" value="${param.emplynt_type}" />
			<input type="hidden" id="old_join_date" value="${param.join_date}" />
			<input type="hidden" id="old_prd_start" value="${param.prd_start}" />
			<input type="hidden" id="old_prd_end" value="${param.prd_end}" />
			<form action="#" id="inqryForm" method="post">
				<input type="hidden" id="i_top" name="top" value="${param.top}" />
				<input type="hidden" id="i_menuNum" name="menuNum" value="${param.menuNum}" />
				<input type="hidden" id="i_menuType" name="menuType" value="${param.menuType}" />
				<input type="hidden" id="page" name="page" value="${page}" />
				<input type="hidden" id="empNum" name="empNum" value="-1" />
				<input type="hidden" id="superEmpNum" name="superEmpNum" value="${sEmpNum}" />
				<div class="srch_wrap">
					<div class="page_srch_area">
						<select class="srch_sel" name="srch_sel">
							<option value="-1" selected>전체</option>
							<option value="0">사원번호</option>
							<option value="1">사원명</option>
							<option value="2">부서명</option>
						</select>
						<div class="srch_text_wrap">
							<input type="text" id="srch_txt" name="srch_txt" value="${param.srch_txt}" />
						</div>
						<div class="cmn_btn_ml">검색</div>
					</div>
					<div class="srch_cndt_area">
						<div class="item_wrap" id="left_item_wrap">
							<div class="radio_wrap" id="work_clsftn">
								<div class="radio_title">재직구분</div>
								<input type="radio" id="work_clsftn_entr" name="work_clsftn" value="-1" checked="checked" /><label class="radio_item_name" for="work_clsftn_entr">전체</label>
								<input type="radio" id="work_clsftn_work" name="work_clsftn" value="0" /><label class="radio_item_name" for="work_clsftn_work">재직</label>
								<input type="radio" id="work_clsftn_rsgnt" name="work_clsftn" value="1" /><label class="radio_item_name" for="work_clsftn_rsgnt">퇴사</label>
							</div>
							<div class="radio_wrap" id="emplynt_type">
								<div class="radio_title">고용형태</div>
								<input type="radio" id="emplynt_type_entr" name="emplynt_type" value="-1" checked="checked" /><label class="radio_item_name" for="emplynt_type_entr">전체</label>
								<input type="radio" id="emplynt_type_rgl_wrk" name="emplynt_type" value="0" /><label class="radio_item_name" for="emplynt_type_rgl_wrk">정규직</label>
								<input type="radio" id="emplynt_type_cntr_wrk" name="emplynt_type" value="1" /><label class="radio_item_name" for="emplynt_type_cntr_wrk">계약직</label>
							</div>
						</div>
						<div class="item_wrap">
							<div class="radio_wrap" id="join_date">
								<div class="radio_title">입사일</div>
								<input type="radio" id="join_date_entr" name="join_date" value="-1" checked="checked" /><label class="radio_item_name" for="join_date_entr">전체</label>
								<input type="radio" id="join_date_prd_dsgnt" name="join_date" value="0" /><label class="radio_item_name" for="join_date_prd_dsgnt">기간지정</label>
							</div>
							<div class="prd_wrap">
								<div id="prd_wrap_empty"></div>
								<div class="prd_text_wrap">
									<input type="date" class="prd_text" id="prd_start" name="prd_start" disabled="disabled" />
								</div>
								<div class="prd_clsftn">~</div>
								<div class="prd_text_wrap">
									<input type="date" class="prd_text" id="prd_end" name="prd_end" disabled="disabled" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="rslt_wrap">
				<div class="rslt_area">
					<table id="srch_rslt">
					<colgroup>
						<col width="10%" />
						<col width="12%" />
						<col width="12%" />
						<col width="8%" />
						<col width="14%" />
						<col width="12%" />
						<col width="10%" />
						<col width="10%" />
						<col width="12%" />
					</colgroup>
						<thead>
							<tr>
								<th>사원번호</th>
								<th>사원명</th>
								<th>소속부서</th>
								<th>직급</th>
								<th>연락처</th>
								<th>입사일</th>
								<th>고용형태</th>
								<th>재직구분</th>
								<th>퇴사일</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
				<div class="pgn_area">

				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>