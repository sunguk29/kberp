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

.board_table{
	text-align: center;
}
/* 개인 작업 영역 */

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
			<div class="page_title_text">프로젝트 관리</div>
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
			<table class="board_table">
				<colgroup>
					<col width="100"/>
					<col width="400"/>
					<col width="150"/>
				</colgroup>
				<thead>
					<tr>
						<th>서식번호</th>
						<th>서식명</th>
						<th>구분</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>00</td>
						<td class="board_table_hover board_cont_left">공문</td>
						<td>기안서</td>
					</tr>
					<tr>
						<td>01</td>
						<td class="board_table_hover board_cont_left">기안서</td>
						<td>기안서</td>
					</tr>
					<tr>
						<td>02</td>
						<td class="board_table_hover board_cont_left">출장확인서</td>
						<td>기안서</td>
					</tr>
					<tr>
						<td>03</td>
						<td class="board_table_hover board_cont_left">지출보고서</td>
						<td>지출결의서</td>
					</tr>
					<tr>
						<td>04</td>
						<td class="board_table_hover board_cont_left">지출결의서</td>
						<td>지출결의서</td>
					</tr>
					<tr>
						<td>05</td>
						<td class="board_table_hover board_cont_left">품의서</td>
						<td>지출결의서</td>
					</tr>
					<tr>
						<td>06</td>
						<td class="board_table_hover board_cont_left">휴가신청서</td>
						<td>근태관리</td>
					</tr>
					<tr>
						<td>07</td>
						<td class="board_table_hover board_cont_left">교육신청서</td>
						<td>기안서</td>
					</tr>
				</tbody>
			</table>
		
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>