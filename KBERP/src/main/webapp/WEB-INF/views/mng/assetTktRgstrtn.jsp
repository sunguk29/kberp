<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자산대여 등록</title>
<c:import url="/header"></c:import>
<style type="text/css">

#assetName{
	width:130px;
}

#qunty{
	width:50px;
}

.cmn_btn{
	border: none;
	margin-left: 10px;
}
.cont_wrap {
	width: 900px;
	font-size: 10.5pt;
}
.sixth_row td:nth-child(1), .rmrks{
	margin-left: 20px;
}

.rmrks{
	margin-top:50px;
}

.sixth_row td:nth-child(odd){
	font-weight: bold;
	width: 80px;
 }
 
 .sixth_row td:nth-child(3){
 margin-left:30px;
 
 }
 
 
 .sixth_row td:nth-child(even){
 	margin-right:20px;
 }
 
 .sixth_row td{
 	display: inline-block;
 	margin-top: 20px;
 }
 


#rmrks{
	margin-left: 20px;
	width: 870px;
	height: 150px;
	margin-bottom: 10px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#cnclBtn").on("click", function(){
		$("#actionForm").attr("action", "assetTkt");
		$("#actionForm").submit();
	});
	
	$("#rgstrtnBtn").on("click", function() {
		if(checkEmpty("#assetNum")) {
			alert("자산코드를 입력하세요.");
			$("#assetNum").focus();
		}  else if(checkEmpty("#qunty")) {
			alert("수량을 선택하세요.");
			$("#qunty").focus();
		} else if(checkEmpty("#empNum")) {
			alert("사용자를 선택하세요.");
			$("#empNum").focus();
		} else if(checkEmpty("#tktdt")) {
			alert("반출일을 선택하세요.");
			$("#tktdt").focus();
		} else if(checkEmpty("#rmrks")) {
			alert("비고를 입력하세요.");
			$("#rmrks").focus();
		} else {
			var rgstrtnForm = $("#rgstrtnForm");
			
			rgstrtnForm.ajaxForm({
				success : function(res) {
					// 글 저장
					var params = $("#rgstrtnForm").serialize();
					
					$.ajax({
						type : "post", 
						url : "assetAction/insertTkt", 
						dataType : "json",
						data : params, 
						success : function(res) { 
							if(res.res == "success") {
								location.href ="assetTkt";
							} else {
								alert("작성중 문제가 발생하였습니다.");
							}
						},
						error : function(request, status, error) {
							console.log(request.responseText); 
						}
					});
				}, // success end
				error : function(req) {
					console.log(request.responseText); 
				} //error end
			});
			
			rgstrtnForm.submit(); // ajaxForm 실행
			
		} // else end
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
<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNum">${param.menuNum}</c:param>
		<%-- board로 이동하는 경우 B 나머지는 M --%>
		<c:param name="menuType">${param.menuType}</c:param>
	</c:import>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="num" value="${param.num}"/>
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
</form>
<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">자산반출 등록</div>
		</div>
			<form action="#" id="rgstrtnForm" method="post" >
			<input type="hidden" name="rgstrtnEmpNum" value="${sEmpNum}"/>
				<div class="cont_area">
				<table class="intrnl_cost_admnstrtn_new">
					<tbody>
						<tr class="sixth_row">
							<td>자산코드</td>
							<td>
								<input style=width:80px; type="text" id="assetNum" name="assetNum" />
							</td>
							<td>자산명</td>
							<td>
								<input style=width:80px; type="text" />
							</td>
							<td>수량</td>
							<td>
								<input style=width:50px; type="text" id="qunty" name="qunty" />
								<input style=width:50px; type="text" id="quntynum" name="quntynum" />
							</td>
						</tr>
						<tr class="sixth_row">
							<td>사용자</td>
							<td>
								<input style=width:120px; type="text" id="empNum" name="empNum" />
							</td>
							<td>반출일</td>
							<td >
								<input type="date" id="tktdt" name="tktdt" />
							</td>
					</tbody>
				</table>
						<div class="rmrks"><b>비고</b></div>
						<input type="text" id="rmrks" name="rmrks" />
			<div class="board_bottom">
				<input class="cmn_btn" type="button" id="rgstrtnBtn" value="등록">
				<input class="cmn_btn" type="button" value="취소" id="cnclBtn"/>
			</div>
		</div>
			</form>
	</div>

</body>
</html>