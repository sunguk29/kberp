<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 내부비용관리 월별 목록</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */
.mnthly_slct_wrap {
	width: calc(100% - 400px);
	display: inline-block;
	vertical-align: top;
	text-align: right;
}

.mnthly_slct {
	display: inline-block;
	vertical-align: top;
	height: 27px;
}

.btn_wrap {
	display: inline-block;
	vertical-align: top;
	text-align: right;
}

.board_table tbody td {
	color: #000000;
}

.total {
	border-collapse: collapse;
	font-size: 10.5pt;
	margin: 15px 0 15px;
	overflow: scroll
}

.total td {
	border: 1px solid #DDDDDD;
	text-align: center;
}

.total td:nth-child(1) {
	background-color: #F2F2F2;
	height: 50px;
	font-size: 11pt;
	font-weight: bold;
}

.btn_wrap {
	width: 100%;
	text-align: right;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#alertBtn").on("click", function() {
		makeAlert("하이", "내용임");
	});
	$("#btn1Btn").on("click", function() {
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 300,
			title : "버튼하나팝업",
			contents : "내용임",
			buttons : {
				name : "하나",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}
		});
	});
	$("#btn2Btn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "버튼두개팝업",
			contents : "내용임",
			buttons : [{
				name : "하나",
				func:function() {
					console.log("One!");
					closePopup();
				}
			}, {
				name : "둘닫기"
			}]
		});
	});
	
	reloadList();
	
	$("#pgn_area").on("click", "div", function() {
		$("#page2").val($(this).attr("page"));
		reloadList();
	});
});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "intrnlCostMngMnthlyListAjax",
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
	
}

function drawPaging(pb) {
	var html = "";
	
	html += "<div class=\"page_btn page_first\" page=\"1\">first</div>";
	
	if($("#page").val() == "1") {
		html += "<div class=\"page_btn page_prev\" page=1>prev</div>";
	} else {
		html += "<div class=\"page_btn page_prev\" page=\"" + ($("#page").val() * 1 - 1) + "\">prev</div>";		
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++) {
		if($("#page").val() == i) {
			html += "<div class=\"page_btn_on\" page=\"" + i + "\">" + i + "</div>";
		} else {
			html += "<div class=\"page_btn\" page=\"" + i + "\">" + i + "</div>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<div class=\"page_btn page_next\" page=\"" + pb.maxPcount + "\">next</div>";		
	} else {
		html += "<div class=\"page_btn page_next\" page=\"" + ($("#page").val() * 1 + 1) + "\">next</div>";				
	}
	
	html += "<div class=\"page_btn page_last\" page=\"" + pb.maxPcount + "\">last</div>";
	
	$("#pgn_area").html(html);
}

</script>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="mon" name="mon" value="${param.mon}">
		<input type="hidden" id="page" name="page" value="${param.page}" />
		<input type="hidden" id="page2" name="page2" value="${page2}" />
		<input type="hidden" id="searchMonth" name="searchMonth" value="${param.searchMonth}">
		<input type="hidden" id="top" name="top" value="${param.top}">
		<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}">
		<input type="hidden" id="menuType" name="menuType" value="${param.menuType}">
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
			<div class="page_title_text">내부비용관리 월별 목록</div>
			<div class="mnthly_slct_wrap">
				<input type="month" class="mnthly_slct" value="2022-01" />
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="board_table">
				<colgroup>
					<col width="150">
					<col width="150">
					<col width="150">
					<col width="150">
					<col width="150">
					<col width="150">
				</colgroup>
				<thead>
					<tr>
						<th>지출일</th>
						<th>전표번호</th>
						<th>거래처</th>
						<th>금액</th>
						<th>계정명</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2022-01-01</td>
						<td class="board_table_hover">202201010001</td>
						<td>건물주</td>
						<td>150,000원</td>
						<td>건물임대료</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area" id="pgn_area">
				</div>
			</div>

			<table class="total">
				<colgroup>
					<col width="200">
					<col width="800">
				</colgroup>
				<tbody>
					<tr>
						<td>총 합계</td>
						<td>150,000원</td>
					</tr>
				</tbody>
			</table>
			<div class="btn_wrap">
				<div class="cmn_btn">목록</div>
				<div class="cmn_btn_ml">신규</div>
				<div class="cmn_btn_ml">월 삭제</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>