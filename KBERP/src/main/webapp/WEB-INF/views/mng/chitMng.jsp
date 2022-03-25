<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 매입전표/매출전표</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */
.srch_month {
	height: 27px;
}

.srch_month:focus {
	outline: 2px solid #F2CB05; 
}

.board_table thead tr:nth-child(2) {
	border-top: 1px solid #d7d7d7;
}

.board_table thead td {
	border: 1px solid #d7d7d7;
	text-align: center;
	font-weight: bold;
	background-color: #F2F2F2;
	height: 40px;
	font-size: 11pt;
}

.board_table tbody td {
	color: black;
}

.chit_admnstrtn_total_table {
	border-collapse: collapse;
	font-size: 10.5pt;
}

.chit_admnstrtn_total_table td {
	height: 50px;
	border: 1px solid #DDDDDD;
	padding-left: 10px;
	text-align: center;
}

.board_bottom {
	margin-bottom: 15px;
}

.chit_admnstrtn_total_table td:nth-child(1) {
	font-size: 11pt;
	font-weight: bold;
	background-color: #F2F2F2;
}

.aprvl_rqst_wrap {
	text-align: right;
	margin-top: 20px;
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
		$("#page").val($(this).attr("page"));
		reloadList();
	});
	
	$("#srchMonth").on("change", function() {
		$("#mon").val($("#srchMonth").val());
		reloadList();
	});
	
	$("#aprvlRqst").on("click", function() {
		
		if(data != null) {
			makePopup({
				bg : true,
				bgClose : false,
				title : "결재요청확인",
				contents : "결재를 요청하시겠습니까?",
				buttons : [{
					name : "요청",
					func:function() {
						console.log("요청!");
						closePopup();
					}
				}, {
					name : "취소"
				}]
			});
		}
	});
	
	
	$("#listTbody").on("click", "#chitNum", function() {
		$("#sendChitNum").val($(this).attr("chitnum"));
		
		$("#actionForm").attr("action", "chitNumCheck");
		$("#actionForm").submit();
	});
	
	
});

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "chitMngAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
			drawSum(res.data);
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
	});
}

function drawList(list) {
	var html = "";
	
	for(data of list) {
		html += "<tr>";
		html += "<td class=\"board_table_hover\" id=\"chitNum\" chitnum=\"" + data.CHIT_NUM + "\">" + data.CHIT_NUM + "</td>";
		html += "<td>" + data.AMNT + "원</td>";
		html += "<td>-</td>";
		if(data.RMRKS != null) {
			html += "<td>" + data.RMRKS + "</td>";			
		} else {
			html += "<td>-</td>";
		}
		html += "</tr>";
	}
	
	$("#listTbody").html(html);
	
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

function drawSum(data) {
	var html = "";
	
	html += "<tr>";
	html += "<td>차변 합계</td>";
	if(data != null) {
		html += "<td>" + data.DEVIT_SUM + "원</td>";		
	} else {
		html += "<td>0원</td>";
	}
	html += "</tr>";
	html += "<tr>";
	html += "<td>대변 합계</td>";
	html += "<td>0원</td>";
	html += "</tr>";
	
	$("#totalTbody").html(html);
}


</script>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="mon" name="mon" value="${mon}">
		<input type="hidden" id="page" name="page" value="${page}">
		<input type="hidden" id="sendChitNum" name="sendChitNum">
		<input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
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
			<div class="page_title_text">매입전표 / 매출전표</div>
			<div class="page_srch_area">
				<input type="month" class="srch_month" id="srchMonth" value="${mon}"/>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="board_table">
				<colgroup>
					<col width="200">
					<col width="200">
					<col width="200">
					<col width="300">
				</colgroup>
				<thead>
					<tr>
						<td rowspan="2">전표번호</td>
						<td colspan="2">금액</td>
						<td rowspan="2">비고</td>
					</tr>
					<tr>
						<td>차변</td>
						<td>대변</td>
					</tr>
				</thead>
				<tbody id="listTbody">
				</tbody>
			</table>

			<div class="board_bottom">
				<div class="pgn_area" id="pgn_area">
				</div>
			</div>

			<div>
				<table class="chit_admnstrtn_total_table">
					<colgroup>
						<col width="200">
						<col width="700">
					</colgroup>
					<tbody id="totalTbody">
					</tbody>
				</table>
				<div class="aprvl_rqst_wrap">
					<div class="cmn_btn" id="aprvlRqst">결재요청</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>