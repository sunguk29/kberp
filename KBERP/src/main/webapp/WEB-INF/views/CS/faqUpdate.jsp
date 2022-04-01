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
/* 개인 작업 영역 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */

.cont_area {
	display: inline-block;
	margin-left:100px;
	margin-top: 20px;
}

.top .cate, .top .wrt_title, .top .wrt_wrter {
	display: inline-block;
	margin-right:10px;
	height: 50px;
}

.top .cate select {
	width: 160px;
	height: 45px;
} 
.top .wrt_title {
	margin-right:210px;
	width: 150px;
	height: 40px;
}
/* .wrt_wrter {
	margin-left: 20px;
} */
.top .wrt_title input {
	width: 609px;
	height: 40px;
}
.top .wrt_date input {
	width: 160px;
	height: 40px;
}

.cont {
	resize: none;
}
.bottom {
	margin-top: 35px;
}

.bottom input[type="text"] {
	width: 450px;
	height: 40px;
}

.cmn_btn {
	margin-left:210px;
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
			draggable : true,
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
			<div class="page_title_text">FAQ</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="top">
					<div class="cate">
						<select>
					 		<option>${data.CTGRY_NAME}</option>
						</select>
					</div>
						<div class="wrt_title">
							<input type="text" placeholder="제목(질문글)">
						</div>
						<!-- <div class="wrt_wrter">
							<input type="text" placeholder="작성자">
						</div> -->
					</div>
					<div class="middle">
						<textarea class="cont" rows="30" cols="114" placeholder="내용(답변글)"></textarea>
					</div>
			<div class="bottom">
						<div class = "cmn_btn">수정</div>
 			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>