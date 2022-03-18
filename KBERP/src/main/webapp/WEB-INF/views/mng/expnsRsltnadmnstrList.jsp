<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지출결의서관리 목록</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */
.srch_month {
	display: inline-block;
	vertical-align: top;
	height: 27px;
}

.mnthly_slct:focus {
	outline: 2px solid #F2CB05;
}

.board_table tbody td {
	color: black;
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
	<div class="right_area">
		<!-- 내용영역 -->
		<div class="cont_wrap">
			<div class="page_title_bar">
				<div class="page_title_text">지출결의서관리 목록</div>
				<div class="page_srch_area">
					<input type="month" class="srch_month">
					
					<div class="srch_text_wrap">
						<input type="text" placeholder="사원명" />
					</div>
					<div class="cmn_btn_ml">검색</div>
				</div>
			</div>
			<!-- 해당 내용에 작업을 진행하시오. -->
			<div class="cont_area">
				<!-- 여기부터 쓰면 됨 -->
				<div>
					<table class="board_table">
						<colgroup>
							<col width="180">
							<col width="180">
							<col width="180">
							<col width="180">
							<col width="180">
						</colgroup>
						<thead>
							<tr>
								<th>귀속연월</th>
								<th>사원명</th>
								<th>개인 지출 합계</th>
								<th>법인 지출 합계</th>
								<th>총 합계</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2022.01</td>
								<td class="board_table_hover">홍길동</td>
								<td>150,000원</td>
								<td>150,000원</td>
								<td>300,000원</td>
							</tr>
							<tr>
								<td>2022.01</td>
								<td class="board_table_hover">김철수</td>
								<td>150,000원</td>
								<td>150,000원</td>
								<td>300,000원</td>
							</tr>
							<tr>
								<td>2022.01</td>
								<td class="board_table_hover">고길동</td>
								<td>150,000원</td>
								<td>150,000원</td>
								<td>300,000원</td>
							</tr>
							<tr>
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
							</tr>
							<tr>
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
							</tr>
							<tr>
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
							</tr>
						</tbody>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>