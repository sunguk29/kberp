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
tbody tr{
	cursor: pointer;	
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	if('${param.searchGbn}' != '') {
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
	
	$("#searchBtn").on("click",function(){	
		$("#page").val("1");
		
		$("#oldSearchGbn").val($("#searchGbn").val());
		$("#oldSearchTxt").val($("#searchTxt").val());
		
		reloadList();
		
	});
	$(".pgn_area").on("click","div",function(){
		$("#page").val($(this).attr("page"));
		
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		reloadList();
	});
	$("#add_btn").on("click",function(){
		$("#searchGbn").val($("#oldSearchGbn").val());
		$("#searchTxt").val($("#oldSearchTxt").val());
		
		$("#actionForm").attr("action","fcltAdd");
		$("#actionForm").submit();		
	});
});
function reloadList() { //목록 조회용 + 페이징 조회용
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "fcltAjax",
		dataType : "json",
		data : params,
		success : function(res){ 
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request, status, error){
			console.log(request.responseText);
		}
	});
}
function drawList(list){
	var html = "";
	
	for(var data of list){
		html += "<tr no=\"" + data.FCLTY_NUM + "\">";
		
		html += "<td>" + data.FCLTY_NUM + "</td>";
		html += "<td>" + data.FCLTY_NAME + "</td>";
		html += "<td>" + data.PLACE + "</td>";
		html += "<td>" + data.EMP_NAME + "</td>";
		html += "<td>" + data.ACPT_NUM_OF_PL + "</td>";
	}
	$("tbody").html(html);
	
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
			<div class="page_title_text">시설물 목록</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="gbn" name="gbn"/>
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
	<input type="hidden" id="page" name="page" value="${page}" />
	<input type="hidden" id="no" name="no" value="${no}" />
	<input type="hidden" id="oldSearchGbn" value="${param.searchGbn}"/>
	<input type="hidden" id="oldSearchTxt" value="${param.searchTxt}"/>
				<select class="srch_sel" name="searchGbn">
					<option value="0">시설물명</option>
					<option value="1">시설물위치</option>
				</select>
				<div class="srch_text_wrap">
					<input type="text" id="searchTxt" name="searchTxt" value="${param.searchTxt}"/>
				</div>
				<div class="cmn_btn_ml" id="searchBtn">검색</div>
</form>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="board_table">
				<colgroup>
					<col width="100"/>
					<col width="200"/>
					<col width="150"/>
					<col width="150"/>
					<col width="100"/>
				</colgroup>
				<thead>
					<th>시설물코드</th>
					<th>시설물명</th>
					<th>위치</th>
					<th>관리자</th>
					<th>수용인원</th>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area">
					<div class="pgn_area">
					</div>
				</div>
					<div class="cmn_btn_ml" id="add_btn">시설물등록</div>
			</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>