<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리드관리</title>
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

/* sts */
.sts {
	display: inline-block;
	width: 100%;
	height: 30px;
	text-align: center;
	margin-top: 10px;
}

.sts_list {
	display: inline-block;
	vertical-align: middle;
	width: 135px;
	margin: 0 30px;
	padding: 8px 5px;
	font-size: 10pt;
	text-align: center;
	background-color: #f2f2f2;
	border-radius: 5px;
}

.sts_list:hover {
	font-weight: bold;
	cursor: pointer;
	background-color: #F2B705;
}

.sts_list:active {
   width: 130pxpx;
   margin: 0 30px;
   padding: 8px 5px;
   background-color: #F2CB05;
   cursor: pointer;
   font-weight: bold;
}

.tLine{
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
	border : 1px solid #858585;
	height: 22px;
	width: 160px;
	border-radius : 1px;
	text-align: right;
}
.findEmp_box:hover {
	cursor: pointer;
}
.findEmp_box:active {
	background-color : white;
	outline : 1.5px solid #222222;
}
.userIcon{
	height: 15px;
	margin-top: 3px;
	margin-right : 5px;
}
/*---------  검색결과 : n건 --------- */
.SearchResult { /* 영업기회 검색결과 */
	width: 927px;
	font-size: 11pt;
	text-align: left;
	margin-top: 30px;
}
/********** list_table **********/
.list_table {
	border-collapse: collapse;
	background-color: #FFF;
	width: 100%;
	font-size: 10.5pt;
	text-align: left;
	margin: 10px 0px 40px 0px;
}

.list_table thead th {
	height: 25px;
	font-size: 10pt;
	font-weight: bold;
	/* border-top: 2px solid gray; */
}

.list_table thead tr:nth-child(1) {
	border-top: 2px solid gray;
}

.list_table thead tr:nth-child(3) {
	border-bottom: 1.5px solid gray;
}

.list_table thead tr {
	border-bottom: none;
}

.list_table tbody td {
	height: 30px;
	font-size: 11pt;
}

.list_table tbody tr:nth-child(3) {
	border-bottom: 1.5px solid #d7d7d7;
}
/* 글번호 */
.list_table thead tr:nth-child(1) th:nth-child(1), .list_table tbody tr:nth-child(1) td:nth-child(1)
	{
	text-align: center;
}
/* 상품명 */
.list_table tbody tr:nth-child(2) td:nth-child(2) {
	font-weight: 700;
	font-size: 12pt;
}
.list_table tbody tr:nth-child(2) td:nth-child(2):hover {
	color: #4b94f2;
	cursor: pointer;
	text-decoration: underline;
}
/* 판매 가능 버튼 */
.sales_psbl_btn {
	display: inline-block;
	vertical-align: top;
	padding: 0px 10px;
	min-width: 30px;
	height: 30px;
	margin-left: 10px;
	line-height: 30px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
	background-color: #4b94f2;
	border-radius: 2px;
	color: #f2f2f2;
	cursor: pointer;
}

.sales_psbl_btn:active {
	background-color: #2e83f2;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	// 목록 조회
	reloadList();
	
	$(".list_table tbody").on("click", "tr", function() {
		$("#no").val($(this).attr("no"));
		
		$("#actionForm").attr("action", "lead");
		$("#actionForm").submit();
	});
	
	$("#pgn_area").on("click", "div", function() {
		
		$("#page").val($(this).attr("page"));
		
		reloadList();
		
	});
	
	$(".cmn_btn").on("click", function() {
		
		$("#actionForm").attr("action", "leadAdd")
		$("#actionForm").submit();
	});
}); 

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "leadListAjax",
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
//리스트
function drawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<tr no=\"" + data.LEAD_NUM + "\">";
		html += "<td rowspan=\"3\">" + data.LEAD_NUM + "</td>";
		html += "<td>" + LD + data.LEAD_NUM + "</td>";
		html += "<td>" + CLNT_CMPNY_NAME / CLNT_NAME + "</td>";
		html += "<td></td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td>" + EMP_NAME + "</td>";
		html += "<td>" + LEAD_NAME + "</td>";
		html += "<td><span class=\"sales_psbl_btn\"> 50 % </span></td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td>" + PRGRS_STS_NUM + "</td>";
		html += "<td>" + RGSTRTN_DATE + "</td>";
		html += "<td></td>";
		html += "</tr>";
	}
	
	$(".list_table tbody").html(html);
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
			html += "<div class=\"page_btn_on\">" + i + "</div>";
		} else {
			html += "<div class=\"page_btn\">" + i + "</div>";
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
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="page" name="page" value="${page}" />
	<input type="hidden" id="no" name="no" />
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
				<div class="page_title_text">리드 목록</div>
			</div>
			<!-- page_title_bar end -->
			<!-- 해당 내용에 작업을 진행하시오. -->
			<div class="cont_area">
				<!-- 여기부터 쓰면 됨 -->
					<!-- 검색영역 -->
					<div class="bodyWrap">
						<!-- sts : 상품현황 -->
						<div class="sts">
							<div class="sts_list">전체 : 390건</div>
							<div class="sts_list">진행중 : 252건</div>
							<div class="sts_list">영업기회 전환 : 123건</div>
							<div class="sts_list">실패: 15건</div>
						</div>
						<div class="tLine"></div>
						<!-- class="sts" end -->

						<!-- srch_table -->
						<table class="srch_table">
							<colgroup>
								<col width="80" />
								<col width="60" />
								<col width="40" />
								<col width="60" />
								<col width="60" />
								<col width="90" />
								<col width="60" />
								<col width="30" />
								<col width="10" />
								<col width="55" />
							</colgroup>
							<tbody>
								<!-- col=10 -->							
								<tr>
									<td>
										<span class="srch_name">가능 여부</span>
									</td>
									<td colspan="9">
										<label><input type="checkbox" name="sales_sts" value="1" checked="checked" />전체</label> 
										&nbsp;
										<label><input type="checkbox" name="sales_sts" value="2" />0% ~ 20%</label> 
										&nbsp;
										<label><input type="checkbox" name="sales_sts" value="3" />21% ~ 40%</label> 
										&nbsp;
										<label><input type="checkbox" name="sales_sts" value="3" />41% ~ 60%</label>
										&nbsp;
										<label><input type="checkbox" name="sales_sts" value="3" />61% ~ 80%</label>
										&nbsp;
										<label><input type="checkbox" name="sales_sts" value="3" />81% ~ 100%</label>
									</td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">진행 상태</span>
									</td>
									<td>
										<select>
											<option>선택안함</option>
											<option>진행중</option>
											<option>종료(영업기회 전환)</option>
											<option>종료(영업기회 실패)</option>
										</select>
									</td>
									<td>
										<span class="srch_name_noMgn">담당자</span>
									</td>
									<td colspan="7">
										<div class="findEmp_box">
											<img class="userIcon" src="resources/images/sales/usericon.png">
										</div>										
									</td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">기간</span>
									</td>
									<td>
										<select>
											<option selected="selected">리드등록일</option>
										</select>
									</td>
									<td colspan="8">
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
									<td colspan="8">
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
										<select>
											<option>선택안함</option>
											<option>리드명</option>
											<option>고객사명</option>
											<option>담당자명</option>
											<option>리드번호</option>
										</select>
									</td>
									<td colspan="4">
										<input type="text" class="srch_msg" placeholder="검색 조건을 선택한 후 입력해주세요." />
									</td>
									<td>
										<span class="cmn_btn">검색</span>
									</td>
									<td colspan="3"></td>
								</tr>
								<tr>
									<td>
										<span class="srch_name">정렬</span>
									</td>
									<td>
										<select>
											<option selected="selected">선택안함</option>
											<option>등록일</option>
											<option>리드명</option>
											<option>고객사명</option>
										</select>
									</td>
									<td>
										<img class="asc_btn cmn_btn" alt="등록버튼" src="resources/images/sales/asc.png" />
									</td>
									<td colspan="7"></td>
								</tr>
							</tbody>
						</table>
						<div class="SearchResult"><h3>리드 (검색결과: 390건)</h3></div>
						<!-- list_table -->
						<table class="list_table">
							<!-- col=4 -->
							<colgroup>
								<col width="70">
								<col width="100">
								<col width="290">
								<col width="80">
							</colgroup>
							<thead>
								<tr>
									<th rowspan="3">글번호</th>
									<th>리드번호</th>
									<th>고객사명 / 고객명</th>
									<th></th>
								</tr>
								<tr>
									<th>담당자</th>
									<th>리드명</th>
									<th>가능 여부</th>
								</tr>
								<tr>
									<th>진행상태</th>
									<th>등록일</th>
									<th></th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
						<div class="body_bottom">
							<div class="board_bottom">
								<div class="pgn_area"></div>
								<div class="cmn_btn"> 등록</div>
							</div>
						</div>
					</div>
				</div>
				<!-- class="body" end -->
			</div>
<!-- bottom -->
<c:import url="/bottom"></c:import>
</body>
</html>