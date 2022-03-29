<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자산 상세보기</title>
<c:import url="/header"></c:import>
<style type="text/css">

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
 }
 
 .sixth_row td{
 	display: inline-block;
 	width: 120px;
 	margin-top: 20px;
 }
 
 .fclty_aprvl_mng_cont:nth-child(4) {
 	margin-top: 40px;
 }
 
 
.fclty_aprvl_mng_cont{
	margin-bottom: 10px;
} 

#fclty_img{
	border: 1px solid black;
	vertical-align:top;
	display:inline-block;
	margin-left: 20px;
	width: 250px;
	height: 250px;
}



#fclty_aprvl_mng_area{
	display: inline-block;
	margin-top: 50px;
	margin-left: 50px;
}

.use {
	margin-left: 20px;
	color: black;
	font-size: 16pt;
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
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action", "assetRntl");
		$("#actionForm").submit();
	});
	
	$("#mdfyBtn").on("click", function(){
		$("#actionForm").attr("action", "assetDtlViewDrblMdfy");
		$("#actionForm").submit();
	});
});


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
</form>
<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">승인관리 상세보기</div>
		</div>
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
				<table class="intrnl_cost_admnstrtn_new">
					<tbody>
						<tr class="sixth_row">
							<td>자산코드</td>
							<td>
								${data.ASSET_NUM}
							</td>
							<td>자산명</td>
							<td >
								${data.ASSET_NAME}
							</td>
							<td>담당자</td>
							<td>
								${data.EMP_NAME}
							</td>
						</tr>
						<tr class="sixth_row">
							<td>사용자</td>
							<td>
								${data.USENAME}	
							</td>
							<td>사용시작일</td>
							<td >
								${data.START_DATE}
							</td>
							<td>사용종료일</td>
							<td>
								${data.END_DATE}
								
							</td>
						</tr>
					</tbody>
				</table>
						<div class="rmrks"><b>비고</b></div>
						<input type="text" id="rmrks" name="rmrks" readonly="readonly" value="${data.RMRKS}" />
			<div class="board_bottom">
				<input class="cmn_btn" type="button" id="mdfyBtn" value="수정">
				<input class="cmn_btn" type="button" value="목록으로" id="listBtn"/>
			</div>
		</div>
	</div>

</body>
</html>