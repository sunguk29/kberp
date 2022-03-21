<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인관리 상세보기</title>
<c:import url="/header"></c:import>
<style type="text/css">

.cmn_btn{
	border: none;
}
.cont_wrap {
	width: 900px;
	font-size: 10.5pt;
}
.fclty_aprvl_mng_cont div:nth-child(1), .fclty_aprvl_mng_cont div:nth-child(3){
 	display:inline-block;
	width: 120px;
	font-weight: bold;
 }
 
 .fclty_aprvl_mng_cont div:nth-child(2), .fclty_aprvl_mng_cont div:nth-child(4){
 	display: inline-block;
 	width: 120px;
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

#use_cont{
	margin-left: 20px;
	width: 900px;
	height: 150px;
	margin-bottom: 10px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#cnclBtn").on("click", function(){
		$("#actionForm").attr("action", "aprvlMng");
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
	<input type="hidden" name="no" value="${param.no}"/>
	<input type="hidden" name="page" value="${param.page}"/>
</form>
<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">승인관리 상세보기</div>
		</div>
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
				<div id="fclty_img"><img src ="resources/images/mng/building.png"/></div>
					<div id="fclty_aprvl_mng_area">
						<div class="fclty_aprvl_mng_cont">
							<div>예약 코드 :</div>
							<div>${data.RSVTN_NUM}</div>	
						</div>
						<div class="fclty_aprvl_mng_cont">
							<div>시설물 명 :</div>
							<div>${data.FCLTY_NAME}</div>
							<div>시설물 코드 :</div>
							<div>${data.FCLTY_NUM}</div>
						</div>
						<div class="fclty_aprvl_mng_cont">	
							<div>신청자 명 : </div>
							<div>${data.EMP_NAME}</div>
							<div>예약 인원 :</div>
							<div>${data.USE_NUM_OF_PL}</div>
						</div>
						<div class="fclty_aprvl_mng_cont">	
							<div>사용 날짜 :</div>
							<div>${data.RSVTN_DATE}</div>
						</div>
						<div class="fclty_aprvl_mng_cont">
							<div>사용 시간 :</div>
							<div>${data.TIME_DVSN_NUM}</div>				
						</div>
						
					</div>
						<div class="use"><b>사용 용도</b></div>
						<input type="text" id="use_cont" readonly="readonly" value="${data.USE_USE}" />
			<div class="board_bottom">
				<div class="cmn_btn_mr" id="aprvl_btn">승인</div>
				<div class="cmn_btn_mr" id="aprvl_impsbl_btn">승인불가</div>
				<input class="cmn_btn" type="button" value="취소" id="cnclBtn"/>
			</div>
		</div>
	</div>

</body>
</html>