<!-- 
	제안 상세보기 : sales2SgstnCont
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제안 상세보기</title>
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
table{	
	border: 1px;
	width: 927px;
	margin: 40px auto;
}
td:nth-child(2), td:nth-child(4){
	border-bottom: 1px solid #d7d7d7;
}
tr:nth-child(9) td:nth-child(3){
	padding : 0;
}
.btn{
	width : 90px;
	height: 40px;
}
.address{
	width : 90px;
	height: 100px;
}
.btn, .address{
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	width: 150px;
	border: none;
}
.btnImg:hover{
	cursor: pointer;
}

.txt{
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
.btnImg{
   width : 30px;
   float: right;
   margin-left: 10px;
}
.rmks{
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

.imgPos{
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
   display:inline-block;
   vertical-align: middle;
   width: 18px;
   height: 18px;
   background-image: url("resources/images/sales/plus.png");
   background-size: 18px 18px;
   float: right;
   margin-right: 5px;
   margin-top: 5.5px;
}
.drop_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
}
.up_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/up_arrow.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
}
.plus_btn:hover, .drop_btn:hover, .up_btn:hover {
	cursor: pointer;
}
.rmks{
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
.bx2 { /* 스크롤때문에 div 박스 추가 */
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
.del:hover {
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
.drop_btn {
	display:inline-block;
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
/* 전환 */
.next_bot {
   margin-top: 20px;
   width: 100%;
   height: 30px;
}
.nb {
	font-size: 14px;
	float: right;
}
/* 영업관리 속성들 */
.page_cont_title_text {
	display: inline-block;
	vertical-align: top;
	width: 400px;
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
.spc{
	margin-bottom : 30px;
}
.cntrct_box_in {
    width: 885px;
    height: 100px;
    border: 1px solid #d7d7d7;
    border-radius: 7px;
    margin-bottom: 18px;
    margin-left: 45px;
}
.btnImg_in{
	display: inline-block;
	vertical-align: middle;
	width: 25px;
	height: 25px;
	float: right;
	margin-right: 5px;
}
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

/* 영업 종료 */
.salesOver_btn {
   display: inline-block;
   vertical-align: top;
   padding: 0px 10px;
   min-width: 30px;
   height: 30px;
   line-height: 30px;
   font-size: 10pt;
   font-weight: bold;
   text-align: center;
   background-color: #d7d7d7;
   border-radius: 2px;
   color: #222222;
   cursor: pointer;
}
.salesOver_btn:active {
   background-color: #E1E1E1;
}
.hr_bot {
	margin-bottom: 20px;
}
.mng_txt{
	width: 680px; 
}

#att {
	display: none;
}

#fileName {
	border: hidden;
	outline: none;
}

/* 끝 */
</style>
<script type="text/javascript">
$(document).ready(function() {

	console.log(${param.salesNum});
	
	// 목록 버튼
	$("#listBtn").on("click", function() {
		
		$("#actionForm").attr("action", "salesList");
		$("#actionForm").submit();
	});
	
	// 수정 버튼
	$("#updateBtn").on("click", function() {
		
		$("#actionForm").attr("action", "sales2Update");
		$("#actionForm").submit();
	});
	
	// 다음 단계로 전환하기 버튼 : 견적 등록 페이지
	$("#nextStageBtn").on("click", function() {
		$("#actionForm").attr("action", "sales3QntReg");
		$("#actionForm").submit();
	});
	
	
	// 영업 종료하기 버튼
	$(".salesOver_btn").on("click", function() {
		// 수정이랑 같음, 상태를 종료로 변경, ajax로 failure로 보내기
		makePopup({
			bg : true,
			bgClose : false,
			title : "영업 종료하기",
			contents : "영업을 종료하시겠습니까?",
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "확인",
				func:function() {
					/* 여기에 넣기 */
					var params = $("#updateForm").serialize();
					
					$.ajax({
						type : "post",
						url : "salesMng2ActionAjax/failure",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
								$("#updateForm").attr("action", "salesList");
								$("#updateForm").submit();
							} else {
								alert("영업 종료중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) { // 문제 발생 시 실행 함수
							console.log(request.responseText); // 결과텍스트
						}
					});
					
					console.log("One!");
					closePopup();
				}
			}, {
				name : "닫기"
			}]
		});
	});
});


</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="page" name="page" value="${page}" />
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	<input type="hidden" id="salesNum" name="salesNum" value="${data.SALES_NUM}" /> <!-- 영업번호 -->
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
			<div class="page_title_text">영업관리 - 제안 상세보기</div>
				<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />
				<img alt="수정버튼" src="resources/images/sales/pencil.png" class="btnImg" id="updateBtn" />
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
				<div class="bodyWrap">
				<!-- 시작 -->
				<form action="#" id="updateForm" method="post">
						<input type="hidden" id="page" name="page" value="${page}" />
						<input type="hidden" name="top" value="${param.top}" />
						<input type="hidden" name="menuNum" value="${param.menuNum}" />
						<input type="hidden" name="menuType" value="${param.menuType}" />
						<input type="text" name="prgrsStsNum" value="${data.PRGRS_STS_NUM}" />
						<input type="text" id="salesNum" name="salesNum" value="${data.SALES_NUM}" />
				
					<div class="bot_title"><h3>영업기회<div class="drop_btn"></div></h3></div>
					<hr class="hr_bot" color="white" width="925px">
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
								<td><input type="button" class="btn" value="영업명*" /></td>
								<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.LEAD_NAME}" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="고객사"/></td>
									<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.CLNT_CMPNY_NAME}" /></td>								
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="고객" /></td>
									<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.CLNT_NAME}" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="고객사 등급"/></td>
									<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.GRADE_NAME}" /></td>		
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="영업시작일*" /></td>
									<td colspan="3"><input type="date" class="txt" readonly="readonly" value="${data.START_DATE}" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="담당자 *" readonly="readonly"/></td>
								<td colspan="3" value="${data.MNGR_EMP_NUM}">
									<input type="text" class="txt mng_txt" readonly="readonly" value="${data.EMP_NAME}" />
									<img class="btnImg_in" alt="담당자아이콘" src="resources/images/sales/usericon.png" />
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
								<td><input type="button" class="btn" value="대출 원인*" /></td>
								<td colspan="3">
									<select class="txt" disabled="disabled">
											<optgroup>
												<c:choose>
													<c:when test="${data.LOAN_CAUSE_NUM eq 0}">													
														<option value="0" selected="selected">사업확장</option>
													</c:when>
													<c:when test="${data.LOAN_CAUSE_NUM eq 1}">													
														<option value="0" selected="selected">제품개발</option>
													</c:when>
													<c:when test="${data.LOAN_CAUSE_NUM eq 2}">													
														<option value="0" selected="selected">토지매매</option>
													</c:when>
													<c:when test="${data.LOAN_CAUSE_NUM eq 3}">													
														<option value="0" selected="selected">기타</option>
													</c:when>
												</c:choose>
											</optgroup>
										</select>
								</td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="예상 대출 규모"/></td>
									<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.EXPCTN_LOAN_SCALE}" /></td>								
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="대출 희망 유형*" /></td>
									<td colspan="3">
										<select class="txt" disabled="disabled">
											<optgroup>
											<c:choose>
													<c:when test="${data.LOAN_HOPE_TYPE eq 0}">													
														<option value="0" selected="selected">장기대출</option>
													</c:when>
													<c:when test="${data.LOAN_HOPE_TYPE eq 1}">													
														<option value="0" selected="selected">단기대출</option>
													</c:when>
												</c:choose>
											</optgroup>
										</select>
									</td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="대출 희망 시기*"/></td>
									<td colspan="3">
										<select class="txt" disabled="disabled">
											<optgroup>
												<c:choose>
													<c:when test="${data.LOAN_HOPE_TIME eq 0}">													
														<option value="0" selected="selected">근시일 내</option>
													</c:when>
													<c:when test="${data.LOAN_HOPE_TIME eq 1}">													
														<option value="0" selected="selected">3개월 이후</option>
													</c:when>
													<c:when test="${data.LOAN_HOPE_TIME eq 2}">													
														<option value="0" selected="selected">6개월 이후</option>
													</c:when>
													<c:when test="${data.LOAN_HOPE_TIME eq 3}">													
														<option value="0" selected="selected">1년 이후</option>
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
									<td><input type="button" class="btn" value="예정 사업명"/></td>
									<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.EXPCTD_BSNS_NAME}" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="예정 사업 형태" /></td>
									<td colspan="3"><input type="text" class="txt" readonly="readonly" value="${data.EXPCTD_BSNS_TYPE}" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="비고" /></td>
									<td colspan="3"><input type="text" class="rmks" readonly="readonly" value="${data.RMKS}" /></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!-- 첨부자료  -->
					<div class="spc">
						<div class="adc_txt"> 첨부자료 (0)
								<input type=file name='file1' style='display: none;'> 
						</div>
						<div class="cntrct_box_in"></div> 
					</div>
					
					
					<!-- *************** 영업기회 끝 **************** -->
					
					<hr class="hr_bot" color="#4B94F2" width="925px">
					<!-- *************** 제안 부분 시작 **************** -->
					
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
										<input type="button" class="btn" value="대출 원인*"  />
									</td>
									<td colspan="3">
										<select class="txt" id="sgstnloanCauseNum" name="sgstnloanCauseNum" disabled="disabled">
											<optgroup>
												<c:choose>
													<c:when test="${data2.SGSTN_LOAN_CAUSE_NUM eq 0}">
														<option value="0">사업확장</option>
													</c:when>
													<c:when test="${data2.SGSTN_LOAN_CAUSE_NUM eq 1}">
														<option value="1">제품개발</option>
													</c:when>
													<c:when test="${data2.SGSTN_LOAN_CAUSE_NUM eq 2}">
														<option value="2">토지매매</option>
													</c:when>
													<c:when test="${data2.SGSTN_LOAN_CAUSE_NUM eq 3}">
														<option value="3">기타</option>
													</c:when>
												</c:choose>
												</optgroup>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 규모*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnLoanScale" name="sgstnLoanScale" value="${data2.SGSTN_LOAN_SCALE}" readonly="readonly" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 유형*" />
									</td>
									<td colspan="3">
										<select class="txt" id="sgstnloanType" name="sgstnloanType" disabled="disabled">
											<optgroup>
												<c:choose>
													<c:when test="${data2.SGSTN_LOAN_TYPE eq 0}">
														<option value="0">장기 대출</option>
													</c:when>
													<c:when test="${data2.SGSTN_LOAN_TYPE eq 1}">
														<option value="1">단기 대출</option>
													</c:when>
												</c:choose>
											</optgroup>
										</select>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="대출 시기*" />
									</td>
									<td colspan="3">
										<input type="month" class="txt" id="sgstnloanTime" name="sgstnloanTime" value="${data2.SGSTN_LOAN_TIME}"  disabled="disabled" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="상환 시기*" />
									</td>
									<td colspan="3">
										<input type="month" class="txt" id="sgstnRdmptnTime" name="sgstnRdmptnTime" value="${data2.SGSTN_RDMPTN_TIME}"  disabled="disabled" />
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
										<input type="text" class="txt" id="sgstnTotalAmnt" name="sgstnTotalAmnt" value="${data2.SGSTN_TOTAL_AMNT}"  disabled="disabled" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="부채액*" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnDebtAmnt" name="sgstnDebtAmnt" value="${data2.SGSTN_DEBT_AMNT}"  disabled="disabled" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="평균 매출액" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnAvgRvnAmnt" name="sgstnAvgRvnAmnt" value="${data2.SGSTN_AVG_RVN_AMNT}"  disabled="disabled" />
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="사원 수" />
									</td>
									<td colspan="3">
										<input type="text" class="txt" id="sgstnEmpCount" name="sgstnEmpCount" value="${data2.SGSTN_EMP_COUNT}"  disabled="disabled" />
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
										<input type="button" class="btn" value="상세내용*" />
									</td>
									<td colspan="3">
										<textarea rows="100" cols="50" class="txt_area" id="dtlCont" name="dtlCont" readonly="readonly">${data2.DTL_CONT}</textarea>
									</td>
								</tr>
								<tr height="40">
									<td>
										<input type="button" class="btn" value="비고" />
									</td>
									<td colspan="3">
										<input type="text" class="rmks" id="rmrks" name="rmrks" value="${data2.RMRKS}" readonly="readonly" />
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
								첨부자료
								<img class="plus_btn att_btn" src="resources/images/sales/plus.png" />
							</div>
							<div class="cntrct_box_in">
							
							</div>
						</div>
					
					
					
					
					
					<div class="next_bot">
						<div class="cmn_btn nb" id="nextStageBtn">다음단계로 전환하기 ▶</div>
					</div>					
					<!-- 의견 -->
					<div class="mgtop"></div>
					<div class="bot_title"><h3>의견(7)</h3></div>
					<hr color="#F2B705" width="925px">
										<div class="bx">
						<div class="OpinionBox">
							<div class="name">구예지(영업1팀 대리)</div>
							<div class="txtOp">이 고객사와 계약 하려면 키위대리님에게 연락해서 물어보면 꿀팁 주십니다.</div>
							<div class="dt">2022-01-10 PM 05:39 </div>
							<div class="del">삭제</div>
						</div>
						<div class="OpinionBox">
							<div class="name">구예지(영업1팀 대리)</div>
							<div class="txtOp">이 고객은 상품권 같은 것 보다는 커피 한잔 사드리는것을 더 좋아하시더라구요..!</div>
							<div class="dt">2022-01-10 PM 05:39 </div>
							<div class="del">삭제</div>
						</div>
						<div class="OpinionBox">
							<div class="name">김민재(영업1팀 주임)</div>
							<div class="txtOp">이 고객사와 계약 하려면 키위대리님에게 연락해서 물어보면 꿀팁 주십니다.</div>
							<div class="dt">2022-01-10 PM 05:39 </div>
							<div class="del">삭제</div>
						</div>
						<div class="OpinionBox">
							<div class="name">유은정(영업1팀 사원)</div>
							<div class="txtOp">매출이 큰 회사는 아닌듯 합니다.</div>
							<div class="dt">2022-01-10 PM 05:39 </div>
							<div class="del">삭제</div>
						</div>
						<div class="OpinionBox">
							<div class="name">유은정(영업1팀 사원)</div>
							<div class="txtOp">하하하 </div>
							<div class="dt">2022-01-10 PM 05:39 </div>
							<div class="del">삭제</div>
						</div>
						<div class="OpinionBox">
							<div class="name">유은정(영업1팀 사원)</div>
							<div class="txtOp">하하하 </div>
							<div class="dt">2022-01-10 PM 05:39 </div>
							<div class="del">삭제</div>
						</div>
						<div class="OpinionBox">
							<div class="name">유은정(영업1팀 사원)</div>
							<div class="txtOp">하하하 </div>
							<div class="dt">2022-01-10 PM 05:39 </div>
							<div class="del">삭제</div>
						</div>
					</div>
					<div class="opBox">
						<textarea></textarea>
						<div class="cmn_btn subm">등록</div>
					</div>
					<!-- 히스토리 -->
					<div class="mgtop"></div>
					<div class="bot_title"><h3>히스토리(5)<div class="drop_btn"></div></h3></div>
					<hr color="#F2B705" width="925px">
					<div class="bx">
							<div class="OpinionBox">
								<div class="name">영업기회 (21/12/27 17:01:00)</div>
								<div class="txtOp">내용: 등록된 영업기회 표시</div>
								<div class="txtOp">담당자:000</div>
							</div>
							<div class="OpinionBox">
								<div class="name">계약 (21/12/27 17:01:00)</div>
								<div class="txtOp">내용: 계약 외 추가된 내용 기록</div>
								<div class="txtOp">담당자:000</div>
							</div>
							<div class="OpinionBox">
								<div class="name">계약 (21/12/27 17:01:00)</div>
								<div class="txtOp">내용: 계약 외 추가된 내용 기록</div>
								<div class="txtOp">담당자:000</div>
							</div>
							<div class="OpinionBox">
								<div class="name">계약 (21/12/27 17:01:00)</div>
								<div class="txtOp">내용: 계약 외 추가된 내용 기록</div>
								<div class="txtOp">담당자:000</div>
							</div>
							<div class="OpinionBox">
								<div class="name">계약 (21/12/27 17:01:00)</div>
								<div class="txtOp">내용: 계약 외 추가된 내용 기록</div>
								<div class="txtOp">담당자:000</div>
							</div>
					</div>
					<hr class="hr_bot" color="white" width="925px">
					<hr class="hr_bot" color="white" width="925px">
					<div class="salesOver_btn nb">영업 종료하기</div>
					</form>
					<!-- 끝 -->
					
					
				</div>
			</div>	
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>