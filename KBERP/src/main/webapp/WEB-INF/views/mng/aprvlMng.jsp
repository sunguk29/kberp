<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP Sample</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">

 tbody td:nth-child(3):hover {
 	text-decoration: underline;
 	cursor: pointer;
 }

th {
	font-size: 11pt;
}

.cont_wrap {
	width: 900px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	if('${param.searchGbn}' != '') { // 넘어오는 값을 확인해서 비어있지 않다면 검색구분을 유지
		$("#searchGbn").val('${param.searchGbn}');
	} else {
		$("#searchGbn").val("0");
	}
	
	reloadList();
	
	$("#searchTxt").on("keypress", function(event){
		if(event.keyCode == 13) {	
			$("#searchBtn").click();
			
			return false;
		}
	});
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		
		$("#oldSearchGbn").val($("#searchGbn").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		reloadList();
	});

	$("tbody").on("click", "#click", function() {
		$("#no").val($(this).attr("no"));
		
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		$("#actionForm").attr("action", "aprvlMngDtlView");
		$("#actionForm").submit();
	});
	
	$("#paging_wrap").on("click", "span", function() {
		$("#page").val($(this).attr("page"));
		
		
		reloadList();
	});	
});

function reloadList() { // 목록 조회용 + 페이징 조회용
	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post", 
		url : "parvlMngAjax", 
		dataType : "json",
		data : params, 
		success : function(res) { 
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
				},
		error : function(result, status, error) {
			console.log(result.responseText);

		}
	});
}

function drawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<tr num=\""+ data.RSVTN_NUM + "\">";
		html += "<td>" + data.RSVTN_NUM + "</td>";
		html += "<td>" + data.FCLTY_NUM + "</td>";
		html += "<td id=\"click\">" + data.FCLTY_NAME + "</td>";
		html += "<td>" + data.RSVTN_DATE + "</td>";
		html += "<td>" + data.EMP_NAME + "</td>";
		html += "<td>" + data.TIME_DVSN_NUM + "</td>";
		html += "</tr>";
	}
	$("tbody").html(html);
}

function drawPaging(pb) {
	var html = "";
	
	html += "<span page=\"1\" class=\"page_btn page_first\">first</span>";
	
	if($("#page").val() == "1") {
		html += "<span page=\"1\" class=\"page_btn page_prev\">prev</span>";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 - 1) + "\" class=\"page_btn page_prev\">prev</span>";
	}
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<span class=\"page_btn_on\">" + i + "</span>";
		} else {
			html += "<span class=\"page_btn\">" + i + "</span>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<span page=\"" + pb.maxPcount + "\" class=\"page_btn page_next\">next</span>";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 + 1) + "\" class=\"page_btn page_next\">next</span>";
	}
	
	html += "<span page=\"" + pb.maxPcount + "\" class=\"page_btn page_last\">last</span>";
	
	$(".pgn_area").html(html);
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
<input type="hidden" id="oldSearchGbn" value="${param.searchGbn}"/>
<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}"/>
	
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">승인관리</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">
				<form action="#" id="actionForm" method="post">
					<input type="hidden" id="no" name="no"/>
					<input type="hidden" id="page" name="page" value="${page}"/>
					<select id="searchGbn" name="searchGbn">
						<option value="0">예약코드</option>
						<option value="1">시설물명</option>
					</select>
					<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}"/>
					<input class="cmn_btn_ml" type="button" value="검색" id="searchBtn"/>
				</form>	
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="board_table">
				<colgroup>
					<col width="100"/>
					<col width="150"/>
					<col width="150"/>
					<col width="150"/>
					<col width="150"/>
					<col width="150"/>
					<col width="50"/>
					
				</colgroup>
				<thead>
					<tr>
						<th>예약코드</th>
						<th>시설물코드</th>
						<th>시설물 명</th>
						<th>신청자</th>
						<th>사용 날짜</th>
						<th>사용 시간</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<div>
			<div class="board_bottom">
				<div class="pgn_area"></div>
			</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>