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

/********** div 큰 영역  **********/
.new_sales_actvty {
	display: inline-block;
	vertical-align: top;
	width: 430px;
	height: 260px;
	margin-bottom: 30px; 
}

.sales_text_bot{
	width: 428px;
	height: 200px;
	border: 1px solid #000;
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
/********** 검색 영역 **********/
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
/* 직원검색 */
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
/********** 제목 영역 **********/
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

/* 파란 줄 */
.actvty_tLine1 {
	background-color: #4B94F2;
	width: 100%;
	height: 2px;
}

/* 네모 이미지 */
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
			<div class="page_title_text">고객 차트</div>
			<!-- 검색영역 선택적 사항 -->
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
									<span class="srch_name">내영업 조회</span>
								</td>
								<td colspan="3">
									<input type="checkbox"/>
								</td>
							</tr>
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
									<span class="srch_name">기간</span>
								</td>
								<td colspan="3">
									<input type="date" /> ~ <input type="date" />
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
								<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />신규고객
							</div>
							<div class="actvty_tLine1"></div>
						</div>
						<div class="sales_text_bot">
						</div>
					</div>
					
					<div class="new_sales_actvty">
							<div class="sales_text">
								<div class="sales_text_top">
									<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />부서
								</div>
								<div class="actvty_tLine1"></div>
							</div>
							<div class="sales_text_bot">
							</div>
						</div>
					</dlv>
					<dlv class="cont_left">
						<div class="new_sales_actvty">
							<div class="sales_text">
								<div class="sales_text_top">
									<img class="img_rect" alt="바" src="resources/images/sales/rect.png" />고객 등급
								</div>
								<div class="actvty_tLine1">
								</div>
							</div>
							<div class="sales_text_bot">
							</div>
						</div>
					</dlv>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>