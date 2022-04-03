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
	CKEDITOR.replace("cont", {
		//옵션
		resize_enabled : false, //크기변경
		language : "ko", //언어
		enterMode: 2, //엔터<br/>처리
		width: "788", //가로
		height : "300" //세로
	});
	
	$("#cancelBtn").on("click", function() {
		$("#backForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		makePopup({
			bg : false,
			bgClose : false,
			title : "수정",
			contents : "게시글을 수정하시겠습니까?",
			draggable : true,
			buttons : [{
				name : "예",
				func:function() {
					$("#wrtng_cont").val(CKEDITOR.instances['wrtng_cont'].getData());
					if(checkEmpty("#wrtng_title")) {
						alert("제목을 입력하세요.");
						$("#wrtng_title").focus();
					} else if(checkEmpty("#wrtng_cont")) {
						alert("내용을 입력하세요.");
						$("#wrtng_cont").focus();
					} else {
						var updateForm = $("#updateForm");
						
						/* updateForm.ajaxForm({
							success : function(res) {
								// 물리파일명 보관
								if(res.fileName.length > 0) {
									$("#ansr_attFile").val(res.fileName[0]);
								} */
								
								// 글 수정
								var params =  $("#updateForm").serialize();
							
								$.ajax({
									type : "post",
									url : "faqActionAjax/update",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "success") {
											$("#backForm").submit();
										} else {
											alert("수정중 문제가 발생하였습니다.");
										}
									}, // success end
									error : function(request, status, error) {
										console.log(request.responseText);
									} // error end
								}); // ajax end
							}, // success end
							error : function(req) {
								console.log(req.responseText);
							} // error end
						/* });// ajaxForm end */
						
						updateForm.submit(); // ajaxForm 실행
							closePopup();
						} // else end
				}
					}, {
						name : "아니오"
					}]
		}); // makePopup end
	}); // btn2Btn end
});

function checkEmpty(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
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
	
	<form action="faq" id="backForm" method="post">
	<input type="hidden" name="no" value="${param.no}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	</form>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">FAQ 수정</div>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
	<!-- <form action="faqdt" id="updateForm" method="post"> -->
	<input type="hidden" id="emp_num" name="emp_num" value="${sEmpNum}" />
	
					<div class="top">
						<div class="cate">
							<select id="ctgry_num" name="ctgry_num">
						 	<option value="1">인터넷뱅킹</option>
							<option value="2">스마트폰뱅킹</option>
							<option value="3">CD/ATM</option>
							<option value="4">공인인증서</option>
							<option value="5">인증/OTP/보안카드</option>
							<option value="6">예금/신탁</option>
							<option value="7">펀드</option>
							<option value="8">대출</option>
							<option value="9">외환</option>
							<option value="10">로그인관련</option>
							</select>
						</div>
							<div class="wrt_title">
								<input type="text" placeholder="제목(질문글)" id="wrtng_title" name="wrtng_title">
							</div>
							<!-- <div class="wrt_wrter">
								<input type="text" placeholder="작성자">
							</div> -->
					</div>
					<div class="middle">
						<textarea id="cont" name="cont" rows="30" cols="114" placeholder="내용(답변글)" id="wrtng_cont" name="wrtng_cont"></textarea>
					</div>
	<!-- </form>	 -->
			<div class="bottom">
						<div class = "cmn_btn" id="updateBtn" >수정</div>
						<div class = "cmn_btn" id="cancelBtn" >취소</div>
 			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>