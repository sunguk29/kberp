<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 ERP - 리드 상세보기</title>
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
.popup_bg {
	/* 숨김용 */
	display: none;
}
.popup {
	/* 숨김용 */
	display: none;
	/* 크기변경용 */
	width: 600px;
	height: 400px;
	top: calc(50% - 200px); /* 높이 반  */
	left: calc(50% - 300px); /* 너비 반 */
}

.popup_cont {
	/* 내용 변경용 */
	font-size: 10.5pt;
}

/* 개인 작업 영역 */
table{
	
	border: 1px;
	width: 927px;
	margin: 40px auto;
}
td:nth-child(2){
	border-bottom: 1px solid #d7d7d7;
}
tr:nth-child(10) td{
	border-bottom: 1px solid #d7d7d7;
}
tr:nth-child(9) td:nth-child(1){
	height: 66px;
}
td:nth-child(1) {
	text-align: center;
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
.txt_in{
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
.btnImg_in{
	display: inline-block;
	vertical-align: middle;
	width: 25px;
	height: 25px;
	float: right;
	cursor: pointer;
	margin-right: 5px;
}
.imgPos{
	text-align: right;
}
.imgPos_in{
	text-align: right;
	background-color: #f2f2f2;
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
.drop_btn:hover, .plus_btn:hover, .up_btn:hover {
	cursor: pointer;
}
/* 예정된 일정  */
.sche {
	display: inline-block;
	width: 696.5px;
}
.sch_re, .sch_del {
	font-size: 9pt;
	color: gray;
}
.sch_re:hover, .sch_del:hover {
	cursor: pointer;
	color: #F2CB05;
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
/* 첨부자료 */
.cntrct_box_in {
	width: 885px;
	height: 100px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
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
.plus_btn_bot {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 7px;
	margin-top: 7.5px;
}
.plus_btn_bot:hover {
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(document).ready(function () {
	
	$("#listBtn").on("click", function() {
		
		$("#actionForm").attr("action", "leadList");
		$("#actionForm").submit();
	});
});
</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="page" value="${param.page}" />	
	<input type="hidden" name="leadNum" value="${param.leadNum}" />	
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="searchDate" value="${param.searchDate}" />
	<input type="hidden" name="searchDate2" value="${param.searchDate2}" />
	<input type="hidden" name="srchType" value="${param.srchType}" />
	<input type="hidden" name="psNum" value="${param.psNum}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
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
			<div class="page_title_text">리드 상세보기</div>
			<!-- 검색영역 선택적 사항 -->
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />			
			<img alt="수정버튼" src="resources/images/sales/pencil.png" class="btnImg" />
			<img alt="삭제버튼" src="resources/images/sales/garbage.png" class="btnImg" />
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
				<div class="bodyWrap">
				<!-- 시작 -->
					<table>
						<colgroup>
							<col width="200" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="리드명 *" readonly="readonly"/></td>
								<td><input type="text" class="txt" value="${data.LEAD_NAME}" readonly="readonly" /></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객명 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" value="${data.CLNT_NAME}" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객사 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" value="${data.CLNT_CMPNY_NAME}" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객사 등급" readonly="readonly"/></td>
								<td><select class="txt_in" disabled="disabled">
										<optgroup>
											<c:choose>
												<c:when test="${data.GRADE_NUM eq 0}">
													<option value="0" selected="selected">S</option>										
												</c:when>
												<c:when test="${data.GRADE_NUM eq 1}">
													<option value="1" selected="selected">A</option>										
												</c:when>
												<c:when test="${data.GRADE_NUM eq 2}">
													<option value="2" selected="selected">B</option>										
												</c:when>
												<c:when test="${data.GRADE_NUM eq 3}">
													<option value="3" selected="selected">C</option>										
												</c:when>
												<c:when test="${data.GRADE_NUM eq 4}">
													<option value="4" selected="selected">D</option>										
												</c:when>
											</c:choose>
										</optgroup>
								</select></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="인지경로 *" readonly="readonly"/></td>
								<td><select class="txt_in" disabled="disabled" >
										<optgroup>
											<c:choose>
												<c:when test="${data.RCGNTN_PATH_NUM eq 0}">
													<option value="0" selected="selected">자사홈페이지</option>										
												</c:when>
												<c:when test="${data.RCGNTN_PATH_NUM eq 1}">
													<option value="1" selected="selected">인터넷검색</option>										
												</c:when>
												<c:when test="${data.RCGNTN_PATH_NUM eq 2}">
													<option value="2" selected="selected">지인소개</option>										
												</c:when>
												<c:when test="${data.RCGNTN_PATH_NUM eq 3}">
													<option value="3" selected="selected">세미나</option>										
												</c:when>	
												<c:when test="${data.RCGNTN_PATH_NUM eq 4}">
													<option value="4" selected="selected">전화</option>										
												</c:when>
												<c:when test="${data.RCGNTN_PATH_NUM eq 5}">
													<option value="5" selected="selected">기타</option>										
												</c:when>						
											</c:choose>
										</optgroup>
								</select></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="담당자 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" value="${data.EMP_NAME}" readonly="readonly"  />
									<img class="btnImg_in" alt="담당자아이콘" src="resources/images/sales/usericon.png" />
								</td>
							</tr>
							
						</tbody>
					</table>
					<!-- 첨부파일 -->
					<c:set var="fileLength" value="${fn:length(data.ATT_FILE_NAME)}"></c:set>
					<c:set var="fileName" value="${fn:substring(data.ATT_FILE_NAME, 20, fileLength)}"></c:set>
					<div class="rvn_txt">
						첨부파일
					</div>
					<div class="cntrct_box_in">
						<a href="resources/upload/${data.ATT_FILE_NAME}"  download="${fileName}">${fileName}</a>
					</div>
					<!-- 의견 -->
					<form action="#" id="botOpActionForm" method="post">
						
					</form>
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
					<!-- 예정된 일정 -->
					<div class="mgtop"></div>
					<div class="bot_title"><h3>예정된 일정(5)<div class="drop_btn"></div><div class="plus_btn_bot"></div></h3></div>
					<hr color="#F2B705" width="925px">
					<div class="bx">
							<div class="OpinionBox">
								<div class="name">예정된 일정 (22/01/27 17:01:00)</div>
								<div class="txtOp">내용: 000사원과 저녁식사 예정</div>
								<div class="txtOp sche">담당자:000</div><span class="sch_re">수정</span><span> | </span><span class="sch_del">삭제</span>
							</div>
							<div class="OpinionBox">
								<div class="name">예정된 일정 (22/01/27 17:01:00)</div>
								<div class="txtOp">내용: 000사원과 저녁식사 예정</div>
								<div class="txtOp sche">담당자:000</div><span class="sch_re">수정</span><span> | </span><span class="sch_del">삭제</span>
							</div>
							<div class="OpinionBox">
								<div class="name">예정된 일정 (22/01/27 17:01:00)</div>
								<div class="txtOp">내용: 000사원과 저녁식사 예정</div>
								<div class="txtOp sche">담당자:000</div><span class="sch_re">수정</span><span> | </span><span class="sch_del">삭제</span>
							</div>
							<div class="OpinionBox">
								<div class="name">예정된 일정 (22/01/27 17:01:00)</div>
								<div class="txtOp">내용: 000사원과 저녁식사 예정</div>
								<div class="txtOp sche">담당자:000</div><span class="sch_re">수정</span><span> | </span><span class="sch_del">삭제</span>
							</div>
							<div class="OpinionBox">
								<div class="name">예정된 일정 (22/01/27 17:01:00)</div>
								<div class="txtOp">내용: 000사원과 저녁식사 예정</div>
								<div class="txtOp sche">담당자:000</div><span class="sch_re">수정</span><span> | </span><span class="sch_del">삭제</span>
							</div>
					</div>
					<!-- 끝 -->
				</div>
			</div>	
		</div>
	</div>
<!-- bottom -->
<c:import url="/bottom"></c:import>
</body>
</html>