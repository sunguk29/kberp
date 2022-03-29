<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 고객</title>
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
	margin: 20px auto;
}
table{
	
	border: 1px;
	width: 927px;
	margin: 40px auto;
}
td:nth-child(2), td:nth-child(4){
	border-bottom: 1px solid #d7d7d7;
}

td:nth-child(1), td:nth-child(3){
	text-align: center;
}
.btn{ /* 내용 제목 영역 */
	width : 90px;
	height: 40px;
}
.btn {
	background-color: #fff;
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	width: 150px;
	border: none;
	text-align: center;
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
	width: 30px;
	float: right;
	margin-left: 10px;
}

/* 목록, 수정, 삭제 영역 */
.imgPos{
	position: relative;
}
.plus_btn:hover {
	cursor: pointer;
}
/* 첨부자료 */
.cntrct_box_in {
	width: 885px;
	height: 100px;
	border: 1px solid #d7d7d7;
	border-radius: 7px;
	margin-bottom: 18px;
	margin-left: 40px;
	font-size: 10pt;
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
#att {
	display: none;
}
.btnImg_in {
    position: absolute;
    left: 691px;
    top: 4px;
    width: 25px;
    cursor: pointer;
}
.imgName {
	padding-right: 30px;
}
/* 팝업 */
.popup_title_mid {
	width: calc(100% + 20px);
	height: 70px;
	background-color: #F2F2F2;
	font-size: 11pt;
	padding-bottom: 3px;
	border-bottom: 1px solid #d7d7d7;
    margin: -10px 0px 0px -10px;
}
.ptm_left {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 70px;
}
.ptm_left_top, .ptm_left_bot  {
	width: 100px;
	height: 35px;
	line-height: 35px;
	text-align: right;
	font-size: 15px;
	font-weight: bold;
}
.ptm_right_bot {
	width: 94px;
	height: 35px;
	line-height: 35px;
	text-align: left;
	font-size: 15px;
	font-weight: bold;
}
.ptm_right_bot2 {
	width: 94px;
    height: 32px;
    margin-top: 5px;
    text-align: center;
}
.ptm_mid {
	display: inline-block;
	vertical-align: top;
	width: 150px;
	height: 70px;
}
.ptm_mid_top, .ptm_mid_bot {
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.sel_size {
	width: 130px;
	height: 25px;
	outline: none;
}
.ptm_mid_right0 {
	display: inline-block;
	vertical-align: top;
	width: 50px;
	height: 70px;
}
.ptm_mid_right {
	display: inline-block;
	vertical-align: top;
	width: 185px;
	height: 70px;
}
.ptm_mid_right_top, .ptm_mid_right_bot {
	width: 180px;
	height: 35px;
	line-height: 35px;
	text-align: center;
}
.text_size1 {
	width: 123px;
	height: 19px;
	outline: none;
}
.text_size2 {
	width: 170px;
	height: 19px;
	margin-left : 12px;
	outline: none;
}
.ptm_right {
	display: inline-block;
	vertical-align: top;
	width: 94px;
	height: 100%;
}
.ptm_right_top {
	width: 94px;
	height: 32px;
	text-align: center;
}
/* 팝업 내용 */
.popup_box_left {
   display: inline-block;
   vertical-align: top;
   width: 120px;
   height: 50px;
}
.popup_cc_box_right {
   display: inline-block;
   width: 400px;
   height: 50px;
   font-size: 14px;
}
.popup_mng_box_right {
   display: inline-block;
   width: 400px;
   height: 50px;
   font-size: 14px;
   line-height: 50px;
}
.popup_cc_box_in {
   width: 550px;
   height: 55px;
   border: 2px solid #d7d7d7;
   border-radius: 7px;
   background-color: #F2F2F2;
   margin-left: 15px;
   margin-bottom: 5px;
}
.popup_mng_box_in {
   width: calc(100% - 4px);
   height: 50px;
   border: 2px solid #d7d7d7;
   border-radius: 3px;
   background-color: #F2F2F2;
   margin-bottom: 5px;
}

.popup_mng_box_in:hover, .popup_cc_box_in:hover {
   cursor: pointer;
   border: 2px solid #2E83F2;
}
.company {
   display: inline-block;
   width: 42px;
   height: 25px;
   background-image: url("resources/images/sales/client.png");
   background-size: 42px 25px;
   margin-top: 13px;
   margin-left: 45px;
}
.mngIcon {
   display: inline-block;
   width: 42px;
   height: 25px;
   margin-top: 13px;
   margin-left: 45px;
}
.boldname{
	font-weight: bold;
	font-size : 12px;
}
.boldMngName{
	margin-left: 30px;
	font-weight: bold;
}
.mg_wid {
	margin-left: 50px;
}
.popCmnBtn {
	margin-top: 35px;
	margin-left: 200px;
}
.popMngBtn {
	margin-top: 5px;
	margin-left: 25px;
}
.popup_box_mng {
	height: 297px;
	padding-top: 8px;
}
.popup_box_cc {
	height: 322px;
	padding-top: 8px;
}
[href] {
	color: black;
	text-decoration: none;
	
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action", "clntList");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action", "clntUpdate");
		$("#actionForm").submit();
	});
	
	$("#deleteBtn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "경고",
			contents : "삭제하시겠습니까?",
			contentsEvent : function() {
				$("#popup1").draggable();
			},
			buttons : [{
				name : "삭제",
				func:function() {
					
					var params = $("#actionForm").serialize();
					
					$.ajax({
						type : "post",
						url : "clntMngAjax/delete",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
								$("#actionForm").attr("action", "clntList");
								$("#actionForm").submit();
							} else {
								alert("삭제중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) {
							console.log(request.responseText);
						}
					});
					
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});		
	}); // 글 삭제 버튼 end
	
});
</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="page" name="page" value="${page}" />
	<input type="hidden" name="cn" value="${param.cn}" />
	<input type="hidden" name="searchType" value="${param.searchType}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
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
			<div class="page_title_text">고객 상세보기</div>
			<img alt="목록버튼" src="resources/images/sales/list.png" class="btnImg" id="listBtn" />
			<img alt="수정버튼" src="resources/images/sales/pencil.png" class="btnImg" id="updateBtn" />
			<img alt="삭제버튼" src="resources/images/sales/garbage.png" class="btnImg" id="deleteBtn" />
			<!-- 검색영역 선택적 사항 -->
			
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
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="고객 *" readonly="readonly"/></td>
								<td><input type="text" class="txt" id="cName" name="cName" value="${data.CLNT_NAME}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="고객사 *" /></td>
								<td>
									<div class="imgPos">
										<input type="text" class="txt imgName" id="ccName" name="ccName" value="${data.CLNT_CMPNY_NAME}" readonly="readonly" />
										<input type="hidden" id="ccNum" name="ccNum" />
										<!-- <img class="btnImg_in" id="ccPop" alt="팝업" src="resources/images/sales/popup.png"> -->
									</div>
								</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="부서" /></td>
								<td><input type="text" class="txt" id="dept" name="dept" value="${data.DEPT}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="직책" /></td>
								<td><input type="text" class="txt" id="duty" name="duty" value="${data.DUTY}" readonly="readonly" /></td>								
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="휴대폰 번호*" /></td>
								<td><input type="text" class="txt" id="mbl" name="mbl" placeholder="'-' 를 포함하지 않은 숫자만 입력해주세요." value="${data.MBL}" readonly="readonly" /></td>																
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="메일" /></td>
								<td><input type="text" class="txt" id="email" name="email" value="${data.EMAIL}" readonly="readonly" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="담당자 *" /></td>
								<td>
									<div class="imgPos">
										<input type="text" class="txt imgName" id="mngEmp" name="mngEmp" value="${data.EMP_NAME}" readonly="readonly" />
										<input type="hidden"id="mngNum" name="mngNum"/>
										<!-- <img class="btnImg_in" id="mngPop" alt="팝업" src="resources/images/sales/usericon.png"> -->
									</div>
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
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>