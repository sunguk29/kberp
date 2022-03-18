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
	background-image: url('../images/note.png');
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
	color: blue;
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

.reply_btn {
	margin-top: 10px;
	margin-left: 800px;
}

.move_btn {
	margin-top: 20px;
	margin-left: 380px;
	font-size: 10px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#replyBtn").on("click", function() {
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
	$("#dltBtn").on("click", function() {
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
});
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
				<select class="srch_sel">
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
				</select>
				<div class="srch_text_wrap">
					<input type="text" />
				</div>
				<div class="cmn_btn_ml">검색</div>
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
				<table class="board_table">
					<thead>
						<tr>
							<th>선택</th>
							<th>No.</th>
							<th>파일</th>
							<th>보낸사람</th>
							<th>내용</th>
							<th>받은시간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<td>6</td>
							<td></td>
							<td>최현우[chw]</td>
							<td>수신참조 된 결제 내역이 있습니다.<img src="../images/new.png" height="13" width="13"/></td>
							<td>2022-01-30 18:00</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>5</td>
							<td></td>
							<td>최현우[chw]</td>
							<td>올해 사내행사 총 결재금액 및 지출 내용입니다.<img src="../images/new.png" height="13" width="13"/></td>
							<td>2022-01-30 18:00</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>4</td>
							<td></td>
							<td>최현우[chw]</td>
							<td>수신참조 된 결제 내역이 있습니다.<img src="../images/new.png" height="13" width="13"/></td>
							<td>2022-01-30 18:00</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>3</td>
							<td></td>
							<td>최현우[chw]</td>
							<td>전자결재 문서가 종결(전결) 되었습니다.<img src="../images/new.png" height="13" width="13"/></td>
							<td>2022-01-30 18:00</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>2</td>
							<td></td>
							<td>최현우[chw]</td>
							<td>새로운 전자결재 문서가 상신되었습니다.<img src="../images/new.png" height="13" width="13"/></td>
							<td>2022-01-30 18:00</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td></td>
							<td>최현우[chw]</td>
							<td>수신참조 된 결제 내역이 있습니다.<img src="../images/new.png" height="13" width="13"/></td>
							<td>2022-01-30 18:00</td>
						</tr>
					</tbody>
				</table>
			</div>
			
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
				<div class="cmn_btn_ml" id="replyBtn">답장</div>
				<div class="cmn_btn_ml" id="dltBtn">삭제</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>