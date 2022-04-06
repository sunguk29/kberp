<!-- 
	견적 상세보기 : sales3QtnCont
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견적 상세보기</title>
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
.drop_btn:hover, .up_btn:hover {
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
[href] {
	color: black;
	text-decoration: none;
}
.op_title { 
	font-size: 11pt;
}
.opbx {
	width: 860px;
	height: 305px;
	margin-left: 47.5px;
	overflow-y: auto;
}
.salesCont {
	width: 927px;
	height: 1138px;
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
		
		$("#actionForm").attr("action", "sales3Update");
		$("#actionForm").submit();
	});
	
	// 다음 단계로 전환하기 버튼 : 견적 등록 페이지
	$("#nextStageBtn").on("click", function() {
		$("#actionForm").attr("action", "sales4CntrctReg");
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
						url : "salesMng3ActionAjax/failure",
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
	
	/* 의견 목록 */
	reloadOpList();
	
	/* 의견 등록 버튼 클릭시 */
	$(".subm").on("click", function() {
		var params = $("#botOpActionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "sgstnBotActionAjax/insert",
			dataType : "json",
			data : params,
			success : function(res) {
				if(res.res == "success") {
					$("#tatacont").val("");
					reloadOpList();
				} else {
					alert("등록중 문제가 발생하였습니다.");
				}
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
		});
	});
	
	
	/* 의견 삭제 버튼 클릭시 */
	$(".opbx").on("click", ".del", function() {
		var cmntNum = $(this).children("#cmntNum").val();
		document.getElementById("cmntNum").value = cmntNum;
		
		makePopup({
			bg : false,
			bgClose : false,
			title : "경고",
			contents : "삭제하시겠습니까?",
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "예",
				func:function() {
					console.log($("#cmntNum").val());
					var params = $("#botOpActionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "sgstnBotActionAjax/update",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
								reloadOpList();
							} else {
								alert("삭제중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) {
							console.log(request.responseText);
						}
					});
					
					closePopup();
					
				}
			}, {
				name : "아니오"
			}]
		});
		
	});
	
	// 영업기회 탭 접기펼치기
	$("#sales_btn").on("click", "#salesContBtn_h", function() {
		$(".salesCont").hide();
		html = "<div class=\"up_btn\" id=\"salesContBtn_s\"></div>";
		$("#sales_btn").html(html);
	});
	
	$("#sales_btn").on("click", "#salesContBtn_s", function() {
		$(".salesCont").show();
		html = "<div class=\"drop_btn\" id=\"salesContBtn_h\"></div>";
		$("#sales_btn").html(html);
	});
	
	// 제안 탭 접기펼치기
	$("#sgstn_btn").on("click", "#sgstnContBtn_h", function() {
		$(".sgstnCont").hide();
		html = "<div class=\"up_btn\" id=\"sgstnContBtn_s\"></div>";
		$("#sgstn_btn").html(html);
	});
	
	$("#sgstn_btn").on("click", "#sgstnContBtn_s", function() {
		$(".sgstnCont").show();
		html = "<div class=\"drop_btn\" id=\"sgstnContBtn_h\"></div>";
		$("#sgstn_btn").html(html);
	});
	
	console.log('${param.LoanAmnt}');
	console.log('${LoanAmnt}');
	console.log(${LoanAmnt});
	console.log('kkkㅇㅇddk');
	
});

/* 의견 목록 Ajax */
function reloadOpList() {
	var params = $("#botOpActionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "sgstnOpBotListAjax",
		data : params,
		dataType : "json",
		success : function(res) {
			drawOpCnt(res.opListCnt);
			drawOpList(res.list);
		},
		error : function(req) {
			console.log(req.responseText);
		}
	});
}

/* 의견 목록 개수 html */
function drawOpCnt(opListCnt) {
	var html = "";
	
	html = "<h3>의견(" + opListCnt + ")</h3>";
	
	$(".op_title").html(html);
}

/* 의견 목록 html */
function drawOpList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<div class=\"OpinionBox\">";
		html += "<div class=\"name\">" + data.EMP_NAME + "(" + data.DEPT_NAME + " / " + data.RANK_NAME + ")" + "</div>";
		html += "<div class=\"txtOp\">" + data.CONT + "</div>";
		html += "<div class=\"dt\">" + data.RGSTRTN_DATE + "</div>";
		html += "<div class=\"del\">삭제";
		html += "<input type=\"hidden\" id=\"cmntNum\" name=\"cmntNum\" value=\"" + data.CMNT_NUM + "\" />";
		html += "</div>";
		html += "</div>";
	}
	
	$(".opbx").html(html);
	
}

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
			<div class="page_title_text">영업관리 - 견적 상세보기</div>
				<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />
				<img alt="인쇄버튼" src="resources/images/sales/printer.png" class="btnImg" />
				<img alt="수정버튼" src="resources/images/sales/pencil.png" class="btnImg" id="updateBtn" data-toggle="tooltip" title="견적서 추가하기" />
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
				
					<div class="bot_title">
						<h3>영업기회<span id="sales_btn"><div class="drop_btn" id="salesContBtn_h"></div></span></h3>
					</div>
				<div class="salesCont">
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
									<td colspan="3">
										<select class="txt" disabled="disabled">
											<optgroup>
												<c:choose>
													<c:when test="${data.EXPCTD_BSNS_TYPE eq 0}">													
														<option value="0" selected="selected">민수 사업</option>
													</c:when>
													<c:when test="${data.EXPCTD_BSNS_TYPE eq 1}">													
														<option value="0" selected="selected">관공 사업</option>
													</c:when>
													<c:when test="${data.EXPCTD_BSNS_TYPE eq 2}">													
														<option value="0" selected="selected">기타</option>
													</c:when>
												</c:choose>
											</optgroup>
										</select>
									</td>
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
				</div>
					
					<!-- *************** 영업기회 끝 **************** -->
					
					<hr class="hr_bot" color="#4B94F2" width="925px">
					<!-- *************** 제안 부분 시작 **************** -->
						
						<div class="bot_title">
							<h3>제안<span id="sgstn_btn"><div class="drop_btn" id="sgstnContBtn_h"></div></span></h3>
						</div>
						
						<div class="sgstnCont">
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
						<input type=file id="att" name="att" />
						<input type="hidden" id="attFile" name="attFile" />
						<div class="spc">
							<div class="adc_txt">
								첨부자료
							</div>
							<div class="cntrct_box_in">
							
							</div>
						</div>
						</div>
						
						
<!-- *************************************** 견적 시작 *************************************** -->			
	<hr class="hr_bot" color="#4B94F2" width="925px">
	<input type="hidden" name="salesNum" value="${param.salesNum}" /> <!-- 영업기회에서 가져온 영업번호 -->
					<input type="hidden" id= "mdNum" name="mdNum" /> <!-- 영업기회에서 가져온 영업번호 -->
					<div class="bot_title"><h3>견적</h3></div>
					 <hr class="hr_bot" color="white" width="925px"> 
					<div class="hr_bot"></div>
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
								<td colspan="3"><input type="text" class="txt" id="qtnName" name="qtnName" value="${data3.QTN_NAME}" readonly="readonly" /></td>		
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="상품유형" readonly="readonly" /></td>
								<td colspan="3">
									<select class="txt" id="mdType" name="mdType" disabled="disabled">
									 	<optgroup>
									 		<c:choose>
									 			<c:when test="${data3.MD_TYPE_NUM eq 0}">
											 		<option value="0" selected="selected">개인사업</option>
									 			</c:when>
									 			<c:when test="${data3.MD_TYPE_NUM eq 1}">
											 		<option value="0" selected="selected">법인사업</option>
									 			</c:when>
									 			<c:when test="${data3.MD_TYPE_NUM eq 2}">
											 		<option value="0" selected="selected">공공사업</option>
									 			</c:when>
									 		</c:choose>
									 	</optgroup>
									</select>
								</td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="견적일*" readonly="readonly" /></td>
									<td colspan="3"><input type="date" class="txt" id="qtnDate" name="qtnDate" value="${data3.QTN_DATE}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="대출금액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="LoanAmnt" name="LoanAmnt" value="${data3.LOAN_AMNT}" readonly="readonly" /></td>		
							</tr> 
							<tr height="40">
									<td><input type="button" class="btn" value="공급가액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="splyPrice" name="sqlyPrice" value="${data3.SPLY_PRICE}" readonly="readonly" /></td>		
							</tr> 
							<tr height="40">
									<td><input type="button" class="btn" value="세액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="taxAmnt" name="taxAmnt" value="${data3.TAX_AMNT}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="합계액*" readonly="readonly" /></td>
									<td colspan="3"><input type="text" class="txt" id="sumAmnt" name="sumAmnt" value="${data3.TOTAL}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
									<td><input type="button" class="btn" value="중도상환가능여부" readonly="readonly" /></td>
									<td>
										<select class="txt" id="prdmptn_psbl_check" name="prdmptnPsbl"  disabled="disabled">
											<optgroup>
												<c:choose>
													<c:when test="${data3.MID_RDMPTN_PSBL_CHECK eq 0}">
														<option value="0" selected="selected">가능</option>
													</c:when>
													<c:when test="${data3.MID_RDMPTN_PSBL_CHECK eq 1}">
														<option value="0" selected="selected">불가능</option>
													</c:when>
												</c:choose>
											</optgroup>
										</select>
									</td>
									<td><input type="button" class="btn" value="부가세*" readonly="readonly" /></td>
									<td>
										<select class="txt" id="srtx" name="srtx" onchange="test(this);" disabled="disabled">
										 	<optgroup>
										 		<c:choose>
										 			<c:when test="${data3.SRTX eq 0}">
										 				<option value="0" selected="selected">미포함</option>
										 			</c:when>
										 			<c:when test="${data3.SRTX eq 1}">
										 				<option value="0" selected="selected">포함</option>
										 			</c:when>
										 			<c:when test="${data3.SRTX eq 2}">
										 				<option value="0" selected="selected">면세</option>
										 			</c:when>
										 		</c:choose>
										 	</optgroup>
										</select>
									</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="이자납부방식" readonly="readonly" /></td>
								<td>
									<select class="txt" id="intrst_pymnt" name="intrstPymnt"disabled="disabled">
										<optgroup>
											<c:choose>
												<c:when test="${data3.INTRST_PYMNT_MTHD_NUM eq 0}">
													<option value="0" selected="selected">원금 균등 상환</option>
												</c:when>
												<c:when test="${data3.INTRST_PYMNT_MTHD_NUM eq 1}">
													<option value="0" selected="selected">원리금 균등 상환</option>
												</c:when>
												<c:when test="${data3.INTRST_PYMNT_MTHD_NUM eq 2}">
													<option value="0" selected="selected">만기 일시 상환</option>
												</c:when>
											</c:choose>
										</optgroup>
									</select>
								</td>
								<td><input type="button" class="btn" value="원금상환방식" readonly="readonly" /></td>
								<td colspan="2">
									<select class="txt" id="prncpl_pymnt" name="prncplPymnt" disabled="disabled">
										<optgroup>
											<c:choose>
												<c:when test="${data3.PRNCPL_PYMNT_MTHD_NUM eq 0}">
													<option value="0" selected="selected">원금 균등 상환</option>
												</c:when>
												<c:when test="${data3.PRNCPL_PYMNT_MTHD_NUM eq 1}">
													<option value="0" selected="selected">원리금 균등 상환</option>
												</c:when>
												<c:when test="${data3.PRNCPL_PYMNT_MTHD_NUM eq 2}">
													<option value="0" selected="selected">만기 일시 상환</option>
												</c:when>
											</c:choose>
										</optgroup>
									</select>
								</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="이자율(%)" /></td>
								<td><input type="text" class="txt" id="intrstRate" name="intrstRate" value="${data3.INTRST_RATE}" readonly="readonly" /></td>
								<td><input type="button" class="btn" value="납부일" readonly="readonly" /></td>
								<td colspan="2"><input type="text" class="txt" id="pymntDate" name="pymntDate" value="${data3.PYMNT_DATE}" readonly="readonly" placeholder="매달    일" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="대출기간" readonly="readonly" /></td>
								<td>
									<select class="txt" id="loanPrd" name="loanPrd" disabled="disabled">
										<optgroup>
											<c:choose>
												<c:when test="${data3.LOAN_PRD eq 0}">
													<option value="0" selected="selected">6개월</option>
												</c:when>
												<c:when test="${data3.LOAN_PRD eq 1}">
													<option value="0" selected="selected">1년</option>
												</c:when>
												<c:when test="${data3.LOAN_PRD eq 2}">
													<option value="0" selected="selected">3년</option>
												</c:when>
												<c:when test="${data3.LOAN_PRD eq 2}">
													<option value="0" selected="selected">5년</option>
												</c:when>
											</c:choose>
										</optgroup>
									</select>	
								</td>
								<td></td>
								<td colspan="2" style="border:none;"></td>
							</tr>
							<!-- <tr height="40">
								<td><input type="button" class="btn" value="월 납부액" readonly="readonly" /></td>
								<td><input type="text" class="txt" id="monthPymntAmnt" name="monthPymntAmnt" readonly="readonly" /></td>
								<td><input type="button" class="btn" value="월 이자액" readonly="readonly" /></td>
								<td colspan="2"><input type="text" class="txt" id="monthIntrstAmnt" name="monthIntrstAmnt" readonly="readonly" /></td>
							</tr> -->
							<tr height="40">
								<td><input type="button" class="btn" value="비고" readonly="readonly"/></td>
								<td colspan="3"><input type="text" class="rmks" name="rmksCont" value="${data3.RMKS}" readonly="readonly" /></td>
							</tr>							
						</tbody>
					</table>
					
					<!-- 첨부자료 -->
					<input type=file id="att" name="att" onchange="uploadName(this)" />
					<input type="hidden" id="attFile" name="attFile" />
					<div class="spc">
						<div class="adc_txt">
							첨부자료
							<img class="plus_btn att_btn" src="resources/images/sales/plus.png" />
						</div>
						<div class="cntrct_box_in">
							<input type="text" id="fileName" readonly="readonly" />
						</div>
					</div>



			
<!-- *************************************** 견적 끝 *************************************** -->						
					<div class="next_bot">
						<div class="cmn_btn nb" id="nextStageBtn">다음단계로 전환하기 ▶</div>
					</div>
				</form>					
				<form action="#" id="botOpActionForm" method="post">
					<input type="hidden" name="salesNum" value="${param.salesNum}" />
					<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
					<input type="hidden" id="cmntNum" name="cmntNum" />
					<!-- 의견 -->
					<div class="mgtop"></div>
					<div class="op_title"></div>
					<hr color="#F2B705" width="925px">
					<div class="opbx"></div>
					<div class="opBox">
						<textarea id="tatacont" name="tacont"></textarea>
						<div class="cmn_btn subm">등록</div>
					</div>
				</form>
					<!-- 히스토리 -->
<!-- 					<div class="mgtop"></div>
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
					</div> -->
					<hr class="hr_bot" color="white" width="925px">
					<hr class="hr_bot" color="white" width="925px">
					<div class="salesOver_btn nb">영업 종료하기</div>
					<!-- 끝 -->
					
					
				</div>
			</div>	
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>