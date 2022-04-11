<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeNote</title>
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
	background-image: url('resources/images/GW/note.png');
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

.rcpnt_emp {
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

#cnt {
	resize: none;
	width: 895px;
	height: 235px;
}

.file {
	display: inline-block;
	width: 180px;
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
		html += "<div id=\"t\">";
		html += "<input type=\"checkbox\" id=\"no\" value=\"1\" />1";
		html += "<input type=\"checkbox\" id=\"no\" value=\"2\" />2";
		html += "</div>";
		
		makePopup({
			depth : 1,
			bg : true,
			width : 400,
			height : 300,
			title : "받는사람",
			contents : html,
			buttons : [{
				name : "추가",
				func:function() {
					var arr = [];
					$("#t #no:checked").each(function() {
						arr.push($(this).val());
					});
					console.log(arr.toString());
					//closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	$("#sendBtn").on("click", function() {
		if(checkEmpty("#rcpnt")) {
			alert("받는사람을 입력하세요.");
			$("#rcpnt").focus();
		} else if(checkEmpty("#cnt")) {
			alert("내용을 입력하세요.");
			$("#cnt").focus();
		} else {
			var sendForm = $("#sendForm");
			
			sendForm.ajaxForm({
				success : function(res) {
					// 물리파일명 보관
					if(res.fileName.length > 0) {
						$("#attFile").val(res.fileName[0]);
					}
			
					// 글 저장
					var params = $("#sendForm").serialize();
					
					$.ajax({
						type : "post",
						url : "NoteAction/insert",
						dataType : "json",
						data : params,
						success : function(res) {
							if(res.res == "success") {
								$("#actionForm").attr("action", "sentNoteBox");
								$("#actionForm").submit();
							} else {
								alert("작성중 문제가 발생하였습니다.");
							}
						},
						error : function(result, status, error) {
							console.log(result, responseText);
						}
					});
				},
				error : function() {
					console.log(req.responseText);
				}
			});
			
			sendForm.submit();
		}
	});
	
	$("#cnlBtn").on("click", function() {
		$("#actionForm").attr("action", "rcvdNoteBox");
		$("#actionForm").submit();
	});
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
	
	<!-- 내용영역 -->
	<div class="cont_wrap">
		<div class="page_title_bar">
			<div class="page_title_text">쪽지쓰기</div>
			<form action="#" id="actionForm" method="post">
				<input type="hidden" id="top" name="top" value="${param.top}" />
				<input type="hidden" id="menuNum" name="menuNum" value="${param.menuNum}" />
				<input type="hidden" id="menuType" name="menuType" value="${param.menuType}" />
			</form>
		</div>
		<!-- 해당 내용에 작업을 진행하시오. -->
		<div class="cont_area">
			<!-- 여기부터 쓰면 됨 -->
			<div class="note">
				<div class="title">쪽지쓰기
					<div class="title_bar"></div>
				</div>
				<div class="guide">※ 받는 사람은 직접 입력이 가능합니다.<br/>
								  (단, 입력 시 '이름 또는 사원번호'로 입력을 해야 하며
								  구분자로 , 또는 엔터값을 허용합니다.)
				</div>
				<form action="fileUploadAjax" id="sendForm" method="post" enctype="multipart/form-data">
					<div class="cont">
						<div class="rcpnt_emp">받는사람</div>
						<div class="emp">
							<input type="text" size="95" id="rcpnt" name="rcpnt" />
						</div>
						<div class="rcpnt_btn">
							<input type="button" value="받는사람">
						</div>
					</div>
					<textarea placeholder="내용을 입력하세요." id="cnt" name="cnt"></textarea>
					<div class="atchmnt">
						<div class="file">
							<input type = "file" id="att" name="att"/>
						</div>
					</div>
					<input type="hidden" id="sndr" name="sndr" value="${sEmpNum}"/>
					<input type="hidden" id="notesq" name="notesq" value="${notesq}"/>
					<input type="hidden" id="attFile" name="attFile" />
					<div class="note_bottom">
						<div class="cmn_btn_ml" id="sendBtn">보내기</div>
						<div class="cmn_btn_ml" id="cnlBtn">취소</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>