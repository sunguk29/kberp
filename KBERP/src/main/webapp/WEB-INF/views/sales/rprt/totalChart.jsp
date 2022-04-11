<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 보고서</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1013px;
}
/* 개인 작업 영역 */
.body {
	display: block;
	background-color: white;
	width: 1013px;
	height: 100%;
	margin: auto;
}

.bodyWrap {
	display: block;
	background-color: white;
	width: 927px;
	height: 100%;
	margin: 40px auto;
}
.new_sales_actvty {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 260px;
	margin-bottom: 30px; 
}
.sales_text_bot {
	width: 430px;
	height: 200px;
	margin-top: 10px;
	font-size: 11pt;
}
.cont_right {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 100%;
	padding-right: 33.5px;	
}
.cont_left {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 100%;
	padding-left: 33.5px;	
}
.srch_table {
	border-collapse: collapse;
	background-color: #f2f2f2;
	width: 100%;
	font-size: 10.5pt;
	text-align: left;
	margin: 10px 0px 50px 0;
}
.srch_table tr {
	height: 40px;
}
.srch_table td {
	padding: 10px 2px;
}
select {
	height: 23px;
	width: 150px;
	font-size: 12px;
}
.srch_name {
	margin: 0px 10px 0px 20px;
	font-weight: bold;
}
.srch_msg {
	height: 20px;
	width: 305px;
	font-size: 12px;
}
.findEmp_box {
	background-color: white;
	border : 1px solid #858585;
	height: 22px;
	width: 160px;
	border-radius : 1px;
	text-align: right;
}
.findEmp_box:hover {
	cursor: pointer;
}
.findEmp_box:active {
	background-color : white;
	outline : 1.5px solid #222222;
}
.userIcon{
	height: 15px;
	margin-top: 3px;
	margin-right : 5px;
}
.sales_text, .img_rect {
	display: inline-block;
	vertical-align: top;
	font-size: 11pt;
	font-weight: bold;
	color: #7b7b7b;
}
.sales_text {
	width: 100%;
}
.sales_text_top {
	display: inline-block;
}
.actvty_tLine1 {
	background-color: #4B94F2;
	width: 100%;
	height: 2px;
}
.img_rect {
	width: 12px;
	height: 12px;
	padding-top: 4px;
	margin-right: 10px;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	getData();
});

// 차트 데이터
function getData() {
	var params = $("#getForm").serialize();
	$.ajax({
		type : "post",
		url : "totalNewSalesRankAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			makeChart(res.list);
		},
		error : function(request, status, error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

// 차트 그래프
function makeChart(list) {
	$('.sales_text_bot').highcharts({
		chart: {
			type: 'bar',
			zoomType: 'x'
		},
		colors: ['#5CB3FF', '#D462FF', '#FBB917', '#FBB917'],
        series : [{
        	name: '개수',
        	data : list
        }]
	});
}
</script>
</head>
<body>
<form action="#" id="getForm" method="post">
	<input type="hidden" name="size" value="4" />
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
			<div class="page_title_text">종합차트</div>
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
			<div class="body">
				<div class="bodyWrap">
					<!-- 검색창 -->
					<table class="srch_table">
						<colgroup>
							<col width="50" />
							<col width="100" />
							<col width="25" />
							<col width="100" />
						</colgroup>
						<tbody>
							<!-- col=4 -->
							<tr>
								<td>
									<span class="srch_name">부서</span>
								</td>
								<td colspan="3">
									<select>
										<option>부서전체</option>
										<option>영업 1팀</option>
										<option>영업 2팀</option>
										<option>영업 3팀</option>
										<option>영업 지원팀</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">담당자</span>
								</td>
								<td colspan="3">
									<div class="findEmp_box">
										<img class="userIcon" src="resources/images/sales/usericon.png">
									</div>										
								</td>
							</tr>
							<tr>
								<td>
									<span class="srch_name">정렬</span>
								</td>
								<td>
									<select>
										<option selected="selected">선택안함</option>
										<option>오름차순</option>
										<option>내림차순 </option>
									</select>
								</td>
								<td>
									<span class="cmn_btn">검색</span>
								</td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<dlv class="cont_right">
						<div class="new_sales_actvty">
						<div class="sales_text">
							<div class="sales_text_top">
								<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />당월 매출실적(상품별 실적)
							</div>
							<div class="actvty_tLine1"></div>
						</div>
						<div class="sales_text_bot"></div>
					</div>
					<div class="new_sales_actvty">
						<div class="sales_text">
							<div class="sales_text_top">
								<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />신규 영업 활동
							</div>
							<div class="actvty_tLine1"></div>
						</div>
						<div class="sales_text_bot"></div>
					</div>
					<div class="new_sales_actvty">
							<div class="sales_text">
								<div class="sales_text_top">
									<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />당월 영업실적차트
								</div>
								<div class="actvty_tLine1"></div>
							</div>
							<div class="sales_text_bot"></div>
						</div>
					</dlv>
					<dlv class="cont_left">
						<div class="new_sales_actvty">
							<div class="sales_text">
								<div class="sales_text_top">
									<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />당월 매출실적차트
								</div>
								<div class="actvty_tLine1"></div>
							</div>
							<div class="sales_text_bot"></div>
						</div>
					<div class="new_sales_actvty" >
					</div>
						<div class="new_sales_actvty">
							<div class="sales_text">
								<div class="sales_text_top">
									<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />당월 영업 실적
								</div>
								<div class="actvty_tLine1"></div>
							</div>
							<div class="sales_text_bot"></div>
						</div>
					</dlv>
				</div>
			</div>
			<!-- 페이징 영역 -->
			<!-- <div class="board_bottom">
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
				<div class="cmn_btn_ml" id="alertBtn">알림</div>
				<div class="cmn_btn_ml" id="btn1Btn">버튼1개</div>
				<div class="cmn_btn_ml" id="btn2Btn">버튼2개</div>
			</div> -->
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>