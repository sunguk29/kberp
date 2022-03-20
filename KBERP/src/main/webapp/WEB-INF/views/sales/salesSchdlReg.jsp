<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 일정</title>
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

/* 개인 작업 영역 */
table{
	border: 1px;
	width: 927px;
	margin: 40px auto;
}
td:nth-child(n+2) {
	border-bottom: 1px solid #d7d7d7;
}
td:nth-child(1), td:nth-child(3), td:nth-child(4){
	text-align: center;
}
td:nth-child(3) {
	border : none;
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
.txt_in:hover, .btnImg:hover{
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
.txt:hover{
	cursor : pointer;
}
input {
	font-size: 10.5px;
}
.btnImg{
	width : 30px;
	float: right;
	margin-left: 10px;
}
.btnImg_in{
	display: inline-block;
	vertical-align: top;
	width: 25px;
	height: 25px;
	float: right;
	cursor: pointer;
	margin-top: 4px;
}
.imgPos{
	width: 613px;
	display: inline-block;
	vertical-align: top;
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
.plus_btn, .drop_btn:hover {
	cursor: pointer;
}
.txt_in {
	width: 100%;
	border: none;
	outline: none;
}
.date_sign {
	text-align: center;
}
/* 활동시간 입력칸 */
.num_in {
	width: 130px;
	outline: none;
	border: none;
}
.ta_box {
 width: 718px;
 height: 80px;
 border: none;
 outline: none;
 background-color: #f2f2f2;
 resize: none;
 margin: 5px 0px;
}
.jo_box {
 width: 718px;
 height: 40px;
 border: none;
 outline: none;
 background-color: #f2f2f2;
 resize: none;
}
.up_btn {
	display:inline-block;
	vertical-align: middle;
	width: 18px;
	height: 18px;
	background-image: url("resources/images/sales/up_arrow.png");
	background-size: 18px 18px;
	float: right;
	margin-right: 5px;
}
.plus_btn:hover, .up_btn:hover {
	cursor: pointer;
}
/* 날짜 입력칸 */
.date_box {
	width: 100%;
	height: 33px;
	font-size: 10.5px;
	border: none;
	outline: none;
}
/* 물결용 */
.wave {
	display: inline-block;
	vertical-align: top;
	width: 15px;
	height: 15px;
	font-size: 15px;
	font-weight: bold;
	margin-left: 20px;
	line-height: 15px;
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
			contentsEvent : function() {
				$("#popup1").draggable();
			},
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
	
	/* 목록 이동 이벤트 */
	$("#listBtn").on("click", function() {
		$("#backForm").submit();
	});
	
	
	/* 저장 이동 및 알림 이벤트 */
	$("#saveBtn").on("click", function() {
		if(checkEmpty("#ssname")){
			essentialPop();
			$("#ssname").focus();
		} else if(checkEmpty("#ssactvtyclsfy")){
			essentialPop();
			$("#ssactvtyclsfy").focus();
		} else if(checkEmpty("#ssactvtyprps")){
			essentialPop();
			$("#ssactvtyprps").focus();
		} else if(checkEmpty("#sdt")){
			essentialPop();
			$("#sdt").focus();
		} else {
			saveCheckPop();
		}
		
	});
	
});

/* 비어있는지 확인하기 위한 함수 */
function checkEmpty(sel) {
	if($.trim($(sel).val()) == ""){
		return true;
	} else {
		return false;
	}
}

function essentialPop() {
	var html = "";
	
	html += "<div class=\"popup_cont\">필수항목을 입력하세요.</div>";
	
	makePopup({
		bg : true,
		bgClose : false,
		title : "필수 항목 입력",
		draggable : true,
		contents : html,
		width : 400,
		height : 180,
		buttons : [{
			name : "확인",
			func:function(){
				closePopup();
			}
		}]
	});
}

function saveCheckPop() {
	var html = "";
	
	html += "<div class=\"popup_cont\">저장하시겠습니까?</div>";
	
	makePopup({
		bg : true,
		bgClose : false,
		title : "저장",
		draggable : true,
		contents : html,
		width : 400,
		height : 180,
		buttons : [{
			name : "확인",
			func:function(){
				savePop();
			}
		}, {
			name : "취소"	,
			func:function(){
				closePopup();
			}
		}]
	});
}

function savePop() {
	var html = "";
	
	html += "<div class=\"popup_cont\">저장되었습니다</div>";
	
	makePopup({
		bg : true,
		bgClose : false,
		title : "저장",
		draggable : true,
		contents : html,
		width : 400,
		height : 180,
		buttons : [{
			name : "확인",
			func:function(){
				closePopup();
			}
		}]
	});
}
</script>
</head>
<body>
<form action="salesSchdl" id = "backForm" method="post">
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
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
			<div class="page_title_text">영업일정 등록</div>
			<img alt="저장버튼" src="resources/images/sales/save.png" class="btnImg" id="saveBtn" />
			<img alt="삭제버튼" src="resources/images/sales/garbage.png" class="btnImg" id="deleteBtn" />
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg"  id="listBtn"/>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
				<div class="bodyWrap">
				<!-- 시작 -->
					<form action="#" id="RegForm" method="post">
					<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
					<table>
						<colgroup>
							<col width="200" />
							<col width="143.4" />
							<col width="143.4" />
							<col width="143.4" />
							<col width="143.4" />
							<col width="143.4" />
						</colgroup>
						
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="일정명 *" readonly="readonly"/></td>
								<td colspan="5"><input type="text" class="txt" id="ssname" name="ssname"/></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="영업" readonly="readonly"/></td>
								<td colspan="5">
									<img class="btnImg_in" alt="팝업" src="resources/images/sales/popup.png" id="sNum" name="sNum"/>
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="리드" readonly="readonly"/></td>
								<td colspan="5">
									<img class="btnImg_in" alt="팝업" src="resources/images/sales/popup.png" id="lNum" name="lNum"/>
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객명" readonly="readonly"/></td>
								<td colspan="5"><input type="text" class="txt" readonly="readonly"  name="clName"/></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="고객사" readonly="readonly"/></td>
								<td colspan="5"><input type="text" class="txt" readonly="readonly" name="ccName" /></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="활동분류 *" readonly="readonly"/></td>
								<td colspan="5"><select class="txt_in" id=ssactvtyclsfy" name="ssactvtyclsfy">
										<optgroup>
											<option>선택하세요</option>
											<option value="0">전화</option>
											<option value="1">메일</option>
											<option value="2">방문</option>
											<option value="3">기타</option>
										</optgroup>
								</select></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="활동목적 *" readonly="readonly"/></td>
								<td colspan="5"><select class="txt_in" id="ssactvtyprps">
										<optgroup>
											<option>선택하세요</option>
											<option value="0">종합광고</option>
											<option value="1">개별광고</option>
											<option value="2">클레임</option>
											<option value="3">교육</option>
											<option value="4">기타</option>
										</optgroup>
								</select></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="날짜 *" readonly="readonly"/></td>
								<td colspan="2"><input type="datetime-local" class="txt" id="sdt" name="sdt"/></td>
								<td>
									<div class="wave"> ~ </div>
								</td>
								<td colspan="2"><input type="datetime-local" class="txt" id="edt" name="edt"/></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="활동내용" readonly="readonly"/></td>
								<td colspan="5"><textarea class="ta_box" id="ssactvtycont" name="ssactvtycont"></textarea></td>
							</tr>
						</tbody>
					</table>
					</form>
					<!-- 첨부자료 -->
					<div class="rvn_txt"> 첨부자료 (0)
						<input type=file name='file1' style='display: none;' /> 
						<img class="plus_btn" id="schdl_att_file" name="schdl_att_file" src="resources/images/sales/plus.png" border='0' onclick="document.all.file1.click();" > 
					</div>
					<div class="cntrct_box_in"></div>
					<!-- 끝 -->
				</div>
		
			<div class="board_bottom">
				<div class="pgn_area">
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>