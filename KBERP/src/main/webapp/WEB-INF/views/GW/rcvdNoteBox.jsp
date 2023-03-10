<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rcvdNoteBox</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.note {
	display: inline-block;
	vertical-align : top;
	width: 900px;
	height: 500px;
	border: 1px solid #000;
}

.title {
	display: inline-block;
	vertical-align: top;
	width: 900px;
	height: 50px;
	text-indent: 35px;
	line-height: 50px;
	background-image: url('resources/images/GW/note.png');
	background-size: 18px 18px;
	background-repeat: no-repeat;
	background-position: 10px 16px;
	font-size: 17px;
	font-weight: bold;
}
.title_bar {
	display: inline-block;
	vertical-align: top;
	width: 900px;
	height: 3px;
	background-color: #4B94F2;
}

.guide {
	display: table-cell;
	vertical-align: middle;
	width: 900px;
	height: 50px;
	background-color: #F2CB05;
	font-size: 12px;
	text-align: center;
	/*padding-left: 10px;*/
}

table {
	border-collapse: collapse;
	
}

tr {
	border-top: 1px solid #444;
	border-bottom: 1px solid #444;
	height: 45px;
	
}

thead tr {
	background-color: #cecece;
	font-size: 15px;
}

tbody tr {
	font-size: 13px;
}

td:nth-child(1), th:nth-child(1) {
	width: 50px;
	text-align: center;
}

td:nth-child(2), th:nth-child(2) {
	width: 50px;
	text-align: center;
}

td:nth-child(3), th:nth-child(3) {
	width: 50px;
	text-align: center;
}

td:nth-child(4), th:nth-child(4) {
	width: 150px;
	text-align: center;
}

th:nth-child(5) {
	width: 450px;
	text-align: center;
}

td:nth-child(5) {
	width: 450px;
	text-align: left;
	text-align: center;
}

.read_check {
	color : black;
}

.no_read {
	color : blue;
	font-weight: bold;
}

td:nth-child(6), th:nth-child(6) {
	width: 150px;
	text-align: center;
}

td:nth-child(5):hover {
	text-decoration: underline;
	cursor: pointer;
	font-weight: bold;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	if('${param.srch_sel}' !='') {
		$('#srch_sel').val('${param.srch_sel}');
	}
	
	reloadList();
	
	$("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click();
			
			return false; // 이벤트를 동작 하지 않겠다
		}
	});
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
			
		reloadList();
	});

	$("tbody").on("click", "td:nth-child(2), td:nth-child(3), td:nth-child(4), td:nth-child(5), td:nth-child(6)", function() {
		$("#no").val($(this).parent().attr("no")); 
		
		$("#actionForm").attr("action", "rcvdNoteView");
		$("#actionForm").submit();
	});

	$(".pgn_area").on("click", "div", function() {
		$("#page").val($(this).attr("page"));
		
		reloadList();
	}); 
	
	$("#dltBtn").on("click", function() {
		if($("[name='cb']").is(":checked")) { 
			if(confirm("삭제하시겠습니까?")) {
				
				var params = $("#actForm").serialize();
				console.log(params);
					
				$.ajax({
					type : "post",
					url : "NoteAction/delete",
					dataType : "json",
					data : params,
					success : function(res) {
						if(res.res == "success") {
							$("#actionForm").attr("action", "rcvdNoteBox");
							$("#actionForm").submit();
							alert("삭제성공");
						} else {
							alert("삭제중 문제가 발생하였습니다.");
						}
					},
					error : function(result, status, error) {
						console.log(result, responseText);
					}
			   });
			}
		} else {	
			alert("삭제할 목록을 선택해주세요.");
		}
	});
});

function reloadList() { // 목록 조회용 + 페이징 조회용
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "rcvdNoteBoxAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(result, status, error) {
			console.log(result, responseText);
		}
	});
}

function drawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<tr no=\"" + data.NOTE_NUM + "\">";
		html += "<td>" + "<input type=\"checkbox\" id=\"cb\" name=\"cb\" value=\"" + data.NOTE_NUM + "\"/>" + "</td>";
		html += "<td>" + data.NOTE_NUM + "</td>";
		if(data.ATT_FILE != null) {
			html += "<td>" + "<img src=\"resources/images/GW/attFile.png\" width=\"15\" height=\"15\"/>" + "</td>";
		} else {
			html += "<td>" + "</td>";
		}
		html += "<td>" + data.EMP_NAME + "</td>";
		if(data.READ_CHECK == 1) {
			html += "<td class=\"read_check\">" + data.NOTE_CNT + "</td>";
		} else {
			html += "<td class=\"no_read\">" + data.NOTE_CNT + "</td>";
		} 
		html += "<td>" + data.VIEW_DATE + "</td>";
		html += "</tr>";
	}

	$("tbody").html(html);
	
}

function drawPaging(pb) {
	var html = "";
	
	html += "<div page=\"1\"class=\"page_btn page_first\">first</div>";
	
	if($("#page").val() == "1") {
		html += "<div page=\"1\"class=\"page_btn page_prev\">prev</div>";
	} else {
		html += "<div page=\"" + ($("#page").val() * 1 - 1) + "\"class=\"page_btn page_prev\">prev</div>";
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
		html += "<div page=\"" + ($("#page").val() *1 + 1) + "\" class=\"page_btn page_next\">next</div>";
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
			<div class="page_title_text">받은쪽지함</div>
			<!-- 검색영역 선택적 사항 -->
			<div class="page_srch_area">
				<form action="#" id="actionForm" method="post">
					<input type="hidden" id="top" name="top" value="${param.top}" />
					<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
					<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
					<input type="hidden" id="no" name="no" value="${param.no}" />
					<input type="hidden" id="page" name="page" value="${page}">
					<input type="hidden" id="notesq" name="notesq" value="${notesq}"/>
					<input type="hidden" id="readcheck" name="readcheck" value="${param.readcheck}" />
					<select id="srch_sel" name="srch_sel">
						<option value="0">내용</option>
						<option value="1">보낸사람</option>
					</select>
					<div class="srch_text_wrap">
						<input type="text" id="searchTxt" name="searchTxt" value="${param.searchTxt}"/>
					</div>
					<div class="cmn_btn_ml" id="searchBtn" name="searchBtn">검색</div>
				</form>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="note">
				<div class="title">받은쪽지함
					<div class="title_bar"></div>
				</div>
				<div class="guide">※ 받은 쪽지와 보낸 쪽지 모두 30일 이후에 자동 삭제됩니다.<br/>
								  (단, 30일이 지난 쪽지라도 사용자가 열어보지 않으면 삭제되지 않습니다.)
				</div>
				<form action="#" id="actForm" method="post">
					<input type="hidden" id="no" name="no" value="${param.no}" />
					<table class="board_table">
						<thead>
							<tr>
								<th>선택</th>
								<th>No</th>
								<th>파일</th>
								<th>보낸사람</th>
								<th>내용</th>
								<th>받은시간</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</form>
			</div>
			
			<div class="board_bottom">
				<div class="pgn_area"></div>
				<div class="cmn_btn_ml" id="dltBtn">삭제</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>