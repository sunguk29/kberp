<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqdt</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.buttons_bottom {
    margin-top: 10px;

}
.button_list {
    float: left;
}

.button_up {
    float: right;
    margin-left: 20px;
    
}

.button_del{
    float: right;
    
}

.page_title_bar {
    height: 30px;
    margin-bottom: 15px;
    width: 940px;
 }
 
.title-area {
    margin-bottom: 30px;
}

.title {
    font-size: 22px;
    font-weight: bold;
    text-indent: 10px;
    padding: 10px 0px;
    border-top: 3px solid gray;
}
.wrtr_info {
	margin-bottom:10px;
	
}
.date {
	display: inline-block;
    font-size: 16px;
    line-height: 13px;
    color: #909090;
    text-indent: 10px;
}


.cont{

	width: 940px;
	height: 500px;
	border: 1px solid #F0F0F0;
	
	font-size: 15px;
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
			<div class="page_title_text">상세보기</div>
			<!-- 검색영역 선택적 사항 -->
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
		<div class="title-area">
			<div class="title">${data.WRTNG_TITLE}</div>
			<div class="wrtr_info">
				<div class="date">${data.WRTNG_DATE}</div>
				<span class="cate">
					<select disabled="disabled" >
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
				</span>
			</div>
		</div>
			
			<div class="cont">
			${data.WRTNG_CONT}
			</div>
			<div class="buttons_bottom">
				<div class="button_list">
					<div class="cmn_btn">목록</div>
				</div>
				<div class="button_up">
					<div class="cmn_btn">수정</div>
				</div>
				<div class="button_del">
					<div class="cmn_btn">삭제</div>
				</div>
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
	
	<form action="guideWrtng" id="backForm" method="post">
         <input type="hidden" name="top" value="${param.top}">
		<input type="hidden" name="menuNum" value="${param.menuNum}">
		<input type="hidden" name="menuType" value="${param.menuType}">
		<input type="hidden" id="no" name="no"/>
    </form>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>