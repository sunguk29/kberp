<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 내부비용관리 상세보기</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}

/* 개인 작업 영역 */

.expns_rsltn_dtl_view {
	border-collapse: collapse;
	font-size: 10.5pt;
	margin-bottom: 15px;
}

.expns_rsltn_dtl_view tbody td {
	border: 1px solid #DDDDDD;
	height: 40px;
}

.expns_rsltn_dtl_view td:nth-child(odd) {
	text-align: center;
	font-size: 11pt;
	font-weight: bold;
	background-color: #F2F2F2;
}

.expns_rsltn_dtl_view td:nth-child(even) {
	padding-left: 15px;
	display: table-cell;
	vertical-align: middle;
}

.btn_wrap {
	display: inline-block;
	vertical-align: top;
	text-align: right;
	width: 900px;
}

.atchd_file {
	display: inline-block;
	vertical-align: middle;
	width: 30px;
	height: 40px;
	background-image: url('./images/cmn/dwnld_icon.png');
	background-position: center;
	background-repeat: no-repeat;
	background-size: 20px;
	cursor: pointer;
	position: relative;
}

.file_name {
	display: inline-block;
	vertical-align: middle;
	font-weight: bold;
}

.file_name:hover {
	color: #4B94F2;
	text-decoration: underline;
	cursor: pointer;
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
	
	$("#previousBtn").on("click", function() {
		$("#actionForm").attr("action", "intrnlCostMngMnthlyList");
		$("#actionForm").submit();
	});
	
	$("#previousBtn2").on("click", function() {
		$("#top2").val("34");
		$("#menuNum2").val("39");
		$("#menuType2").val("M");
		
		$("#actionForm").attr("action", "chitMng")
		$("#actionForm").submit();
	});
	
});
</script>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="mon" name="mon" value="${param.mon}">
		<input type="hidden" id="page" name="page" value="${param.page}" />
		<input type="hidden" id="page2" name="page2" value="${param.page2}" />
		<input type="hidden" id="searchMonth" name="searchMonth" value="${param.searchMonth}">
		<input type="hidden" id="top2" name="top" value="${param.top}">
		<input type="hidden" id="menuNum2" name="menuNum" value="${param.menuNum}">
		<input type="hidden" id="menuType2" name="menuType" value="${param.menuType}">
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
			<div class="page_title_text">내부비용관리 상세보기</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<table class="expns_rsltn_dtl_view">
				<colgroup>
					<col width="150" />
					<col width="150" />
					<col width="150" />
					<col width="150" />
					<col width="150" />
					<col width="150" />
				</colgroup>
				<tbody>
					<tr>
						<td>작성자</td>
						<td colspan="5">${data.EMP_NAME}</td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="5">${data.DATE_RGS}</td>
					</tr>
					<tr>
						<td>지출일자</td>
						<td colspan="5">${data.DATE_D}</td>
					</tr>
					<tr>
						<td>전표번호</td>
						<td colspan="5">${data.CHIT_NUM}</td>
					</tr>
					<tr>
						<td>계정명</td>
						<td colspan="5">${data.ACNT_NAME}</td>
					</tr>
					<tr>
						<td>거래처</td>
						<td colspan="5">${data.CRSPNDNT}</td>
					</tr>
					<tr>
						<td>품목명</td>
						<td>${data.ITEM}</td>
						<td>수량</td>
						<c:choose>
							<c:when test="${data.QUNTY != null}">
								<td>${data.QUNTY}</td>								
							</c:when>
							<c:otherwise>
								<td>-</td>
							</c:otherwise>
						</c:choose>
						<td>단가</td>
						<td>${data.UNIT_PRICE}</td>
					</tr>
					<tr>
						<td>공급가액</td>
						<td colspan="5">${data.SPLY_PRICE}</td>
					</tr>
					<tr>
						<td>부가세</td>
						<td colspan="5">${data.SRTX}</td>
					</tr>
					<tr>
						<td>사업자번호</td>
						<td colspan="5">${data.BSNSMN_NUM}</td>
					</tr>
					<tr>
						<td>합계</td>
						<td colspan="5">${data.AMNT}</td>
					</tr>
					<tr>
						<td>비고</td>
						<c:choose>
							<c:when test="${data.RMRKS != null}">
								<td colspan="5">${data.RMRKS}</td>
							</c:when>
							<c:otherwise>
								<td colspan="5">-</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="5">
							<c:choose>
								<c:when test="${data.ATT_FILE != null}">
									<div class="atchd_file"></div>
									<div class="file_name">영수증.jpg</div>
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="btn_wrap">
				<c:if test="${empty param.back}">				
					<div class="cmn_btn" id="previousBtn">목록</div>
					<div class="cmn_btn_ml" id="updateBtn">수정</div>
					<div class="cmn_btn_ml" id="deleteBtn">삭제</div>
				</c:if>
				<c:if test="${!empty param.back}">
					<div class="cmn_btn" id="previousBtn2">돌아가기</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>