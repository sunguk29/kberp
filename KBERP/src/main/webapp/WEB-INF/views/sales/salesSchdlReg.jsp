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
.sales_txt, .lead_txt{
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
	background-image: url(resources/images/sales/popup.png);
	background-size: 20px 20px;
	background-repeat: no-repeat;
	background-position: 700px center;
}
.sales_txt:hover, .lead_txt:hover{
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
	
	/* 목록 이동 이벤트 */
	$("#listBtn").on("click", function() {
		$("#backForm").submit();
	});
	
	
	/* 저장 이동 및 알림 이벤트 */
	$("#saveBtn").on("click", function() {
		if(checkEmpty("#ssname")){
			makeAlert("필수입력", "일정명을 입력하세요");
			$("#ssname").focus();
		} else if(checkEmpty("#ssactvtyclsfy")){
			makeAlert("필수입력", "활동분류를 입력하세요");
			$("#ssactvtyclsfy").focus();
		} else if(checkEmpty("#sdt")){
			makeAlert("필수입력", "시작일을 입력하세요");
			$("#sdt").focus();
		} else if(checkEmpty("#ssactvtycont")){
			makeAlert("필수입력", "활동내용을 입력하세요");
			$("#ssactvtycont").focus();
		} else {
			makePopup({
				bg : false,
				bgClose : false,
				title : "저장",
				contents : "저장하시겠습니까?",
				contentsEvent : function() {
					$("#popup").draggable();
				},
				draggable : true,
				width : 400,
				height: 180,
				buttons : [{
					name : "확인",
					func:function(){
						
						var RegForm = $("#RegForm");
						
						RegForm.ajaxForm({
							success: function(res) {
								if(res.fileName.length > 0) {
									$("#schdl_att_file").val(res.fileName[0]);
								}
								
								var params = $("#RegForm").serialize();
								
								$.ajax({
									type  : "post",
									url : "salesSchdlAction/insert",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "success"){
											savePop();								
										} else {
											alert("등록중 문제가 발생하였습니다.");
										}
									},
									error : function(request, status, error) {
										console.log(request.responseTxt);
									}
								});
							},
							error : function(req) {
								console.log(req.responseTxt);
							}
						});
						
						RegForm.submit();
						}
						}, {
							name : "취소"
						}]
				});
						
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


function savePop() {
	var html = "";
	
	html += "<div class=\"popup_cont\">저장되었습니다</div>";
	
	makePopup({
		bg : false,
		bgClose : false,
		title : "저장",
		draggable : true,
		contents : html,
		width : 400,
		height : 180,
		buttons : [{
			name : "확인",
			func:function() {
				$("#backForm").submit();
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
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg"  id="listBtn"/> 
			<img alt="삭제버튼" src="resources/images/sales/garbage.png" class="btnImg" id="deleteBtn" />
			<img alt="저장버튼" src="resources/images/sales/save.png" class="btnImg" id="saveBtn" />
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
				<div class="bodyWrap">
				<!-- 시작 -->
					<form action="#" id="RegForm" method="post" enctype="multipart/form-data">
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
									<input type="text" class="sales_txt" id="sNum" name="sNum" />
								</td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="리드" readonly="readonly"/></td>
								<td colspan="5">
									<input type="text" class="lead_txt" id="lNum" name="lNum" />
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
								<td colspan="5"><select class="txt_in" id="ssactvtyclsfy" name="ssactvtyclsfy">
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
								<td><input type="button" class="btn" value="날짜 *" readonly="readonly"/></td>
								<td colspan="2"><input type="datetime-local" class="txt" id="sdt" name="sdt"/></td>
								<td>
									<div class="wave"> ~ </div>
								</td>
								<td colspan="2"><input type="datetime-local" class="txt" id="edt" name="edt"/></td>
							</tr>
							<tr>
								<td><input type="button" class="btn" value="활동내용 *" readonly="readonly"/></td>
								<td colspan="5"><textarea class="ta_box" id="ssactvtycont" name="ssactvtycont"></textarea></td>
							</tr>
						</tbody>
					</table>
					<!-- 첨부자료 -->
					<div class="rvn_txt">
						첨부파일 (0) <input type="file" name="att" />
						<input type="file" id="schdl_att_file" name="schdl_att_file"' /> 
						<img class="plus_btn"  src="resources/images/sales/plus.png" border='0' /> 
					</div>
					<div class="cntrct_box_in"></div>
					</form>
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