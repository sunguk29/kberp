<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업일정</title>
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
.sc_title {
	width: 925px;
	height: 48px;
	border: 1px solid #000;
	background-color: #F2F2F2;
	font-size: 16px;
	font-weight: bold;
	line-height: 48px;
}
.bg {
	margin-left: 75px;
	margin-top: 9px;
}
.sc_title_bot {
	width: 927px;
	height: 50px;
	margin-top: 10px;
	margin-bottom: 25px;
}
.sc_content {
	width: 927px;
	height: 400px;
}
.calendar {
	display: inline-block;
	vertical-align: top;
	width: 498px;
	height: 398px;
	border: 1px solid #000;
}
.content_bot {
	width: 498px;
	height: 30px;
	font-size: 15px;
	line-height: 30px;
	text-align: center;
}
.calendar_text {
	display: inline-block;
	vertical-align: top;
	width: 338px;
	height: 279px;
	margin-left: 87px;
}
.lead_cal {
	display: inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-color: #FFC107;
	border-radius: 3px;
}
.lead_cal {
	display: inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-color: #FFC107;
	border-radius: 3px;
}
.so_cal {
	display: inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-color: #4B94F2;
	border-radius: 3px;
}
.pers_cal {
	display: inline-block;
	vertical-align: middle;
	width: 15px;
	height: 15px;
	background-color: #66BB6A;
	border-radius: 3px;
}
.lead_cal_big {
	width: 30px;
	height: 30px;
	background-color: #FFC107;
	border-radius: 3px;
	margin-left: 26px;
	margin-top: 26px;
}
.so_cal_big {
	width: 30px;
	height: 30px;
	background-color: #4B94F2;
	border-radius: 3px;
	margin-left: 26px;
	margin-top: 26px;
}
.pers_cal_big {
	width: 30px;
	height: 30px;
	background-color: #66BB6A;
	border-radius: 3px;
	margin-left: 26px;
	margin-top: 26px;
}
.lead_cal_big:hover, .so_cal_big:hover, .pers_cal_big:hover {
	cursor: pointer;
}
.marg {
	margin-left: 30px;
	margin-right: 50px;
}
.boxsize {
	width: 158px;
	height: 25px;
	outline: none;
}
.textsize {
	width: 150px;
	height: 19px;
	outline: none;
}
.cal_text_top {
	width: 338px;
	height: 30px;
	font-size: 15px;
	font-weight: bold;
	line-height: 30px;
	background-color: #BDBDBD;
}
.cal_text1 {
	width: 338px;
	height: 82px;
	border-bottom: 1px dotted #616161;
	background-color: #EEEEEE;
}
.cal_text2 {
	width: 338px;
	height: 82px;
	border-bottom: 1px dotted #616161;
	background-color: #EEEEEE;
}
.cal_text3 {
	width: 338px;
	height: 82px;
	background-color: #EEEEEE;
	border-bottom: 1px dotted #616161;
	background-color: #EEEEEE;
}
.imgsize {
	display: inline-block;
	vertical-align:top;
	width: 30px;
	height: 30px;
}
.newcalsize {
	width: 48px;
	height: 48px;
	float: right;
}
.newcalsize:hover {
	cursor: pointer;
}
.text_left {
	display: inline-block;
	vertical-align: top;
	width: 82px;
	height: 82px;

}
.text_right {
	display: inline-block;
	vertical-align: top;
	width: 256px;
	height: 82px;
	white-space: pre;
	font-size: 12px;
}
.text_right:hover {
	cursor: pointer;
}
.userseach {
	display: inline-block;
	vertical-align: middle;
	width: 136px;
	height: 23px;
	border: 1px solid #000;
	background-color: #fff;
	text-align: right;
	line-height: 23px;
}
.userseach:hover {
	cursor: pointer;
}
.userseach:active {
	outline: 1px solid #000;
}
.userIcon2 {
	width: 23px;
	height: 23px;
	
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#alertBtn").on("click", function() {
		makeAlert("하이", "내용임");
	});
	$("#btn1Btn").on("click", function() {
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
	$("#btn2Btn").on("click", function() {
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
			<div class="page_title_text">일정</div>
			<!-- 검색영역 선택적 사항 -->
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="body">
					<div class="bodyWrap">
						<div class="sc_title">
						<span class="marg">
						팀분류
						<select class="boxsize">
							<option selected="selected">선택안함</option>
							<option>영업1팀</option>
							<option>영업2팀</option>
							<option>영업3팀</option>
						</select>
						</span>
						담당자
						<div class="userseach">
							<img class="userIcon2" src="../../images/sales/usericon.png">
						</div>
						<div class="cmn_btn bg">검색</div>
						</div>
						<div class="sc_title_bot">
							<img alt="일정등록" src="../../images/sales/newcal.png" class="newcalsize" />
						</div>
						<div class="sc_content">
							<div class="calendar"></div>
							<div class="calendar_text">
								<div class="cal_text_top">
								<img alt="오늘날짜" src="../../images/sales/today.png" class="imgsize" />
								2022-01-31
								</div>
								<div class="cal_text1">
									<div class="text_left">
										<div class="lead_cal_big"></div>
									</div>
									<div class="text_right"><br/>10:00 ~ 11:30 방문/종합광고<br/>미래전자<br/>[진행중-제안]대출 상담 건</div>
								</div>
								<div class="cal_text2">
									<div class="text_left">
										<div class="so_cal_big"></div>
									</div>
									<div class="text_right"><br/>10:00 ~ 11:30 방문/종합광고<br/>미래전자<br/>[진행중-제안]대출 상담 건</div>
								</div>
								<div class="cal_text3">
									<div class="text_left">
										<div class="pers_cal_big"></div>
									</div>
									<div class="text_right"><br/>10:00 ~ 11:30 방문/종합광고<br/>미래전자<br/>[진행중-제안]대출 상담 건</div>
								</div>
							</div>
						</div>
						<div class="content_bot">
							<div class="lead_cal"></div>
							리드
							<div class="so_cal"></div>
							영업
							<div class="pers_cal"></div>
							개인
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>