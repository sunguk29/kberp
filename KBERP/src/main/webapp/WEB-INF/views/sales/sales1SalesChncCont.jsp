<!-- 
	영업기회 상세보기 : sales1SalesChncCont
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업기회 상세보기</title>
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
    font-size: 10pt;
    text-indent: 12px;
    line-height: 40px;
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
.popup_cont2 {
	/* 내용 변경용 */
	font-size: 13pt;
	font-weight: 600;
	text-align: center;
	line-height: 100px;
}
/* 끝 */
</style>
<script type="text/javascript">
$(document).ready(function() {
	// 목록 버튼
	$("#listBtn").on("click", function() {
		
		$("#actionForm").attr("action", "salesList");
		$("#actionForm").submit();
	});
	
	// 수정 버튼
	$("#updateBtn").on("click", function() {
		
		$("#actionForm").attr("action", "sales1Update");
		$("#actionForm").submit();
	});
	
	// 다음 단계로 전환하기 버튼 : 제안 등록 페이지
	$("#nextStageBtn").on("click", function() {
		$("#actionForm").attr("action", "sales2SgstnReg");
		$("#actionForm").submit();
	});
	
	
	// 영업 종료하기 버튼
	$(".salesOver_btn").on("click", function() {
		// 수정이랑 같음, 상태를 종료로 변경, ajax로 failure로 보내기
		
		var html = "";
		
		html += "<div class=\"popup_cont2\">영업을 종료하시겠습니까?</div>";
		
		makePopup({
			bg : true,
			bgClose : false,
			title : "영업 종료하기",
			contents : html,
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
						url : "salesMng1ActionAjax/failure",
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
		
		if(checkEmpty("#tatacont")) {
			var html = "";
			
			html += "<div class=\"popup_cont2\">의견 내용 입력 후, 등록버튼을 눌러주세요.</div>";
			
			makePopup({
				depth : 1,
				bg : true,
				width : 400,
				height : 200,
				title : "알림",
				contents : html,
				buttons : {
					name : "확인",
					func:function() {
						console.log("One!");
						closePopup();
					}
				}
			});
			("#tatacont").focus();
		} else {
		
			var params = $("#botOpActionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "salesBotActionAjax/insert",
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
		}
	});
	
	
	/* 의견 삭제 버튼 클릭시 */
	$(".opbx").on("click", ".del", function() {
		var cmntNum = $(this).children("#cmntNum").val();
		document.getElementById("cmntNum").value = cmntNum;
		
		var html = "";
		
		html += "<div class=\"popup_cont2\">삭제하시겠습니까?</div>";
		
		makePopup({
			bg : false,
			bgClose : false,
			title : "경고",
			contents : html,
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "확인",
				func:function() {
					console.log($("#cmntNum").val());
					var params = $("#botOpActionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "salesBotActionAjax/update",
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
				name : "취소"
			}]
		});
		
	});
	
});

/* 의견 목록 Ajax */
function reloadOpList() {
	var params = $("#botOpActionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "salesOpBotListAjax",
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
	<input type="hidden" id="salesNum" name="salesNum" value="${param.salesNum}" /> <!-- 영업번호 -->
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
			<div class="page_title_text">영업관리 - 영업기회 상세보기</div>
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
				
					<div class="bot_title"><h3>영업기회</h3></div>
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
					<c:set var="fileLength" value="${fn:length(data.ATT_FILE_NAME)}"></c:set>
					<c:set var="fileName" value="${fn:substring(data.ATT_FILE_NAME, 20, fileLength)}"></c:set>
					<div class="spc">
						<div class="adc_txt">
							첨부자료
						</div>
						<div class="cntrct_box_in">
							<a href="resources/upload/${data.ATT_FILE_NAME}"  download="${fileName}">${fileName}</a>
						</div> 
					</div>
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