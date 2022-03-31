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
}

.board_table{
	text-align: center;
}

.container {
	display: inline-block;
	font-size: 14px;
	margin-left: 20px;
	line-height: 3.5;
	
}

#dcmnt_num	{
	height: 25px;
	font-size: 14px;
	margin-right: 150px;
	
}

#form_name {
	height: 25px;
	font-size: 14px;
	margin-right: 60px;
	
}

#dcmnt_tlte {
	height: 25px;
	font-size: 14px;
	margin-right: 84px;
	width: 240px;
}

#complete {
	height: 25px;
	font-size: 14px;
}



.srch {
	height: 25px;
	width: 30px;
	position: relative;
	top:20px;
	left: 15px;
	z-index: 10;
}

.srch_2 {
 	display: inline-block;
 	border: 1px solid #000;
 	font-size: 14px;
 	background-color: #f2cb05;
 	height: 35px;
 	width: 70px;
 	text-align: right;
 	line-height: 2.5;
 	position: relative;
 	top: 10px;
 	right: 30px;
 	
 
}


.content_table {
	border-collapse: collapse;
	width: 900px;
	height: 200px;
	font-size: 12px;
	margin-top: 40px;
	
}

.content_table tbody tr {
	border-top: 1px solid #000;
	border-bottom: 1px solid #000;
	text-align: center;
}

.board_bottom {
	margin-top:10px;
}

.cont_area {
	background-color: #b7b7b7;
}

/* 개인 작업 영역 */

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
			<div class="page_title_text">프로젝트 관리</div>
			<!-- 검색영역 선택적 사항 -->

		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="container">
				<span>문서번호</span>
				<input type="text" value = 자동채번 id= dcmnt_num>
				<span>서식명</span>
				<input type="text" id= form_name>
				<img class= "srch" alt="srch_icon.png" src="resources/images/GW/cmn/srch_icon.png"/>
				<div class="srch_2">검색</div>
				<br/>
				<span>문서제목</span>
				<input type="text" id="dcmnt_tlte">
				<span>완료일</span>
				<input type="date" id="complete"> ~
				<input type="date" id="complete">
			</div>
				
			</div>                                                                                     
			<table class="content_table">
				<thead>
					<tr>
						<th>문서번호</th>
						<th>서식명</th>
						<th>문서제목</th>
						<th>기안자</th>
						<th>기안부서</th>
						<th>기안일</th>
						<th>결재일</th>
						<th>결재상태</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>03</td>
						<td>기안서</td>
						<td>카카오뱅크OO기안서</td>
						<td>홍길동</td>
						<td>그룹웨어팀</td>
						<td>2021.12.24</td>
						<td>2021.12.25</td>
						<td>결재완료</td>
						<td>...</td>
					</tr>
					<tr>
						<td>02</td>
						<td>휴가기안서</td>
						<td>카카오뱅크휴가기안서</td>
						<td>홍길동</td>
						<td>그룹웨어팀</td>
						<td>2021.12.24</td>
						<td>2021.12.25</td>
						<td>결재반려</td>
						<td>...</td>
					</tr>
					<tr>
						<td>01</td>
						<td>지출결의서</td>
						<td>카카오뱅크 지출결의서</td>
						<td>홍길동</td>
						<td>그룹웨어팀</td>
						<td>2021.12.24</td>
						<td></td>
						<td>결재진행중</td>
						<td>...</td>
					</tr>
				</tbody>
			</table>
			<div class="board_bottom">
				<div class="pgn_area">
					<div class="page_btn page_first">first</div>
					<div class="page_btn page_prev">prev</div>
					<div class="page_btn">1</div>
					<div class="page_btn">2</div>
					<div class="page_btn">3</div>
					<div class="page_btn">4</div>
					<div class="page_btn_on">5</div>
					<div class="page_btn page_next">next</div>
					<div class="page_btn page_last">last</div>
				</div>
			</div>
		
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>

</body>
</html>