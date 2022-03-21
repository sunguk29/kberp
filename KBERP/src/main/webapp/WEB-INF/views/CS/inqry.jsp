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
			<div class="page_title_text">1:1 문의</div>
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
			<div class="cnsl_top">
				<div class="ctgr">
					<select disabled="disabled">
						<option>인터넷뱅킹</option>
						<option>스마트폰뱅킹</option>
						<option>CD/ATM</option>
						<option>공인인증서</option>
						<option>인증/OTP/보안카드</option>
						<option>예금/신탁</option>
						<option>펀드</option>
						<option>대출</option>
						<option>외환</option>
						<option>로그인관련</option>
					</select>
				</div>
				<div class="wrtng_title">
					<input type="text" placeholder="제목" readonly="readonly">
				</div>
				<div class="wrtng_wrtr">
					<input type="text" placeholder="작성자" readonly="readonly">
				</div>
			</div> <!-- cnsl_top의 끝 -->
			
				<div class="cnsl_middle">
					<textarea class="wrtng_cont" rows="20" cols="116" placeholder="내용을 입력하세요." readonly="readonly"></textarea>
				</div>
				<div class="cnsl_bottom">
					<div class="file_atch">
						<input type="text" readonly="readonly" placeholder="첨부된 파일 & 이미지 : ">
						<input class="dwnld" type="button" value="다운로드">
					<div class="cmn_btn_ml">답변등록</div>
					<div class="cmn_btn_ml">삭제</div>
				</div>
		</div>
	</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>