<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리드등록</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 1013px;;
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
.plus_btn, .btnImg:hover{
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
.cntrct_box_in {
	width: 885px;
	height: 150px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
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
.plus_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("../../images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 5px;
	margin-top: 5.5px;	
}
.imgPos{
	text-align: right;
}
.imgPos_in{
	text-align: right;
	background-color: #f2f2f2;
}

/* 예정된 일정 */
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
.txtOp, .dt {
	padding-left: 20px;
}
.dt {
	display: inline-block;
	vertical-align: top;
	font-size: 9pt;
	padding-right: 590px;
	color: gray;
}
.drop_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("../../images/sales/downarrow.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
}
.plus_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("../../images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-top: 7.5px;
	margin-right: 20px;
}
.up_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("../../images/sales/up_arrow.png");
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
	background-image: url("../../images/sales/plus.png");
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
	background-image: url("../../images/sales/plus.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 7px;
	margin-top: 7.5px;
}
.plus_btn_bot:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">리드 등록</div>
			<!-- 검색영역 선택적 사항 -->
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" />
			<img alt="저장버튼" src="resources/images/sales/save.png" class="btnImg" />
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
								<td><input type="text" class="txt" /></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객명 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" />
									<img class="btnImg_in" alt="팝업" src="../../images/sales/popup.png" />
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객사 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" />
									<img class="btnImg_in" alt="팝업" src="../../images/sales/popup.png" />
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객사 등급" readonly="readonly"/></td>
								<td><select class="txt_in" disabled="disabled">
										<optgroup>
											<option>고객사 등록 후 자동 입력</option>
											<option>S</option>
											<option>A</option>
											<option>B</option>
											<option>C</option>
											<option>D</option>
										</optgroup>
								</select></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="인지경로 *" readonly="readonly"/></td>
								<td><select class="txt_in">
										<optgroup>
											<option>자사홈페이지</option>
											<option>인터넷검색</option>
											<option>지인소개</option>
											<option>세미나</option>
											<option>전화</option>
										</optgroup>
								</select></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="담당자 *" readonly="readonly"/></td>
								<td>
									<input type="text" class="txt" />
									<img class="btnImg_in" alt="담당자아이콘" src="resources/images/sales/usericon.png" />
								</td>
							</tr>
							
						</tbody>
					</table>
					<!-- 첨부자료 -->
					<div class="rvn_txt"> 첨부자료 (0)
						<input type=file name='file1' style='display: none;' /> 
						<img class="plus_btn" src="../../images/sales/plus.png" border='0' onclick="document.all.file1.click();" > 
					</div>
					<div class="cntrct_box_in"></div>
				</div> <!-- bodyWrap end -->
			</div>	
		</div>
	</div>
<!-- bottom -->
<c:import url="/bottom"></c:import>
</body>
</html>