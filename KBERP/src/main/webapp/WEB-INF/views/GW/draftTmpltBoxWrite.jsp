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

.board_a{
	display: flex;
	justify-content: flex-end;
}

#writeBtn {
	width: 100px;
	height: 30px;
	font-size: 14px;
	border: 1px solid #000;
	margin-right: 10px;
	line-height: 2;
	text-align: center;
	background-color: #f2b705;
	
}

#cancelBtn {
	width: 100px;
	height: 30px;
	font-size: 14px;
	border: 1px solid #000;
	line-height: 2;
	text-align: center;
	background-color: #f2b705;
}

span {
	font-size: 14px;
}

.aprvl_num {
	margin-left: 100px;
}

#aprvl_num_1 {
	height: 30px;
	font-size: 14px;
	margin-left: 40px;
}

.draft {
	margin-left: 100px;
}

#draft_1 {
	height: 30px;
	font-size: 14px;
	margin-left: 55px;
	margin-top: 20px;
}

.draft_day {
	margin-left: 100px;
}

#draft_day_1 {
	height: 30px;
	font-size: 14px;
	margin-left : 40px;
	margin-top: 20px;
	width: 178px;
}

.srch {
	width: 50px;
	height: 30px;
	position: relative;
	top: 10px;
	
}

.dcmnt_tlte {
	margin-left: 100px;
}

#dcmnt_tlte_1 {
	height: 50px;
	font-size: 14px;
	margin-left : 40px;
	margin-top: 20px;
	width: 500px;
}

.aprvl_line {
	margin-left: 100px;
}

#aprvl_line_1 {
	height: 50px;
	font-size: 14px;
	margin-left : 40px;
	margin-top: 20px;
	width: 300px;
}

.crbn_copy {
	margin-left: 100px;
}

#crbn_copy_1{
	height: 50px;
	font-size: 14px;
	margin-left : 55px;
	margin-top: 20px;
	width: 300px;
	
}

.atchd_file {
	margin-left: 100px;
}

#atchd_file_1 {
	height: 30px;
	font-size: 14px;
	margin-left : 40px;
	margin-top: 20px;
}


.cont{
	margin-left: 100px;
}

#cont_1 {
	
	font-size: 14px;
	margin-left : 70px;
	margin-top: 20px;
	width: 500px;
	height: 200px;
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
			<div class="page_srch_area">
				<select class="srch_sel">
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
				</select>
				<div class="srch_text_wrap">
					<input type="text" />
				</div>
				<div class="cmn_btn_ml">검색</div>
			</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="board_a">
				<input type = "button" id="writeBtn" value="저장">
				<input type = "button" id="cancelBtn" value="취소">
			</div>
			
			<div class="dcmnt_tlte">
				<span>문서제목</span>
				<input type="text" id="dcmnt_tlte_1">
			</div>
			<div class="aprvl_line">
				<span>결재라인</span>
				<input type= "text" id="aprvl_line_1">
				<img class= "srch" alt="srch_icon.png" src="../images/cmn/srch_icon.png"/>
			</div>
			<div class="crbn_copy">
				<span>참조자</span>
				<input type= "text" id="crbn_copy_1">
				<img class= "srch" alt="srch_icon.png" src="../images/cmn/srch_icon.png"/>
			</div>
			<div class="atchd_file">
				<span>첨부파일</span>
				<input type="file" id="atchd_file_1">
			</div>
			<div class="cont">
				<span>내용</span>
				<input type="text" id="cont_1">
			</div>
		
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>