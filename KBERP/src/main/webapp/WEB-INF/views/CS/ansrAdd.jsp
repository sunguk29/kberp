<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오뱅크 ERD 답변등록</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<style type="text/css">
/* 가로 사이즈 조정용 */
.cont_wrap {
	width: 900px;
}
/* 개인 작업 영역 */
.cmn_btn_mr, .open_cnsl_btn, .see_cnsl_header,
.open_ansr_btn, .see_ansr_header {
	/* 마우스 드래그 금지 */
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
}

.cont_area {
	display: inline-block;
	margin-left: 30px;
	margin-top: 10px;
}

.see_cnsl {
	display: inline-block;
	width: 800px;
}

.open_cnsl_head {
	display: inline-block;
	width: 800px;
	height: 35px;
	background-color: #F2CB05;
	box-shadow: 0px 1px 2px 0px #999;
	margin-bottom: 2px;
}

.open_cnsl_btn {
	display: inline-block;
	width: 40px;
	height: 30px;
	line-height: 24px;
	font-size: 20pt;
	font-weight: bold;
	text-align: center;
	background-color: #F2CB05;
	border-radius: 2px;
	color: #222222;
	cursor: pointer;
	margin-top: 3px;
}

.see_cnsl_header {
	display: inline-block;
	vertical-align: top;
	font-size: 12pt;
	font-weight: bold;
	color: #000;
	width: 50px;
	line-height: 35px;
}

.open_cnsl_cont {
	display: none;
	width: 800px;
	height: 170px;
	background-color: #FAFAFA;
}

.see_cnsl_title_icon {
	display: inline-block;
	width: 50px;
	height: 30px;
	line-height: 30px;
	font-size: 11pt;
	font-weight: bold;
	text-indent: 20pt;
}

.see_cnsl_title {
	width: 750px;
	height: 30px;
	display: inline-block;
	line-height: 30px;
}

.see_cnsl_title input {
	width: 700px;
	height: 28px;
	border: none;
	background: none;
	outline: none;
	font-size: 11pt;
	font-weight: bold;

}

.see_cnsl_cont {
	display: inline-block;
	width: 750px;
	height: 120px;
	vertical-align: top;
	line-height: 25px;
	text-indent: 50px;
}

.see_cnsl_cont textarea {
	border: none;
	background: none;
	outline: none;
	font-size: 10pt;
}

.ansr_dtls_see {
	display: inline-block;
}

.ansr_dtls_see_top {
	display: inline-block;
	width: 800px;
}

.open_ansr_head {
	display: inline-block;
	width: 800px;
	height: 35px;
	box-shadow: 0px 1px 1px 0px #999;
	background-color: #F2CB05;
	vertical-align: top;
}

.open_ansr_btn {
	display: inline-block;
	width: 40px;
	height: 30px;
	line-height: 24px;
	font-size: 20pt;
	font-weight: bold;
	text-align: center;
	background-color: #F2CB05;
	border-radius: 2px;
	color: #222222;
	cursor: pointer;
	margin-top: 3px;
}

.see_ansr_header {
	display: inline-block;
	vertical-align: top;
	font-size: 12pt;
	font-weight: bold;
	color: #000;
	width: 50px;
	line-height: 35px;
}

.open_ansr_cont {
	width: 800px;
	height: 480px;
	background-color: #FAFAFA;
}

.ansr_title {
	display: inline-block;
	width: 800px;
	height: 40px;
	margin-top: 10px;
	margin-left: 10px;
}

.ansr_dtls_see_top .wrtng_title {
	display: inline-block;
	width: 750px;
	height: 40px;
	margin-left: 20px;
	margin-top: 10px;
}

.ansr_dtls_see_top .wrtng_title input {
	display: inline-block;
	width: 725px;
	height: 25px;
	border: 1px solid #d1d1d1;
	outline: none;
}

.cnsl_middle {
	width: 800px;
	height: 350px;
	margin-left: 20px;
}

.wrtng_cont {
	display: inline-block;
	resize: none;
	font-family: 고딕;
}

.cnsl_bottom .file_atch {
	width: 400px;
	height: 50px;
	display: inline-block;
	position: relative;
	margin-left: 20px;
}

.cnsl_bottom input[type="file"] {
	width: 200px;
	margin-top: 25px;
	position: absolute;
}

.cnsl_bottom input[type="text"] {
	width: 400px;
	height: 20px;
	background: none;
	border: 1px solid #999999ff;
	vertical-align: top;
	margin-top: 25px;
}

.ansr_btn {
	float: right;
	margin-top: 20px;
	margin-right: 37px;
}

.popup_cont {
	text-align: center;
	line-height: 100px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace("ansr_cont", {
		// 옵션
		resize_enabled : false, // 크기변경
		language : "ko", // 언어
		enterMode : 2, // 엔터 <br/>처리
		width : "730", // 가로
		height : "250" // 세로
	});
	
	$(".open_cnsl_btn").on("click", function() {
		
		$(".open_cnsl_cont").slideToggle(300);
		  
	});
	
	$(".open_ansr_btn").on("click", function() {
		
		$(".open_ansr_cont").slideToggle(300);
		  
	});
	
	$("#btn1Btn").on("click", function() {
		makePopup({
			depth : 1,
			bg : false,
			bgClose : false,
			width : 500,
			height : 600,
			title : "대응가이드",
			contents : "",
			buttons : {
				name : "확인",
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
			title : "등록",
			contents : "게시글을 등록하시겠습니까?",
			draggable : true,
			buttons : [{
				name : "예",
				func:function() {
					$("#ansr_cont").val(CKEDITOR.instances['ansr_cont'].getData());
					if(checkEmpty("#ansr_title")) {
						alert("제목을 입력하세요.");
						$("#ansr_title").focus();
					} else if(checkEmpty("#ansr_cont")) {
						alert("내용을 입력하세요.");
						$("#ansr_cont").focus();
					} else {
						var writeForm = $("#writeForm");
						
						writeForm.ajaxForm({
							success : function(res) {
								// 물리파일명 보관
								if(res.fileName.length > 0) {
									$("#ansr_attFile").val(res.fileName[0]);
								}
								
								// 글 저장
								var params =  $("#writeForm").serialize();
						
								$.ajax({
									type : "post",
									url : "inqryAction/insert",
									dataType : "json",
									data : params,
									success : function(res) {
										if(res.res == "success") {
											location.href = "inqryList";
										} else {
											alert("작성중 문제가 발생하였습니다.");
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
						});// ajaxForm end
						
						writeForm.submit(); // ajaxForm 실행
							closePopup();
						} // else end
				}
					}, {
						name : "아니오"
					}]
		}); // makePopup end
	}); // btn2Btn end
}); // document ready end

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
	<form action="inqry" id="actionForm" method="post">
		<input type="hidden" name="no" value="${param.no}" />
		<input type="hidden" name="page" value="${param.page}" />
		<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" id="top" name="top" value="${param.top}"/>
		<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}"/>
		<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
	</form>
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<span class="page_title_text">1:1 문의</span>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="cnsl_dtls_see">
				<div class="see_cnsl">
					<div class="open_cnsl_head">
						<div class="open_cnsl_btn">+</div>
						<div class="see_cnsl_header">상담글</div>
					</div>
					<div class="open_cnsl_cont">
						<div class="see_cnsl_title_icon">Q .</div>
						<div class="see_cnsl_title">
							<input type="text" readonly="readonly" value="${data.WRTNG_TITLE}">
						</div>
						<div class="see_cnsl_cont">
							<textarea class="wrtng_cont" rows="7" cols="110" readonly="readonly">${data.WRTNG_CONT}</textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="ansr_dtls_see">
				<div class="ansr_dtls_see_top">
					<div class="open_ansr_head">
						<div class="open_ansr_btn">+</div>
						<div class="see_ansr_header">답변글</div>
					</div>
					<div class="open_ansr_cont">
						<form action="fileUploadAjax" id="writeForm" method="post"
							  enctype="multipart/form-data">
							<input type="hidden" name="no" value="${param.no}" />
							<input type="hidden" id="emp_name" name="emp_name" value="${data.EMP_NUM}" />
							<input type="hidden" id="top" name="top" value="${param.top}"/>
							<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}"/>
							<input type="hidden" id="menuType" name="menuType" value="${param.menuType}"/>
							<div class="ansr_title">
								<div class="wrtng_title">
									<input type="text" placeholder="제목" id="ansr_title" name="ansr_title"/>
								</div>
							<div class="cnsl_middle">
								<textarea class="ansr_cont" id="ansr_cont" name="ansr_cont" rows="15" cols="110" placeholder="내용을 입력하세요."></textarea>
							</div>
							<div class="cnsl_bottom">
								<div class="file_atch">
									<input type="file" name="ansr_file" />
									<input type="text" id="ansr_att" name="ansr_att" readonly="readonly"/>
									<input type="hidden" id="ansr_attFile" name="ansr_attFile"/>
								</div>
								<div class="ansr_btn">
									<div class="cmn_btn_mr" id="btn1Btn">대응가이드</div>
									<div class="cmn_btn_mr" id="btn2Btn">답변등록</div>
								</div>
							</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>