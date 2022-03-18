<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 130px;
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
	height: 50px;
}

.srch_table tr:nth-child(2) {
	height: 45px;
	border-top: 0.5px solid #d7d7d7;
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

.srch_msg {
	height: 20px;
	width: 305px;
	font-size: 12px;
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
/* 거래 횟수 이미지 */
.deal{
	height: 40px;
}
.deal_cnt{
	position:relative;
	top: -15px;
	right: -5px;
}

/* 상단 버튼 */
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
	
	reloadList();
	
	$("#pgn_area").on("click", "div", function() {
		$("#page").val($(this).attr("page"));

		reloadList();
	});
	
	$("#addBtn").on("click", function() {
		$("#actionForm").attr("action", "clntCmpnyReg");
		$("#actionForm").submit();
	});
});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "clntListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawPaging(res.pb);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
	
}

function drawList(list) {
	var html = "";
	
 	for(var data of list) {
 		html += "<tbody>";
		html += "<tr>";
		html += "<td rowspan=\"3\">" + data.RNUM + "</td>";
		html += "<td>" + data.CLNT_NUM + "</td>";
		html += "<td>" + data.DEPT + "/" + data.DUTY + "</td>";
		html += "<td>" + data.EMAIL + "</td>";
		html += "</tr>";
		html += "<tr>";
			<td>삼성전자</td>
			<td>김호구</td>
			<td>010-1234-5678</td>
		</tr>
		<tr></tr>	
	</tbody>
	}
	
	$(".list_table").html(html);

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
			<div class="page_title_text">고객 목록</div>
			<!-- 검색영역 선택적 사항 -->

		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="bodyWrap">
				<div class="tLine"></div>
				<!-- class="sts" end -->

				<!-- srch_table -->
				<table class="srch_table">

					<colgroup>
						<col width="90" />
						<col width="60" />
						<col width="40" />
						<col width="60" />
						<col width="60" />
						<col width="60" />
						<col width="60" />
						<col width="60" />
						<col width="0" />
						<col width="55" />
					</colgroup>
					<tbody>
						<tr>
							<td><span class="srch_name">검색어</span></td>
							<td><select>
									<option>선택안함</option>
									<option>고객명</option>
									<option>고객사명</option>
									<option>고객번호</option>
							</select></td>
							<td colspan="3"><input type="text" class="srch_msg"
								placeholder="검색 조건을 선택한 후 입력해주세요." /></td>
							<td colspan="5"><span class="cmn_btn">검색</span></td>
						</tr>
						<tr>
							<td><span class="srch_name">정렬</span></td>
							<td><select>
									<option selected="selected">선택안함</option>
									<option>고객명</option>
									<option>고객사명</option>
							</select></td>
							<td><img class="asc_btn cmn_btn" alt="등록버튼"
								src="resources/images/sales/asc.png" /></td>
							<td colspan="7"></td>
						</tr>
					</tbody>
				</table>
				<div class="SearchResult">
					<h3>고객 (검색결과: 83건)</h3>
				</div>
				<!-- list_table -->
				<table class="list_table">
					<!-- col=4 -->
					<colgroup>
						<col width="70">
						<col width="90">
						<col width="150">
						<col width="150">
					</colgroup>
					<thead>
						<tr>
							<th rowspan="2">글번호</th>
							<th>고객번호</th>
							<th>부서 / 직책</th>
							<th>이메일</th>
						</tr>
						<tr>
							<th>고객사명</th>
							<th>고객명</th>
							<th>전화번호</th>
						</tr>
						<tr></tr>
					</thead>
				</table>
				<div class="body_bottom">
					<div class="board_bottom">
						<div class="pgn_area"></div>
						<div class="cmn_btn" id="addBtn">등록</div>
					</div>
				</div>
			</div>
		</div>
			<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>