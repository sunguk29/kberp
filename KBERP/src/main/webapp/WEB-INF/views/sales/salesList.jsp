<!-- 
	영업기회 목록
 -->
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업관리</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1013px;
}
/* 개인 작업 영역 */
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
/* ------- 영업기회 진행단계 선택박스 --------  */
.stageM { /* 영업기회별 단계 박스 */
	width: 927px;
	height: 35px;
	display: block;
}

.stage { /* 영업기회 이름  */
	width: 134.5px;
	margin: 0px 43px;
	padding: 8px 5px;
	background-color: #F2F2F2;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	font-size: 10pt;
	text-align: center;
	display: inline-block;
	vertical-align: middle;
}

.stage:hover {
	font-weight: bold;
	background-color: #F2B705;
	cursor: pointer;
}

.stage:active {
	width: 134.5px;
	margin: 0px 43px;
	padding: 8px 5px;
	background-color: #F2CB05;
	cursor: pointer;
	font-weight: bold;
}

.tLine {
	background-color: #4B94F2;
	width: 927px;
	height: 3px;
	margin: 10px auto;
}
/********** srch_table **********/
.srch_table {
	border-collapse: collapse;
	background-color: #f2f2f2;
	width: 100%;
	font-size: 10.5pt;
	text-align: left;
	margin: 10px 0px;
}

.srch_table tr {
	height: 40px;
}

.srch_table tr:nth-child(6) {
	height: 41.5px;
	border-top: 1.5px solid #d7d7d7;
}

.asc_btn {
	width: 30px;
	height: 25px;
}

.asc_btn:hover {
	cursor: pointer;
}

select {
	height: 23px;
	width: 150px;
	font-size: 12px;
}

.srch_name {
	margin: 0px 10px 0px 20px;
	font-weight: bold;
}

.srch_name_noMgn {
	margin: 0px 0px;
	font-weight: bold;
}

.srch_msg {
	height: 20px;
	width: 305px;
	font-size: 12px;
}
/* 직원검색 */
.findEmp_box {
	background-color: white;
	border: 1px solid #858585;
	height: 22px;
	width: 147px;
	border-radius: 1px;
	text-align: right;
}

.findEmp_box:hover {
	cursor: pointer;
}

.findEmp_box:active {
	background-color: white;
	outline: 1.5px solid #222222;
}

.userIcon {
	height: 15px;
	margin-top: 3px;
	margin-right: 5px;
}

/*---------  영업기회 검색결과 : n건 --------- */
.SearchResult { /* 영업기회 검색결과 */
	width: 927px;
	font-size: 11pt;
	text-align: left;
	margin-top: 30px;
}
/*---------- 영업기회 박스 ------------  */
.salesOpportunityName { /* 영업기회명 */
	width: 725px;
	height: 25px;
	line-height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	margin: 13px 5px;
	display: inline-block;
	vertical-align: top;
}

.salesOpportunityName:hover { /* 영업기회명-hover */
	color: #2E83F2;
	cursor: pointer;
}

.opt { /* 영업기회 버튼 */
	display: inline-block;
	width: 25px;
	height: 25px;
	background-image: url("resources/images/sales/option.png");
	background-size: 100%;
	background-repeat: no-repeat;
	margin: 10px 5px;
	cursor: pointer;
}

.salesOpportunity { /* 영업기회박스 */
	width: 925px;
	height: 140px;
	border: 1px solid #F2F2F2;
	display: block;
	background-color: #F2F2F2;
	margin-bottom: 10px;
}

.lastSalesOpportunity {
	margin-bottom: 40px;
}

.sledding { /* 진행상태 */
	width: 130px;
	height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	text-align: center;
	line-height: 25px;
	color: #2E83F2;
	margin: 13px 5px;
	display: inline-block;
	vertical-align: top;
	border: 1px solid #2E83F2;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

.cliimg { /* 고객사 이미지 */
	display: inline-block;
	width: 20px;
	height: 25px;
	background-image: url("resources/images/sales/client.png");
	background-size: 100%;
	background-repeat: no-repeat;
	margin: 13px 0px 13px 10px;
}

.client { /* 고객사/고객  */
	width: 200px;
	height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	line-height: 25px;
	margin: 13px 5px 13px 0px;
	padding-left: 3px;
	display: inline-block;
	vertical-align: top;
}

.fs { /* 예상매출액 */
	width: 250px;
	height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	line-height: 25px;
	margin: 13px 5px 13px 0px;
	display: inline-block;
	vertical-align: top;
}

.pic { /* 담당자 */
	width: 150px;
	height: 25px;
	font-size: 10.5pt;
	font-weight: bold;
	line-height: 25px;
	margin: 13px 5px 13px 0px;
	display: inline-block;
	vertical-align: top;
}
/* ------ 영업기회 파이프라인 테이블 ------ */
table {
	font-size: 10pt;
	text-align: center;
	border: none;
	padding-left: 70px;
}

.colNum1 {
	width: 200px;
	background-color: #F2CB05;
	border: none;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	cursor: pointer;
}

.colNum1 { /* 단계별 파이프라인 그라데이션 */
	background: linear-gradient(90deg, #FFE65A, #FFE150);
}


.colNum1:active {
	font-weight: bold;
	color: #4B94F2;
	cursor: pointer;
}

.colNum1:hover {
	font-weight: bold;
	cursor: pointer;
}

.stick1, .stick2, .stick3, .stick4, .stick5, .stick6 { /* 막대기 color */
	width: 38px;
	border: none;
}

.stick1 {
	background-color: #FFE150;
}

.stick2 {
	background-color: #FFDC46;
}

.stick3 {
	background-color: #FFD232;
}

.stick4 {
	background-color: #FFC81E;
}

.stick5 {
	background-color: #FFC314;
}

.stick6 {
	background-color: #F2B705;
}

.a {
	width: 38px;
	border: none;
	background-color: #F2F2F2;
}

.boldSts {
	color: #2E83F2;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	// 검색 후 구분란(searchGbn)에 검색어유지를 위해
	if('${param.searchGbn}' != '') {
		$("#searchGbn").val('${param.searchGbn}');
	} else {
		$("#oldSearchGbn").val("0");
	}
	
	// 목록 조회
	reloadList();
	
	// 검색
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		
		$("#oldSearchGbn").val($("#searchGbn").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		
		reloadList();
	})
	
	$("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click();
			
			return flase; // event 실행 않도록.
		}
	});
	
	// stage 클릭
	//$("#stage0").on("click", function() {
		
	//});
	
	// 목록에서 영업명 선택 시 상세보기로 이동
	
	
	
	$(".salesWrap").on("click", ".salesOpportunityName", function() {
		$("#salesNum").val($(this).attr("salesNum")); // 영업번호 가져오기
		
		console.log($(this).children("#test").val());
		
		if($(this).children("#test").val() == "영업기회") {
			$("#actionForm").attr("action", "sales1SalesChncCont"); // 영업기회 상세보기로 이동.
			$("#actionForm").submit();
		} else if($(this).children("#test").val() == "제안") {
			$("#actionForm").attr("action", "sales2SgstnCont"); // 제안 상세보기로 이동.
			$("#actionForm").submit();
		} else if($(this).children("#test").val() == "견적") {
			$("#actionForm").attr("action", "sales3QntCont"); // 견적 상세보기로 이동.
			$("#actionForm").submit();
		}  else if($(this).children("#test").val() == "계약") {
			$("#actionForm").attr("action", "sales4CntrctCont"); // 계약 상세보기로 이동.
			$("#actionForm").submit();
		} else if($(this).children("#test").val() == "종료(성공)") {
			$("#actionForm").attr("action", "sales4CntrctCont"); // 계약 상세보기로 이동.
			$("#actionForm").submit();
		} else if($(this).children("#test").val() == "종료(실패)") {
			
			$("#actionForm").attr("action", "sales4CntrctCont"); // 여기는 어디로 이동?? if로...처리?
			$("#actionForm").submit();
		} 
		
	});
	
	// 페이징
	$(".pgn_area").on("click", "div", function() {
		$("#page").val($(this).attr("page"));
		
		reloadList();
	});
	
	// *추후변경:리드에서 영업기회로 전환하면 영업기회등록화면(sales1SalesChncReg)으로 이어지게...
	$("#addBtn").on("click", function() {
		$("#actionForm").attr("action", "sales1SalesChncReg");
		$("#actionForm").submit();
	});
	
});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "salesListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawList(res.list);
			drawPaging(res.pb);
			drawRsltCnt(res.RsltCnt);
			drawCnt(res.stage0, res.stage1, res.stage2, res.stage3);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function drawCnt(stage0, stage1, stage2, stage3) {
	var html = "";
	
	html += "<div class=\"stage\" id=\"stage0\">영업기회 : " + stage0 + "건</div>";
	html += "<div class=\"stage\" id=\"stage1\">제안 : " + stage1 + "건</div>";
	html += "<div class=\"stage\" id=\"stage2\">견적 : " + stage2 + "건</div>";
	html += "<div class=\"stage\" id=\"stage3\">계약 : " + stage3 + "건</div>";
	
	$(".stageM").html(html);
}

function drawRsltCnt(RsltCnt) {
	var html = "";
	
	html += "<h3>";
	html += "영업관리 (검색결과: " + RsltCnt + "건)";
	html += "</h3>";
	
	$(".SearchResult").html(html);
}


function drawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<div class=\"salesOpportunity\">";
		html += "<div class=\"sledding\">" + data.PRGRS_STS + "</div>";
		html += "<div class=\"salesOpportunityName\" salesNum = \"" + data.SALES_NUM + "\">" + data.LEAD_NAME + "<input type=\"hidden\" id=\"test\" value=\"" + data.PRGRS_STS2 + "\" /></div>";
		html += "<div class=\"opt\"></div>";
		html += "<table cellspacing=\"0\">";
		html += "<colgroup>";
		html += "<col width=\"120\">";
		html += "<col width=\"25\">";
		html += "<col width=\"120\">";
		html += "<col width=\"25\">";
		html += "<col width=\"120\">";
		html += "<col width=\"25\">";
		html += "<col width=\"120\">";
		html += "<col width=\"25\">";
		html += "<col width=\"120\">";
		html += "<col width=\"25\">";			
		html += "<col width=\"120\">";						
		html += "</colgroup>";
		html += "<tbody>";
		
		/* 현재 단계 굵게 표시 */

		html += "<tr height=\"10\">";
		if(data.PRGRS_STS2 == "영업기회") {
			html += "<td class=\"colNum1 boldSts\" rowspan=\"3\"><b>영업기회</b></td>";
		} else {
			html += "<td class=\"colNum1\" rowspan=\"3\">영업기회</td>";
		}
		html += "<td class=\"a\"></td>";
		if(data.PRGRS_STS2 == "제안") {
			html += "<td class=\"colNum1 boldSts\" rowspan=\"3\"><b>제안</b></td>";
		} else {
			html += "<td class=\"colNum1\" rowspan=\"3\">제안</td>";
		}
		html += "<td class=\"a\"></td>";
		if(data.PRGRS_STS2 == "견적") {
			html += "<td class=\"colNum1 boldSts\" rowspan=\"3\"><b>견적</b></td>";
		} else {
			html += "<td class=\"colNum1\" rowspan=\"3\">견적</td>";
		}
		html += "<td class=\"a\"></td>";
		if(data.PRGRS_STS2 == "계약") {
			html += "<td class=\"colNum1 boldSts\" rowspan=\"3\"><b>계약</b></td>";
		} else {
			html += "<td class=\"colNum1\" rowspan=\"3\">계약</td>";
		}
		html += "</tr>";
		html += "<tr height=\"10\">";
		html += "<td class=\"stick1\"></td>";
		html += "<td class=\"stick2\"></td>";
		html += "<td class=\"stick3\"></td>";
		html += "</tr>";
		html += "<tr height=\"10\">";
		html += "<td class=\"a\"></td>";
		html += "<td class=\"a\"></td>";
		html += "<td class=\"a\"></td>";
		html += "</tr>";
		html += "</tbody>";
		html += "</table>";
		html += "<div class=\"cliimg\"></div>";
		html += "<div class=\"client\">" + data.CLNT_CMPNY_NAME + " / " + data.CLNT_NAME + "</div>";
		if(data.EXPCTN_LOAN_SCALE == null) {
			html += "<div class=\"fs\">예상매출 : 0원</div>";
		} else {
			html += "<div class=\"fs\">예상매출 : " + data.EXPCTN_LOAN_SCALE + "원</div>";
		}
		html += "<div class=\"pic\">" + data.EMP_NAME + "</div>";
		html += "<br>";
		html += "</div>";
	}
	$(".salesWrap").html(html);
}

function drawPaging(pb) {
	var html = "";
	
	html += "<div page=\"1\" class=\"page_btn page_first\">first</div>";
	
	if($("#page").val() == "1") {
		html += "<div page=\"1\" class=\"page_btn page_prev\">prev</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</div>";
	}
	<!-- 현재페이지 굵게 표시 : _on -->
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div page=\"" + i +"\" class=\"page_btn_on\">" + i + "</div>";
		} else {
			html += "<div page=\"" + i +"\" class=\"page_btn\">" + i + "</div>";
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

</script>
</head>
<body>
<!-- 검색 데이터 유지용 -->
<!-- 머지 테스트 -->
<input type="hidden" id="oldSearchGbn" value="${param.searchGbn}" />
<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}" />

	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="page" name="page" value="${page}" />
		<input type="hidden" name="top" value="${param.top}" />
		<input type="hidden" name="menuNum" value="${param.menuNum}" />
		<input type="hidden" name="menuType" value="${param.menuType}" />
		<input type="hidden" id="salesNum" name="salesNum" /> <!-- 상세보기 갈 때 필요 -->
		
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
			<div class="page_title_text">영업관리 목록</div>
			<!-- 검색영역 선택적 사항 -->
		</div>

		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<div class="body">
				<div class="bodyWrap">
					<div class="stageM"></div>
					<div class="tLine"></div>
					<table class="srch_table">

						<colgroup>
							<col width="100" />
							<col width="180" />
							<col width="70" />
							<col width="270" />
							<col width="190" />

						</colgroup>
						<tbody>
							<!-- col=5 -->
							<tr>
								<td>
									<span class="srch_name">팀 분류</span>
								</td>
								<td>
									<select>
										<option>선택안함</option>
										<option>영업 1팀</option>
										<option>영업 2팀</option>
										<option>영업 3팀</option>
										<option>영업 4팀</option>
										<option>영업 지원팀</option>
									</select>
								</td>

								<td>
									<span class="srch_name_noMgn">담당자</span>
								</td>
								<td colspan="2">
									<div class="findEmp_box">
										<img class="userIcon" src="resources/images/sales/usericon.png">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">진행 단계</span>
								</td>
								<td>
									<select id="prgrsStage" name="prgrsStage">
										<option value="9">선택안함</option>
										<option value="0">영업기회</option>
										<option value="1">제안</option>
										<option value="2">견적</option>
										<option value="3">계약</option>
									</select>
								</td>

								<td>
									<span class="srch_name_noMgn">완료 여부</span>
								</td>
								<td colspan="2">
									<select>
										<option>선택안함</option>
										<option>진행중</option>
										<option>종료(성공)</option>
										<option>종료(실패)</option>
									</select>
								</td>
							</tr>

							<tr>
								<td>
									<span class="srch_name">기간</span>
								</td>
								<td>
									<select>
										<option selected="selected">영업기회등록일</option>
									</select>
								</td>
								<td colspan="3">
									<input type="button" value="어제" />
									<input type="button" value="오늘" />
									<input type="button" value="일주일 전" />
									<input type="button" value="1개월 전" />
									<input type="button" value="3개월 전" />
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td colspan="3">
									<input type="date" />
									~
									<input type="date" />
								</td>

							</tr>
							<tr>
								<td>
									<span class="srch_name">검색어</span>
								</td>
								<td>
									<select id="searchGbn" name="searchGbn">
										<option value="9">선택안함</option>
										<option value="0">고객사명</option>
										<option value="1">영업명</option>
										<option value="2">영업기회번호</option>
									</select>
								</td>
								<td colspan="2">
									<input type="text" class="srch_msg" id="searchTxt" name="searchTxt" value="${param.searchTxt}" placeholder="검색 조건을 선택한 후 입력해주세요." />
								</td>
								<td>
									<span class="cmn_btn" id="searchBtn">검색</span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">정렬</span>
								</td>
								<td>
									<select>
										<option selected="selected">영업명</option>
										<option>고객사명</option>
										<option>예상매출</option>
										<option>시작일</option>
									</select>
								</td>
								<td>
									<img class="asc_btn cmn_btn" alt="등록버튼" src="resources/images/sales/asc.png" />
								</td>
								<td colspan="3"></td>
							</tr>
						</tbody>
					</table>
					<div class="SearchResult"></div>
					<div class="salesWrap"></div>
					<div class="body_bottom">
						<div class="board_bottom">
							<div class="pgn_area"></div>
							<div class="cmn_btn" id="addBtn">등록</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- cont_area end -->
	</div>
	<!-- cont_wrap end -->
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>