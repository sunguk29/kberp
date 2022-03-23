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
.txt:hover {
	cursor: pointer;
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
	text-align: right;
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
    display: inline-block;
    vertical-align: middle;
    width: 25px;
    height: 25px;
    float: right;
    cursor: pointer;
    margin-right: 5px;
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
<form action="clntList" id="listForm" method="post">
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
				<table>
					<colgroup>
						<col width="200" />
						<col width="auto" />
					</colgroup>
					<tbody>
						<tr>
							<td><input type="button" class="btn" value="고객 *" readonly="readonly"/></td>
							<td><input type="text" class="txt" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="고객사 *" /></td>
							<td>
								<div class="imgPos">
									<img class="btnImg_in" alt="팝업" src="resources/images/sales/popup.png">
								</div>
							</td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="부서" /></td>
							<td><input type="text" class="txt" /></td>
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="직책" /></td>
							<td><input type="text" class="txt" /></td>								
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="휴대폰 번호*" /></td>
							<td><input type="text" class="txt" /></td>																
						</tr>
						<tr height="40">
							<td><input type="button" class="btn" value="메일" /></td>
							<td><input type="text" class="txt" /></td>
						</tr>
					</tbody>
				</table>
				<!-- 첨부자료 -->
				<div class="rvn_txt"> 첨부파일
					<img class="plus_btn aff_btn" src="resources/images/sales/plus.png" border='0' />
				</div>
				<div class="cntrct_box_in">
				</div>
				<input type="file" id="att" name="att" />
				<input type="hidden" id="attFile" name="attFile" />
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>