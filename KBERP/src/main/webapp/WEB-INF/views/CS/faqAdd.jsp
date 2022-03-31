<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더추가 -->
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
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
	width: 220px;
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

.wrt_con {
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
	margin-left:200px;	
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace("content",{
		//옵션
		resize_enabled:false, //크기 변경
		language: "ko",       //언어
		enterMode : 2,        //엔터<br/>처리
		width: "700",		  //가로
		height: "300"  	      //세로
	});
	
	$("#cancelBtn").on("click", function(){
		$("#backForm").submit();
	});
	$("#addBtn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "등록",
			contents : "등록하시겠습니까?",
			buttons : [{
				name : "등록",
				func:function() {
					$("#cont").val(CKEDITOR.instances['cont'].getData());
					if(checkEmpty("#title")) {
						alert("제목을 입력하세요.");
						$("#title").focus();
					} else if(checkEmpty("#cont")) {
						alert("내용을 입력하세요.");
						$("#cont").focus();
					
					else{
						var params= $("#addForm").serialize();
						
						$.ajax({
							type: "post", // 전송형태
							url : "faqdtActionAjax/insert" , //통신 주소
							dataType : "json", //받을 데이터 형태
							data : params, //보낼 데이터. 보낼 것이 없으면 안씀
							success : function(res){ // 성공 시 실행 함수. 인자는 받아온 데이터
								if(res.res=="success"){
									$("#backForm").submit();
								}else{
									alert("작성중 문제가 발생하였습니다");
								}
							},
							error: function(request, status, error){ // 문제 발생 시 실행 함수
								console.log(request.responseText); //결과텍스트. 스프링 실행 결과
							}
						}); // ajax end
						error : function(req) {
							console.log(req.responseText);
						} // error end
					}); // ajaxForm end
					
					writeForm.submit(); //ajaxForm 실행
				} // else end
			}); // addBtn click end
	
});
function checkEmpty(sel){
	if($.trim($(sel).val())==""){
		return true;
	}else{
		return false;
		}
	}
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
	<form action="faqList" id="backForm" method="post">
	<input type="hidden" name="no" value="${param.no}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	</form>
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
							<div class="wrt_title">
								<input type="text" placeholder="제목(질문글)">
							</div>
							<!-- <div class="wrt_wrter">
								<input type="text" placeholder="작성자">
							</div> -->
					</div>
					<div class="middle">
						<textarea class="wrt_con" rows="20" cols="98" placeholder="내용(답변글)"></textarea>
					</div>
					<div class="bottom">
					<div class="cmn_btn">취소</div>
					<div class="cmn_btn">등록</div>
					</div>
				</div>
			</div>		
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>