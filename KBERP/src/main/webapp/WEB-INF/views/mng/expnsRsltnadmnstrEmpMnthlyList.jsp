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
.mnthly_slct_wrap {
	width: calc(100% - 400px);
	display : inline-block;
	vertical-align: top;
	text-align: right;
	display: inline-block;
}

.mnthly_slct {
	display: inline-block;
	vertical-align: top;
	height: 27px;
}

.emp_name{
	font-size: 11pt;
	font-weight: bold;
	margin-bottom: 10px;
	display: inline-block;
	vertical-align: top;
}

.date_expense_rsltn_wrap {
	width: 100%;
	height: 500px;
}

.total {
	border-collapse:  collapse;
	font-size: 15px;
	margin: 20px 0 20px;
	overflow: scroll
}

.total td {
	border: 1px solid #DDDDDD;
}

.total td:nth-child(1) {
	background-color: #F2F2F2;
	height: 50px;
	font-weight: bold;
	text-align: center;
}

.total td:nth-child(2) {
	text-align: center;
}

.btn_wrap {
	width: 100%;
	text-align: right;
	padding-bottom: 20px;
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
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">지출결의서관리 사원별 월별 목록</div>
			<div class="mnthly_slct_wrap">
				<input type="month" class="mnthly_slct" value="2022-01" />
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
				<!-- 여기부터 쓰면 됨 -->
				<div class="emp_name">
					<div>사원명 : 홍길동</div>
				</div>
				<div>
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
								<th>유형</th>
								<th>금액</th>
								<th>지출처</th>
								<th>계정명</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2022-01-03</td>
								<td class="board_table_hover">202202080001</td>
								<td>개인</td>
								<td>150,000원</td>
								<td>애플</td>
								<td>출장비</td>
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
					
					<table class="total">
						<colgroup>
							<col width="200">
							<col width="700">
						</colgroup>
						<tbody>
							<tr>
								<td>개인 지출 합계</td>
								<td>150,000원</td>
							</tr>
							<tr>
								<td>법인 지출 합계</td>
								<td>0원</td>
							</tr>
							<tr>
								<td>총 합계</td>
								<td>150,000원</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap">
					<div class="cmn_btn">목록</div>
					</div>
				</div>
			</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>