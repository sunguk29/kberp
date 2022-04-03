<!-- 
	견적 등록 : sales3QtnReg
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견적 등록</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1013px;
}

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

/* 개인 작업 영역 */
.cont_body {
	display: block;
	width: 1013px;
	height: 1013px;
	margin: auto;
}

table {
	border: 1px;
	width: 927px;
	margin: 40px auto;
}

td:nth-child(2), td:nth-child(4) {
	border-bottom: 1px solid #d7d7d7;
}

tr:nth-child(9) td:nth-child(3) {
	padding: none;
}

.btn {
	width: 90px;
	height: 40px;
}

.address {
	width: 90px;
	height: 100px;
}

.btn, .address {
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	width: 150px;
	border: none;
}

.btnImg:hover {
	cursor: pointer;
}

tr:nth-last-child(1) {
	margin-top: 40px;
}

.page_cont_title_text {
	display: inline-block;
	vertical-align: top;
	width: 900px;
	height: 30px;
	line-height: 30px;
	color: #2E83F2;
	font-size: 12pt;
	font-weight: bold;
	text-shadow: 0px 0 1px #7b7b7b;
	margin: 5px 40px;
}

.hr_width {
	width: 900px;
	margin: 10px 40px;
	border: none;
	height: 0.2px;
	background-color: #333;
	opacity: 0.5;
}

.txt {
	height: 33px;
	width: 100%;
	padding: 0 5px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}

.txt2 {
	height: 33px;
	width: 90%;
	padding: 0 5px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
}

.detailList tr td:nth-child(1) {
	text-align: center;
}

/* 상세정보 테이블 */
.detail_info_table tr:nth-child(1) td:nth-child(2) {
	border: none;
}

.detail_info_table tr td:nth-child(1) {
	text-align: center;
}

.btnImg {
	width: 30px;
	float: right;
	margin-left: 10px;
}

.rmks {
	height: 33px;
	width: 100%;
	padding: 0 5px;
	font-size: 10.5px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: none;
	background-color: #F2F2F2;
}

.imgPos {
	text-align: right;
}

.title_name {
	font-size: 15px;
	font-weight: bold;
	border-bottom: 3px solid #2E83F2;
	padding-bottom: 10px;
	margin-top: 100px;
	margin-bottom: 30px;
}

.box_in {
	width: 885px;
	height: 80px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
	background-color: #F2F2F2;
}

.plus_btn {
	display: inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 5px;
}

.mdhr_plus_btn {
	display: inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
	margin-right: 5px;
}

.drop_btn {
	display: inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
}

.up_btn {
	display: inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/up_arrow.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
}

.plus_btn:hover, .drop_btn:hover, .up_btn:hover, .mdhr_plus_btn:hover {
	cursor: pointer;
}

hr { /* 구분선 */
	margin-bottom: 10px;
}

.bot_title {
	font-size: 11pt;
}

.drop_btn {
	display: inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
}

.drop_btn:hover {
	cursor: pointer;
}

.nb {
	font-size: 14px;
	float: right;
}
/* 상단부분 hr 바텀 여백  */
.hr_bot {
	margin-bottom: 20px;
}
/* 첨부자료 */
.cntrct_box_in {
	width: 885px;
	height: 100px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 45px;
}

.txt_area {
	width: 720px;
	height: 200px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	font-size: 9pt;
	text-indent: 10px;
	line-height: 25px;
}

.rvn_txt {
	height: 33px;
	width: 885px;
	padding: 0 15px;
	font-size: 14px;
	color: black;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: 1px solid #d7d7d7;
	background-color: #F2F2F2;
	text-align: left;
	font-weight: bold;
	margin-left: 40px;
	margin-bottom: 5px;
}

.plus_btn {
	display: inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 5px;
	margin-top: 5.5px;
}
/* 상품 접었다 폈다 */
.mdhr {
	width: 880px;
	margin-bottom: 10px;
	float: right;
}
/* 첨부자료 */
.spc {
	margin-bottom: 30px;
}

.adc_txt {
	height: 33px;
	width: 885px;
	padding: 0 15px;
	font-size: 14px;
	color: black;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: 1px solid #d7d7d7;
	background-color: #F2F2F2;
	text-align: left;
	font-weight: bold;
	margin-left: 45px;
	margin-bottom: 5px;
	vertical-align: middle;
}

.btnImg_in {
	display: inline-block;
	vertical-align: middle;
	width: 25px;
	height: 25px;
	float: right;
	margin-right: 5px;
}

/* ******** 견적 ******** */
.qtn_txt {
	height: 33px;
	width: 885px;
	padding: 0 5px;
	font-size: 14px;
	color: black;
	vertical-align: middle;
	box-sizing: border-box;
	outline: none;
	border-radius: 3px;
	line-height: 33px;
	border: 1px solid #000;
	background-color: #F2F2F2;
	text-align: center;
	font-weight: bold;
	margin-left: 40px;
}

.qtn_title_name, .title_name {
	font-size: 15px;
	font-weight: bold;
	border-bottom: 3px solid #2E83F2;
	padding-bottom: 10px;
	margin-bottom: 30px;
	margin-left: 40px;
	width: 900px;
}
.title_name {
	margin-top: 30px;
}
.qtn_box_in {
	width: 885px;
	height: 150px;
	border: 1px solid #000;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
}
.past_ngtn {
	margin-left: 40px;
	font-size: 11pt;
	font-weight: bold;
	color: black;
	text-align: center;
}
.cc_box_in {
	display: inline-block;
	vertical-align: top;
	width: 480px;
	height: 70px;
	padding-left: 20px;
	white-space: pre;
	font-size: 14px;
	padding-top: 5px;
	padding-bottom: 5px;
	line-height: 20px;
}
.cc_box_in:hover {
	cursor: pointer;
	color: #2E83F2;
}
.cc_box_right {
	display: inline-block;
	vertical-align: top;
	width: 365px;
	height: 70px;
	padding-right: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.right_box {
	width: 200px;
	height: 50px;
	margin: 10px auto;
	font-size: 14px;
	text-align: right;
}
.hands{
	display: inline-block;
	vertical-align: middle;
	width: 48px;
	height: 48px;
	background-image: url("resources/images/sales/hands.png");
	background-size: 48px 48px;
	margin-right: 10px;
}
.boldname{
	font-weight: bold;
}

/* 의견, 히스토리 */
.mgtop {
	margin-top: 50px;
}

hr { /* 구분선 */
	margin-bottom: 10px;
}
.bot_title { 
	font-size: 11pt;
}
.bx { /* 스크롤때문에 div 박스 추가 */
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}
.OpinionBox {
	width: 830px;
	height: 70px;
	font-size: 10pt;
	border: 1px solid gray;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	border-bottom-left-radius: 12px;
	border-bottom-right-radius: 12px;
	margin-bottom: 5px;
	background-color: #F2F2F2;
}
.name {
	margin-top: 3px;
	font-weight: bold;
	padding-top: 5px;
	padding-left: 20px;
}
.txtOp, .dt, .del {
	padding-left: 20px;
}
.dt {
	padding-right: 590px;
}
.dt, .del {
	display: inline-block;
	vertical-align: top;
	font-size: 9pt;
	color: gray;
}
.del:hover, .dtl:hover, .apply:hover {
	cursor: pointer;
	color: #F2CB05;
}
.opBox {
	width: 860px;
	height: 56px;
	margin: 15px 0px 5px 47.5px;
}
textarea {
	width: 757px;
	height: 52px;
	font-size: 10.5pt;
	white-space: pre-wrap;
	resize: none;
	font-family: "맑은 고딕";
	display: inline-block;
	vertical-align: top;
	outline: none;
}
.subm {
	margin-left: 14px;
	width: 35px;
	height: 56px;
	line-height: 56px;
}

/* 상품 드롭다운 수정 영역 */
.mdhr {
   margin-bottom: 10px;
   float: right;
} 
.drop_btn2 {
	display:inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 15px 15px;
	float: right;
	margin-top: 15px;
	margin-right: 5px;
}
/* 지난 견적서 */
pre{
	font-family: "맑은 고딕";
	margin-top: 3px;
}
.qtnBox {
	width: 830px;
	height: 60px;
	font-size: 10pt;
	border: 1px solid gray;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	border-bottom-left-radius: 12px;
	border-bottom-right-radius: 12px;
	margin: 5px;
	background-color: #F2F2F2;
}
.qtnBox:hover {
	cursor: pointer;
	outline: 2px solid #F2B705;
}
.plus_btn_top {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 10px;
	margin-top: 7.5px;
}
.plus_btn_top:hover {
	cursor: pointer;
}
/* 견적 상품  */
.mdBox {
	width: 800px;
	height: 35px;
	margin-left: 20px;
	line-height: 30px;
	border: 1px solid #D7D7D7;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	border-bottom-left-radius: 12px;
	border-bottom-right-radius: 12px;
	margin-bottom: 5px;
	background-color: #F2F2F2;
}
.md_bx { /* 스크롤때문에 div 박스 추가 */
	width: 835x;
	height: 75px;
	margin-left: 70px;
	overflow-y: auto;
}
.md_txt{
	font-size: 14px;
	font-weight: bold;
}
.md_hr{
	margin-left: 80px;
}
.md_title { 
	font-size: 14pt;
	height : 24px;
	line-height: 14px;
	margin-left: 850px;
	vertical-align: middle;
}
.md_plus_btn {
	display:inline-block;
	vertical-align: middle;
	width: 14px;
	height: 14px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 14px 14px;
	margin-left: 5px;
}
.txtOp_btn{
	margin-left: 600px;
}
.md_nm, .md_intrst, .md_grd, .md_prd{
	width: 50px;
	height: 35px;
	margin: 0px 15px;
	font-size: 12pt;
}
.md_nm{
	font-weight: bold;
}
.md_btn{
	margin-left : 200px;
}
.dtl, .apply, .gb{
	display: inline-block;
	vertical-align: top;
	font-size: 11pt;
	color: gray;
	margin : 0px 5px; 
}
/* ******** 견적 끝 ******** */
#att {
	display: none;
}

#fileName {
	border: hidden;
	outline: none;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	console.log(${param.salesNum});
	
	// 목록 버튼
	$("#listBtn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "알림",
			contents : "작성중인 내용이 저장되지 않습니다. 나가시겠습니까?",
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [ {
				name : "확인",
				func : function() {
					$("#listForm").attr("action", "salesList");
					$("#listForm").submit();
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			} ]
		});
	});
	
	// 제안 - 상세정보 - 첨부파일
	$(".att_btn").on("click", function() {
		$("#att").click();
	});
	
	// 저장 버튼
	$("#saveBtn").on("click", function() {
		if($("#sgstnloanCauseNum").val() == 9) {
			alert("대출 원인을 선택하세요.");
			$("#sgstnloanCauseNum").focus();
		} else if(checkEmpty("#sgstnLoanScale")) {
			alert("대출 규모를 입력하세요.");
			$("#sgstnLoanScale").focus();
		} else if($("#sgstnloanType").val() == 9) {
			alert("대출 유형을 선택하세요.");
			$("#sgstnloanType").focus();
		} else if(checkEmpty("#sgstnloanTime")) {
			alert("대출 시기를 선택하세요.");
			$("#sgstnloanTime").focus();
		} else if(checkEmpty("#sgstnRdmptnTime")) {
			alert("상환 시기를 선택하세요.");
			$("#sgstnRdmptnTime").focus();
		} else if(checkEmpty("#sgstnTotalAmnt")) {
			alert("자산 총액을 입력하세요.");
			$("#sgstnTotalAmnt").focus();
		} else if(checkEmpty("#sgstnDebtAmnt")) {
			alert("부채액을 입력하세요.");
			$("#sgstnDebtAmnt").focus();
		} else if(checkEmpty("#dtlCont")) {
			alert("상세내용을 입력하세요.");
			$("#dtlCont").focus();
		} else {
			makePopup({
				bg : false,
				bgClose : false,
				title : "알림",
				contents : "저장하시겠습니까?",
				contentsEvent : function() {
					$("#popup1").draggable();
				},
				buttons : [{
					name : "확인",
					func:function() {
						/* 여기에 넣기 */
						var addForm = $("#addForm");
						
						addForm.ajaxForm({
							success : function(res) {
								if(res.fileName.length > 0) {
									$("#attFile").val(res.fileName[0]);
								}
								
								var params = $("#addForm").serialize();
								
								$.ajax({
									type : "post",
									url : "salesMng2ActionAjax/insert",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "success") {
											
											$("#listForm").attr("action", "sales2SgstnCont");
											$("#listForm").submit();
										} else {
											alert("등록중 문제가 발생하였습니다.");
										}
									},
									error : function(request, status, error) {
										console.log(request.responseText);
									}
								});
							},
							error : function(req) {
								console.log(request.responseText);
							}
						});
						addForm.submit();
						console.log("One!");
						closePopup();
					}
				}, {
					name : "닫기"
				}]
			});
		}
	});
	
	

}); // JS end

function uploadName(e) {
	var files = e.files;
	var filename = files[0].name;
	$("#fileName").val(filename);
}

</script>
</head>
<body>
	<form action="#" id="listForm" method="post">
		<input type="hidden" id="page" name="page" value="${page}" />
		<input type="hidden" name="top" value="${param.top}" />
		<input type="hidden" name="menuNum" value="${param.menuNum}" />
		<input type="hidden" name="menuType" value="${param.menuType}" />
		<input type="hidden" name="salesNum" value="${param.salesNum}" /> <!-- 영업기회에서 가져온 영업번호 -->
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
			<div class="page_title_text">영업관리 - 견적 등록</div>
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" /> <img alt="저장버튼" src="resources/images/sales/save.png" class="btnImg" id="saveBtn" />
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
				<div class="bodyWrap">
					<!-- 시작 -->


					<div class="bot_title">
						<h3>
							영업기회
							<div class="drop_btn"></div>
						</h3>
					</div>
					<!-- 영업기회 -->
					<div class="bodyWrap">
						<!-- 시작 -->

						<div class="page_cont_title_text">기본정보</div>
						<hr class="hr_width">
						<table>
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr>
									<td>
										<input type="button" class="btn" value="영업명*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${lead.LEAD_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="고객사" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${lead.CLNT_CMPNY_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="고객" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${lead.CLNT_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="고객사 등급" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" readonly="readonly" value="${lead.GRADE_NAME}" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="영업시작일*" />
									</td>
									<td colspan="3">
										<input type="date" class="txt" readonly="readonly" value="${lead.START_DATE}" />
									</td>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="담당자 *" readonly="readonly" />
									</td>
									<td colspan="3" value="${lead.MNGR_EMP_NUM}">
										<input type="text" class="txt2" id="mngrName" name="mngrName" value="${lead.EMP_NAME}" readonly="readonly" />
										<img class="btnImg_in" id="userIcon" alt="담당자아이콘" src="resources/images/sales/usericon.png" />
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page_cont_title_text">대출 상세정보</div>
						<hr class="hr_width">
						<table>
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr>
									<td>
										<input type="button" class="btn" value="대출 원인*" />
									</td>
									<td colspan="3">
										<select class="txt" id="loanCauseNum" name="loanCauseNum" value="${loan.LOAN_CAUSE_NUM}" disabled="disabled">
											<optgroup>
												<c:choose>
													<c:when test="${loan.LOAN_CAUSE_NUM eq 0}">
														<option value="0" selected="selected">사업확장</option>
														<option value="1">제품개발</option>
														<option value="2">토지매매</option>
														<option value="3">기타</option>
													</c:when>
													<c:when test="${loan.LOAN_CAUSE_NUM eq 1}">
														<option value="0">사업확장</option>
														<option value="1" selected="selected">제품개발</option>
														<option value="2">토지매매</option>
														<option value="3">기타</option>
													</c:when>
													<c:when test="${loan.LOAN_CAUSE_NUM eq 2}">
														<option value="0">사업확장</option>
														<option value="1">제품개발</option>
														<option value="2" selected="selected">토지매매</option>
														<option value="3">기타</option>
													</c:when>
													<c:when test="${loan.LOAN_CAUSE_NUM eq 3}">
														<option value="0">사업확장</option>
														<option value="1">제품개발</option>
														<option value="2">토지매매</option>
														<option value="3" selected="selected">기타</option>
													</c:when>
												</c:choose>
											</optgroup>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="예상 대출 규모" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="expctnLoanScale" name="expctnLoanScale" value="${loan.EXPCTN_LOAN_SCALE}" readonly="readonly" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 희망 유형*" />
									</td>
									<td colspan="3">
										<select class="txt" id="loanHopeType" name="loanHopeType" value="${loan.LOAN_HOPE_TYPE}" disabled="disabled">
											<optgroup>
												<c:choose>
													<c:when test="${loan.LOAN_HOPE_TYPE eq 0}">
														<option value="0" selected="selected">장기대출</option>
														<option value="1">단기대출</option>
													</c:when>
													<c:when test="${loan.LOAN_HOPE_TYPE eq 1}">
														<option value="0">장기대출</option>
														<option value="1" selected="selected">단기대출</option>
													</c:when>
												</c:choose>
											</optgroup>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 희망 시기*" />
									</td>
									<td colspan="3">
										<select class="txt" id="loanHopeTime" name="loanHopeTime" value="${loan.LOAN_HOPE_TIME}" disabled="disabled">
											<optgroup>
												<c:choose>
													<c:when test="${loan.LOAN_HOPE_TIME eq 0}">
														<option value="0" selected="selected">근시일 내</option>
														<option value="1">3개월 이후</option>
														<option value="2">6개월 이후</option>
														<option value="3">1년 이후</option>
													</c:when>
													<c:when test="${loan.LOAN_HOPE_TIME eq 1}">
														<option value="0">근시일 내</option>
														<option value="1" selected="selected">3개월 이후</option>
														<option value="2">6개월 이후</option>
														<option value="3">1년 이후</option>
													</c:when>
													<c:when test="${loan.LOAN_HOPE_TIME eq 2}">
														<option value="0">근시일 내</option>
														<option value="1">3개월 이후</option>
														<option value="2" selected="selected">6개월 이후</option>
														<option value="3">1년 이후</option>
													</c:when>
													<c:when test="${loan.LOAN_HOPE_TIME eq 3}">
														<option value="0">근시일 내</option>
														<option value="1">3개월 이후</option>
														<option value="2">6개월 이후</option>
														<option value="3" selected="selected">1년 이후</option>
													</c:when>
												</c:choose>
											</optgroup>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page_cont_title_text">예정 사업 상세정보</div>
						<hr class="hr_width">
						<table>
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="예정 사업명" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="expctdBsnsName" name="expctdBsnsName" value="${bsns.EXPCTD_BSNS_NAME}" readonly="readonly" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="예정 사업 형태" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="expctdBsnsType" name="expctdBsnsType" value="${bsns.EXPCTD_BSNS_TYPE}" readonly="readonly" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="비고" />
									</td>
									<td colspan="3">
										<input type="text" class="rmks" id="rmks" name="rmks" value="${bsns.RMKS}" readonly="readonly" />
									</td>
								</tr>
							</tbody>
						</table>
						<br /> <br />
						<!-- 첨부자료  -->
						<div class="spc">
							<div class="adc_txt">
								첨부자료 (0) <img class="plus_btn" src="resources/images/sales/plus.png" border='0' />
							</div>
							<div class="cntrct_box_in"></div>
							<input type=file id="att" name="att" />
							<input type="hidden" id="attFile" name="attFile" />
						</div>
						<!-- 끝 -->
					</div>

					<hr class="hr_bot" color="#4B94F2" width="925px">
					
						<!-- ******************* 제안 시작 ******************* -->

						<div class="bot_title">
							<h3>
								제안
								<div class="drop_btn"></div>
							</h3>
						</div>
						<div class="page_cont_title_text">대출 상세정보</div>
						<hr class="hr_width">
						<table class="detailList">
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr>
									<td>
										<input type="button" class="btn" value="대출 원인*" readonly="readonly" />
									</td>
									<td colspan="3">
										<select class="txt" id="sgstnloanCauseNum" name="sgstnloanCauseNum" required>
											<optgroup>
												<option value="9">선택하세요</option>
												<option value="0">사업확장</option>
												<option value="1">제품개발</option>
												<option value="2">토지매매</option>
												<option value="3">기타</option>
											</optgroup>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 규모*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnLoanScale" name="sgstnLoanScale" placeholder="대출 규모 금액을 입력하세요." />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 유형*" />
									</td>
									<td colspan="3">
										<select class="txt" id="sgstnloanType" name="sgstnloanType" required>
											<optgroup>
												<option value="9">선택 하세요</option>
												<option value="0">장기 대출</option>
												<option value="1">단기 대출</option>
											</optgroup>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 시기*" />
									</td>
									<td colspan="3">
										<input type="month" class="txt" id="sgstnloanTime" name="sgstnloanTime" required />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="상환 시기*" />
									</td>
									<td colspan="3">
										<input type="month" class="txt" id="sgstnRdmptnTime" name="sgstnRdmptnTime" required />
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page_cont_title_text">고객사 상세정보</div>
						<hr class="hr_width">
						<table class="detailList">
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="자산 총액*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnTotalAmnt" name="sgstnTotalAmnt" required placeholder="자산 총액을 입력하세요." />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="부채액*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnDebtAmnt" name="sgstnDebtAmnt" required placeholder="부채액을 입력하세요." />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="평균 매출액" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnAvgRvnAmnt" name="sgstnAvgRvnAmnt" placeholder="ex. 매출액(2021년기준) , 매출액(최근 3개월 기준)" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="사원 수" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnEmpCount" name="sgstnEmpCount" placeholder="사원수를 입력하세요." />
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page_cont_title_text">상세정보</div>
						<hr class="hr_width">
						<table class="detail_info_table">
							<colgroup>
								<col width="200" />
								<col width="250" />
								<col width="200" />
								<col width="250" />
							</colgroup>
							<tbody>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="상세내용*" readonly="readonly" />
									</td>
									<td colspan="3">
										<textarea rows="100" cols="50" class="txt_area" id="dtlCont" name="dtlCont" placeholder="상세 내용 입력란입니다."></textarea>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="비고" />
									</td>
									<td colspan="3">
										<input type="text" class="rmks" id="rmrks" name="rmrks" />
									</td>
								</tr>
								<tr height="10"></tr>
							</tbody>
						</table>
						<!-- 첨부자료  -->
						<input type=file id="att" name="att">
						<input type="hidden" id="attFile" name="attFile" />
						<div class="spc">
							<div class="adc_txt">
								첨부자료 <img class="plus_btn att_btn" src="resources/images/sales/plus.png" />
							</div>
							<div class="cntrct_box_in">
								<input type="text" id="fileName" readonly="readonly" />
							</div>
						</div>
						
						<hr class="hr_bot" color="#4B94F2" width="925px">
						
						<form action="fileUploadAjax" id="addForm" method="post" enctype="multipart/form-data">
						<!-- ******************* 견적 시작 ******************* -->
					<div class="bot_title"><h3>견적<div class="drop_btn"></div></h3></div>
					 <hr class="hr_bot" color="white" width="925px"> 
					<div class="hr_bot"></div>
					<div class="md_title">
						<span class="md_txt">상품(5)<img class="md_plus_btn" src="resources/images/sales/plus.png" border='0' onclick="document.all.file1.click();" ></span>
					</div>
					<div class="md_hr">
						<hr color="#D7D7D7" width="830px" />
					</div>
					<div class="md_bx">
							<div class="mdBox">
								<span class="md_nm">A상품</span>
								<span class="md_intrst">이자율: 1%</span>
								<span class="md_grd">상품등급: A</span>
								<span class="md_prd">대출기간: 1년</span>		
								<span class="md_btn">
									<span class="dtl" id="dtl">상세보기</span>
									<span class="gb">|</span>
									<span class="apply" id="apply">적용</span>
								</span>
								</div>
					</div>
					<table>
						<colgroup>
							<col width="200" />
							<col width="250" />
							<col width="200" />
							<col width="250" />
						</colgroup>
						<tbody>
							<tr height="40">
								<td><input type="button" class="btn" value="견적명*" readonly="readonly" /></td>
								<td colspan="3"><input type="text" class="txt"  /></td>		
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="상품유형" readonly="readonly" /></td>
								<td colspan="3">
									<select class="txt">
									 	<optgroup>
									 		<option>선택 하세요</option>
									 		<option selected="selected">개인사업</option>
									 		<option>법인사업</option>
									 		<option>공공사업</option>
									 	</optgroup>
									</select>
								</td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="견적일*" readonly="readonly" /></td>
									<td colspan="3"><input type="date" class="txt" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="공급가액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" /></td>		
							</tr> 
							<tr height="40">
									<td><input type="button" class="btn" value="세액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="합계액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="중도상환가능여부" readonly="readonly" /></td>
									<td>
										<select class="txt">
											<optgroup>
												<option>선택 하세요</option>
												<option>가능</option>
												<option>불가능</option>
											</optgroup>
										</select>
									</td>
									<td><input type="button" class="btn" value="부가세*" readonly="readonly" /></td>
									<td>
										<select class="txt">
										 	<optgroup>
										 		<option>선택 하세요</option>
										 		<option>포함</option>
										 		<option>미포함</option>
										 		<option>면세</option>
										 	</optgroup>
										</select>
									</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="이자납부방식" readonly="readonly" /></td>
								<td>
									<select class="txt">
										<optgroup>
											<option>선택 하세요</option>
											<option>원금 균등 상환</option>
											<option>원리금 균등 상환</option>
											<option>만기 일시 상환</option>
										</optgroup>
									</select>
								</td>
								<td><input type="button" class="btn" value="원금상환방식" readonly="readonly" /></td>
								<td colspan="2">
									<select class="txt">
										<optgroup>
											<option>선택 하세요</option>
											<option>원금 균등 상환</option>
											<option>원리금 균등 상환</option>
											<option>만기 일시 상환</option>
										</optgroup>
									</select>
								</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="이자율(%)" readonly="readonly" /></td>
								<td><input type="text" class="txt" /></td>
								<td><input type="button" class="btn" value="납부일" readonly="readonly" /></td>
								<td colspan="2"><input type="text" class="txt" value="매달    일" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="월 납부액" readonly="readonly" /></td>
								<td><input type="text" class="txt" /></td>
								<td><input type="button" class="btn" value="월 이자액" readonly="readonly" /></td>
								<td colspan="2"><input type="text" class="txt" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="비고" readonly="readonly"/></td>
								<td colspan="3"><input type="text" class="rmks" /></td>
							</tr>							
						</tbody>
					</table>
					
					<!-- 첨부자료 -->
					<div class="rvn_txt"> 첨부자료 (0)
						<input type=file name='file1' style='display: none;'/> 
						<img class="plus_btn" src="resources/images/sales/plus.png" border='0' onclick="document.all.file1.click();" > 
					</div>
					<div class="cntrct_box_in"></div>
					<!-- 지난 견적서 -->
					<div class="mgtop"></div>
					<div class="bot_title"><h3>지난 견적서<div class="drop_btn"></div></h3></div>
					<hr color="#F2B705" width="925px">
					<div class="bx">
						<div class="qtnBox">
							<div class="name">21E314 견적서2 (21/12/27 17:01:00)</div>
							<div class="txtOp"><pre>법인사업    중소기업 소액 대출      3%          1200000만원</pre></div>
						</div>
						<div class="qtnBox">
							<div class="name">21E314 견적서2 (21/12/27 17:01:00)</div>
							<div class="txtOp"><pre>법인사업    중소기업 소액 대출      3%          1200000만원</pre></div>
						</div>
						<div class="qtnBox">
							<div class="name">21E314 견적서2 (21/12/27 17:01:00)</div>
							<div class="txtOp"><pre>법인사업    중소기업 소액 대출      3%          1200000만원</pre></div>
						</div>
						<div class="qtnBox">
							<div class="name">21E314 견적서2 (21/12/27 17:01:00)</div>
							<div class="txtOp"><pre>법인사업    중소기업 소액 대출      3%          1200000만원</pre></div>
						</div>
						<div class="qtnBox">
							<div class="name">21E314 견적서2 (21/12/27 17:01:00)</div>
							<div class="txtOp"><pre>법인사업    중소기업 소액 대출      3%          1200000만원</pre></div>
						</div>
						<div class="qtnBox">
							<div class="name">21E314 견적서2 (21/12/27 17:01:00)</div>
							<div class="txtOp"><pre>법인사업    중소기업 소액 대출      3%          1200000만원</pre></div>
						</div>
					</div>
						</form>
					<!-- ********* 견적 끝 ********* -->
				</div>
			</div>
		</div>
	</div>
	<!-- cont_wrap end -->
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>