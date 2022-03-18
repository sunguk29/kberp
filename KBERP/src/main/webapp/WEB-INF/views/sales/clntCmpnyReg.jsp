<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 고객사</title>
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
tr:nth-child(11) > td:nth-child(1){
	border-bottom: 1px solid #d7d7d7;
}
/* tr:nth-child(9) > td:nth-child(2){
	background-color: #F2F2F2;
} */
td:nth-child(1), td:nth-child(3){
	text-align: center;
}
.btn{
	width : 90px;
	height: 40px;
}
.btn, .address{
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	width: 150px;
	border: none;
	text-align: center;
}
.btnImg:hover, .plus_btn:hover {
	cursor: pointer;
}
.txt{
	height: 30px;
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
/* .txt_ad {
	height: 30px;
	width: 679px;
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
} */

.btnImg{
	width : 30px;
	float: right;
	margin-left: 10px;
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
.drop_btn:hover, .up_btn:hover {
	cursor: pointer;
}
.cc_box_in {
	display: inline-block;
	vertical-align: top;
	width: 480px;
	height: 65px;
	padding-top: 5px;
	padding-left: 20px;
	white-space: pre;
	font-size: 13px;
	line-height: 20px;
}
.cc_box_in:hover {
	cursor: pointer;
	color: #2E83F2;
}
.cc_box_right {
	display: inline-block;
	vertical-align: top;
	width: 305px;
	height: 70px;
	padding-right: 20px;
}
.right_box {
	width: 136px;
	height: 70px;
	font-size: 14px;
	padding-left: 162px;
	line-height: 70px;
	text-align: center;
}
.boldname{
	font-weight: bold;
}
/* 팝업 버튼 */
.btn_pos {
	text-align: center;
}
.btn_wd {
	width: 60px;
}
.cont_pos {
	line-height: 100px;
	text-align: center;
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
$(document).ready(function() {
	$("#listBtn").on("click", function() {
		$("#listForm").submit();
	});
	
	$("#addBtn").on("click", function() {
		if(checkEmpty("#cc_name")) {
			alert("고객사를 입력하세요.");
			$("#cc_name").focus();
		} else if(checkEmpty("#cc_clsfy")) {
			alert("고객사 분류를 선택하세요.");
			$("#cc_clsfy").focus();
		} else if(checkEmpty("#cc_grade")) {
			alert("고객사 등급을 선택하세요.");
			$("#cc_grade").focus();
		} else if(checkEmpty("#zip_code_num")) {
			alert("우편번호를 입력하세요.");
			$("#zip_code_num").focus();
		} else if(checkEmpty("#adrs")) {
			alert("주소를 입력하세요.");
			$("#adrs").focus();
		} else if(checkEmpty("#dtl_adrs")) {
			alert("상세주소를 입력하세요.");
			$("#dtl_adrs").focus();
		} else if(checkEmpty("#rvn")) {
			alert("매출를 입력하세요.");
			$("#rvn").focus();
		} else if(checkEmpty("#rp")) {
			alert("인지경로를 선택하세요.");
			$("#rp").focus();
		} else {
			var addForm = $("#addForm");
			
			addForm.ajaxForm({
				success : function(res) {
					if(res.fileName.length > 0) {
						$("#attFile").val(res.fileName[0]);
					}
					
					var params = $("#addForm").serialize();
					
					$.ajax({
						type : "post",
						url : "clntCmpnyMngAction/insert",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
								location.href = "clntCmpnyList";
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
					console.log(req.responseText);
				}
			});
			
			addForm.submit(); 
		}
	});
});

function checkEmpty(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
}
</script>
</head>
<body>
<form action="clntCmpnyList" id="listForm" method="post">
	<input type="hidden" id="page" name="page" value="${page}" />
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
			<div class="page_title_text">고객사 등록</div>
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />
			<img alt="등록버튼" src="resources/images/sales/save.png" class="btnImg" id="addBtn" />
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="bodyWrap">
				<table>
					<colgroup>
						<col width="200" />
						<col width="auto" />
					</colgroup>
					<form action="imageUploadAjax" id="addForm" method="post" enctype="multipart/form-data">
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="고객사 *" readonly="readonly" /></td>
								<td><input type="text" class="txt" id="cc_name" name="cc_name" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="고객사 분류 *" /></td>
								<td><select class="txt" id="cc_clsfy" name="cc_clsfy">
										<optgroup>
											<option>선택하세요</option>
											<option value="0">거래고객사</option>
											<option value="1">파트너사</option>
											<option value="2">해지고객사</option>
											<option value="3">정지고객사</option>
											<option value="4">외국고객사</option>
											<option value="5">기타</option>
										</optgroup>
								</select></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="등급 *" /></td>
								<td><select class="txt" id="cc_grade" name="cc_grade">
										<optgroup>
											<option>선택하세요</option>
											<option value="0">S</option>
											<option value="1">A</option>
											<option value="2">B</option>
											<option value="3">C</option>
											<option value="4">D</option>
										</optgroup>
								</select></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="사업자번호" /></td>
								<td><input type="text" class="txt" id="br_num" name="br_num" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="대표" /></td>
								<td><input type="text" class="txt" id="c_name" name="c_name" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="유선번호" /></td>
								<td><input type="text" class="txt" id="phone_num" name="phone_num" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="팩스번호" /></td>
								<td><input type="text" class="txt" id="fax" name="fax" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="웹사이트" /></td>
								<td><input type="text" class="txt" id="hmpg" name="hmpg" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="우편번호" /></td>
								<td><input type="text" class="txt" id="zip_code_num" name="zip_code_num" /></td>
							</tr>
							<tr height="40">
								<td rowspan="2"><input type="button" class="address" value="주소 *" /></td>
								<td><input type="text" class="txt" id="adrs" name="adrs" /></td>
								<!-- <img class="btnImg" alt="돋보기" src="resources/images/sales/mg.png" /></td> -->
							</tr>
							<tr height="40">
								<td><input type="text" class="txt" placeholder="상세주소" id="dtl_adrs" name="dtl_adrs"/></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="매출(년)*" /></td>
								<td><input type="text" class="txt" id="rvn" name="rvn" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="인지경로"></td>
								<td><select class="txt" id="rp" name="rp">
										<optgroup>
											<option value="0">자사홈페이지</option>
											<option value="1">인터넷검색</option>
											<option value="2">지인소개</option>
											<option value="3">세미나</option>
											<option value="4">전화</option>
											<option value="5">기타</option>
										</optgroup>
								</select></td>
							</tr>
						</tbody>
					</table>
					<!-- 첨부자료 -->
					<!-- <div class="rvn_txt">
						첨부자료 (0) <input type="file" name="att" />
						<input type="hidden" id="attFile" name="attFile" />
						<img class="plus_btn" src="resources/images/sales/plus.png" border='0' />
					</div>
					<div class="cntrct_box_in"></div> -->
					<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
				</form>
			</div>
		</div>
			<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>