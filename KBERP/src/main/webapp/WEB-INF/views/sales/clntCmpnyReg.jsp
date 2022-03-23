<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP - 고객사</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	margin: 20px auto;
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
.search_text {
	width: 679px;
	background-color: #f2f2f2;
}
#att {
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#listBtn").on("click", function() {
		makePopup({
			bg : true,
			bgClose : false,
			title : "알림",
			contents : "나가면 저장되지않습니다, 나가시겠습니까?",
			contentsEvent : function() {
				
			},
			buttons : [{
				name : "나가기",
				func:function() {
					$("#listForm").submit();
					console.log("One!");
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	$("#search_icon").on("click", function() {
		findAddr();
	});
	
	$(".aff_btn").on("click", function() {
		$("#att").click();
	});
	
	$("#addBtn").on("click", function() {
		if(checkEmpty("#ccName")) {
			makeAlert("필수 항목 알림", "고객사를 입력하세요");
			$("#ccName").focus;
		} else if(checkEmpty("#ccClsfy")) {
			makeAlert("필수 항목 알림", "대표를 입력하세요");
			$("#ccClsfy").focus();
		} else if(checkEmpty("#ccGrade")) {
			makeAlert("필수 항목 알림", "등급을 선택하세요");
			$("#ccGrade").focus();
		} else if(checkEmpty("#zipCodeNum")) {
			makeAlert("필수 항목 알림", "우편번호를 입력하세요");
			$("#zipCodeNum").focus();
		} else if(checkEmpty("#adrs")) {
			makeAlert("필수 항목 알림", "주소를 입력하세요");
			$("#adrs").focus();
		} else if(checkEmpty("#dtlAdrs")) {
			makeAlert("필수 항목 알림", "상세주소를 입력하세요");
			$("#dtlAdrs").focus();
		} else if(checkEmpty("#rvn")) {
			makeAlert("필수 항목 알림", "매출를 입력하세요");
			$("#rvn").focus();
		} else if(checkEmpty("#rp")) {
			makeAlert("필수 항목 알림", "인지경로를 선택하세요");
			$("#rp").focus();
		} else {
			makePopup({
				bg : true,
				bgClose : false,
				title : "알림",
				contents : "저장하시겠습니까?",
				contentsEvent : function() {
					$("#popup1").draggable();
				},
				buttons : [{
					name : "저장",
					func:function() {
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
								console.log(req.responseText);
							}
						});
						
						addForm.submit();
						console.log("One!");
						closePopup();
					}
				}, {
					name : "취소"
				}]
			});
				
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

function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipCodeNum').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("adrs").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("adrs").value = jibunAddr;
            }
        }
    }).open();
}
</script>
</head>
<body>
<form action="clntCmpnyList" id="listForm" method="post">
	<input type="hidden" id="page" name="page" value="${page}" />
	<input type="hidden" name="top" value="${param.top}" />
	<input type="hidden" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" name="menuType" value="${param.menuType}" />
	<input type="hidden" id="clntCmpnyClsfyNum" value="${param.clntCmpnyClsfyNum}" />
	<input type="hidden" id="searchType" value="${param.searchType}" />
	<input type="hidden" id="searchTxt" value="${param.searchTxt}" />
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
			<!-- 검색영역 선택적 사항 -->
			
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="bodyWrap">
				<form action="fileUploadAjax" id="addForm" method="post" enctype="multipart/form-data">
					<input type="hidden" id="page" name="page" value="${page}" />
					<input type="hidden" name="top" value="${param.top}" />
					<input type="hidden" name="menuNum" value="${param.menuNum}" />
					<input type="hidden" name="menuType" value="${param.menuType}" />
					<input type="hidden" name="sEmpNum" value="${sEmpNum}" />
					<table>
						<colgroup>
							<col width="200" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<tr>
								<td><input type="button" class="btn" value="고객사 *" readonly="readonly" /></td>
								<td><input type="text" class="txt" id="ccName" name="ccName" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="고객사 분류 *" /></td>
								<td>
									<select class="txt" id="ccClsfy" name="ccClsfy">
											<option value="0">거래고객사</option>
											<option value="1">파트너사</option>
											<option value="2">해지고객사</option>
											<option value="3">정지고객사</option>
											<option value="4">외국고객사</option>
											<option value="5">기타</option>
									</select>
								</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="등급 *" /></td>
								<td>
									<select class="txt" id="ccGrade" name="ccGrade">
											<option value="0">S</option>
											<option value="1">A</option>
											<option value="2">B</option>
											<option value="3">C</option>
											<option value="4">D</option>
									</select>
								</td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="사업자번호" /></td>
								<td><input type="text" class="txt" id="brNum" name="brNum" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="대표" /></td>
								<td><input type="text" class="txt" id="cName" name="cName" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="유선번호" /></td>
								<td><input type="text" class="txt" id="phoneNum" name="phoneNum" /></td>
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
								<td><input type="text" class="txt" id="zipCodeNum" name="zipCodeNum" /></td>
							</tr>
							<tr height="40">
								<td rowspan="2"><input type="button" class="address" value="주소 *" /></td>
								<td><input type="text" class="txt search_text" id="adrs" name="adrs" readonly="readonly" />
									<img class="btnImg" id="search_icon" alt="돋보기" src="resources/images/sales/mg.png" /></td>
							</tr>
							<tr height="40">
								<td><input type="text" class="txt" placeholder="상세주소" id="dtlAdrs" name="dtlAdrs"/></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="매출(년)*" /></td>
								<td><input type="text" class="txt" id="rvn" name="rvn" /></td>
							</tr>
							<tr height="40">
								<td><input type="button" class="btn" value="인지경로"></td>
								<td>
									<select class="txt" id="rp" name="rp">
											<option value="0">자사홈페이지</option>
											<option value="1">인터넷검색</option>
											<option value="2">지인소개</option>
											<option value="3">세미나</option>
											<option value="4">전화</option>
											<option value="5">기타</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- 첨부파일 -->
					<div class="rvn_txt"> 첨부파일
						<img class="plus_btn aff_btn" src="resources/images/sales/plus.png" border='0' />
					</div>
					<div class="cntrct_box_in">
					</div>
					<input type="file" id="att" name="att" />
					<input type="hidden" id="attFile" name="attFile" />
				</form>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>