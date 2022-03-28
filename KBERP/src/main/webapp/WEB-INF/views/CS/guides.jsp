<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guides</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.mh{      
	margin-right:5px;
}
textarea{
	width:894px;
	height:500px;
	resize : none;
	margin-bottom: 5px;
	background-color: #f4f4f4;
}
.inf_title{
	display: inline-block;
	width: 250px;
	height: 30px;
	text-align: center;
	border : 0.1px solid;
	border-bottom: 0px;
	border-color:rgba(118, 118, 118, 0.3);
	font-size: 2pt;
	background-color: #f4f4f4;
	line-height: 30px;
	font-size: 15pt;
	}
.inf_wrtr{
	display: inline-block;
	width: 150px;
	height: 30px;
	text-align: center;
	border : 0.1px solid;
	border-bottom: 0px;
	border-color:rgba(118, 118, 118, 0.3);
	float: right;
	font-size: 2pt;
	background-color: #f4f4f4;
	line-height: 30px;
	font-size: 10pt;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#btn1Btn").on("click", function() {
		$("#actionForm").attr("action","guideWrtng")
		$("#actionForm").submit();
	});
	$("#btn2Btn").on("click", function() {
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
	$("#btn3Btn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "버튼두개팝업",
			contents : "내용임",
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
			<div class="page_title_text">상세보기</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		<div class="inf_title">${data.EMP_NAME}</div>
		<div class="inf_wrtr">${data.CMBN_TITLE}</div>
		<br/>
		<textarea readonly="readonly" disabled="disabled">${data.CMBN_CONT}</textarea>
			<div class="board_bottom">
			
				<div class="cmn_btn_ml" id="btn1Btn">목록</div>
				<div class="cmn_btn_ml" id="btn2Btn">수정</div>
				<div class="cmn_btn_ml" id="btn3Btn">삭제</div>
			</div>
		</div>
	</div>
	
	<form action="#" id="actionForm" method="post">
	<input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
		<input type="hidden" id="no" name="no" value="${param.no} "/>
	<input type="hidden" id="page" name="page" value="${param.page}"/>
	</form>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>