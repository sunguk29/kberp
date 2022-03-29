<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqList</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type = "text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */

</style>
<script type = "text/javascript">
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
			<div class="page_title_text">FAQ</div>
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
					<col width="50"/>
					<col width="140"/>
					<col width="450"/>
					<col width="100"/>
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>99</td>
						<td>입출금/예적금</td>
						<td class="board_table_hover board_cont_left">질문글입니다.</td>
						<td>2022-12-01</td>
					</tr>
					<tr>
						<td>98</td>
						<td>입출금/예적금</td>
						<td class="board_table_hover board_cont_left">질문글입니다.</td>
						<td>2022-12-01</td>
					</tr>
					<tr>
						<td>97</td>
						<td>입출금/예적금</td>
						<td class="board_table_hover board_cont_left">질문글입니다.</td>
						<td>2022-12-01</td>
					</tr>
					<tr>
						<td>96</td>
						<td>입출금/예적금</td>
						<td class="board_table_hover board_cont_left">질문글입니다.</td>
						<td>2022-12-01</td>
					</tr>
					<tr>
						<td>95</td>
						<td>인증/보안</td>
						<td class="board_table_hover board_cont_left">질문글입니다.</td>
						<td>2022-12-01</td>
					</tr>
					<tr>
						<td>94</td>
						<td>인증/보안</td>
						<td class="board_table_hover board_cont_left">질문글입니다.</td>
						<td>2022-12-01</td>
					</tr>
					<tr>
						<td>93</td>
						<td>인증/보안</td>
						<td class="board_table_hover board_cont_left">질문글입니다.</td>
						<td>2022-12-01</td>
					</tr>
					<tr>
						<td>92</td>
						<td>앱이용</td>
						<td class="board_table_hover board_cont_left">질문글입니다.</td>
						<td>2022-12-01</td>
					</tr>
					<tr>
						<td>91</td>
						<td>앱이용</td>
						<td class="board_table_hover board_cont_left">질문글입니다.</td>
						
						<td>2022-12-01</td>
					</tr>
					<tr>
						<td>90</td>
						<td>앱이용</td>
						<td class="board_table_hover board_cont_left">질문글입니다.</td>
						<td>2022-12-01</td>
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
				<div class="cmn_btn_ml">글쓰기</div>
			</div>
		</div>
	</div>
	
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>