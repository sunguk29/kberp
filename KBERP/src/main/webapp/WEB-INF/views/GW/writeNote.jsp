<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Note</title>
<link rel="icon" href="../images/favicon/favi.gif" />
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.note {
	display: inline-block;
	vertical-align : top;
	width: 900px;
	height: 500px;
	border: 1px solid #000;
}
.title {
	display: inline-block;
	vertical-align: top;
	width: 900px;
	height: 50px;
	text-indent: 35px;
	line-height: 50px;
	background-image: url('./images/note.png');
	background-size: 18px 18px;
	background-repeat: no-repeat;
	background-position: 10px 16px;
	font-size: 17px;
	font-weight: bold;
}
.title_bar {
	display: inline-block;
	vertical-align: top;
	width: 900px;
	height: 3px;
	background-color: #4B94F2;
}

.guide {
	display: table-cell;
	vertical-align: middle;
	width: 900px;
	height: 50px;
	background-color: #F2CB05;
	font-size: 12px;
	text-align: center;
	/*padding-left: 10px;*/
}

.cont {
	border-top: 1px solid black;
}

.rcpnt {
	display: inline-block;
	vertical-align: top;
	width: 100px;
	height: 50px;
	background-color: #dadada;
	text-align: center;
	line-height: 50px;
	font-size: 15px;
	font-weight: bold;
}

.emp {
	display: inline-block;
	vertical-align: top;
	margin-top: 12px;
	margin-left: 6px;
}

.rcpnt_btn {
	display: inline-block;
	vertical-align: top;
	margin-top: 12px;
	margin-left: 11px;
}

.write {
	resize: none;
	width: 895px;
	height: 235px;
}

.file {
	display: inline-block;
	width: 180px;
}

.file_on {
	display: inline-block;
}

.note_bottom {
	text-align: right;
	margin-top: 50px;
	margin-right: 15px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$(".rcpnt_btn").on("click", function() {
		var html = "";
		
		html += "<div class=\"popup\"><div class=\"popup_title\">받는사람<div class=\"popup_cont\">조직도<div class=\"popup_btn_area\"><div class=\"cmn_btn_mr\">추가<div class=\"cmn_btn_mr\">취소</div></div></div></div></div></div>";
	    html += "<div class=\"popup_bg\"></div>";
		
		$("body").append(html);
		
		$(".popup, .popup_bg").hide();
		$(".popup, .popup_bg").fadeIn();
	});
	
	$("#sendBtn").on("click", function() {
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
	
	$("#cnlBtn").on("click", function() {
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
			<div class="page_title_text">쪽지쓰기</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="note">
				<div class="title">쪽지쓰기
					<div class="title_bar"></div>
				</div>
				<div class="guide">※ 받는 사람은 직접 입력이 가능합니다.<br/>
								  (단, 입력 시 '이름(ID) 또는 ID'로 입력을 해야 하며,
								  구분자로 , 또는 엔터값을 허용합니다.)
				</div>
				<div class="cont">
					<div class="rcpnt">받는사람</div>
					<div class="emp">
						<input type="text" size="95" />
					</div>
					<div class="rcpnt_btn">
						<input type="button" value="받는사람">
					</div>
				</div>
				<textarea placeholder="내용을 입력하세요." class="write"></textarea>
				<div class="atchmnt">
					<div class="file">
						<input type = "file"/>
					</div>
					<div class="file_on">
						<input type="text" size="95"/>
					</div>
				</div>
				<div class="note_bottom">
					<div class="cmn_btn_ml" id="sendBtn">보내기</div>
					<div class="cmn_btn_ml" id="cnlBtn">취소</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>