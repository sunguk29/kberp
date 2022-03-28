<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERP Sample</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
	font-size: 10.5pt;
}
/* 개인 작업 영역 */
#file_preview{
	vertical-align:top;
	display:inline-block;
	width: 300px;
	height: 300px;
}
#fclty_input_area{
	display: inline-block;
	margin-top: 110px;
	margin-left: 20px;
}

#file_name{
	display:inline-block;
	width: 235px; 
	padding: 10px 0px;
	text-align: center;
}
.fclty_input_text{
	display:inline-block;
	width: 100px;
}
.fclty_input{
	display: inline-block;
}
.cmn_btn_ml{
	margin-top: 5px;
}
.fclty_input_row{
	margin-bottom: 5px;
}
.button_row{
	float: right;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#listBtn").on("click",function(){
		$("#actionForm").attr("action","fcltList");
		$("#actionForm").submit();
	});
});
</script>
</head>
<body>
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
			<div class="page_title_text">시설물 등록</div>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="top" name="top" value="${param.top}" />
	<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
	<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
	<input type="hidden" name="no" value="${param.no}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
				<div id="file_preview"></div>
				
				<div id="fclty_input_area">
					
					<div class="fclty_input_row">	
						<div class="fclty_input_text">시설물 명 : </div>
						<input type="text" class="fclty_input">
					</div>
					<div class="fclty_input_row">	
						<div class="fclty_input_text">위치 : </div>
						<input type="text" class="fclty_input">
					</div>
					<div class="fclty_input_row">
						<div class="fclty_input_text">관리자 : </div>
						<input type="text" class="fclty_input">			
					</div>
					<div class="fclty_input_row">
						<div class="fclty_input_text">수용인원 : </div>
						<input type="text" class="fclty_input">
					</div>
					<div class="button_row">
						<div class="cmn_btn_ml">등록</div>
						<div class="cmn_btn_ml" id="listBtn">목록으로</div>
					</div>
				</div>
				<div id="atchmn_row">
					<div id="file_name"></div>
					<div class="cmn_btn_ml">첨부</div>
				</div>	
				</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>