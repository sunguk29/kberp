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
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
tbody img {
	width: 12px;
}


</style>
<script type="text/javascript">
$(document).ready(function() {
	reloadList();
	
	if('${param.searchGbn}' != '') {
		$("#searchGbn").val('${param.searchGbn}');
	} else {
		$("#oldSearchGbn").val("0");
	}
	
	$("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click();
				
			return false;
		}
	});
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		
		$("#oldSearchGbn").val($("#searchGbn").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		
		// 목록 조회
		reloadList();
	});
	
	$("tbody").on("click", "tr", function() {
		$("#no").val($(this).attr("no"));
		
		$("#actionForm").attr("action", "inqry");
		$("#actionForm").submit();
		
	});
	
	$("#paging_wrap").on("click", "span", function() {
		$("#page").val($(this).attr("page"));
		
		reloadList();
	});
	
	$("#writeBtn").on("click", function () {
		
		$("#actionForm").attr("action", "inqryAdd");
		$("#actionForm").submit();
	});
	
	
});
function reloadList() { // 목록 조회용 + 페이징 조회용
	var params =  $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "inqryListAjax", 
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
	
	for(var data of list) {
		html += "<tr no=\"" + data.INQRY_NUM + "\">";
		html += "<td>" + data.INQRY_NUM + "</td>";
		html += "<td>" + data.CTGRY_NUM + "</td>";
		html += "<td>";
		html += data.WRTNG_TITLE;
		if(data.ATT_FILE != null) {
			html += "<img src=\"resources/images/CS/attFile.png\" />";
		}
		html += "</td>";
		html += "<td>" + data.CLNT_NUM + "</td>";
		html += "<td>" + data.WRTNG_DATE + "</td>";
		html += "<td>" + data.ANSR + "</td>";
		html += "</tr>";
	}
	$("tbody").html(html);
}

function drawPaging(pb) {
	var html = "";
	
	html += "<span page=\"1\">처음</span>";
	
	if($("#page").val() == "1") {
		html += "<span page=\"1\">이전</span>";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 - 1) + "\">이전</span>";
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<span page=\"" + i + "\"><b>" + i + "</b></span>";
		} else {
			html += "<span page=\"" + i + "\">" + i + "</span>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<span page=\"" + pb.maxPcount + "\">다음</span>";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>";
	}
	
	html += "<span page=\"" + pb.maxPcount + "\">마지막</span>";
	
	$("#paging_wrap").html(html);
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
	<input type="hidden" id="oldSearchGbn" value="${param.searchGbn}" />
	<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}" />
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="no" name="no" />
		<input type="hidden" id="page" name="page" value="${page}" />
	</form>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">1:1 문의</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">
				<select class="srch_sel" id="searchGbn" name="searchGbn">
					<option value="0">제목</option>
					<option value="1">작성자</option>
				</select>
				<div class="srch_text_wrap">
					<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}"/>
				</div>
				<div class="cmn_btn_ml" id="searchBtn">검색</div>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="board_table">
				<colgroup>
					<col width="50"/>
					<col width="150"/>
					<col width="450"/>
					<col width="100"/>
					<col width="100"/>
					<col width="100"/>
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>답변상태</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area">
					<div class="page_btn page_first">first</div>
					<div class="page_btn page_prev">prev</div>
					<div class="page_btn_on">1</div>
					<div class="page_btn">2</div>
					<div class="page_btn">3</div>
					<div class="page_btn">4</div>
					<div class="page_btn">5</div>
					<div class="page_btn page_next">next</div>
					<div class="page_btn page_last">last</div>
				</div>
				<div class="cmn_btn_ml">글쓰기</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>